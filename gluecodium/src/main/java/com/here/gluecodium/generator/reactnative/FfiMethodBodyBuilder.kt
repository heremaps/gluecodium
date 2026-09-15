/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.gluecodium.generator.reactnative

import com.here.gluecodium.generator.common.NameHelper
import com.here.gluecodium.generator.common.isCallbackListenerInterface
import com.here.gluecodium.generator.ffi.FfiNameResolver
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeValue

/**
 * Generates method bodies that call pre-built SDK C FFI functions instead of C++ class methods.
 *
 * The FFI functions are flat `extern "C"` symbols exported from the pre-built SDK binary.
 * Naming convention: {libraryName}_{ffiTypeName}_{methodName}__{ParamType1}_{ParamType2}
 *
 * This replaces DirectMethodBodyBuilder for the pre-built binary approach.
 */
internal class FfiMethodBodyBuilder(
    private val function: LimeFunction,
    private val limeContainer: LimeContainer,
    private val ffiNameResolver: FfiNameResolver,
    private val libraryName: String,
    private val isPropertyGetter: Boolean = false,
    private val isPropertySetter: Boolean = false,
    private val propertyName: String? = null,
    private val sharedEngineType: String = "",
) {
    private val lines = mutableListOf<String>()
    private var tmpCounter = 0
    private val stringHandlesToRelease = mutableListOf<String>()
    private val listHandlesToRelease = mutableListOf<Pair<String, String>>() // (varName, releaseFunc)
    private val proxyHandlesToRelease = mutableListOf<Pair<String, String>>() // (varName, releaseFunc)
    private val defaultHandlesToRelease =
        mutableListOf<Pair<String, String>>() // (varName, releaseFunc) for default nested-struct/list handles
    private val maxDefaultDepth = 8

    /** FFI declarations needed by this method body (collected for extern "C" block) */
    val ffiDeclarations = mutableListOf<String>()

    /** True when THIS module is the shared-engine class (the type named via -sharedenginetype). */
    private val isSharedEngineModule: Boolean =
        sharedEngineType.isNotEmpty() && limeContainer.path.toString().contains(sharedEngineType)

    /** True when [type] is the shared-engine type — its handle should populate SharedEngineRef. */
    private fun isSharedEngineType(type: LimeType): Boolean =
        sharedEngineType.isNotEmpty() && type.path.toString().contains(sharedEngineType)

    fun build(): String {
        val isStatic = function.isStatic
        val isVoid = function.returnType.isVoid
        val canThrow = function.thrownType != null

        // Compute the FFI function name
        val ffiFuncName = computeFfiFunctionName()

        // Compute the FFI return type
        val ffiReturnType = if (canThrow) "FfiOpaqueHandle" else computeFfiReturnType(function.returnType.typeRef)

        // Build parameter list for FFI declaration
        val ffiParams = buildFfiParamList(isStatic, function.parameters)

        // Emit FFI declaration
        ffiDeclarations += "$ffiReturnType $ffiFuncName($ffiParams);"

        // Phase 0: For instance methods, retrieve handle from registry
        if (!isStatic) {
            lines += "  auto __handleStr = __nativeHandle.utf8(rt);"
            lines += "  FfiOpaqueHandle __self = FfiHandleRegistry::instance().retrieve(__handleStr);"
            if (isVoid && !canThrow) {
                lines += "  if (!__self) return;"
            } else {
                lines += "  if (!__self) throw jsi::JSError(rt, \"Invalid native handle\");"
            }
        }

        // Phase 1: Marshal JSI params to FFI values
        val ffiArgs = mutableListOf<String>()
        if (!isStatic) ffiArgs += "__self"
        ffiArgs += "0" // _isolate_id = 0 (not using Dart isolates)
        for (param in function.parameters) {
            ffiArgs += marshalParam(param)
        }

        // Phase 2: Build the FFI call
        val callExpr = "$ffiFuncName(${ffiArgs.joinToString(", ")})"

        // Phase 3: Handle return value
        if (canThrow) {
            emitThrowingCall(callExpr, ffiFuncName, isVoid)
        } else if (isVoid) {
            lines += "  $callExpr;"
            emitStringCleanup()
        } else {
            lines += "  auto __ffiResult = $callExpr;"
            emitStringCleanup()
            // Shared-engine module: a getter returning the engine type (the -sharedenginetype class's sharedInstance)
            // must populate SharedEngineRef so sub-engines created after Java-side init resolve correctly.
            if (isSharedEngineModule && isSharedEngineType(function.returnType.typeRef.type.actualType)) {
                lines += "  if (__ffiResult) ${libraryName.replace("-", "_")}::setSharedEngineRaw(__ffiResult);"
            }
            emitReturnToJsi("__ffiResult", function.returnType.typeRef)
        }

        return lines.joinToString("\n")
    }

    /**
     * Build body for a constructor/factory that returns a handle.
     */
    fun buildConstructor(emitSharedEngineStore: Boolean = false): String {
        // Field constructors have empty path.name — they map to the struct's create_handle
        if (function.isConstructor && function.path.name.isEmpty() && limeContainer is LimeStruct) {
            return buildFieldConstructorBody(limeContainer)
        }

        val canThrow = function.thrownType != null
        val ffiFuncName = computeFfiFunctionName()
        val ns = libraryName.replace("-", "_")

        // Compute FFI return type
        val ffiReturnType = if (canThrow) "FfiOpaqueHandle" else "FfiOpaqueHandle"

        // Build param list (constructors are always static — no _self)
        val ffiParams = buildFfiParamList(true, function.parameters)
        ffiDeclarations += "$ffiReturnType $ffiFuncName($ffiParams);"

        // Marshal params
        val ffiArgs = mutableListOf("0") // _isolate_id
        for (param in function.parameters) {
            ffiArgs += marshalParam(param)
        }

        val callExpr = "$ffiFuncName(${ffiArgs.joinToString(", ")})"

        if (canThrow) {
            // Declare error-handling FFI functions
            val hasErrorFn = "${ffiFuncName}_return_has_error"
            val getResultFn = "${ffiFuncName}_return_get_result"
            val getErrorFn = "${ffiFuncName}_return_get_error"
            val releaseFn = "${ffiFuncName}_return_release_handle"
            ffiDeclarations += "bool $hasErrorFn(FfiOpaqueHandle handle);"
            ffiDeclarations += "FfiOpaqueHandle $getResultFn(FfiOpaqueHandle handle);"
            ffiDeclarations += "uint32_t $getErrorFn(FfiOpaqueHandle handle);"
            ffiDeclarations += "void $releaseFn(FfiOpaqueHandle handle);"

            lines += "  FfiOpaqueHandle __returnHandle = $callExpr;"
            emitStringCleanup()
            lines += "  if ($hasErrorFn(__returnHandle)) {"
            lines += "    auto __errCode = $getErrorFn(__returnHandle);"
            lines += "    $releaseFn(__returnHandle);"
            lines += "    throw jsi::JSError(rt, \"Native error: \" + std::to_string(__errCode));"
            lines += "  }"
            lines += "  FfiOpaqueHandle __result = $getResultFn(__returnHandle);"
            lines += "  $releaseFn(__returnHandle);"
            if (emitSharedEngineStore) lines += "  $ns::setSharedEngineRaw(__result);"
            lines += "  auto __key = FfiHandleRegistry::instance().store(__result);"
            lines += "  return jsi::String::createFromUtf8(rt, __key);"
        } else {
            lines += "  FfiOpaqueHandle __handle = $callExpr;"
            emitStringCleanup()
            if (emitSharedEngineStore) lines += "  $ns::setSharedEngineRaw(__handle);"
            lines += "  auto __key = FfiHandleRegistry::instance().store(__handle);"
            lines += "  return jsi::String::createFromUtf8(rt, __key);"
        }

        return lines.joinToString("\n")
    }

    /** Sub-engine constructor that injects the shared SDK engine (from
     *  SharedEngineRef) as the first FFI arg and forwards the remaining tail params. `function`
     *  is the engine sibling E whose params are [sharedEngineType] ++ tail. */
    fun buildSharedEngineConstructor(sharedEngineType: String): String {
        val ns = libraryName.replace("-", "_")
        val canThrow = function.thrownType != null
        val ffiFuncName = computeFfiFunctionName()
        ffiDeclarations += "FfiOpaqueHandle $ffiFuncName(${buildFfiParamList(true, function.parameters)});"

        lines += "  FfiOpaqueHandle __sdkEngine = $ns::getSharedEngineRaw();"
        lines += "  if (!__sdkEngine) throw jsi::JSError(rt, \"SDK engine not initialized. Call " +
            "$sharedEngineType.make() first.\");"

        val ffiArgs = mutableListOf("0", "__sdkEngine")
        for (param in function.parameters.drop(1)) ffiArgs += marshalParam(param)
        val callExpr = "$ffiFuncName(${ffiArgs.joinToString(", ")})"

        if (canThrow) {
            val hasErrorFn = "${ffiFuncName}_return_has_error"
            val getResultFn = "${ffiFuncName}_return_get_result"
            val getErrorFn = "${ffiFuncName}_return_get_error"
            val releaseFn = "${ffiFuncName}_return_release_handle"
            ffiDeclarations += "bool $hasErrorFn(FfiOpaqueHandle handle);"
            ffiDeclarations += "FfiOpaqueHandle $getResultFn(FfiOpaqueHandle handle);"
            // `_return_get_error` yields the error CODE (uint32_t), never a handle. This must match
            // the declaration emitted by the primary throwing paths (build()/buildConstructor);
            // otherwise the extern-"C" collector sees two conflicting signatures for the same symbol
            // and emits both, breaking the C++ build ("functions that differ only in their return
            // type cannot be overloaded").
            ffiDeclarations += "uint32_t $getErrorFn(FfiOpaqueHandle handle);"
            ffiDeclarations += "void $releaseFn(FfiOpaqueHandle handle);"
            lines += "  FfiOpaqueHandle __returnHandle = $callExpr;"
            emitStringCleanup()
            lines += "  if ($hasErrorFn(__returnHandle)) {"
            lines += "    auto __errCode = $getErrorFn(__returnHandle);"
            lines += "    $releaseFn(__returnHandle);"
            lines += "    throw jsi::JSError(rt, \"Native error: \" + std::to_string(__errCode));"
            lines += "  }"
            lines += "  FfiOpaqueHandle __result = $getResultFn(__returnHandle);"
            lines += "  $releaseFn(__returnHandle);"
            lines += "  auto __key = FfiHandleRegistry::instance().store(__result);"
            lines += "  return jsi::String::createFromUtf8(rt, __key);"
        } else {
            lines += "  FfiOpaqueHandle __result = $callExpr;"
            emitStringCleanup()
            lines += "  if (!__result) throw jsi::JSError(rt, \"FFI returned null handle\");"
            lines += "  auto __key = FfiHandleRegistry::instance().store(__result);"
            lines += "  return jsi::String::createFromUtf8(rt, __key);"
        }
        return lines.joinToString("\n")
    }

    // Field constructors call the struct's create_handle with ALL fields in declaration order.
    // Specified fields (function.parameters) are marshalled from JS handles; omitted fields default.
    private fun buildFieldConstructorBody(struct: LimeStruct): String {
        val structFfiName = ffiNameResolver.resolveName(struct as LimeType)
        val createHandleFn = "${libraryName}_${structFfiName}_create_handle"
        val specifiedNames = function.parameters.map { it.path.name }.toSet()

        // Use computeFfiParamType for accurate C types (bool, double, int32_t, etc.)
        val argTypes = struct.fields.map { computeFfiParamType(it.typeRef) }
        ffiDeclarations += "FfiOpaqueHandle $createHandleFn(${argTypes.joinToString(", ")});"

        // Use marshalParam to handle all types and nullability correctly for specified fields
        val paramVarNames =
            function.parameters.associate { param ->
                param.path.name to marshalParam(param)
            }

        // Build ffiArgs: ALL struct fields in declaration order.
        // NOTE: struct create_handle does NOT take an isolate_id (unlike class methods).
        val ffiArgs = mutableListOf<String>()
        for (field in struct.fields) {
            val fieldName = field.path.name
            if (fieldName in specifiedNames) {
                ffiArgs += paramVarNames[fieldName]!!
            } else {
                ffiArgs += fieldDefaultValue(field)
            }
        }

        lines += "  FfiOpaqueHandle __handle = $createHandleFn(${ffiArgs.joinToString(", ")});"
        emitStringCleanup()
        lines += "  if (!__handle) throw jsi::JSError(rt, \"create_handle returned null\");"
        lines += "  auto __key = FfiHandleRegistry::instance().store(__handle);"
        lines += "  return jsi::String::createFromUtf8(rt, __key);"
        return lines.joinToString("\n")
    }

    private fun fieldDefaultValue(
        field: LimeField,
        depth: Int = 0,
    ): String {
        val typeRef = field.typeRef
        if (typeRef.isNullable) return "nullptr"
        // Preserve a LIME literal default (numeric/bool) when present, else type-zero.
        val lit = (field.defaultValue as? LimeValue.Literal)?.value
        return when (val actualType = typeRef.type.actualType) {
            is LimeBasicType ->
                when (actualType.typeId) {
                    LimeBasicType.TypeId.BOOLEAN -> lit ?: "false"
                    LimeBasicType.TypeId.FLOAT -> (lit ?: "0.0") + "f"
                    LimeBasicType.TypeId.DOUBLE -> lit ?: "0.0"
                    LimeBasicType.TypeId.INT8, LimeBasicType.TypeId.INT16,
                    LimeBasicType.TypeId.INT32,
                    -> lit ?: "0"
                    LimeBasicType.TypeId.INT64 -> (lit ?: "0") + "LL"
                    LimeBasicType.TypeId.UINT8, LimeBasicType.TypeId.UINT16,
                    LimeBasicType.TypeId.UINT32,
                    -> (lit ?: "0") + "U"
                    LimeBasicType.TypeId.UINT64,
                    LimeBasicType.TypeId.DATE, LimeBasicType.TypeId.DURATION,
                    -> (lit ?: "0") + "ULL"
                    else -> "nullptr"
                }
            is LimeEnumeration -> "static_cast<uint32_t>(0)"
            is LimeList, is LimeSet, is LimeMap -> {
                // Non-nullable collection (list/set/map): build an EMPTY collection handle
                // (temp + released post create_handle). A nullptr here would be dereferenced by the
                // SDK create_handle → SIGSEGV. Map uses the same {lib}_{ffiName}_create_handle() /
                // _release_handle(...) shape as list/set (see marshalMapParam).
                val collectionFfiName = ffiNameResolver.resolveName(actualType)
                val createHandle = "${libraryName}_${collectionFfiName}_create_handle"
                val releaseHandle = "${libraryName}_${collectionFfiName}_release_handle"
                ffiDeclarations += "FfiOpaqueHandle $createHandle();"
                ffiDeclarations += "void $releaseHandle(FfiOpaqueHandle handle);"
                val tmp = freshVar("def")
                lines += "  FfiOpaqueHandle $tmp = $createHandle();"
                defaultHandlesToRelease += tmp to releaseHandle
                tmp
            }
            is LimeStruct -> emitDefaultStructHandle(actualType, depth)
            else -> "nullptr" // LimeClass / LimeInterface: no synthesizable value type
        }
    }

    /** Recursively synthesize a default handle for a non-nullable nested struct field.
     *  Children are emitted before the parent; every temp is released after the enclosing top-level
     *  create_handle (SDK create_handle deep-copies field values). Value-type structs can't cycle;
     *  maxDefaultDepth is a defensive cap. */
    private fun emitDefaultStructHandle(
        struct: LimeStruct,
        depth: Int,
    ): String {
        if (depth >= maxDefaultDepth) return "nullptr"
        val name = ffiNameResolver.resolveName(struct as LimeType)
        val createHandle = "${libraryName}_${name}_create_handle"
        val releaseHandle = "${libraryName}_${name}_release_handle"
        val argTypes = struct.fields.map { computeFfiParamType(it.typeRef) }
        ffiDeclarations += "FfiOpaqueHandle $createHandle(${argTypes.joinToString(", ")});"
        ffiDeclarations += "void $releaseHandle(FfiOpaqueHandle handle);"
        val args = struct.fields.map { fieldDefaultValue(it, depth + 1) }
        val tmp = freshVar("def")
        lines += "  FfiOpaqueHandle $tmp = $createHandle(${args.joinToString(", ")});"
        defaultHandlesToRelease += tmp to releaseHandle
        return tmp
    }

    private fun computeFfiFunctionName(): String {
        // Use FfiNameResolver to get the mangled name, then prepend library name
        val ffiName = ffiNameResolver.resolveName(function)
        return "${libraryName}_$ffiName"
    }

    private fun computeFfiReturnType(typeRef: LimeTypeRef): String {
        if (typeRef.type.actualType is LimeBasicType) {
            return when ((typeRef.type.actualType as LimeBasicType).typeId) {
                LimeBasicType.TypeId.VOID -> "void"
                LimeBasicType.TypeId.BOOLEAN -> "bool"
                LimeBasicType.TypeId.FLOAT -> "float"
                LimeBasicType.TypeId.DOUBLE -> "double"
                LimeBasicType.TypeId.INT8 -> "int8_t"
                LimeBasicType.TypeId.UINT8 -> "uint8_t"
                LimeBasicType.TypeId.INT16 -> "int16_t"
                LimeBasicType.TypeId.UINT16 -> "uint16_t"
                LimeBasicType.TypeId.INT32 -> "int32_t"
                LimeBasicType.TypeId.UINT32 -> "uint32_t"
                LimeBasicType.TypeId.INT64 -> "int64_t"
                LimeBasicType.TypeId.UINT64 -> "uint64_t"
                LimeBasicType.TypeId.DATE, LimeBasicType.TypeId.DURATION -> "uint64_t"
                LimeBasicType.TypeId.STRING, LimeBasicType.TypeId.BLOB,
                LimeBasicType.TypeId.LOCALE,
                -> "FfiOpaqueHandle"
                else -> "FfiOpaqueHandle"
            }
        }
        if (typeRef.type.actualType is LimeEnumeration) return "uint32_t"
        return "FfiOpaqueHandle"
    }

    private fun computeFfiParamType(typeRef: LimeTypeRef): String {
        if (typeRef.isNullable) return "FfiOpaqueHandle"
        return computeFfiReturnType(typeRef)
    }

    private fun buildFfiParamList(
        isStatic: Boolean,
        params: List<LimeParameter>,
    ): String {
        val parts = mutableListOf<String>()
        if (!isStatic) parts += "FfiOpaqueHandle _self"
        parts += "int32_t _isolate_id"
        for (param in params) {
            val ffiType = computeFfiParamType(param.typeRef)
            parts += "$ffiType ${param.path.name}"
        }
        return parts.joinToString(", ")
    }

    private fun marshalParam(param: LimeParameter): String {
        val name = param.path.name
        val resolvedType = param.typeRef.type.actualType
        val isNullable = param.typeRef.isNullable

        return when (resolvedType) {
            is LimeBasicType -> marshalBasicParam(name, resolvedType, isNullable)
            is LimeEnumeration -> {
                if (isNullable) {
                    val ffiTypeName = ffiNameResolver.resolveName(resolvedType as LimeType)
                    val createNullable = "${libraryName}_${ffiTypeName}_create_handle_nullable"
                    val releaseNullable = "${libraryName}_${ffiTypeName}_release_handle_nullable"
                    ffiDeclarations += "FfiOpaqueHandle $createNullable(uint32_t value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    val tmp = freshVar("ffi_$name")
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    $tmp = $createNullable(static_cast<uint32_t>(static_cast<int>($name.value())));"
                    lines += "  }"
                    tmp
                } else {
                    "static_cast<uint32_t>(static_cast<int>($name))"
                }
            }
            is LimeStruct, is LimeClass -> {
                if (isNullable) {
                    if (resolvedType is LimeClass) {
                        // Classes are reference types: the SDK exports NO <Class>_create_handle_nullable
                        // (unlike value-type structs). Pass the raw registry handle (nullptr if absent).
                        val tmp = freshVar("ffi_$name")
                        lines += "  FfiOpaqueHandle $tmp = nullptr;"
                        lines += "  if ($name.has_value()) {"
                        lines += "    auto __hid = $name.value().utf8(rt);"
                        lines += "    $tmp = FfiHandleRegistry::instance().retrieve(__hid);"
                        if (isSharedEngineModule && isSharedEngineType(resolvedType)) {
                            lines += "    if ($tmp) ${libraryName.replace("-", "_")}::setSharedEngineRaw($tmp);"
                        }
                        lines += "  }"
                        tmp
                    } else {
                        val ffiTypeName = ffiNameResolver.resolveName(resolvedType as LimeType)
                        val createNullable = "${libraryName}_${ffiTypeName}_create_handle_nullable"
                        val releaseNullable = "${libraryName}_${ffiTypeName}_release_handle_nullable"
                        ffiDeclarations += "FfiOpaqueHandle $createNullable(FfiOpaqueHandle value);"
                        ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                        val tmp = freshVar("ffi_$name")
                        lines += "  FfiOpaqueHandle $tmp = nullptr;"
                        lines += "  if ($name.has_value()) {"
                        lines += "    auto __hid = $name.value().utf8(rt);"
                        lines += "    auto __inner = FfiHandleRegistry::instance().retrieve(__hid);"
                        lines += "    if (__inner) $tmp = $createNullable(__inner);"
                        lines += "  }"
                        tmp
                    }
                } else {
                    val tmp = freshVar("ffi_$name")
                    lines += "  auto __hid_$name = $name.utf8(rt);"
                    lines += "  FfiOpaqueHandle $tmp = FfiHandleRegistry::instance().retrieveChecked(__hid_$name, " +
                        "\"param '$name'\");"
                    tmp
                }
            }
            is LimeInterface -> {
                marshalInterfaceListenerParam(name, resolvedType, isNullable)
            }
            is LimeList -> {
                marshalListParam(name, resolvedType, isNullable)
            }
            is LimeMap -> {
                marshalMapParam(name, resolvedType, isNullable)
            }
            is LimeSet -> {
                marshalSetParam(name, resolvedType, isNullable)
            }
            is LimeLambda -> {
                marshalLambdaParam(name, resolvedType, isNullable)
            }
            else -> name
        }
    }

    private fun marshalBasicParam(
        name: String,
        basicType: LimeBasicType,
        isNullable: Boolean,
    ): String {
        if (isNullable) {
            val nullableFfiName = getNullableBasicTypeFfiName(basicType.typeId)
            val createNullable = "${libraryName}_${nullableFfiName}_create_handle_nullable"
            val releaseNullable = "${libraryName}_${nullableFfiName}_release_handle_nullable"
            val tmp = freshVar("ffi_$name")

            return when (basicType.typeId) {
                LimeBasicType.TypeId.STRING -> {
                    ffiDeclarations += "FfiOpaqueHandle $createNullable(FfiOpaqueHandle value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    ffiDeclarations += "FfiOpaqueHandle ${libraryName}_std_string_create_handle(const char* value);"
                    ffiDeclarations += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    auto __str = $name.value().utf8(rt);"
                    lines += "    auto __strHandle = ${libraryName}_std_string_create_handle(__str.c_str());"
                    lines += "    $tmp = $createNullable(__strHandle);"
                    lines += "    ${libraryName}_std_string_release_handle(__strHandle);"
                    lines += "  }"
                    tmp
                }
                LimeBasicType.TypeId.BOOLEAN -> {
                    ffiDeclarations += "FfiOpaqueHandle $createNullable(bool value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    $tmp = $createNullable($name.value());"
                    lines += "  }"
                    tmp
                }
                LimeBasicType.TypeId.DOUBLE, LimeBasicType.TypeId.FLOAT -> {
                    val castType = if (basicType.typeId == LimeBasicType.TypeId.FLOAT) "float" else "double"
                    ffiDeclarations += "FfiOpaqueHandle $createNullable($castType value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    $tmp = $createNullable(static_cast<$castType>($name.value()));"
                    lines += "  }"
                    tmp
                }
                LimeBasicType.TypeId.INT8, LimeBasicType.TypeId.INT16,
                LimeBasicType.TypeId.INT32, LimeBasicType.TypeId.INT64,
                LimeBasicType.TypeId.UINT8, LimeBasicType.TypeId.UINT16,
                LimeBasicType.TypeId.UINT32, LimeBasicType.TypeId.UINT64,
                -> {
                    val cType = computeFfiReturnType(LimeDirectTypeRef(basicType))
                    ffiDeclarations += "FfiOpaqueHandle $createNullable($cType value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    $tmp = $createNullable(static_cast<$cType>($name.value()));"
                    lines += "  }"
                    tmp
                }
                LimeBasicType.TypeId.DATE -> {
                    // Nullable DATE: absolute epoch, passed through unscaled (matches the getter).
                    ffiDeclarations += "FfiOpaqueHandle $createNullable(uint64_t value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    $tmp = $createNullable(static_cast<uint64_t>($name.value()));"
                    lines += "  }"
                    tmp
                }
                LimeBasicType.TypeId.DURATION -> {
                    // Nullable DURATION: JS/TS uses SECONDS; the FFI expects MICROSECONDS. Multiply by
                    // 1e6 on the way in (the setter-side mirror of the getter's ÷1e6).
                    ffiDeclarations += "FfiOpaqueHandle $createNullable(uint64_t value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    $tmp = $createNullable(static_cast<uint64_t>(($name.value()) * 1000000.0));"
                    lines += "  }"
                    tmp
                }
                LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE -> {
                    ffiDeclarations += "FfiOpaqueHandle $createNullable(FfiOpaqueHandle value);"
                    ffiDeclarations += "void $releaseNullable(FfiOpaqueHandle handle);"
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    lines += "  if ($name.has_value()) {"
                    lines += "    auto __hid = $name.value().utf8(rt);"
                    lines += "    auto __inner = FfiHandleRegistry::instance().retrieve(__hid);"
                    lines += "    if (__inner) $tmp = $createNullable(__inner);"
                    lines += "  }"
                    tmp
                }
                else -> {
                    lines += "  FfiOpaqueHandle $tmp = nullptr;"
                    tmp
                }
            }
        }
        return when (basicType.typeId) {
            LimeBasicType.TypeId.STRING -> {
                ffiDeclarations += "FfiOpaqueHandle ${libraryName}_std_string_create_handle(const char* value);"
                ffiDeclarations += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                val tmp = freshVar("ffi_$name")
                lines += "  auto __str_$name = $name.utf8(rt);"
                lines += "  FfiOpaqueHandle $tmp = ${libraryName}_std_string_create_handle(__str_$name.c_str());"
                stringHandlesToRelease += tmp
                tmp
            }
            LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE -> {
                // These pass as FfiOpaqueHandle — retrieve from handle registry
                val tmp = freshVar("ffi_$name")
                lines += "  auto __hid_$name = $name.utf8(rt);"
                lines += "  FfiOpaqueHandle $tmp = FfiHandleRegistry::instance().retrieveChecked(__hid_$name, " +
                    "\"param '$name'\");"
                tmp
            }
            LimeBasicType.TypeId.BOOLEAN -> name
            LimeBasicType.TypeId.DOUBLE -> name
            LimeBasicType.TypeId.FLOAT -> "static_cast<float>($name)"
            // DATE is an absolute epoch value → passed through unscaled (matches the getter, which
            // returns it raw). DURATION crosses the FFI as MICROSECONDS, but the JS/TS API uses
            // SECONDS (the getter divides by 1e6), so a Duration PARAMETER must be multiplied back by
            // 1e6 on the way in — the setter-side mirror of the getter conversion. Without this a
            // Duration arg is stored 1e6× too small (e.g. a 500 ms interval became 500 µs).
            LimeBasicType.TypeId.DATE ->
                "static_cast<uint64_t>($name)"
            LimeBasicType.TypeId.DURATION ->
                "static_cast<uint64_t>(($name) * 1000000.0)  /* seconds → microseconds */"
            LimeBasicType.TypeId.INT8, LimeBasicType.TypeId.INT16,
            LimeBasicType.TypeId.INT32, LimeBasicType.TypeId.INT64,
            LimeBasicType.TypeId.UINT8, LimeBasicType.TypeId.UINT16,
            LimeBasicType.TypeId.UINT32, LimeBasicType.TypeId.UINT64,
            -> name
            else -> name
        }
    }

    private fun emitThrowingCall(
        callExpr: String,
        ffiFuncName: String,
        isVoid: Boolean,
    ) {
        val hasErrorFn = "${ffiFuncName}_return_has_error"
        val getResultFn = "${ffiFuncName}_return_get_result"
        val getErrorFn = "${ffiFuncName}_return_get_error"
        val releaseFn = "${ffiFuncName}_return_release_handle"

        ffiDeclarations += "bool $hasErrorFn(FfiOpaqueHandle handle);"
        ffiDeclarations += "void $releaseFn(FfiOpaqueHandle handle);"
        ffiDeclarations += "uint32_t $getErrorFn(FfiOpaqueHandle handle);"

        lines += "  FfiOpaqueHandle __returnHandle = $callExpr;"
        emitStringCleanup()
        lines += "  if ($hasErrorFn(__returnHandle)) {"
        lines += "    auto __errCode = $getErrorFn(__returnHandle);"
        lines += "    $releaseFn(__returnHandle);"
        lines += "    throw jsi::JSError(rt, \"Native error: \" + std::to_string(__errCode));"
        lines += "  }"

        if (!isVoid) {
            val returnType = function.returnType.typeRef
            val ffiResultType = computeFfiReturnType(returnType)
            ffiDeclarations += "$ffiResultType $getResultFn(FfiOpaqueHandle handle);"
            lines += "  auto __ffiResult = $getResultFn(__returnHandle);"
            lines += "  $releaseFn(__returnHandle);"
            emitReturnToJsi("__ffiResult", returnType)
        } else {
            lines += "  $releaseFn(__returnHandle);"
        }
    }

    private fun emitReturnToJsi(
        expr: String,
        typeRef: LimeTypeRef,
    ) {
        val resolvedType = typeRef.type.actualType
        when (resolvedType) {
            is LimeBasicType -> {
                when (resolvedType.typeId) {
                    LimeBasicType.TypeId.BOOLEAN -> lines += "  return $expr;"
                    LimeBasicType.TypeId.DOUBLE, LimeBasicType.TypeId.FLOAT -> lines += "  return $expr;"
                    LimeBasicType.TypeId.INT8, LimeBasicType.TypeId.INT16,
                    LimeBasicType.TypeId.INT32, LimeBasicType.TypeId.UINT8,
                    LimeBasicType.TypeId.UINT16, LimeBasicType.TypeId.UINT32,
                    ->
                        lines += "  return static_cast<double>($expr);"
                    LimeBasicType.TypeId.INT64, LimeBasicType.TypeId.UINT64,
                    LimeBasicType.TypeId.DATE,
                    ->
                        lines += "  return static_cast<double>($expr);"
                    LimeBasicType.TypeId.DURATION ->
                        lines += "  return static_cast<double>($expr) / 1000000.0;  // microseconds → seconds"
                    LimeBasicType.TypeId.STRING -> {
                        ffiDeclarations += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                        ffiDeclarations += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        lines += "  if (!$expr) throw jsi::JSError(rt, \"FFI returned null string handle\");"
                        lines += "  auto __strVal = ${libraryName}_std_string_get_value($expr);"
                        lines += "  auto __jsiStr = jsi::String::createFromUtf8(rt, __strVal);"
                        lines += "  ${libraryName}_std_string_release_handle($expr);"
                        lines += "  return __jsiStr;"
                    }
                    LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE -> {
                        // FFI returns FfiOpaqueHandle — store in registry
                        lines += "  auto __key = FfiHandleRegistry::instance().store($expr);"
                        lines += "  return jsi::String::createFromUtf8(rt, __key);"
                    }
                    else -> lines += "  return $expr;"
                }
            }
            is LimeEnumeration -> {
                lines += "  return static_cast<double>($expr);"
            }
            is LimeStruct, is LimeClass, is LimeInterface -> {
                // Returns an FfiOpaqueHandle — store in registry.
                if (typeRef.isNullable) {
                    // Nullable handle return: a null result is legitimate (e.g. no match) → JS null.
                    lines += "  if (!$expr) return std::nullopt;"
                } else {
                    lines += "  if (!$expr) throw jsi::JSError(rt, \"FFI returned null handle\");"
                }
                lines += "  auto __key = FfiHandleRegistry::instance().store($expr);"
                lines += "  return jsi::String::createFromUtf8(rt, __key);"
            }
            else -> {
                // LimeList, LimeSet — iterate FFI collection → build jsi::Array
                when (resolvedType) {
                    is LimeList -> emitCollectionReturn(expr, resolvedType, resolvedType.elementType)
                    is LimeSet -> emitCollectionReturn(expr, resolvedType, resolvedType.elementType)
                    is LimeMap -> emitMapReturn(expr, resolvedType)
                    else -> {
                        // LimeLambda — return as opaque handle string
                        lines += "  if (!$expr) throw jsi::JSError(rt, \"FFI returned null handle\");"
                        lines += "  auto __key = FfiHandleRegistry::instance().store($expr);"
                        lines += "  return jsi::String::createFromUtf8(rt, __key);"
                    }
                }
            }
        }
    }

    private fun emitStringCleanup() {
        for (handle in stringHandlesToRelease) {
            lines += "  ${libraryName}_std_string_release_handle($handle);"
        }
        for ((handle, releaseFunc) in listHandlesToRelease) {
            lines += "  $releaseFunc($handle);"
        }
        for ((handle, releaseFunc) in defaultHandlesToRelease) {
            lines += "  $releaseFunc($handle);"
        }
        for ((handle, releaseFunc) in proxyHandlesToRelease) {
            lines += "  if ($handle) $releaseFunc($handle);"
        }
    }

    private fun freshVar(prefix: String): String = "__${prefix}_${tmpCounter++}"

    /** Map LimeBasicType.TypeId to the FFI nullable type name prefix. */
    private fun getNullableBasicTypeFfiName(typeId: LimeBasicType.TypeId): String =
        when (typeId) {
            LimeBasicType.TypeId.DOUBLE -> "Double"
            LimeBasicType.TypeId.FLOAT -> "Float"
            LimeBasicType.TypeId.BOOLEAN -> "Boolean"
            LimeBasicType.TypeId.STRING -> "String"
            LimeBasicType.TypeId.INT8 -> "Byte"
            LimeBasicType.TypeId.UINT8 -> "UByte"
            LimeBasicType.TypeId.INT16 -> "Short"
            LimeBasicType.TypeId.UINT16 -> "UShort"
            LimeBasicType.TypeId.INT32 -> "Int"
            LimeBasicType.TypeId.UINT32 -> "UInt"
            LimeBasicType.TypeId.INT64 -> "Long"
            LimeBasicType.TypeId.UINT64 -> "ULong"
            LimeBasicType.TypeId.BLOB -> "Blob"
            LimeBasicType.TypeId.LOCALE -> "Locale"
            // A nullable Date/Duration is ABI-identical to a nullable uint64: both box as
            // `std::optional<uint64_t>*` (FfiConversionBase Conversion<optional<time_point>> and
            // Conversion<optional<duration>>). The SDK exports NO standalone `<lib>_Date_*` /
            // `<lib>_Duration_*` nullable box symbol (the Dart backend inlines that boxing via
            // header-only templates), so reuse the exported `<lib>_ULong_*` box. The by-value
            // uint64 carried in/out is already the microsecond epoch/count.
            LimeBasicType.TypeId.DATE -> "ULong"
            LimeBasicType.TypeId.DURATION -> "ULong"
            else -> "Unknown"
        }

    /** Marshal a List<T> or Set<T> parameter from JS array to FFI collection handle. */
    private fun marshalListParam(
        name: String,
        listType: LimeList,
        isNullable: Boolean,
    ): String = marshalCollectionParam(name, listType, listType.elementType, isNullable)

    private fun marshalSetParam(
        name: String,
        setType: LimeSet,
        isNullable: Boolean,
    ): String = marshalCollectionParam(name, setType, setType.elementType, isNullable)

    private fun marshalCollectionParam(
        name: String,
        collType: LimeType,
        elemTypeRef: LimeTypeRef,
        isNullable: Boolean,
    ): String {
        val elementType = elemTypeRef.type.actualType
        val listFfiName = ffiNameResolver.resolveName(collType)
        val listPrefix = "${libraryName}_$listFfiName"
        val createHandle = "${listPrefix}_create_handle"
        val insertFn = "${listPrefix}_insert"
        val releaseFn = "${listPrefix}_release_handle"

        ffiDeclarations += "FfiOpaqueHandle $createHandle();"
        ffiDeclarations += "void $insertFn(FfiOpaqueHandle list_handle, FfiOpaqueHandle item);"
        ffiDeclarations += "void $releaseFn(FfiOpaqueHandle handle);"

        val tmp = freshVar("ffi_$name")
        if (isNullable) {
            lines += "  FfiOpaqueHandle $tmp = nullptr;"
            lines += "  if ($name.has_value()) {"
            lines += "    auto& __arr = $name.value();"
            lines += "    $tmp = $createHandle();"
            lines += "    for (size_t __i = 0; __i < __arr.size(rt); __i++) {"
            lines += "      auto __elem = __arr.getValueAtIndex(rt, __i);"
            emitListInsertElement(tmp, insertFn, "__elem", elementType)
            lines += "    }"
            lines += "  }"
        } else {
            lines += "  FfiOpaqueHandle $tmp = $createHandle();"
            lines += "  for (size_t __i = 0; __i < $name.size(rt); __i++) {"
            lines += "    auto __elem = $name.getValueAtIndex(rt, __i);"
            emitListInsertElement(tmp, insertFn, "__elem", elementType)
            lines += "  }"
        }
        listHandlesToRelease += tmp to releaseFn
        return tmp
    }

    /** Emit code to insert a single element into an FFI list. */
    private fun emitListInsertElement(
        listVar: String,
        insertFn: String,
        elemVar: String,
        elementType: LimeType,
    ) {
        when (elementType) {
            is LimeBasicType ->
                when (elementType.typeId) {
                    LimeBasicType.TypeId.STRING -> {
                        ffiDeclarations += "FfiOpaqueHandle ${libraryName}_std_string_create_handle(const char* value);"
                        ffiDeclarations += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        lines += "      auto __s = $elemVar.asString(rt).utf8(rt);"
                        lines += "      auto __sh = ${libraryName}_std_string_create_handle(__s.c_str());"
                        lines += "      $insertFn($listVar, __sh);"
                        lines += "      ${libraryName}_std_string_release_handle(__sh);"
                    }
                    LimeBasicType.TypeId.DOUBLE, LimeBasicType.TypeId.FLOAT -> {
                        lines += "      $insertFn($listVar, " +
                            "reinterpret_cast<FfiOpaqueHandle>(static_cast<intptr_t>($elemVar.asNumber())));"
                    }
                    LimeBasicType.TypeId.BOOLEAN -> {
                        lines += "      $insertFn($listVar, reinterpret_cast<FfiOpaqueHandle>(" +
                            "static_cast<intptr_t>($elemVar.getBool() ? 1 : 0)));"
                    }
                    else -> {
                        lines += "      $insertFn($listVar, reinterpret_cast<FfiOpaqueHandle>(" +
                            "static_cast<intptr_t>(static_cast<int64_t>($elemVar.asNumber()))));"
                    }
                }
            is LimeStruct, is LimeClass, is LimeInterface -> {
                lines += "      auto __hid = $elemVar.asString(rt).utf8(rt);"
                lines += "      auto __h = FfiHandleRegistry::instance().retrieveChecked(__hid, \"list element\");"
                lines += "      $insertFn($listVar, __h);"
            }
            is LimeEnumeration -> {
                lines += "      $insertFn($listVar, " +
                    "reinterpret_cast<FfiOpaqueHandle>(static_cast<intptr_t>(static_cast<int>($elemVar.asNumber()))));"
            }
            else -> {
                lines += "      auto __hid = $elemVar.asString(rt).utf8(rt);"
                lines += "      auto __h = FfiHandleRegistry::instance().retrieveChecked(__hid, \"list element\");"
                lines += "      $insertFn($listVar, __h);"
            }
        }
    }

    // ── Map<K,V> marshalling (spec task 15.3) ──
    //
    // The SDK exports a full generic map FFI (FfiGenericTypesHeader.mustache), mirroring List/Set
    // plus a key alongside each value:
    //   FfiOpaqueHandle <lib>_MapOf_K_to_V_create_handle();
    //   void            <lib>_MapOf_K_to_V_put(FfiOpaqueHandle handle, <K> key, <V> value);
    //   FfiOpaqueHandle <lib>_MapOf_K_to_V_iterator(FfiOpaqueHandle handle);
    //   bool            <lib>_MapOf_K_to_V_iterator_is_valid(FfiOpaqueHandle handle, FfiOpaqueHandle it);
    //   void            <lib>_MapOf_K_to_V_iterator_increment(FfiOpaqueHandle it);
    //   <K>             <lib>_MapOf_K_to_V_iterator_get_key(FfiOpaqueHandle it);
    //   <V>             <lib>_MapOf_K_to_V_iterator_get_value(FfiOpaqueHandle it);
    //   void            <lib>_MapOf_K_to_V_iterator_release_handle(FfiOpaqueHandle it);
    //   void            <lib>_MapOf_K_to_V_release_handle(FfiOpaqueHandle handle);
    //
    // Crucially, <K>/<V> are the FFI backend's C representation BY VALUE for a non-complex, non-enum
    // type (e.g. `double` for a `Double` key), a boxed std_string handle for a String, and an
    // FfiOpaqueHandle for structs/classes/interfaces (enums are int32_t). This differs from the JVM
    // side: it is the exact ABI the SDK binaries export.
    //
    // JS representation: a map is carried across the TurboModule boundary as a `ReadonlyArray<[K, V]>`
    // (an array of 2-element [key, value] tuples). JS `Map` serializes to this via `[...map]`, it is
    // TurboModule-codegen-safe (unlike an object with numeric keys), and it preserves ordering and
    // non-string keys. The idiomatic TS wrapper exposes a real `Map<K,V>` and converts on the edge.

    /** Marshal a Map<K,V> parameter: a JS array of [key,value] tuples → FFI map handle. */
    private fun marshalMapParam(
        name: String,
        mapType: LimeMap,
        isNullable: Boolean,
    ): String {
        val mapFfiName = ffiNameResolver.resolveName(mapType as LimeType)
        val mapPrefix = "${libraryName}_$mapFfiName"
        val keyType = mapType.keyType.type.actualType
        val valueType = mapType.valueType.type.actualType
        val keyCType = mapEntryCType(keyType)
        val valueCType = mapEntryCType(valueType)

        ffiDeclarations += "FfiOpaqueHandle ${mapPrefix}_create_handle();"
        ffiDeclarations += "void ${mapPrefix}_put(FfiOpaqueHandle handle, $keyCType key, $valueCType value);"
        ffiDeclarations += "void ${mapPrefix}_release_handle(FfiOpaqueHandle handle);"

        val tmp = freshVar("ffi_$name")
        val body = { obj: String, ind: String ->
            lines += "$ind$tmp = ${mapPrefix}_create_handle();"
            lines += "$ind" + "for (size_t __mi = 0; __mi < $obj.size(rt); __mi++) {"
            lines += "$ind  auto __entry = $obj.getValueAtIndex(rt, __mi).asObject(rt).asArray(rt);"
            lines += "$ind  auto __k = __entry.getValueAtIndex(rt, 0);"
            lines += "$ind  auto __v = __entry.getValueAtIndex(rt, 1);"
            val keyExpr = mapEntryFromJsi("__k", keyType, ind + "  ")
            val valueExpr = mapEntryFromJsi("__v", valueType, ind + "  ")
            lines += "$ind  ${mapPrefix}_put($tmp, $keyExpr, $valueExpr);"
            lines += "$ind}"
        }
        if (isNullable) {
            lines += "  FfiOpaqueHandle $tmp = nullptr;"
            lines += "  if ($name.has_value()) {"
            lines += "    auto& __arr_$name = $name.value();"
            body("__arr_$name", "    ")
            lines += "  }"
        } else {
            lines += "  FfiOpaqueHandle $tmp = nullptr;"
            body(name, "  ")
        }
        listHandlesToRelease += tmp to "${mapPrefix}_release_handle"
        return tmp
    }

    /** Emit code to return a map FFI handle as a jsi::Array of [key,value] tuples. */
    private fun emitMapReturn(
        expr: String,
        mapType: LimeMap,
    ) {
        val mapFfiName = ffiNameResolver.resolveName(mapType as LimeType)
        val mapPrefix = "${libraryName}_$mapFfiName"
        val keyType = mapType.keyType.type.actualType
        val valueType = mapType.valueType.type.actualType

        ffiDeclarations += "FfiOpaqueHandle ${mapPrefix}_iterator(FfiOpaqueHandle handle);"
        ffiDeclarations += "int32_t ${mapPrefix}_iterator_is_valid(FfiOpaqueHandle mapHandle, FfiOpaqueHandle " +
            "iterHandle);"
        ffiDeclarations += "${mapEntryCType(keyType)} ${mapPrefix}_iterator_get_key(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "${mapEntryCType(valueType)} ${mapPrefix}_iterator_get_value(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "void ${mapPrefix}_iterator_increment(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "void ${mapPrefix}_iterator_release_handle(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "void ${mapPrefix}_release_handle(FfiOpaqueHandle handle);"

        lines += "  std::vector<jsi::Value> __mapEntries;"
        lines += "  if ($expr) {"
        lines += "    auto __mapIter = ${mapPrefix}_iterator($expr);"
        lines += "    while (${mapPrefix}_iterator_is_valid($expr, __mapIter)) {"
        lines += "      auto __rawKey = ${mapPrefix}_iterator_get_key(__mapIter);"
        lines += "      auto __rawVal = ${mapPrefix}_iterator_get_value(__mapIter);"
        val keyJsi = mapEntryToJsi("__rawKey", keyType)
        val valueJsi = mapEntryToJsi("__rawVal", valueType)
        lines += "      auto __tuple = jsi::Array(rt, 2);"
        lines += "      __tuple.setValueAtIndex(rt, 0, $keyJsi);"
        lines += "      __tuple.setValueAtIndex(rt, 1, $valueJsi);"
        lines += "      __mapEntries.push_back(jsi::Value(rt, __tuple));"
        lines += "      ${mapPrefix}_iterator_increment(__mapIter);"
        lines += "    }"
        lines += "    ${mapPrefix}_iterator_release_handle(__mapIter);"
        lines += "    ${mapPrefix}_release_handle($expr);"
        lines += "  }"
        lines += "  auto __mapResult = jsi::Array(rt, __mapEntries.size());"
        lines += "  for (size_t __i = 0; __i < __mapEntries.size(); __i++) {"
        lines += "    __mapResult.setValueAtIndex(rt, __i, std::move(__mapEntries[__i]));"
        lines += "  }"
        lines += "  return __mapResult;"
    }

    /** The FFI C type used for a map key/value of the given LIME type (SDK generic-types ABI). */
    private fun mapEntryCType(entryType: LimeType): String =
        when (entryType) {
            is LimeBasicType ->
                when (entryType.typeId) {
                    LimeBasicType.TypeId.STRING, LimeBasicType.TypeId.BLOB, LimeBasicType.TypeId.LOCALE ->
                        "FfiOpaqueHandle"
                    else -> computeFfiReturnType(LimeDirectTypeRef(entryType))
                }
            is LimeEnumeration -> "uint32_t"
            else -> "FfiOpaqueHandle" // struct / class / interface
        }

    /** Convert a JSI value to the FFI C key/value expression for a map entry (param direction). */
    private fun mapEntryFromJsi(
        jsiVar: String,
        entryType: LimeType,
        indent: String,
    ): String =
        when (entryType) {
            is LimeBasicType ->
                when (entryType.typeId) {
                    LimeBasicType.TypeId.STRING -> {
                        ffiDeclarations += "FfiOpaqueHandle ${libraryName}_std_string_create_handle(const char* value);"
                        val v = freshVar("mapstr")
                        lines += "$indent" + "auto __s_$v = $jsiVar.asString(rt).utf8(rt);"
                        lines += "$indent" + "auto $v = ${libraryName}_std_string_create_handle(__s_$v.c_str());"
                        v
                    }
                    LimeBasicType.TypeId.BOOLEAN -> "$jsiVar.getBool()"
                    LimeBasicType.TypeId.FLOAT -> "static_cast<float>($jsiVar.asNumber())"
                    LimeBasicType.TypeId.DOUBLE -> "$jsiVar.asNumber()"
                    LimeBasicType.TypeId.DATE, LimeBasicType.TypeId.DURATION ->
                        "static_cast<uint64_t>($jsiVar.asNumber())"
                    else -> "static_cast<${computeFfiReturnType(LimeDirectTypeRef(entryType))}>($jsiVar.asNumber())"
                }
            is LimeEnumeration -> "static_cast<uint32_t>($jsiVar.asNumber())"
            else -> {
                // struct / class / interface — registry key string → validated FFI handle
                val v = freshVar("maph")
                lines += "$indent" + "auto __hid_$v = $jsiVar.asString(rt).utf8(rt);"
                lines += "$indent" + "auto $v = FfiHandleRegistry::instance().retrieve(__hid_$v);"
                lines += "$indent" + "if (!$v) throw jsi::JSError(rt, \"Invalid handle in map entry\");"
                v
            }
        }

    /** Convert an FFI C key/value into a jsi::Value for a map entry (return direction). */
    private fun mapEntryToJsi(
        rawVar: String,
        entryType: LimeType,
    ): String =
        when (entryType) {
            is LimeBasicType ->
                when (entryType.typeId) {
                    LimeBasicType.TypeId.STRING -> {
                        ffiDeclarations += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                        ffiDeclarations += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        // Read then release the transient std_string handle returned by the iterator.
                        "([&]{ auto __sv = ${libraryName}_std_string_get_value($rawVar); " +
                            "auto __js = jsi::String::createFromUtf8(rt, __sv ? __sv : \"\"); " +
                            "${libraryName}_std_string_release_handle($rawVar); return jsi::Value(rt, __js); }())"
                    }
                    LimeBasicType.TypeId.BOOLEAN -> "jsi::Value(static_cast<bool>($rawVar))"
                    LimeBasicType.TypeId.DURATION ->
                        "jsi::Value(static_cast<double>($rawVar) / 1000000.0)"
                    else -> "jsi::Value(static_cast<double>($rawVar))"
                }
            is LimeEnumeration -> "jsi::Value(static_cast<double>($rawVar))"
            else -> {
                // struct / class / interface — store handle in registry, return its key string
                "jsi::Value(rt, jsi::String::createFromUtf8(rt, FfiHandleRegistry::instance().store($rawVar)))"
            }
        }

    /** Marshal a lambda/callback parameter from JS function to FFI proxy handle. */
    private fun marshalLambdaParam(
        name: String,
        lambdaType: LimeLambda,
        isNullable: Boolean,
    ): String {
        val ffiTypeName = ffiNameResolver.resolveName(lambdaType as LimeType)
        val releaseHandle = "${libraryName}_${ffiTypeName}_release_handle"
        ffiDeclarations += "void $releaseHandle(FfiOpaqueHandle handle);"

        // create_proxy wraps our static trampolines in the SDK's std::function machinery.
        val createProxy = "${libraryName}_${ffiTypeName}_create_proxy"
        ffiDeclarations += "FfiOpaqueHandle $createProxy(uint64_t token, int32_t isolate_id, " +
            "void* dart_handle, FfiOpaqueHandle close_fn, FfiOpaqueHandle call_fn);"

        // Number of FFI (void*) parameters the SDK callback passes to our f0 trampoline.
        val paramCount = lambdaType.parameters.size

        // Determine if any parameter needs typed conversion (nullable enum or list/set).
        val needsTypedSlot =
            lambdaType.parameters.any { p ->
                val actual = p.typeRef.type.actualType
                (actual is LimeEnumeration && p.typeRef.isNullable) ||
                    actual is LimeList || actual is LimeSet
            }

        val tmp = freshVar("ffi_$name")
        if (!needsTypedSlot) {
            // Fast path: all params are opaque handles — use generic acquire<N>.
            if (isNullable) {
                lines += "  FfiOpaqueHandle $tmp = nullptr;"
                lines += "  if ($name) {"
                lines += "    auto __wrapper_$name = " +
                    "facebook::react::CallbackWrapper::createWeak(std::move(*$name), rt, jsInvoker_);"
                lines += "    auto __slot_$name = FfiCbs::acquire<$paramCount>(std::move(__wrapper_$name));"
                lines += "    $tmp = $createProxy(__slot_$name.token, g_ffi_isolate_id, nullptr, " +
                    "__slot_$name.close_fn, " +
                    "__slot_$name.call_fn);"
                lines += "  }"
            } else {
                lines += "  auto __wrapper_$name = facebook::react::CallbackWrapper::createWeak(std::move($name), " +
                    "rt, jsInvoker_);"
                lines += "  auto __slot_$name = FfiCbs::acquire<$paramCount>(std::move(__wrapper_$name));"
                lines += "  FfiOpaqueHandle $tmp = $createProxy(__slot_$name.token, g_ffi_isolate_id, " +
                    "nullptr, __slot_$name.close_fn, " +
                    "__slot_$name.call_fn);"
            }
            return tmp
        }

        // Typed path: read SDK callback payloads into OWNED plain C++
        // SYNCHRONOUSLY on the drain thread (they are valid only during the synchronous
        // callback), then build jsi from the owned values on the JS thread inside invokeAsync.
        val rawSlot = "__rawSlot_$name"
        val wrapperVar = "__wrapper_$name"
        val pParams = (0 until paramCount).joinToString(", ") { "void* p$it" }

        val open =
            if (isNullable) {
                lines += "  FfiOpaqueHandle $tmp = nullptr;"
                lines += "  if ($name) {"
                lines += "    auto $wrapperVar = facebook::react::CallbackWrapper::createWeak(std::move(*$name), rt, " +
                    "jsInvoker_);"
                "    "
            } else {
                lines += "  auto $wrapperVar = facebook::react::CallbackWrapper::createWeak(std::move($name), rt, " +
                    "jsInvoker_);"
                "  "
            }

        // Per-parameter phases: drain (owned C++ on drain thread), captures, jsi (owned -> jsi).
        val drain = mutableListOf<String>()
        val captures = mutableListOf<String>()
        val jsiL = mutableListOf<String>()
        for ((idx, param) in lambdaType.parameters.withIndex()) {
            val pVar = "p$idx"
            val aVar = "a$idx"
            val actualType = param.typeRef.type.actualType
            val isNullableP = param.typeRef.isNullable
            when {
                actualType is LimeEnumeration && isNullableP -> {
                    val enumFfiName = ffiNameResolver.resolveName(actualType)
                    val getVal = "${libraryName}_${enumFfiName}_get_value_nullable"
                    val relNul = "${libraryName}_${enumFfiName}_release_handle_nullable"
                    ffiDeclarations += "uint32_t $getVal(FfiOpaqueHandle handle);"
                    ffiDeclarations += "void $relNul(FfiOpaqueHandle handle);"
                    drain += "std::optional<uint32_t> __oe$idx;"
                    drain += "if ($pVar) { __oe$idx = $getVal($pVar); $relNul($pVar); }"
                    captures += "__oe$idx"
                    jsiL += "facebook::jsi::Value $aVar = __oe$idx ? facebook::jsi::Value(rt, " +
                        "static_cast<double>(*__oe$idx)) : " +
                        "facebook::jsi::Value::null();"
                }
                actualType is LimeEnumeration -> {
                    drain += "auto __en$idx = static_cast<int>(reinterpret_cast<intptr_t>($pVar));"
                    captures += "__en$idx"
                    jsiL += "auto $aVar = facebook::jsi::Value(rt, static_cast<double>(__en$idx));"
                }
                actualType is LimeList || actualType is LimeSet -> {
                    val elemTypeRef =
                        when (actualType) {
                            is LimeList -> actualType.elementType
                            is LimeSet -> actualType.elementType
                            else -> error("unreachable")
                        }
                    val elemType = elemTypeRef.type.actualType
                    val lp = "${libraryName}_${ffiNameResolver.resolveName(actualType)}"
                    ffiDeclarations += "FfiOpaqueHandle ${lp}_iterator(FfiOpaqueHandle handle);"
                    ffiDeclarations += "int32_t ${lp}_iterator_is_valid(FfiOpaqueHandle listHandle, " +
                        "FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "FfiOpaqueHandle ${lp}_iterator_get(FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "void ${lp}_iterator_increment(FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "void ${lp}_iterator_release_handle(FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "void ${lp}_release_handle(FfiOpaqueHandle handle);"
                    val stringVec: Boolean
                    val push: String
                    when {
                        elemType is LimeEnumeration -> {
                            stringVec = false
                            push = "__vv.push_back(static_cast<double>(" +
                                "static_cast<int>(reinterpret_cast<intptr_t>(__item))));"
                        }
                        elemType is LimeBasicType && elemType.typeId == LimeBasicType.TypeId.STRING -> {
                            val gs = "${libraryName}_std_string_get_value"
                            val rs = "${libraryName}_std_string_release_handle"
                            ffiDeclarations += "const char* $gs(FfiOpaqueHandle handle);"
                            ffiDeclarations += "void $rs(FfiOpaqueHandle handle);"
                            stringVec = true
                            push = "{ auto __sv = $gs(__item); " +
                                "__vv.push_back(__sv ? std::string(__sv) : std::string()); $rs(__item); }"
                        }
                        elemType is LimeBasicType -> {
                            stringVec = false
                            push = "__vv.push_back(static_cast<double>(" +
                                "static_cast<int64_t>(reinterpret_cast<intptr_t>(__item))));"
                        }
                        else -> {
                            stringVec = true
                            push = "__vv.push_back(FfiHandleRegistry::instance().store(__item));"
                        }
                    }
                    val vt = if (stringVec) "std::string" else "double"
                    val v = "__v$idx"
                    drain += "std::optional<std::vector<$vt>> $v;"
                    drain += "if ($pVar) { std::vector<$vt> __vv; auto __it = ${lp}_iterator($pVar); while " +
                        "(${lp}_iterator_is_valid($pVar, __it)) { auto __item = ${lp}_iterator_get(__it); $push " +
                        "${lp}_iterator_increment(__it); } ${lp}_iterator_release_handle(__it); " +
                        "${lp}_release_handle($pVar); $v = std::move(__vv); }"
                    captures += "$v = std::move($v)"
                    val toJsi =
                        if (stringVec) {
                            "facebook::jsi::String::createFromUtf8(rt, (*$v)[__i])"
                        } else {
                            "facebook::jsi::Value(rt, (*$v)[__i])"
                        }
                    jsiL += "facebook::jsi::Value $aVar = facebook::jsi::Value::null();"
                    jsiL += "if ($v) { facebook::jsi::Array __arr$idx(rt, $v->size()); for (size_t __i = 0; " +
                        "__i < $v->size(); ++__i) " +
                        "__arr$idx.setValueAtIndex(rt, __i, $toJsi); $aVar = facebook::jsi::Value(rt, " +
                        "std::move(__arr$idx)); }"
                }
                else -> {
                    drain += "std::optional<std::string> __oh$idx;"
                    drain += "if ($pVar) __oh$idx = FfiHandleRegistry::instance().store($pVar);"
                    captures += "__oh$idx = std::move(__oh$idx)"
                    jsiL += "auto $aVar = __oh$idx ? facebook::jsi::Value(rt, " +
                        "facebook::jsi::String::createFromUtf8(rt, *__oh$idx)) : " +
                        "facebook::jsi::Value::null();"
                }
            }
        }

        lines += "${open}auto $rawSlot = FfiCbs::acquireRawSlot<$paramCount>();"
        lines += "${open}FfiCbs::setCallback($rawSlot.k, [w = std::move($wrapperVar)]($pParams) {"
        for (d in drain) lines += "$open  $d"
        lines += "$open  auto sp = w.lock();"
        lines += "$open  if (!sp) return;"
        lines += "$open  sp->jsInvoker().invokeAsync([${(listOf("w") + captures).joinToString(
            ", " +
                "",
        )}](facebook::jsi::Runtime& rt) " +
            "mutable {"
        lines += "$open    auto sp2 = w.lock();"
        lines += "$open    if (!sp2) return;"
        for (j in jsiL) lines += "$open    $j"
        val aArgs = (0 until paramCount).joinToString(", ") { "a$it" }
        lines += "$open    sp2->callback().call(rt${if (aArgs.isNotEmpty()) ", $aArgs" else ""});"
        lines += "$open    sp2->destroy();"
        lines += "$open  });"
        lines += "$open});"
        lines += "${open}${if (isNullable) "" else "FfiOpaqueHandle "}$tmp = $createProxy($rawSlot.token, " +
            "g_ffi_isolate_id, nullptr, " +
            "$rawSlot.close_fn, $rawSlot.call_fn);"
        if (isNullable) lines += "  }"
        return tmp
    }

    /**
     * Marshal a single-method interface parameter (listener) from JS function to FFI proxy handle.
     * Uses the same FfiCallbackSlot pattern as lambdas: acquireRawSlot<N> + create_proxy.
     */
    private fun marshalInterfaceListenerParam(
        name: String,
        ifaceType: LimeInterface,
        isNullable: Boolean,
    ): String {
        val ffiTypeName = ffiNameResolver.resolveName(ifaceType as LimeType)

        // Only generate proxy for single-method interfaces (listener pattern).
        // Multi-method interfaces (non-listener object interfaces) are object handles.
        if (ifaceType.functions.size != 1) {
            // Multi-method LISTENER (all methods void, ≤3 params, no props/constants) → object-of-callbacks
            // proxy with one call_fn slot per method (Phase 23.5). Other multi-method interfaces stay handles.
            if (ifaceType.isCallbackListenerInterface()) {
                return marshalMultiMethodListener(name, ifaceType, isNullable)
            }
            // Object interface (existing SDK object, not a callback listener): the JS side passes a
            // registry key string, exactly like a class/struct handle parameter. Marshal identically —
            // read the utf8 key, retrieve the FFI handle, validate it is non-null, and pass it through.
            // No callback proxy, no nullptr placeholder.
            val tmp = freshVar("ffi_$name")
            if (isNullable) {
                // Object interfaces are reference types: the SDK exports no *_create_handle_nullable
                // (like LimeClass nullable). Pass the raw registry handle, or nullptr when absent.
                lines += "  FfiOpaqueHandle $tmp = nullptr;"
                lines += "  if ($name.has_value()) {"
                lines += "    auto __hid_$name = $name.value().utf8(rt);"
                lines += "    $tmp = FfiHandleRegistry::instance().retrieve(__hid_$name);"
                lines += "  }"
            } else {
                lines += "  auto __hid_$name = $name.utf8(rt);"
                lines += "  FfiOpaqueHandle $tmp = FfiHandleRegistry::instance().retrieveChecked(__hid_$name, " +
                    "\"param '$name'\");"
            }
            return tmp
        }

        val createProxy = "${libraryName}_${ffiTypeName}_create_proxy"
        val releaseHandle = "${libraryName}_${ffiTypeName}_release_handle"

        // Get the interface's single method to determine parameter count
        val method = ifaceType.functions.firstOrNull()
        val paramCount = method?.parameters?.size ?: 0

        // FfiCallbackSlot only supports 0-3 params; fall back to nullptr for unsupported arities
        if (paramCount > 3) {
            val tmp = freshVar("ffi_$name")
            lines += "  // Interface listener with $paramCount params (unsupported arity) — skipped"
            lines += "  FfiOpaqueHandle $tmp = nullptr;"
            return tmp
        }

        ffiDeclarations += "FfiOpaqueHandle $createProxy(uint64_t token, int32_t isolate_id, " +
            "void* dart_handle, FfiOpaqueHandle close_fn, FfiOpaqueHandle call_fn);"
        ffiDeclarations += "void $releaseHandle(FfiOpaqueHandle handle);"

        val tmp = freshVar("ffi_$name")
        val wrapperVar = "__wrapper_$name"
        val slotVar = "__slot_$name"

        if (isNullable) {
            lines += "  FfiOpaqueHandle $tmp = nullptr;"
            lines += "  if ($name) {"
            lines += "    auto $wrapperVar = facebook::react::CallbackWrapper::createWeak(std::move(*$name), rt, " +
                "jsInvoker_);"
            lines += "    auto $slotVar = FfiCbs::acquireRawSlot<$paramCount>();"
            // Emit callback lambda that stores params as handles and invokes JS
            emitInterfaceCallbackBody(slotVar, wrapperVar, method, "    ")
            lines += "    $tmp = $createProxy($slotVar.token, g_ffi_isolate_id, nullptr, $slotVar.close_fn, " +
                "$slotVar.call_fn);"
            lines += "  }"
        } else {
            lines += "  auto $wrapperVar = facebook::react::CallbackWrapper::createWeak(std::move($name), rt, " +
                "jsInvoker_);"
            lines += "  auto $slotVar = FfiCbs::acquireRawSlot<$paramCount>();"
            emitInterfaceCallbackBody(slotVar, wrapperVar, method, "  ")
            lines += "  FfiOpaqueHandle $tmp = $createProxy($slotVar.token, g_ffi_isolate_id, nullptr, " +
                "$slotVar.close_fn, " +
                "$slotVar.call_fn);"
        }
        proxyHandlesToRelease += tmp to releaseHandle
        return tmp
    }

    /**
     * Phase 23.5: marshal a multi-method listener interface (implemented in JS as an object of optional
     * callbacks) to the SDK's multi-slot `create_proxy(token, isolate, dart_handle, close_fn, call_f0..)`.
     * One FfiCallbackSlot per method, call_fns passed in LIME DECLARATION order (matching the Dart FFI
     * ABI). Token + close_fn come from slot 0 (patch-parity lifetime; a per-group close is a follow-up).
     * Missing JS properties get a no-op so the trampoline never invokes an empty std::function.
     */
    private fun marshalMultiMethodListener(
        name: String,
        ifaceType: LimeInterface,
        isNullable: Boolean,
    ): String {
        val ffiTypeName = ffiNameResolver.resolveName(ifaceType as LimeType)
        val createProxy = "${libraryName}_${ffiTypeName}_create_proxy"
        val releaseHandle = "${libraryName}_${ffiTypeName}_release_handle"
        // Order MUST match the SDK's create_proxy, generated by FfiProxyDeclaration.mustache as
        // `{{#each inheritedFunctions functions}}` filtered by !isStatic — i.e. inherited functions
        // first, then own, in declaration order. call_fns are passed positionally in this order.
        val methods = (ifaceType.inheritedFunctions + ifaceType.functions).filter { !it.isStatic }

        val callParams = methods.indices.joinToString(", ") { "FfiOpaqueHandle call_f$it" }
        ffiDeclarations += "FfiOpaqueHandle $createProxy(uint64_t token, int32_t isolate_id, void* " +
            "dart_handle, FfiOpaqueHandle " +
            "close_fn, $callParams);"
        ffiDeclarations += "void $releaseHandle(FfiOpaqueHandle handle);"

        val tmp = freshVar("ffi_$name")
        val obj = if (isNullable) "(*$name)" else name
        val ind = if (isNullable) "    " else "  "
        lines += "  FfiOpaqueHandle $tmp = nullptr;"
        lines += if (isNullable) "  if ($name) {" else "  {"
        val slots = mutableListOf<String>()
        for ((i, method) in methods.withIndex()) {
            val pc = method.parameters.size
            val slot = "__slot_${name}_$i"
            slots += slot
            val jsName = toCamelCaseName(method.path.name)
            lines += "$ind auto $slot = FfiCbs::acquireRawSlot<$pc>();"
            lines += "$ind if ($obj.hasProperty(rt, \"$jsName\") && $obj.getProperty(rt, \"$jsName\").isObject()) {"
            lines += "$ind   auto __fn_${name}_$i = $obj.getProperty(rt, \"$jsName\").asObject(rt).asFunction(rt);"
            lines += "$ind   auto __wrapper_${name}_$i = " +
                "facebook::react::CallbackWrapper::createWeak(std::move(__fn_${name}_$i), rt, " +
                "jsInvoker_);"
            emitInterfaceCallbackBody(slot, "__wrapper_${name}_$i", method, "$ind   ")
            lines += "$ind } else {"
            lines += "$ind   FfiCbs::setCallback($slot.k, FfiCbs::CB$pc{});"
            lines += "$ind }"
        }
        val callFns = slots.joinToString(", ") { "$it.call_fn" }
        lines += "$ind $tmp = $createProxy(${slots[0]}.token, g_ffi_isolate_id, nullptr, ${slots[0]}.close_fn, " +
            "$callFns);"
        lines += "  }"
        proxyHandlesToRelease += tmp to releaseHandle
        return tmp
    }

    /** snake_case (LIME) → camelCase (JS property key), e.g. `on_progress` → `onProgress`. */
    private fun toCamelCaseName(snake: String): String = NameHelper.toLowerCamelCase(snake)

    /** Emit the FfiCbs::setCallback(slot.k, lambda) that dispatches interface callback params to JS.
     *  SDK callback payloads are valid only during the synchronous
     *  callback on the drain thread, so marshal them into OWNED plain C++ there, then build
     *  jsi from the owned values on the JS thread inside invokeAsync. Also unwraps List/Set
     *  params (e.g. WarningListener.onWarnings(List<Warning>)) into a jsi::Array — previously
     *  every param was mis-marshalled as a single handle string. Persistent listener: no destroy(). */
    private fun emitInterfaceCallbackBody(
        slotVar: String,
        wrapperVar: String,
        method: LimeFunction?,
        indent: String,
    ) {
        val params = method?.parameters ?: emptyList()
        val paramCount = params.size
        val pParams = (0 until paramCount).joinToString(", ") { "void* p$it" }

        val drain = mutableListOf<String>()
        val captures = mutableListOf<String>()
        val jsi = mutableListOf<String>()
        for ((idx, param) in params.withIndex()) {
            val pVar = "p$idx"
            val aVar = "a$idx"
            val actual = param.typeRef.type.actualType
            val nullableP = param.typeRef.isNullable
            when {
                actual is LimeEnumeration && nullableP -> {
                    val en = ffiNameResolver.resolveName(actual)
                    val getVal = "${libraryName}_${en}_get_value_nullable"
                    val relNul = "${libraryName}_${en}_release_handle_nullable"
                    ffiDeclarations += "uint32_t $getVal(FfiOpaqueHandle handle);"
                    ffiDeclarations += "void $relNul(FfiOpaqueHandle handle);"
                    drain += "std::optional<uint32_t> __oe$idx;"
                    drain += "if ($pVar) { __oe$idx = $getVal($pVar); $relNul($pVar); }"
                    captures += "__oe$idx"
                    jsi += "facebook::jsi::Value $aVar = __oe$idx ? facebook::jsi::Value(rt2, " +
                        "static_cast<double>(*__oe$idx)) : " +
                        "facebook::jsi::Value::null();"
                }
                actual is LimeEnumeration -> {
                    drain += "auto __en$idx = static_cast<int>(reinterpret_cast<intptr_t>($pVar));"
                    captures += "__en$idx"
                    jsi += "auto $aVar = facebook::jsi::Value(rt2, static_cast<double>(__en$idx));"
                }
                actual is LimeList || actual is LimeSet -> {
                    val elemTypeRef = if (actual is LimeList) actual.elementType else (actual as LimeSet).elementType
                    val elemType = elemTypeRef.type.actualType
                    val lp = "${libraryName}_${ffiNameResolver.resolveName(actual)}"
                    ffiDeclarations += "FfiOpaqueHandle ${lp}_iterator(FfiOpaqueHandle handle);"
                    ffiDeclarations += "int32_t ${lp}_iterator_is_valid(FfiOpaqueHandle listHandle, " +
                        "FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "FfiOpaqueHandle ${lp}_iterator_get(FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "void ${lp}_iterator_increment(FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "void ${lp}_iterator_release_handle(FfiOpaqueHandle iterHandle);"
                    ffiDeclarations += "void ${lp}_release_handle(FfiOpaqueHandle handle);"
                    val stringVec: Boolean
                    val push: String
                    when {
                        elemType is LimeEnumeration -> {
                            stringVec = false
                            push = "__vv.push_back(static_cast<double>(" +
                                "static_cast<int>(reinterpret_cast<intptr_t>(__item))));"
                        }
                        elemType is LimeBasicType && elemType.typeId == LimeBasicType.TypeId.STRING -> {
                            val gs = "${libraryName}_std_string_get_value"
                            val rs = "${libraryName}_std_string_release_handle"
                            ffiDeclarations += "const char* $gs(FfiOpaqueHandle handle);"
                            ffiDeclarations += "void $rs(FfiOpaqueHandle handle);"
                            stringVec = true
                            push = "{ auto __sv = $gs(__item); " +
                                "__vv.push_back(__sv ? std::string(__sv) : std::string()); $rs(__item); }"
                        }
                        elemType is LimeBasicType -> {
                            stringVec = false
                            push = "__vv.push_back(static_cast<double>(" +
                                "static_cast<int64_t>(reinterpret_cast<intptr_t>(__item))));"
                        }
                        else -> {
                            stringVec = true
                            push = "__vv.push_back(FfiHandleRegistry::instance().store(__item));"
                        }
                    }
                    val vt = if (stringVec) "std::string" else "double"
                    val v = "__v$idx"
                    drain += "std::optional<std::vector<$vt>> $v;"
                    drain += "if ($pVar) { std::vector<$vt> __vv; auto __it = ${lp}_iterator($pVar); while " +
                        "(${lp}_iterator_is_valid($pVar, __it)) { auto __item = ${lp}_iterator_get(__it); $push " +
                        "${lp}_iterator_increment(__it); } ${lp}_iterator_release_handle(__it); " +
                        "${lp}_release_handle($pVar); $v = std::move(__vv); }"
                    captures += "$v = std::move($v)"
                    val toJsi =
                        if (stringVec) {
                            "facebook::jsi::String::createFromUtf8(rt2, (*$v)[__i])"
                        } else {
                            "facebook::jsi::Value(rt2, (*$v)[__i])"
                        }
                    jsi += "facebook::jsi::Value $aVar = facebook::jsi::Value::null();"
                    jsi += "if ($v) { facebook::jsi::Array __arr$idx(rt2, $v->size()); for (size_t __i = 0; " +
                        "__i < $v->size(); ++__i) " +
                        "__arr$idx.setValueAtIndex(rt2, __i, $toJsi); $aVar = facebook::jsi::Value(rt2, " +
                        "std::move(__arr$idx)); }"
                }
                else -> {
                    drain += "std::optional<std::string> __oh$idx;"
                    drain += "if ($pVar) __oh$idx = FfiHandleRegistry::instance().store($pVar);"
                    captures += "__oh$idx = std::move(__oh$idx)"
                    jsi += "auto $aVar = __oh$idx ? facebook::jsi::Value(rt2, " +
                        "facebook::jsi::String::createFromUtf8(rt2, *__oh$idx)) : " +
                        "facebook::jsi::Value::null();"
                }
            }
        }

        lines += "${indent}FfiCbs::setCallback($slotVar.k, [w = $wrapperVar]($pParams) {"
        for (d in drain) lines += "$indent  $d"
        lines += "$indent  auto sp = w.lock();"
        lines += "$indent  if (!sp) return;"
        lines += "$indent  sp->jsInvoker().invokeAsync([${(listOf("w2 = w") + captures).joinToString(
            ", " +
                "",
        )}](facebook::jsi::Runtime& " +
            "rt2) mutable {"
        lines += "$indent    auto sp2 = w2.lock();"
        lines += "$indent    if (!sp2) return;"
        for (j in jsi) lines += "$indent    $j"
        val aArgs = (0 until paramCount).joinToString(", ") { "a$it" }
        lines += "$indent    sp2->callback().call(rt2${if (aArgs.isNotEmpty()) ", $aArgs" else ""});"
        lines += "$indent  });"
        lines += "$indent});"
    }

    /** Emit code to return a list/set FFI handle as a jsi::Array. */
    private fun emitCollectionReturn(
        expr: String,
        collType: LimeType,
        elemTypeRef: LimeTypeRef,
    ) {
        val elementType = elemTypeRef.type.actualType
        val listFfiName = ffiNameResolver.resolveName(collType)
        val listPrefix = "${libraryName}_$listFfiName"

        ffiDeclarations += "FfiOpaqueHandle ${listPrefix}_iterator(FfiOpaqueHandle handle);"
        ffiDeclarations += "int32_t ${listPrefix}_iterator_is_valid(FfiOpaqueHandle listHandle, FfiOpaqueHandle " +
            "iterHandle);"
        ffiDeclarations += "FfiOpaqueHandle ${listPrefix}_iterator_get(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "void ${listPrefix}_iterator_increment(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "void ${listPrefix}_iterator_release_handle(FfiOpaqueHandle iterHandle);"
        ffiDeclarations += "void ${listPrefix}_release_handle(FfiOpaqueHandle handle);"

        lines += "  std::vector<jsi::Value> __resultElems;"
        lines += "  if ($expr) {"
        lines += "    auto __listIter = ${listPrefix}_iterator($expr);"
        lines += "    while (${listPrefix}_iterator_is_valid($expr, __listIter)) {"
        lines += "      auto __item = ${listPrefix}_iterator_get(__listIter);"
        emitListGetElement("__resultElems", "__item", elementType)
        lines += "      ${listPrefix}_iterator_increment(__listIter);"
        lines += "    }"
        lines += "    ${listPrefix}_iterator_release_handle(__listIter);"
        lines += "    ${listPrefix}_release_handle($expr);"
        lines += "  }"
        lines += "  auto __result = jsi::Array(rt, __resultElems.size());"
        lines += "  for (size_t __i = 0; __i < __resultElems.size(); __i++) {"
        lines += "    __result.setValueAtIndex(rt, __i, std::move(__resultElems[__i]));"
        lines += "  }"
        lines += "  return __result;"
    }

    /** Emit code to convert a single FFI list element to a jsi::Value and push to a vector. */
    private fun emitListGetElement(
        vecVar: String,
        elemVar: String,
        elementType: LimeType,
    ) {
        when (elementType) {
            is LimeBasicType ->
                when (elementType.typeId) {
                    LimeBasicType.TypeId.STRING -> {
                        ffiDeclarations += "const char* ${libraryName}_std_string_get_value(FfiOpaqueHandle handle);"
                        ffiDeclarations += "void ${libraryName}_std_string_release_handle(FfiOpaqueHandle handle);"
                        lines += "      auto __sv = ${libraryName}_std_string_get_value($elemVar);"
                        lines += "      $vecVar.push_back(jsi::String::createFromUtf8(rt, __sv ? __sv : \"\"));"
                        lines += "      ${libraryName}_std_string_release_handle($elemVar);"
                    }
                    LimeBasicType.TypeId.BOOLEAN -> {
                        lines += "      " +
                            "$vecVar.push_back(jsi::Value(static_cast<bool>(reinterpret_cast<intptr_t>($elemVar))));"
                    }
                    LimeBasicType.TypeId.DOUBLE, LimeBasicType.TypeId.FLOAT -> {
                        lines += "      $vecVar.push_back(jsi::Value(static_cast<double>(" +
                            "reinterpret_cast<double>(reinterpret_cast<intptr_t>($elemVar)))));"
                    }
                    else -> {
                        lines += "      $vecVar.push_back(jsi::Value(static_cast<double>(" +
                            "static_cast<int64_t>(reinterpret_cast<intptr_t>($elemVar)))));"
                    }
                }
            is LimeStruct, is LimeClass, is LimeInterface -> {
                lines += "      auto __ek = FfiHandleRegistry::instance().store($elemVar);"
                lines += "      $vecVar.push_back(jsi::String::createFromUtf8(rt, __ek));"
            }
            is LimeEnumeration -> {
                lines += "      $vecVar.push_back(jsi::Value(static_cast<double>(" +
                    "static_cast<int>(reinterpret_cast<intptr_t>($elemVar)))));"
            }
            else -> {
                lines += "      auto __ek = FfiHandleRegistry::instance().store($elemVar);"
                lines += "      $vecVar.push_back(jsi::String::createFromUtf8(rt, __ek));"
            }
        }
    }
}
