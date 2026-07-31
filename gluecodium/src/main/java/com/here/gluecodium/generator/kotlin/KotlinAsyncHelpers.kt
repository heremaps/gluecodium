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

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN_COROUTINE
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.FLOW
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributeValueType.RESULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.UNREGISTER
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.allCoroutineFunctions
import com.here.gluecodium.model.lime.findCoroutineCallbackParameter
import com.here.gluecodium.model.lime.findCoroutineCancelFunction
import com.here.gluecodium.model.lime.findCoroutineErrorMember
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
        val coroutineContainers =
            rootElements
                .flatMap { LimeTypeHelper.getAllTypes(it) }
                .filterIsInstance<LimeContainer>()
                .filter { container -> container.allCoroutineFunctions().any { isKotlinCoroutineFunction(it) } }

        return coroutineContainers
            .groupBy { (basePackages + it.path.head).map(KotlinNameResolver::normalizePackageName) }
            .map { (packageNames, containers) ->
                val supports =
                    containers.map { container ->
                        val receiverName = nameResolver.resolveName(container)
                        mapOf(
                            "contractViolationName" to contractViolationName(receiverName, nameResolver),
                            "resultBridgeName" to resultBridgeName(receiverName, nameResolver),
                            "valueBridgeName" to valueBridgeName(receiverName, nameResolver),
                        )
                    }
                val templateData =
                    mapOf(
                        "packageName" to packageNames.joinToString("."),
                        "fileJvmName" to
                            containers.map { nameResolver.resolveName(it) }.sorted().joinToString("") + "KotlinCoroutines",
                        "supports" to supports,
                    )
                val content = TemplateEngine.render(TEMPLATE_NAME, templateData)
                val fileName = (listOf(generatorName) + packageNames + "KotlinCoroutines.kt").joinToString(File.separator)
                GeneratedFile(content, fileName)
            }
    }

    /** The generated coroutine members for a container, split by whether the underlying LIME function is static. */
    data class CoroutineMembers(val instance: String, val static: String)

    private val NO_COROUTINE_MEMBERS = CoroutineMembers("", "")

    /**
     * Renders the coroutine `suspend`/`Flow` wrappers for [limeContainer] as members (not extensions), split into
     * the members that belong in the main body and the ones that belong in the companion object, mirroring the
     * `isStatic`-ness of the original `@KotlinCoroutine` function.
     *
     * A wrapper is generated for every `@KotlinCoroutine` function the container declares or inherits from an
     * implemented interface, so each concrete class, interface, or struct exposes the `suspend`/`Flow` API as a
     * real member. Returned blocks are indented for insertion into their respective bodies; both are empty when
     * the container has no such functions.
     */
    fun buildCoroutineMembers(
        limeContainer: LimeContainer,
        nameResolver: KotlinNameResolver,
    ): CoroutineMembers {
        val containerFunctions = limeContainer.allCoroutineFunctions()
        val coroutineFunctions = containerFunctions.filter { isKotlinCoroutineFunction(it) }
        if (coroutineFunctions.isEmpty()) return NO_COROUTINE_MEMBERS

        val receiverName = nameResolver.resolveName(limeContainer)
        // Exception names that collide with a different error type are rejected by `LimeKotlinCoroutineValidator`,
        // so identical duplicates are all that can reach here and de-duplicating them is safe.
        val exceptionClasses =
            coroutineFunctions
                .mapNotNull { function -> function.findCoroutineErrorMember()?.let { function to it } }
                .map { (function, errorMember) -> buildExceptionClass(function, errorMember, nameResolver) }
                .distinctBy { it["name"] }

        val (staticFunctions, instanceFunctions) = coroutineFunctions.filterNot { isFlowFunction(it) }.partition { it.isStatic }
        val (staticFlows, instanceFlows) = coroutineFunctions.filter { isFlowFunction(it) }.partition { it.isStatic }

        val instanceContent =
            TemplateEngine.render(
                MEMBERS_TEMPLATE_NAME,
                mapOf(
                    "exceptions" to exceptionClasses,
                    "functions" to instanceFunctions.map { buildFunctionModel(it, receiverName, nameResolver) },
                    "flows" to
                        instanceFlows.map {
                            KotlinAsyncFlowHelpers.buildFlowFunctionModel(it, containerFunctions, receiverName, nameResolver)
                        },
                ),
            )
        val staticContent =
            TemplateEngine.render(
                MEMBERS_TEMPLATE_NAME,
                mapOf(
                    "exceptions" to emptyList<Map<String, Any>>(),
                    "functions" to staticFunctions.map { buildFunctionModel(it, receiverName, nameResolver) },
                    "flows" to
                        staticFlows.map {
                            KotlinAsyncFlowHelpers.buildFlowFunctionModel(it, containerFunctions, receiverName, nameResolver)
                        },
                ),
            )

        val hasInstanceContent = exceptionClasses.isNotEmpty() || instanceFunctions.isNotEmpty() || instanceFlows.isNotEmpty()
        val hasStaticContent = staticFunctions.isNotEmpty() || staticFlows.isNotEmpty()
        return CoroutineMembers(
            instance = if (hasInstanceContent) indentLines(instanceContent.trim('\n'), "    ") else "",
            static = if (hasStaticContent) indentLines(staticContent.trim('\n'), "        ") else "",
        )
    }

    fun hasFlowMembers(limeContainer: LimeContainer): Boolean =
        limeContainer.allCoroutineFunctions().any { isKotlinCoroutineFunction(it) && isFlowFunction(it) }

    private fun indentLines(
        content: String,
        indent: String,
    ): String = content.lineSequence().joinToString("\n") { if (it.isBlank()) it else indent + it }

    private fun isKotlinCoroutineFunction(limeFunction: LimeFunction) =
        limeFunction.attributes.have(KOTLIN_COROUTINE) &&
            !limeFunction.attributes.have(KOTLIN_COROUTINE, UNREGISTER) &&
            limeFunction.findCoroutineCallbackParameter() != null

    private fun isFlowFunction(limeFunction: LimeFunction) = limeFunction.attributes.have(KOTLIN_COROUTINE, FLOW)

    private fun coroutineName(
        limeFunction: LimeFunction,
        nameResolver: KotlinNameResolver,
    ) = limeFunction.attributes.get(KOTLIN_COROUTINE, NAME) ?: nameResolver.resolveName(limeFunction)

    /** The `error` name rule already appends the configured error suffix (`Exception` by default for Kotlin). */
    internal fun exceptionName(
        limeFunction: LimeFunction,
        nameResolver: KotlinNameResolver,
    ) = nameResolver.resolveGeneratedErrorName(coroutineName(limeFunction, nameResolver))

    internal fun contractViolationName(
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ) = nameResolver.resolveGeneratedErrorName("${receiverName}SdkContractViolation")

    private fun resultBridgeName(
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ) = nameResolver.resolveGeneratedMethodName("${receiverName}AwaitResultBridge")

    private fun valueBridgeName(
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ) = nameResolver.resolveGeneratedMethodName("${receiverName}AwaitValueBridge")

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

    internal fun <T : LimeTypedElement> findResultMembers(
        parameters: List<T>,
        errorMember: T?,
    ): List<T> {
        val markedResults = parameters.filter { it.attributes.have(KOTLIN_COROUTINE, RESULT) }
        return markedResults.ifEmpty { parameters.filterNot { it === errorMember } }
    }

    /** Local names for a callback adapter: the error member is always `error`, other members are positional. */
    internal fun callbackLocalNames(
        members: List<LimeTypedElement>,
        errorMember: LimeTypedElement?,
    ): List<String> = members.mapIndexed { index, member -> if (member === errorMember) "error" else "callbackValue$index" }

    internal fun buildWrapperParameters(
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
        val callbackParameter = limeFunction.findCoroutineCallbackParameter()!!
        val callbackLambda = callbackParameter.typeRef.type.actualType as LimeLambda
        val callbackTypeName = nameResolver.resolveTypeRef(callbackParameter.typeRef).removeSuffix("?")

        val errorMember = callbackLambda.parameters.findCoroutineErrorMember()
        val resultMembers = findResultMembers(callbackLambda.parameters, errorMember)

        val resultClassName =
            if (resultMembers.size > 1) {
                nameResolver.resolveGeneratedTypeName("${coroutineName}CoroutineResult")
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
        val cancelFunction = limeFunction.findCoroutineCancelFunction()
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
            "bridgeName" to
                if (errorMember == null) {
                    valueBridgeName(receiverName, nameResolver)
                } else {
                    resultBridgeName(receiverName, nameResolver)
                },
            "startCall" to startCall,
            "hasError" to (errorMember != null),
            "mapErrorExpr" to exceptionName?.let { "$it(error)" },
            "cancelExpr" to cancelExpression,
        )
    }

    internal fun resolveCallbackMemberName(
        member: LimeTypedElement,
        nameResolver: KotlinNameResolver,
    ): String =
        if (member is LimeLambdaParameter) {
            nameResolver.resolveName(member.asLimeParameter())
        } else {
            nameResolver.resolveName(member)
        }
}
