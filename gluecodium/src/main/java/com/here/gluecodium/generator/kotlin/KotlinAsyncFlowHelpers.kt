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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_DECORATOR
import com.here.gluecodium.model.lime.LimeAttributeValueType.COMPLETE
import com.here.gluecodium.model.lime.LimeAttributeValueType.EMIT
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.allFunctionsWithInherited
import com.here.gluecodium.model.lime.findAsyncCallbackParameter
import com.here.gluecodium.model.lime.findAsyncCancelFunction
import com.here.gluecodium.model.lime.findAsyncErrorMember
import com.here.gluecodium.model.lime.findAsyncResultMembers
import com.here.gluecodium.model.lime.findAsyncUnregisterFunctions

/**
 * Generates the `Flow<T>` wrappers for functions marked `@AsyncDecorator(Flow)`.
 *
 * Split out of [KotlinAsyncHelpers], which still owns the one-shot `suspend` wrappers and the Kotlin-specific helpers
 * shared by both: exception/bridge naming and callback member naming.
 */
internal object KotlinAsyncFlowHelpers {
    private data class FlowValueModel(
        val type: String,
        val expression: String,
        val declaration: String? = null,
    )

    fun buildFlowFunctionModel(
        limeFunction: LimeFunction,
        containerFunctions: List<LimeFunction>,
        receiverName: String,
        nameResolver: KotlinNameResolver,
    ): Map<String, Any?> {
        val functionName = nameResolver.resolveName(limeFunction)
        // Suffixed onto the already-resolved name, then re-normalized, so the result still obeys the `method` rule.
        val flowName =
            limeFunction.attributes.get(ASYNC_DECORATOR, NAME)
                ?: nameResolver.resolveGeneratedMethodName("${functionName}Flow")
        val callbackParameter = limeFunction.findAsyncCallbackParameter()!!
        val callbackTypeName = nameResolver.resolveTypeRef(callbackParameter.typeRef).removeSuffix("?")

        val callbackModel =
            when (val callbackType = callbackParameter.typeRef.type.actualType) {
                is LimeLambda ->
                    buildLambdaFlowCallback(limeFunction, flowName, callbackTypeName, callbackType, receiverName, nameResolver)
                is LimeInterface ->
                    buildInterfaceFlowCallback(limeFunction, flowName, callbackTypeName, callbackType, receiverName, nameResolver)
                // Unreachable: `LimeAsyncDecoratorValidator` rejects callbacks that are neither lambda- nor interface-typed.
                else ->
                    throw GluecodiumExecutionException(
                        "@AsyncDecorator(Flow) callback '${callbackParameter.fullName}' must be a lambda or interface",
                    )
            }

        // Inside `callbackFlow { }` the implicit receiver is the producer scope, so the extension receiver has to be
        // named by the function's own label rather than by the class.
        val startTarget = if (limeFunction.isStatic) receiverName else "this@$flowName"
        val startArguments =
            limeFunction.parameters.joinToString(", ") {
                if (it === callbackParameter) "listener" else nameResolver.resolveName(it)
            }
        val startCall = "$startTarget.$functionName($startArguments)"

        val callbackType = callbackParameter.typeRef.type.actualType
        // At most one matching unregister function can exist; enforced by `LimeAsyncDecoratorValidator`.
        val unregisterFunction = containerFunctions.findAsyncUnregisterFunctions(callbackType).firstOrNull()
        val cancelFunction = limeFunction.findAsyncCancelFunction()
        val needsHandle = unregisterFunction == null && cancelFunction != null
        val cleanupExpression =
            when {
                unregisterFunction != null -> {
                    val target = if (unregisterFunction.isStatic) receiverName else "this@$flowName"
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

        val parameters = KotlinAsyncHelpers.buildWrapperParameters(limeFunction, callbackParameter, nameResolver)
        val docComment =
            "/**\n" +
                " * Flow variant of `$functionName`. Registers the callback when collected and releases it when collection stops.\n" +
                " */"

        return mapOf(
            "eventDeclaration" to callbackModel["eventDeclaration"],
            "docComment" to docComment,
            "receiver" to if (limeFunction.isStatic) "$receiverName.Companion." else "$receiverName.",
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
        val errorMember = callbackLambda.parameters.findAsyncErrorMember()
        val resultMembers = callbackLambda.parameters.findAsyncResultMembers(errorMember)
        val localNames = KotlinAsyncHelpers.callbackLocalNames(callbackLambda.parameters, errorMember)
        val resultLocalNames = resultMembers.map { localNames[callbackLambda.parameters.indexOf(it)] }
        val valueModel =
            buildFlowValueModel(
                nameResolver.resolveGeneratedTypeName("${flowName}Event"),
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
                KotlinAsyncHelpers.exceptionName(limeFunction, nameResolver),
                KotlinAsyncHelpers.contractViolationName(receiverName, nameResolver),
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
        val callbackFunctions = callbackInterface.allFunctionsWithInherited()
        val emitFunctions = callbackFunctions.filter { it.attributes.have(ASYNC_DECORATOR, EMIT) }
        val completeFunctions = callbackFunctions.filter { it.attributes.have(ASYNC_DECORATOR, COMPLETE) }
        val completeFunction = completeFunctions.firstOrNull()

        val resultMembersByFunction =
            (emitFunctions + completeFunctions).associateWith { function ->
                function.parameters.findAsyncResultMembers(function.parameters.findAsyncErrorMember())
            }
        val eventFunctions = emitFunctions + completeFunctions.filter { resultMembersByFunction[it].orEmpty().isNotEmpty() }
        val eventTypeName = nameResolver.resolveGeneratedTypeName("${flowName}Event")
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
                val hasError = eventFunction.parameters.any { it.attributes.have(ASYNC_DECORATOR, ERROR) }
                val valueModel = buildFlowValueModel(eventTypeName, members, localNames, hasError, nameResolver)
                eventType = valueModel.type
                eventDeclaration = valueModel.declaration
                eventExpressions[eventFunction] = valueModel.expression
            }
        } else {
            eventType = eventTypeName
            eventDeclaration = buildSealedFlowEvent(eventTypeName, eventFunctions, resultMembersByFunction, nameResolver)
            eventFunctions.forEach { function ->
                val variantName = nameResolver.resolveGeneratedTypeName(nameResolver.resolveName(function))
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
                val errorMember = callbackFunction.parameters.findAsyncErrorMember()
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
                            KotlinAsyncHelpers.exceptionName(limeFunction, nameResolver),
                            KotlinAsyncHelpers.contractViolationName(receiverName, nameResolver),
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
                val variantName = nameResolver.resolveGeneratedTypeName(nameResolver.resolveName(function))
                val members = resultMembersByFunction[function].orEmpty()
                val hasError = function.parameters.any { it.attributes.have(ASYNC_DECORATOR, ERROR) }
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
                "    public val ${KotlinAsyncHelpers.resolveCallbackMemberName(member, nameResolver)}: $type"
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
}
