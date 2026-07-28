/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN_COROUTINE
import com.here.gluecodium.model.lime.LimeAttributeValueType.CALLBACK
import com.here.gluecodium.model.lime.LimeAttributeValueType.COMPLETE
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.EMIT
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.FLOW
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributeValueType.RESULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.UNREGISTER
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypedElement
import java.io.File

/**
 * Generates Kotlin coroutine (`suspend fun`) and Flow wrappers for functions marked `@KotlinCoroutine`.
 *
 * Wrappers are emitted as members of concrete generated classes. Shared bridges and typed exceptions are emitted once
 * per concrete class package. Every wrapper calls the existing callback API, so C++ and JNI declarations are unchanged.
 *
 * Callback/result/error roles can be declared explicitly via `@KotlinCoroutine(Callback)`,
 * `@KotlinCoroutine(Result)`, and `@KotlinCoroutine(Error)`. When a callback or result role is
 * omitted, the generator falls back to convention: the sole callback-typed parameter is the callback, all callback
 * members other than the explicitly marked error are results, and a `cancel()` method on the returned handle is the
 * cancellation hook. `Flow`, `Emit`, `Complete`, and `Unregister` roles describe repeating listener lifecycles.
 *
 * The resulting model describes the callback/result/error/cancel shape and can be reused by a future Swift `async`
 * generator, while this implementation emits Kotlin only.
 */
internal object KotlinAsyncHelpers {
    private const val TEMPLATE_NAME = "kotlin/KotlinCoroutines"
    private const val MEMBERS_TEMPLATE_NAME = "kotlin/KotlinCoroutineMembers"

    /** Generates one bridge/exception support file per package containing coroutine APIs. */
    fun createCoroutineSupportFiles(
        rootElements: List<LimeNamedElement>,
        nameResolver: KotlinNameResolver,
        basePackages: List<String>,
        generatorName: String,
    ): List<GeneratedFile> {
        val coroutineClasses =
            rootElements
                .flatMap { LimeTypeHelper.getAllTypes(it) }
                .filterIsInstance<LimeClass>()
                .filter { limeClass ->
                    (limeClass.functions + limeClass.interfaceInheritedFunctions).any { isKotlinCoroutineFunction(it) }
                }

        return coroutineClasses
            .groupBy { (basePackages + it.path.head).map(KotlinNameResolver::normalizePackageName) }
            .map { (packageNames, classes) ->
                val supports =
                    classes.map { limeClass ->
                        val receiverName = nameResolver.resolveName(limeClass)
                        mapOf(
                            "contractViolationName" to contractViolationName(receiverName),
                            "resultBridgeName" to resultBridgeName(receiverName),
                            "valueBridgeName" to valueBridgeName(receiverName),
                        )
                    }
                val templateData =
                    mapOf(
                        "packageName" to packageNames.joinToString("."),
                        "fileJvmName" to
                            classes.map { nameResolver.resolveName(it) }.sorted().joinToString("") + "KotlinCoroutines",
                        "supports" to supports,
                    )
                val content = TemplateEngine.render(TEMPLATE_NAME, templateData)
                val fileName = (listOf(generatorName) + packageNames + "KotlinCoroutines.kt").joinToString(File.separator)
                GeneratedFile(content, fileName)
            }
    }

    /**
     * Renders the coroutine `suspend` wrappers for [limeClass] as class members (not extensions).
     *
     * A wrapper is generated for every `@KotlinCoroutine` function the class declares or inherits from
     * an implemented interface, so each concrete engine (e.g. `RoutingEngine`, `OfflineRoutingEngine`)
     * exposes the `suspend` API as a real member. The returned block is indented for insertion into a
     * class body; it is empty when the class has no such functions.
     */
    fun buildClassCoroutineMembers(
        limeClass: LimeClass,
        nameResolver: KotlinNameResolver,
    ): String {
        val classFunctions = (limeClass.functions + limeClass.interfaceInheritedFunctions).distinct()
        val coroutineFunctions =
            classFunctions
                .filter { isKotlinCoroutineFunction(it) }
        if (coroutineFunctions.isEmpty()) return ""

        val receiverName = nameResolver.resolveName(limeClass)
        // Exception names that collide with a different error type are rejected by `LimeKotlinCoroutineValidator`,
        // so identical duplicates are all that can reach here and de-duplicating them is safe.
        val exceptionClasses =
            coroutineFunctions
                .mapNotNull { function -> findErrorMember(function)?.let { function to it } }
                .map { (function, errorMember) -> buildExceptionClass(function, errorMember, nameResolver) }
                .distinctBy { it["name"] }
        val functions = coroutineFunctions.filterNot { isFlowFunction(it) }.map { buildFunctionModel(it, receiverName, nameResolver) }
        val flows =
            coroutineFunctions.filter { isFlowFunction(it) }
                .map { buildFlowFunctionModel(it, classFunctions, receiverName, nameResolver) }
        val content =
            TemplateEngine.render(
                MEMBERS_TEMPLATE_NAME,
                mapOf("exceptions" to exceptionClasses, "functions" to functions, "flows" to flows),
            )
        return indentLines(content.trim('\n'), "    ")
    }

    fun hasFlowMembers(limeClass: LimeClass): Boolean =
        (limeClass.functions + limeClass.interfaceInheritedFunctions).any { isKotlinCoroutineFunction(it) && isFlowFunction(it) }

    private fun indentLines(
        content: String,
        indent: String,
    ): String = content.lineSequence().joinToString("\n") { if (it.isBlank()) it else indent + it }

    private fun isKotlinCoroutineFunction(limeFunction: LimeFunction) =
        limeFunction.attributes.have(KOTLIN_COROUTINE) &&
            !limeFunction.attributes.have(KOTLIN_COROUTINE, UNREGISTER) &&
            findCallbackParameter(limeFunction) != null

    private fun isFlowFunction(limeFunction: LimeFunction) = limeFunction.attributes.have(KOTLIN_COROUTINE, FLOW)

    private fun coroutineName(
        limeFunction: LimeFunction,
        nameResolver: KotlinNameResolver,
    ) = limeFunction.attributes.get(KOTLIN_COROUTINE, NAME) ?: nameResolver.resolveName(limeFunction)

    private fun exceptionName(
        limeFunction: LimeFunction,
        nameResolver: KotlinNameResolver,
    ) = "${coroutineName(limeFunction, nameResolver).replaceFirstChar { it.uppercase() }}Exception"

    private fun supportPrefix(receiverName: String) = receiverName.replaceFirstChar { it.lowercase() }

    private fun contractViolationName(receiverName: String) = "${receiverName}SdkContractViolationException"

    private fun resultBridgeName(receiverName: String) = "${supportPrefix(receiverName)}AwaitResultBridge"

    private fun valueBridgeName(receiverName: String) = "${supportPrefix(receiverName)}AwaitValueBridge"

    /** The `@KotlinCoroutine(Callback)` parameter, or by convention the sole callback-typed parameter. */
    private fun findCallbackParameter(limeFunction: LimeFunction): LimeParameter? {
        val annotated = limeFunction.parameters.filter { it.attributes.have(KOTLIN_COROUTINE, CALLBACK) }
        if (annotated.isNotEmpty()) return annotated.singleOrNull()
        return limeFunction.parameters.filter {
            val type = it.typeRef.type.actualType
            type is LimeLambda || type is LimeInterface
        }.singleOrNull()
    }

    /**
     * The `@KotlinCoroutine(Error)` member among [members], or null if none. At most one error member can
     * exist; `LimeKotlinCoroutineValidator` rejects the model otherwise, before generation is reached.
     */
    private fun <T : LimeTypedElement> findErrorMember(members: List<T>): T? =
        members.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, ERROR) }

    /** The `@KotlinCoroutine(Error)` member of the callback lambda, or null if none. */
    private fun findErrorMember(limeFunction: LimeFunction): LimeTypedElement? {
        val callbackParameter = findCallbackParameter(limeFunction) ?: return null
        return when (val callbackType = callbackParameter.typeRef.type.actualType) {
            is LimeLambda -> findErrorMember(callbackType.parameters)
            is LimeInterface -> {
                val callbackFunctions = callbackType.functions + callbackType.inheritedFunctions
                val completionFunction = callbackFunctions.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, COMPLETE) }
                findErrorMember(completionFunction?.parameters ?: callbackFunctions.flatMap { it.parameters })
            }
            else -> null
        }
    }

    private fun buildExceptionClass(
        limeFunction: LimeFunction,
        errorMember: LimeTypedElement,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any> {
        val errorType = nameResolver.resolveTypeRef(errorMember.typeRef).removeSuffix("?")

        return mapOf(
            "name" to exceptionName(limeFunction, nameResolver),
            "errorType" to errorType,
        )
    }

    /**
     * The cancellation hook on the returned handle: by convention a parameterless `cancel()` method.
     *
     * The parameter check matters: the generated cleanup emits `handle.cancel()` with no arguments, so matching a
     * `cancel(reason)` overload would produce code that does not compile. `LimeKotlinCoroutineValidator` applies the
     * same rule when it decides whether a Flow function has a cancellation handle.
     */
    private fun findCancelFunction(limeFunction: LimeFunction): LimeFunction? {
        val returnType = limeFunction.returnType.typeRef.type.actualType as? LimeContainer ?: return null
        return returnType.functions.firstOrNull { it.name == "cancel" && it.parameters.isEmpty() }
    }

    /**
     * Builds the KDoc block for the generated coroutine wrapper. It reuses the original function's
     * documentation and its (non-callback) parameter comments, marks the function as the `suspend`
     * (coroutine) variant, and documents the returned result and the thrown exception, so the wrapper
     * appears in the generated API reference just like the callback-based functions.
     */
    private fun buildDocComment(
        limeFunction: LimeFunction,
        functionName: String,
        callbackParameter: LimeParameter,
        resultMembers: List<LimeLambdaParameter>,
        exceptionName: String?,
        isCancellable: Boolean,
        nameResolver: KotlinNameResolver,
    ): String {
        val docLines = mutableListOf<String>()

        docLines += "Coroutine (`suspend`) variant of `$functionName`."
        docLines += ""
        docLines += "Suspends the calling coroutine until the operation completes instead of taking a callback."
        if (isCancellable) {
            docLines += "Cancelling the coroutine cancels the underlying task."
        }

        val mainComment = nameResolver.resolveName(limeFunction.comment)
        if (mainComment.isNotBlank()) {
            docLines += ""
            docLines += mainComment.lines()
        }

        limeFunction.parameters
            .filterNot { it === callbackParameter }
            .forEach { parameter ->
                val parameterName = nameResolver.resolveName(parameter)
                val parameterComment = nameResolver.resolveName(parameter.comment).lines().joinToString(" ").trim()
                docLines += if (parameterComment.isBlank()) "@param $parameterName" else "@param $parameterName $parameterComment"
            }

        val resultDescription =
            when (resultMembers.size) {
                0 -> "when the operation completes"
                1 ->
                    nameResolver.resolveName(
                        resultMembers.single().comment,
                    ).lines().joinToString(" ").trim().ifBlank { "the operation value" }
                else -> "the callback values grouped in a generated result type"
            }
        docLines +=
            if (exceptionName == null) {
                "@return $resultDescription."
            } else {
                "@return [Result] holding $resultDescription on success, or a failure carrying $exceptionName on error."
            }

        return "/**\n" + docLines.joinToString("\n") { if (it.isEmpty()) " *" else " * $it" } + "\n */"
    }

    private data class FlowValueModel(
        val type: String,
        val expression: String,
        val declaration: String? = null,
    )

    private fun buildFlowFunctionModel(
        limeFunction: LimeFunction,
        classFunctions: List<LimeFunction>,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any?> {
        val functionName = nameResolver.resolveName(limeFunction)
        val flowName = limeFunction.attributes.get(KOTLIN_COROUTINE, NAME) ?: "${functionName}Flow"
        val callbackParameter = findCallbackParameter(limeFunction)!!
        val callbackTypeName = nameResolver.resolveTypeRef(callbackParameter.typeRef).removeSuffix("?")

        val callbackModel =
            when (val callbackType = callbackParameter.typeRef.type.actualType) {
                is LimeLambda ->
                    buildLambdaFlowCallback(limeFunction, flowName, callbackTypeName, callbackType, receiverName, nameResolver)
                is LimeInterface ->
                    buildInterfaceFlowCallback(limeFunction, flowName, callbackTypeName, callbackType, receiverName, nameResolver)
                // Unreachable: `LimeKotlinCoroutineValidator` rejects callbacks that are neither lambda- nor interface-typed.
                else ->
                    throw GluecodiumExecutionException(
                        "@KotlinCoroutine(Flow) callback '${callbackParameter.fullName}' must be a lambda or interface",
                    )
            }

        val startTarget = if (limeFunction.isStatic) receiverName else "this@$receiverName"
        val startArguments =
            limeFunction.parameters.joinToString(", ") {
                if (it === callbackParameter) "listener" else nameResolver.resolveName(it)
            }
        val startCall = "$startTarget.$functionName($startArguments)"

        val callbackType = callbackParameter.typeRef.type.actualType
        // At most one matching unregister function can exist; enforced by `LimeKotlinCoroutineValidator`.
        val unregisterFunction =
            classFunctions.firstOrNull { candidate ->
                candidate.attributes.have(KOTLIN_COROUTINE, UNREGISTER) &&
                    candidate.parameters.any { it.typeRef.type.actualType === callbackType }
            }
        val cancelFunction = findCancelFunction(limeFunction)
        val needsHandle = unregisterFunction == null && cancelFunction != null
        val cleanupExpression =
            when {
                unregisterFunction != null -> {
                    val target = if (unregisterFunction.isStatic) receiverName else "this@$receiverName"
                    val arguments =
                        unregisterFunction.parameters.joinToString(", ") { parameter ->
                            if (parameter.typeRef.type.actualType === callbackType) "listener" else nameResolver.resolveName(parameter)
                        }
                    "$target.${nameResolver.resolveName(unregisterFunction)}($arguments)"
                }
                cancelFunction != null -> "handle.${nameResolver.resolveName(cancelFunction)}()"
                else -> "Unit"
            }

        val bodyLines = mutableListOf<String>()
        bodyLines += (callbackModel["listenerDeclaration"] as String).lines()
        bodyLines += if (needsHandle) "val handle = $startCall" else startCall
        bodyLines += "awaitClose { $cleanupExpression }"
        val body = bodyLines.joinToString("\n") { if (it.isBlank()) "" else "        $it" }

        val parameters = buildWrapperParameters(limeFunction, callbackParameter, nameResolver)
        val docComment =
            "/**\n" +
                " * Flow variant of `$functionName`. Registers the callback when collected and releases it when collection stops.\n" +
                " */"

        return mapOf(
            "eventDeclaration" to callbackModel["eventDeclaration"],
            "docComment" to docComment,
            "name" to flowName,
            "params" to parameters,
            "eventType" to callbackModel["eventType"],
            "body" to body,
        )
    }

    private fun buildLambdaFlowCallback(
        limeFunction: LimeFunction,
        flowName: String,
        callbackTypeName: String,
        callbackLambda: LimeLambda,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any?> {
        val errorMember = findErrorMember(callbackLambda.parameters)
        val resultMembers = findResultMembers(callbackLambda.parameters, errorMember)
        val localNames = callbackLocalNames(callbackLambda.parameters, errorMember)
        val resultLocalNames = resultMembers.map { localNames[callbackLambda.parameters.indexOf(it)] }
        val valueModel =
            buildFlowValueModel(
                "${flowName.replaceFirstChar { it.uppercase() }}Event",
                resultMembers,
                resultLocalNames,
                errorMember != null,
                nameResolver,
            )
        val actionLines =
            buildFlowAction(
                errorMember?.let { "error" },
                resultMembers,
                resultLocalNames,
                valueModel.expression,
                exceptionName(limeFunction, nameResolver),
                contractViolationName(receiverName),
                false,
            )
        val header = if (localNames.isEmpty()) "$callbackTypeName {" else "$callbackTypeName { ${localNames.joinToString(", ")} ->"
        val listenerDeclaration =
            buildString {
                append("val listener = $header\n")
                actionLines.forEach { append("    $it\n") }
                append("}")
            }

        return mapOf(
            "eventDeclaration" to valueModel.declaration,
            "eventType" to valueModel.type,
            "listenerDeclaration" to listenerDeclaration,
        )
    }

    private fun buildInterfaceFlowCallback(
        limeFunction: LimeFunction,
        flowName: String,
        callbackTypeName: String,
        callbackInterface: LimeInterface,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any?> {
        val callbackFunctions = (callbackInterface.functions + callbackInterface.inheritedFunctions).distinct()
        val emitFunctions = callbackFunctions.filter { it.attributes.have(KOTLIN_COROUTINE, EMIT) }
        val completeFunctions = callbackFunctions.filter { it.attributes.have(KOTLIN_COROUTINE, COMPLETE) }
        val completeFunction = completeFunctions.firstOrNull()

        val resultMembersByFunction =
            (emitFunctions + completeFunctions).associateWith { function ->
                findResultMembers(function.parameters, findErrorMember(function.parameters))
            }
        val eventFunctions = emitFunctions + completeFunctions.filter { resultMembersByFunction[it].orEmpty().isNotEmpty() }
        val eventTypeName = "${flowName.replaceFirstChar { it.uppercase() }}Event"
        val eventExpressions = mutableMapOf<LimeFunction, String>()
        val eventDeclaration: String?
        val eventType: String

        if (eventFunctions.size <= 1) {
            val eventFunction = eventFunctions.singleOrNull()
            if (eventFunction == null) {
                eventType = "Unit"
                eventDeclaration = null
            } else {
                val members = resultMembersByFunction[eventFunction].orEmpty()
                val localNames = members.map { nameResolver.resolveName(it) }
                val hasError = eventFunction.parameters.any { it.attributes.have(KOTLIN_COROUTINE, ERROR) }
                val valueModel = buildFlowValueModel(eventTypeName, members, localNames, hasError, nameResolver)
                eventType = valueModel.type
                eventDeclaration = valueModel.declaration
                eventExpressions[eventFunction] = valueModel.expression
            }
        } else {
            eventType = eventTypeName
            eventDeclaration = buildSealedFlowEvent(eventTypeName, eventFunctions, resultMembersByFunction, nameResolver)
            eventFunctions.forEach { function ->
                val variantName = nameResolver.resolveName(function).replaceFirstChar { it.uppercase() }
                val members = resultMembersByFunction[function].orEmpty()
                val arguments = members.joinToString(", ") { nameResolver.resolveName(it) }
                eventExpressions[function] =
                    if (members.isEmpty()) "$eventTypeName.$variantName" else "$eventTypeName.$variantName($arguments)"
            }
        }

        val overrides =
            callbackFunctions.joinToString("\n\n") { callbackFunction ->
                val parameters =
                    callbackFunction.parameters.joinToString(", ") {
                        "${nameResolver.resolveName(it)}: ${nameResolver.resolveTypeRef(it.typeRef)}"
                    }
                val errorMember = findErrorMember(callbackFunction.parameters)
                val resultMembers = resultMembersByFunction[callbackFunction].orEmpty()
                val resultLocalNames = resultMembers.map { nameResolver.resolveName(it) }
                val isComplete = callbackFunction === completeFunction
                val actionLines =
                    if (callbackFunction in emitFunctions || isComplete) {
                        buildFlowAction(
                            errorMember?.let { nameResolver.resolveName(it) },
                            resultMembers,
                            resultLocalNames,
                            eventExpressions[callbackFunction],
                            exceptionName(limeFunction, nameResolver),
                            contractViolationName(receiverName),
                            isComplete,
                        )
                    } else {
                        emptyList()
                    }
                buildString {
                    append("override fun ${nameResolver.resolveName(callbackFunction)}($parameters) {\n")
                    actionLines.forEach { append("    $it\n") }
                    append("}")
                }
            }
        val listenerDeclaration =
            buildString {
                append("val listener =\n")
                append("    object : $callbackTypeName {\n")
                overrides.lines().forEach { append(if (it.isBlank()) "\n" else "        $it\n") }
                append("    }")
            }

        return mapOf(
            "eventDeclaration" to eventDeclaration,
            "eventType" to eventType,
            "listenerDeclaration" to listenerDeclaration,
        )
    }

    private fun <T : LimeTypedElement> findResultMembers(
        parameters: List<T>,
        errorMember: T?,
    ): List<T> {
        val markedResults = parameters.filter { it.attributes.have(KOTLIN_COROUTINE, RESULT) }
        return markedResults.ifEmpty { parameters.filterNot { it === errorMember } }
    }

    /** Local names for a callback adapter: the error member is always `error`, other members are positional. */
    private fun callbackLocalNames(
        members: List<LimeTypedElement>,
        errorMember: LimeTypedElement?,
    ): List<String> = members.mapIndexed { index, member -> if (member === errorMember) "error" else "callbackValue$index" }

    private fun buildFlowValueModel(
        typeName: String,
        members: List<LimeTypedElement>,
        localNames: List<String>,
        stripNullability: Boolean,
        nameResolver: KotlinNameResolver,
    ): FlowValueModel =
        when (members.size) {
            0 -> FlowValueModel("Unit", "Unit")
            1 ->
                FlowValueModel(
                    nameResolver.resolveTypeRef(members.single().typeRef).let {
                        if (stripNullability) it.removeSuffix("?") else it
                    },
                    localNames.single(),
                )
            else ->
                FlowValueModel(
                    typeName,
                    "$typeName(${localNames.joinToString(", ")})",
                    buildDataClassDeclaration(typeName, members, stripNullability, null, nameResolver),
                )
        }

    private fun buildSealedFlowEvent(
        eventTypeName: String,
        functions: List<LimeFunction>,
        resultMembersByFunction: Map<LimeFunction, List<LimeParameter>>,
        nameResolver: KotlinNameResolver,
    ): String {
        val variants =
            functions.joinToString("\n\n") { function ->
                val variantName = nameResolver.resolveName(function).replaceFirstChar { it.uppercase() }
                val members = resultMembersByFunction[function].orEmpty()
                val hasError = function.parameters.any { it.attributes.have(KOTLIN_COROUTINE, ERROR) }
                if (members.isEmpty()) {
                    "    public object $variantName : $eventTypeName"
                } else {
                    buildDataClassDeclaration(variantName, members, hasError, eventTypeName, nameResolver)
                        .lines().joinToString("\n") { "    $it" }
                }
            }
        return "public sealed interface $eventTypeName {\n$variants\n}"
    }

    private fun buildDataClassDeclaration(
        className: String,
        members: List<LimeTypedElement>,
        stripNullability: Boolean,
        superType: String?,
        nameResolver: KotlinNameResolver,
    ): String {
        val fields =
            members.joinToString(",\n") { member ->
                val type =
                    nameResolver.resolveTypeRef(member.typeRef).let {
                        if (stripNullability) it.removeSuffix("?") else it
                    }
                "    public val ${resolveCallbackMemberName(member, nameResolver)}: $type"
            }
        val suffix = superType?.let { " : $it" }.orEmpty()
        return "public data class $className(\n$fields,\n)$suffix"
    }

    private fun buildFlowAction(
        errorLocalName: String?,
        resultMembers: List<LimeTypedElement>,
        resultLocalNames: List<String>,
        valueExpression: String?,
        exceptionName: String,
        contractViolationName: String,
        isComplete: Boolean,
    ): List<String> {
        val successLines = mutableListOf<String>()
        if (valueExpression != null) successLines += "trySend($valueExpression)"
        if (isComplete) successLines += "close()"

        if (errorLocalName == null) return successLines

        // Validation requires every success member paired with an error channel to be nullable.
        val nullResultCondition =
            resultMembers.zip(resultLocalNames)
                .filter { (member, _) -> member.typeRef.isNullable }
                .joinToString(" || ") { (_, localName) -> "$localName == null" }
        val result = mutableListOf<String>()
        result += "when {"
        result += "    $errorLocalName != null -> close($exceptionName($errorLocalName))"
        if (nullResultCondition.isNotEmpty()) {
            result +=
                "    $nullResultCondition -> " +
                "close($contractViolationName(\"SDK contract violation: success callback contains null result\"))"
        }
        result += "    else -> {"
        result += successLines.map { "        $it" }
        result += "    }"
        result += "}"
        return result
    }

    private fun buildWrapperParameters(
        limeFunction: LimeFunction,
        callbackParameter: LimeParameter,
        nameResolver: KotlinNameResolver,
    ): String =
        limeFunction.parameters
            .filterNot { it === callbackParameter }
            .joinToString(", ") { parameter ->
                val declaration = "${nameResolver.resolveName(parameter)}: ${nameResolver.resolveTypeRef(parameter.typeRef)}"
                if (parameter.attributes.have(KOTLIN_COROUTINE, DEFAULT)) {
                    "$declaration = ${nameResolver.resolveTypeRef(parameter.typeRef).removeSuffix("?")}()"
                } else {
                    declaration
                }
            }

    private fun buildFunctionModel(
        limeFunction: LimeFunction,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any?> {
        val functionName = nameResolver.resolveName(limeFunction)
        val coroutineName = coroutineName(limeFunction, nameResolver)
        val callbackParameter = findCallbackParameter(limeFunction)!!
        val callbackLambda = callbackParameter.typeRef.type.actualType as LimeLambda
        val callbackTypeName = nameResolver.resolveTypeRef(callbackParameter.typeRef).removeSuffix("?")

        val errorMember = findErrorMember(callbackLambda.parameters)
        val resultMembers = findResultMembers(callbackLambda.parameters, errorMember)

        val resultClassName =
            if (resultMembers.size > 1) {
                "${coroutineName.replaceFirstChar { it.uppercase() }}CoroutineResult"
            } else {
                null
            }
        val resultClass =
            resultClassName?.let { className ->
                val fields =
                    resultMembers.mapIndexed { index, member ->
                        mapOf(
                            "name" to resolveCallbackMemberName(member, nameResolver),
                            "type" to
                                nameResolver.resolveTypeRef(member.typeRef).let {
                                    if (errorMember == null) it else it.removeSuffix("?")
                                },
                            "last" to (index == resultMembers.lastIndex),
                        )
                    }
                mapOf("name" to className, "fields" to fields)
            }

        // SAM adapter parameter names, in the callback's own declaration order. The error member is
        // always forwarded as the bridge's first argument and all result members form the value.
        val samParameterNames = callbackLocalNames(callbackLambda.parameters, errorMember)
        val samHeader =
            if (samParameterNames.isEmpty()) "$callbackTypeName {" else "$callbackTypeName { ${samParameterNames.joinToString(", ")} ->"
        val resultLocalNames =
            resultMembers.map { member -> samParameterNames[callbackLambda.parameters.indexOf(member)] }
        val valueExpression =
            when (resultMembers.size) {
                0 -> "Unit"
                1 -> resultLocalNames.single()
                else -> "$resultClassName(${resultLocalNames.joinToString(", ")})"
            }
        val nullableValueExpression =
            if (errorMember != null && resultMembers.size > 1) {
                val nullableChecks =
                    resultMembers.zip(resultLocalNames)
                        .filter { (member, _) -> member.typeRef.isNullable }
                        .joinToString(" && ") { (_, localName) -> "$localName != null" }
                if (nullableChecks.isEmpty()) valueExpression else "if ($nullableChecks) $valueExpression else null"
            } else if (errorMember != null && resultMembers.isEmpty()) {
                "if (error == null) Unit else null"
            } else {
                valueExpression
            }
        val forwardExpression =
            if (errorMember == null) {
                "callback($valueExpression)"
            } else {
                "callback(error, $nullableValueExpression)"
            }
        val adaptedCallback = "$samHeader $forwardExpression }"

        val startArguments =
            limeFunction.parameters.joinToString(", ") {
                if (it === callbackParameter) adaptedCallback else nameResolver.resolveName(it)
            }
        val isStatic = limeFunction.isStatic
        val startTarget = if (isStatic) receiverName else "this"
        val startCall = "$startTarget.$functionName($startArguments)"

        val resultType =
            when (resultMembers.size) {
                0 -> "Unit"
                1 ->
                    nameResolver.resolveTypeRef(resultMembers.single().typeRef).let {
                        if (errorMember == null) it else it.removeSuffix("?")
                    }
                else -> resultClassName!!
            }
        val suspendParameters = buildWrapperParameters(limeFunction, callbackParameter, nameResolver)

        val exceptionName = errorMember?.let { exceptionName(limeFunction, nameResolver) }
        val cancelFunction = findCancelFunction(limeFunction)
        val cancelExpression = cancelFunction?.let { "handle.${nameResolver.resolveName(it)}()" } ?: "Unit"

        return mapOf(
            "docComment" to
                buildDocComment(
                    limeFunction,
                    functionName,
                    callbackParameter,
                    resultMembers,
                    exceptionName,
                    cancelFunction != null,
                    nameResolver,
                ),
            "resultClass" to resultClass,
            "name" to coroutineName,
            "params" to suspendParameters,
            "returnType" to if (errorMember == null) resultType else "Result<$resultType>",
            "continuationIndent" to "      ",
            "bridgeName" to if (errorMember == null) valueBridgeName(receiverName) else resultBridgeName(receiverName),
            "startCall" to startCall,
            "hasError" to (errorMember != null),
            "mapErrorExpr" to exceptionName?.let { "$it(error)" },
            "cancelExpr" to cancelExpression,
        )
    }

    private fun resolveCallbackMemberName(
        member: LimeTypedElement,
        nameResolver: KotlinNameResolver,
    ): String =
        if (member is LimeLambdaParameter) {
            nameResolver.resolveName(member.asLimeParameter())
        } else {
            nameResolver.resolveName(member)
        }
}
