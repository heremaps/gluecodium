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
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_TASK_HANDLE
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN_COROUTINE
import com.here.gluecodium.model.lime.LimeAttributeValueType.CALLBACK
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.RESULT
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypeHelper
import java.io.File

/**
 * Generates Kotlin coroutine (`suspend fun`) wrappers for functions marked `@KotlinCoroutine`.
 *
 * A coroutine wrapper is emitted as an extension function on the enclosing type in a separate
 * `<Type>Coroutines.kt` file, rendered from the reusable `KotlinCoroutines` template. It calls the existing
 * callback-based API, so its existing JNI glue is left untouched.
 *
 * Callback/result/error roles can be declared explicitly via `@KotlinCoroutine(Callback)`,
 * `@KotlinCoroutine(Result)`, `@KotlinCoroutine(Error)`, and `@AsyncTaskHandle`. When a callback or result role is
 * omitted, the generator falls back to convention: the sole lambda-typed parameter is the callback; the callback
 * member that is not the error is the result; and a `cancel()` method on the returned handle is the cancellation hook.
 * The error member must be marked explicitly because it cannot be inferred by type. Explicit annotations always win.
 *
 * The resulting model describes the callback/result/error/cancel shape and can be reused by a future Swift `async`
 * generator, while this implementation emits Kotlin only.
 */
internal object KotlinAsyncHelpers {
    private const val TEMPLATE_NAME = "kotlin/KotlinCoroutines"
    private const val MEMBERS_TEMPLATE_NAME = "kotlin/KotlinCoroutineMembers"

    /**
     * Generates the shared typed-exception file(s) for `@KotlinCoroutine` functions.
     *
     * The `suspend` wrappers themselves are emitted as members of each concrete implementing class
     * (see [buildClassCoroutineMembers]); only the typed exception classes are emitted here, exactly
     * once, from the container (interface) that *declares* the `@KotlinCoroutine` function. This keeps
     * a single top-level definition of each exception shared by all implementers.
     */
    fun createCoroutineExceptionFiles(
        rootElement: LimeNamedElement,
        nameResolver: KotlinNameResolver,
        basePackages: List<String>,
        generatorName: String,
    ): List<GeneratedFile> =
        LimeTypeHelper.getAllTypes(rootElement)
            .filterIsInstance<LimeContainer>()
            .mapNotNull { createCoroutineExceptionFile(it, nameResolver, basePackages, generatorName) }

    private fun createCoroutineExceptionFile(
        limeContainer: LimeContainer,
        nameResolver: KotlinNameResolver,
        basePackages: List<String>,
        generatorName: String,
    ): GeneratedFile? {
        val coroutineFunctions = limeContainer.functions.filter { isKotlinCoroutineFunction(it) }
        if (coroutineFunctions.isEmpty()) return null

        val exceptionClasses =
            coroutineFunctions
                .mapNotNull { fn -> findErrorMember(fn)?.let { fn to it } }
                .map { (fn, errorMember) -> buildExceptionClass(fn, errorMember, nameResolver) }
        if (exceptionClasses.isEmpty()) return null

        val receiverName = nameResolver.resolveName(limeContainer)
        val packageNames = (basePackages + limeContainer.path.head).map { KotlinNameResolver.normalizePackageName(it) }
        val templateData =
            mapOf(
                "packageName" to packageNames.joinToString("."),
                "exceptions" to exceptionClasses,
                "functions" to emptyList<Map<String, Any>>(),
            )
        val content = TemplateEngine.render(TEMPLATE_NAME, templateData)
        val fileName = (listOf(generatorName) + packageNames + "${receiverName}Coroutines.kt").joinToString(File.separator)
        return GeneratedFile(content, fileName)
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
        val coroutineFunctions =
            (limeClass.functions + limeClass.interfaceInheritedFunctions)
                .filter { isKotlinCoroutineFunction(it) }
                .distinct()
        if (coroutineFunctions.isEmpty()) return ""

        val receiverName = nameResolver.resolveName(limeClass)
        val functions = coroutineFunctions.map { buildFunctionModel(it, receiverName, nameResolver) }
        val content = TemplateEngine.render(MEMBERS_TEMPLATE_NAME, mapOf("functions" to functions))
        return indentLines(content.trim('\n'), "    ")
    }

    private fun indentLines(
        content: String,
        indent: String,
    ): String = content.lineSequence().joinToString("\n") { if (it.isBlank()) it else indent + it }

    private fun isKotlinCoroutineFunction(limeFunction: LimeFunction) =
        limeFunction.attributes.have(KOTLIN_COROUTINE) && findCallbackParameter(limeFunction) != null

    /** The `@KotlinCoroutine(Callback)` parameter, or by convention the sole lambda-typed parameter. */
    private fun findCallbackParameter(limeFunction: LimeFunction): LimeParameter? {
        val annotated = limeFunction.parameters.filter { it.attributes.have(KOTLIN_COROUTINE, CALLBACK) }
        if (annotated.isNotEmpty()) return annotated.singleOrNull()
        return limeFunction.parameters.filter { it.typeRef.type.actualType is LimeLambda }.singleOrNull()
    }

    /** The `@KotlinCoroutine(Error)` member of the callback lambda, or null if none. */
    private fun findErrorMember(limeFunction: LimeFunction): LimeLambdaParameter? {
        val callbackParameter = findCallbackParameter(limeFunction) ?: return null
        val callbackLambda = callbackParameter.typeRef.type.actualType as? LimeLambda ?: return null
        return callbackLambda.parameters.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, ERROR) }
    }

    private fun buildExceptionClass(
        limeFunction: LimeFunction,
        errorMember: LimeLambdaParameter,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any> {
        val functionName = nameResolver.resolveName(limeFunction)
        val exceptionName = "${functionName.replaceFirstChar { it.uppercase() }}Exception"
        val errorType = nameResolver.resolveTypeRef(errorMember.typeRef).removeSuffix("?")

        return mapOf(
            "name" to exceptionName,
            "errorType" to errorType,
        )
    }

    /** The `@AsyncTaskHandle` method on the return type, or by convention a `cancel()` method. */
    private fun findCancelFunction(limeFunction: LimeFunction): LimeFunction? {
        val returnType = limeFunction.returnType.typeRef.type.actualType as? LimeContainer ?: return null
        return returnType.functions.firstOrNull { it.attributes.have(ASYNC_TASK_HANDLE) }
            ?: returnType.functions.firstOrNull { it.name == "cancel" }
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
        exceptionName: String,
        callbackParameter: LimeParameter,
        resultMember: LimeLambdaParameter?,
        nameResolver: KotlinNameResolver,
    ): String {
        val docLines = mutableListOf<String>()

        docLines += "Coroutine (`suspend`) variant of `$functionName`."
        docLines += ""
        docLines += "Suspends the calling coroutine until the operation completes and returns a [Result]"
        docLines += "instead of taking a callback. Cancelling the coroutine cancels the underlying task."

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

        val resultComment = resultMember?.let { nameResolver.resolveName(it.comment).lines().joinToString(" ").trim() }.orEmpty()
        val resultDescription = if (resultComment.isBlank()) "the operation value" else resultComment
        docLines += "@return [Result] holding $resultDescription on success, or a failure carrying $exceptionName on error."

        return "/**\n" + docLines.joinToString("\n") { if (it.isEmpty()) " *" else " * $it" } + "\n */"
    }

    private fun buildFunctionModel(
        limeFunction: LimeFunction,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any> {
        val functionName = nameResolver.resolveName(limeFunction)
        val callbackParameter = findCallbackParameter(limeFunction)!!
        val callbackLambda = callbackParameter.typeRef.type.actualType as LimeLambda
        val callbackTypeName = nameResolver.resolveTypeRef(callbackParameter.typeRef).removeSuffix("?")

        val errorMember =
            findErrorMember(limeFunction)
                ?: throw IllegalStateException(
                    "@KotlinCoroutine function '${limeFunction.fullName}' must declare an @KotlinCoroutine(Error) callback member",
                )
        val resultMember =
            callbackLambda.parameters.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, RESULT) }
                ?: callbackLambda.parameters.filterNot { it === errorMember }.singleOrNull()

        if (callbackLambda.parameters.filterNot { it === errorMember }.size > 1 && resultMember == null) {
            throw IllegalStateException(
                "@KotlinCoroutine function '${limeFunction.fullName}' has ambiguous callback success members. " +
                    "Mark one callback member with @KotlinCoroutine(Result).",
            )
        }

        // SAM adapter parameter names, in the callback's own declaration order. The error member is
        // always forwarded as the bridge's first argument and the result member as the second.
        val samParameterNames =
            callbackLambda.parameters.map {
                when {
                    it === errorMember -> "error"
                    it === resultMember -> "result"
                    else -> "_"
                }
            }
        val samHeader =
            if (samParameterNames.isEmpty()) "$callbackTypeName {" else "$callbackTypeName { ${samParameterNames.joinToString(", ")} ->"
        val forwardExpression =
            if (resultMember != null) "callback(error, result)" else "callback(error, if (error == null) Unit else null)"
        val adaptedCallback = "$samHeader $forwardExpression }"

        val startArguments =
            limeFunction.parameters.joinToString(", ") {
                if (it === callbackParameter) adaptedCallback else nameResolver.resolveName(it)
            }
        val isStatic = limeFunction.isStatic
        val startTarget = if (isStatic) receiverName else "this"
        val startCall = "$startTarget.$functionName($startArguments)"

        val resultType = resultMember?.let { nameResolver.resolveTypeRef(it.typeRef).removeSuffix("?") } ?: "Unit"
        val suspendParameters =
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

        val exceptionName = "${functionName.replaceFirstChar { it.uppercase() }}Exception"
        val cancelFunction = findCancelFunction(limeFunction)
        val cancelExpression = cancelFunction?.let { "handle.${nameResolver.resolveName(it)}()" } ?: "Unit"

        return mapOf(
            "docComment" to buildDocComment(limeFunction, functionName, exceptionName, callbackParameter, resultMember, nameResolver),
            "name" to functionName,
            "params" to suspendParameters,
            "resultType" to resultType,
            "startCall" to startCall,
            "mapErrorExpr" to "$exceptionName(error)",
            "cancelExpr" to cancelExpression,
        )
    }
}
