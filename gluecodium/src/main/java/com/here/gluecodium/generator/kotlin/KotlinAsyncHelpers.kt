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
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_DECORATOR
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypeHelper
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.findAsyncCallbackParameter
import com.here.gluecodium.model.lime.findAsyncCancelFunction
import com.here.gluecodium.model.lime.findAsyncErrorMember
import com.here.gluecodium.model.lime.findAsyncResultMembers
import java.io.File

/**
 * Generates Kotlin coroutine (`suspend fun`) wrappers for functions marked `@AsyncDecorator`.
 *
 * Wrappers are emitted as top-level extension functions in a per-package support file. Shared bridges and typed
 * exceptions are emitted once per package. Every wrapper calls the existing callback API, so C++ and bindings
 * declarations are unchanged.
 *
 * Callback/result/error roles can be declared explicitly via `@AsyncDecorator(Callback)`,
 * `@AsyncDecorator(Result)`, and `@AsyncDecorator(Error)`. When a callback or result role is
 * omitted, the generator falls back to convention: the sole callback-typed parameter is the callback, all callback
 * members other than the explicitly marked error are results, and the returned handle's `@AsyncTaskHandle` function
 * (a parameterless `cancel()` by convention) is the cancellation hook.
 *
 * The resulting model describes the callback/result/error/cancel shape and can be reused by a future Swift `async`
 * generator, while this implementation emits Kotlin only.
 */
internal object KotlinAsyncHelpers {
    private const val TEMPLATE_NAME = "kotlin/KotlinCoroutines"
    private const val MEMBERS_TEMPLATE_NAME = "kotlin/KotlinCoroutineMembers"

    /**
     * Builds a deterministic per-file suffix from the set of containers emitted into one coroutine file.
     *
     * Several modules can generate `KotlinCoroutines.kt` into the same Kotlin package. Without a unique JVM
     * file-class name this produces duplicate `.../KotlinCoroutinesKt` classes during Kotlin compilation.
     */
    private fun coroutineFileJvmSuffix(containers: List<LimeContainer>): String {
        val names = containers.map { it.path.container }.distinct().sorted()
        return "_${names.joinToString("_")}"
    }

    /** Containers that contribute coroutine APIs, grouped by the package file they are emitted into. */
    internal fun groupCoroutineContainersByPackage(
        rootElements: List<LimeNamedElement>,
        basePackages: List<String>,
    ): Map<List<String>, List<LimeContainer>> =
        rootElements
            .flatMap { LimeTypeHelper.getAllTypes(it) }
            .filterIsInstance<LimeContainer>()
            .filter { container -> declaredAsyncDecoratorFunctions(container).isNotEmpty() }
            .groupBy { (basePackages + it.path.head).map(KotlinNameResolver::normalizePackageName) }

    /** Generates one bridge/exception support file per package containing coroutine APIs. */
    fun createCoroutineSupportFiles(
        rootElements: List<LimeNamedElement>,
        nameResolver: KotlinNameResolver,
        importCollector: KotlinImportCollector,
        basePackages: List<String>,
        generatorName: String,
    ): List<GeneratedFile> =
        groupCoroutineContainersByPackage(rootElements, basePackages)
            .map { (packageNames, containers) ->
                // The bridges are fully generic, so one shared pair serves every type in the package.
                val supports =
                    mapOf(
                        "resultBridgeName" to nameResolver.resolveCoroutineResultBridgeName(),
                        "valueBridgeName" to nameResolver.resolveCoroutineValueBridgeName(),
                    )
                // The generated exception and result types reference the callback's own member types, so the
                // coroutine support file needs those imports even though the container's file does not.
                val imports =
                    containers
                        .flatMap { importCollector.collectImports(it) + importCollector.collectAsyncDecoratorCallbackImports(it) }
                        .filterNot { KotlinNameRules.getPackageFromImportString(it) == packageNames }
                        .distinct()
                        .sorted()
                val templateData =
                    mapOf(
                        "packageName" to packageNames.joinToString("."),
                        // Stable per generated package-file and unique across modules sharing one package.
                        "fileJvmName" to "KotlinCoroutines${coroutineFileJvmSuffix(containers)}",
                        "imports" to imports,
                        "supports" to supports,
                        "extensions" to containers.joinToString("\n") { buildCoroutineExtensions(it, nameResolver) },
                    )
                val content = TemplateEngine.render(TEMPLATE_NAME, templateData)
                val fileName = (listOf(generatorName) + packageNames + "KotlinCoroutines.kt").joinToString(File.separator)
                GeneratedFile(content, fileName)
            }

    /**
     * Renders the coroutine `suspend` wrappers for [limeContainer] as top-level extension functions.
     *
     * Extensions rather than members, so that the callback-based API stays uncluttered, Java callers never see a
     * `Continuation` parameter, and the wrappers can be attached to interfaces as well as classes: an extension is
     * resolved statically at the call site, so it never becomes an abstract JVM method the way an interface member
     * with a body does.
     */
    fun buildCoroutineExtensions(
        limeContainer: LimeContainer,
        nameResolver: KotlinNameResolver,
    ): String {
        val model = buildCoroutineModel(limeContainer, nameResolver) ?: return ""
        return TemplateEngine.render(MEMBERS_TEMPLATE_NAME, mapOf("exceptions" to model.first, "functions" to model.second))
    }

    /** The exception and wrapper models rendered into the coroutine file, or null when the container has no wrappers. */
    private fun buildCoroutineModel(
        limeContainer: LimeContainer,
        nameResolver: KotlinNameResolver,
    ): Pair<List<Map<String, Any>>, List<Map<String, Any?>>>? {
        val coroutineFunctions = declaredAsyncDecoratorFunctions(limeContainer)
        if (coroutineFunctions.isEmpty()) return null

        val receiverTypeName = nameResolver.resolveNestedTypeName(limeContainer)
        // Generated symbols are top-level in a shared per-package file, so a nested receiver has to contribute its
        // whole path: two `Nested` types under different outers would otherwise produce the same symbol names.
        val receiverName = receiverTypeName.replace(".", "")
        // Exception names that collide with a different error type are rejected by `LimeAsyncDecoratorValidator`,
        // so identical duplicates are all that can reach here and de-duplicating them is safe.
        val exceptionClasses =
            coroutineFunctions
                .mapNotNull { function -> function.findAsyncErrorMember()?.let { function to it } }
                .map { (function, errorMember) -> buildExceptionClass(function, errorMember, receiverName, nameResolver) }
                .distinctBy { it["name"] }

        return exceptionClasses to coroutineFunctions.map { buildFunctionModel(it, receiverName, receiverTypeName, nameResolver) }
    }

    /**
     * Every top-level Kotlin symbol [limeContainer] contributes to the shared per-package coroutine file. Derived from
     * the same models that are rendered, so it cannot drift from what is actually emitted.
     */
    internal fun collectGeneratedSymbols(
        limeContainer: LimeContainer,
        nameResolver: KotlinNameResolver,
    ): List<String> {
        val (exceptions, functions) = buildCoroutineModel(limeContainer, nameResolver) ?: return emptyList()
        return exceptions.map { "class ${it["name"]}" } +
            functions.mapNotNull { (it["resultClass"] as? Map<*, *>)?.get("name")?.let { name -> "class $name" } } +
            functions.map { "fun ${it["receiver"]}${it["name"]}(${it["params"]})" }
    }

    /**
     * The `@AsyncDecorator` functions a container generates wrappers for.
     *
     * Interfaces are included: wrappers are extensions, so they never become abstract JVM methods and hand-written
     * Java implementers are unaffected. A class only wraps the functions it declares itself, because the ones it
     * inherits are already covered by the extension generated on the interface.
     */
    private fun declaredAsyncDecoratorFunctions(limeContainer: LimeContainer): List<LimeFunction> =
        limeContainer.functions.filter { isAsyncDecoratorFunction(it) }

    private fun isAsyncDecoratorFunction(limeFunction: LimeFunction) =
        limeFunction.attributes.have(ASYNC_DECORATOR) &&
            limeFunction.findAsyncCallbackParameter() != null

    private fun coroutineName(
        limeFunction: LimeFunction,
        nameResolver: KotlinNameResolver,
    ) = limeFunction.attributes.get(ASYNC_DECORATOR, NAME) ?: nameResolver.resolveName(limeFunction)

    /**
     * Prefixed with the receiver name because every type in a package shares one coroutine file, so two types
     * declaring the same function name would otherwise generate the same exception class twice.
     * The `error` name rule appends the configured suffix (`Exception` by default for Kotlin).
     */
    internal fun exceptionName(
        limeFunction: LimeFunction,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ) = nameResolver.resolveCoroutineExceptionName(receiverName, coroutineName(limeFunction, nameResolver))

    private fun buildExceptionClass(
        limeFunction: LimeFunction,
        errorMember: LimeTypedElement,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any> {
        val errorType = nameResolver.resolveTypeRef(errorMember.typeRef).removeSuffix("?")

        return mapOf(
            "name" to exceptionName(limeFunction, receiverName, nameResolver),
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
            docLines += "Cancelling the coroutine requests cancellation of the underlying task;" +
                " the task may still run to completion on the native side."
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
        docLines += "@return $resultDescription."
        if (exceptionName != null) {
            docLines += "@throws $exceptionName on error."
        }

        return "/**\n" + docLines.joinToString("\n") { if (it.isEmpty()) " *" else " * $it" } + "\n */"
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
                if (parameter.attributes.have(ASYNC_DECORATOR, DEFAULT)) {
                    "$declaration = ${nameResolver.resolveTypeRef(parameter.typeRef).removeSuffix("?")}()"
                } else {
                    declaration
                }
            }

    private fun buildFunctionModel(
        limeFunction: LimeFunction,
        receiverName: String,
        receiverTypeName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any?> {
        val functionName = nameResolver.resolveName(limeFunction)
        val coroutineName = coroutineName(limeFunction, nameResolver)
        val callbackParameter = limeFunction.findAsyncCallbackParameter()!!
        val callbackLambda = callbackParameter.typeRef.type.actualType as LimeLambda
        val callbackTypeName = nameResolver.resolveTypeRef(callbackParameter.typeRef).removeSuffix("?")

        val errorMember = callbackLambda.parameters.findAsyncErrorMember()
        val resultMembers = callbackLambda.parameters.findAsyncResultMembers(errorMember)

        val resultClassName =
            if (resultMembers.size > 1) {
                nameResolver.resolveCoroutineResultTypeName(receiverName, coroutineName)
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
                mapOf("name" to className, "fields" to fields, "coroutineName" to coroutineName)
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
        val startTarget = if (isStatic) receiverTypeName else "this"
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

        val exceptionName = errorMember?.let { exceptionName(limeFunction, receiverName, nameResolver) }
        val cancelFunction = limeFunction.findAsyncCancelFunction()
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
            "receiver" to if (isStatic) "$receiverTypeName.Companion." else "$receiverTypeName.",
            "name" to coroutineName,
            "params" to suspendParameters,
            "returnType" to resultType,
            "continuationIndent" to "      ",
            "bridgeName" to
                if (errorMember == null) {
                    nameResolver.resolveCoroutineValueBridgeName()
                } else {
                    nameResolver.resolveCoroutineResultBridgeName()
                },
            "startCall" to startCall,
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
