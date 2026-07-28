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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN_COROUTINE
import com.here.gluecodium.model.lime.LimeAttributeValueType
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
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeTypedElement

/** Validates Kotlin-only coroutine and Flow annotation roles. */
internal class LimeKotlinCoroutineValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        var isValid = true

        allElements.filterIsInstance<LimeContainer>().forEach {
            isValid = validateContainer(it) && isValid
        }
        allElements.filterIsInstance<LimeLambda>().forEach {
            isValid = validateLambda(it) && isValid
        }
        allElements.filterIsInstance<LimeProperty>().forEach {
            isValid = validateNonFunction(it) && isValid
        }

        return isValid
    }

    private fun validateContainer(container: LimeContainer): Boolean {
        var isValid = true
        val completionFunctions = container.functions.filter { it.attributes.have(KOTLIN_COROUTINE, COMPLETE) }
        if (completionFunctions.size > 1) {
            logger.error(container, "a coroutine Flow listener can have at most one `@KotlinCoroutine(Complete)` function")
            isValid = false
        }

        container.functions.forEach {
            isValid = validateFunction(it, container) && isValid
        }
        isValid = validateExceptionNames(container) && isValid
        return isValid
    }

    /**
     * Generated exception classes are named after the coroutine name, so two wrapper functions sharing a coroutine name
     * must agree on the error type. Overloads are the usual cause, and `@KotlinCoroutine(Name = "...")` resolves it.
     */
    private fun validateExceptionNames(container: LimeContainer): Boolean {
        var isValid = true
        allFunctions(container)
            .filter { it.attributes.have(KOTLIN_COROUTINE) && !it.attributes.have(KOTLIN_COROUTINE, UNREGISTER) }
            .mapNotNull { function -> findErrorTypeName(function)?.let { coroutineName(function) to it } }
            .groupBy({ it.first }, { it.second })
            .filterValues { errorTypes -> errorTypes.distinct().size > 1 }
            .forEach { (coroutineName, errorTypes) ->
                logger.error(
                    container,
                    "coroutine functions named `$coroutineName` declare conflicting error types " +
                        "(${errorTypes.distinct().sorted().joinToString()}); " +
                        "use `@KotlinCoroutine(Name = \"...\")` to give them distinct names",
                )
                isValid = false
            }
        return isValid
    }

    /** Functions visible on the container, including the ones a class inherits from its interfaces. */
    private fun allFunctions(container: LimeContainer): List<LimeFunction> =
        when (container) {
            is LimeClass -> (container.functions + container.interfaceInheritedFunctions).distinct()
            else -> container.functions
        }

    private fun coroutineName(function: LimeFunction) = function.attributes.get(KOTLIN_COROUTINE, NAME) ?: function.name

    /** The `@KotlinCoroutine(Callback)` parameter, or by convention the sole callback-typed parameter. */
    private fun findCallbackParameter(function: LimeFunction): LimeParameter? {
        val markedCallbacks = function.parameters.filter { it.attributes.have(KOTLIN_COROUTINE, CALLBACK) }
        if (markedCallbacks.isNotEmpty()) return markedCallbacks.singleOrNull()
        return function.parameters.filter {
            val type = it.typeRef.type.actualType
            type is LimeLambda || type is LimeInterface
        }.singleOrNull()
    }

    /** Fully qualified type name of the callback's `@KotlinCoroutine(Error)` member, or null when there is none. */
    private fun findErrorTypeName(function: LimeFunction): String? {
        val members: List<LimeTypedElement> =
            when (val callbackType = findCallbackParameter(function)?.typeRef?.type?.actualType) {
                is LimeLambda -> callbackType.parameters
                is LimeInterface -> {
                    val callbackFunctions = callbackType.functions + callbackType.inheritedFunctions
                    val completionFunction = callbackFunctions.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, COMPLETE) }
                    completionFunction?.parameters ?: callbackFunctions.flatMap { it.parameters }
                }
                else -> emptyList()
            }
        return members.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, ERROR) }?.typeRef?.type?.actualType?.fullName
    }

    private fun validateFunction(
        function: LimeFunction,
        container: LimeContainer,
    ): Boolean {
        var isValid = true
        if (!function.attributes.have(KOTLIN_COROUTINE)) {
            function.parameters.forEach { parameter ->
                if (parameter.attributes.have(KOTLIN_COROUTINE)) {
                    logger.error(parameter, "Kotlin coroutine parameter roles require a `@KotlinCoroutine` function")
                    isValid = false
                }
            }
            return isValid
        }

        val roles = function.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
        return when {
            roles.contains(EMIT) || roles.contains(COMPLETE) -> validateListenerFunction(function, container) && isValid
            roles.contains(UNREGISTER) -> validateUnregisterFunction(function) && isValid
            else -> validateWrapperFunction(function, container) && isValid
        }
    }

    private fun validateWrapperFunction(
        function: LimeFunction,
        container: LimeContainer,
    ): Boolean {
        var isValid = true
        val roles = function.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
        val unsupportedRoles = roles - setOf(FLOW, NAME)
        if (unsupportedRoles.isNotEmpty()) {
            logger.error(function, "unsupported Kotlin coroutine function roles: ${unsupportedRoles.joinToString()}")
            isValid = false
        }
        if (function.isConstructor) {
            logger.error(function, "`@KotlinCoroutine` cannot be used on constructors")
            isValid = false
        }

        val markedCallbacks = function.parameters.filter { it.attributes.have(KOTLIN_COROUTINE, CALLBACK) }
        val callbackCandidates =
            if (markedCallbacks.isNotEmpty()) {
                markedCallbacks
            } else {
                function.parameters.filter { parameter ->
                    val type = parameter.typeRef.type.actualType
                    type is LimeLambda || type is LimeInterface
                }
            }
        val callbackParameter = callbackCandidates.singleOrNull()
        if (callbackCandidates.size != 1) {
            logger.error(function, "`@KotlinCoroutine` requires exactly one callback parameter")
            isValid = false
        }

        function.parameters.forEach { parameter ->
            val allowedRoles = if (parameter === callbackParameter) setOf(CALLBACK) else setOf(DEFAULT)
            isValid = validateParameterRoles(parameter, allowedRoles) && isValid
        }

        val callbackType = callbackParameter?.typeRef?.type?.actualType
        when (callbackType) {
            is LimeLambda -> {
                if (!callbackType.returnType.isVoid) {
                    logger.error(callbackType, "a Kotlin coroutine callback lambda must return `Void`")
                    isValid = false
                }
                isValid = validateCallbackMembers(callbackType.parameters, callbackType) && isValid
            }
            is LimeInterface -> {
                if (!roles.contains(FLOW)) {
                    logger.error(function, "interface callbacks require `@KotlinCoroutine(Flow)`")
                    isValid = false
                }
                isValid = validateFlowInterface(callbackType) && isValid
            }
            null -> Unit
            else -> {
                callbackParameter?.let { logger.error(it, "Kotlin coroutine callback must be lambda- or interface-typed") }
                isValid = false
            }
        }

        if (roles.contains(FLOW) && callbackType != null) {
            val unregisterFunctions =
                allFunctions(container).filter { candidate ->
                    candidate.attributes.have(KOTLIN_COROUTINE, UNREGISTER) &&
                        candidate.parameters.any { it.typeRef.type.actualType === callbackType }
                }
            if (unregisterFunctions.size > 1) {
                logger.error(
                    function,
                    "`@KotlinCoroutine(Flow)` matches more than one `@KotlinCoroutine(Unregister)` function",
                )
                isValid = false
            }
        }

        if (roles.contains(FLOW) && callbackType != null && !hasFlowCleanup(function, container, callbackType)) {
            val selfCompleting =
                callbackType is LimeInterface &&
                    (callbackType.functions + callbackType.inheritedFunctions).any {
                        it.attributes.have(KOTLIN_COROUTINE, COMPLETE)
                    }
            if (!selfCompleting) {
                logger.error(
                    function,
                    "`@KotlinCoroutine(Flow)` requires a cancellation handle, completion function, or unregister function",
                )
                isValid = false
            }
        }

        return isValid
    }

    private fun validateListenerFunction(
        function: LimeFunction,
        container: LimeContainer,
    ): Boolean {
        var isValid = true
        val roles = function.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
        val listenerRoles = roles.intersect(setOf(EMIT, COMPLETE))
        if (container !is LimeInterface) {
            logger.error(function, "`@KotlinCoroutine(Emit/Complete)` can only be used on interface functions")
            isValid = false
        }
        if (listenerRoles.size != 1 || roles.size != 1) {
            logger.error(function, "a Flow listener function must have exactly one `Emit` or `Complete` role")
            isValid = false
        }
        if (!function.returnType.isVoid) {
            logger.error(function, "a Flow listener function must return `Void`")
            isValid = false
        }
        function.parameters.forEach {
            isValid = validateParameterRoles(it, setOf(ERROR, RESULT)) && isValid
        }
        isValid = validateCallbackMembers(function.parameters, function) && isValid
        return isValid
    }

    private fun validateUnregisterFunction(function: LimeFunction): Boolean {
        var isValid = true
        val roles = function.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
        if (roles != setOf(UNREGISTER)) {
            logger.error(function, "`@KotlinCoroutine(Unregister)` cannot be combined with other coroutine roles")
            isValid = false
        }
        if (!function.returnType.isVoid) {
            logger.error(function, "a coroutine unregister function must return `Void`")
            isValid = false
        }
        val callbackParameters =
            function.parameters.filter {
                val type = it.typeRef.type.actualType
                type is LimeLambda || type is LimeInterface
            }
        if (function.parameters.size != 1 || callbackParameters.size != 1) {
            logger.error(function, "a coroutine unregister function must have exactly one parameter: the callback")
            isValid = false
        }
        function.parameters.forEach {
            if (it.attributes.have(KOTLIN_COROUTINE)) {
                logger.error(it, "unregister function parameters must not have Kotlin coroutine roles")
                isValid = false
            }
        }
        return isValid
    }

    private fun validateFlowInterface(callbackInterface: LimeInterface): Boolean {
        val functions = callbackInterface.functions + callbackInterface.inheritedFunctions
        var isValid = true
        val properties = callbackInterface.properties + callbackInterface.inheritedProperties
        if (properties.isNotEmpty()) {
            logger.error(callbackInterface, "a coroutine Flow listener cannot declare properties")
            isValid = false
        }
        functions.forEach { function ->
            val flowRoles =
                function.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
                    .intersect(setOf(EMIT, COMPLETE))
            if (flowRoles.size != 1) {
                logger.error(function, "every coroutine Flow listener function must declare exactly one `Emit` or `Complete` role")
                isValid = false
            }
        }
        if (functions.none { it.attributes.have(KOTLIN_COROUTINE, EMIT) }) {
            logger.error(callbackInterface, "a coroutine Flow listener must have at least one `@KotlinCoroutine(Emit)` function")
            isValid = false
        }
        if (functions.count { it.attributes.have(KOTLIN_COROUTINE, COMPLETE) } > 1) {
            logger.error(callbackInterface, "a coroutine Flow listener can have at most one completion function")
            isValid = false
        }
        return isValid
    }

    private fun validateLambda(lambda: LimeLambda): Boolean {
        var isValid = true
        if (lambda.attributes.have(KOTLIN_COROUTINE)) {
            logger.error(lambda, "Kotlin coroutine attributes cannot be applied to a lambda declaration")
            isValid = false
        }
        isValid = validateCallbackMembers(lambda.parameters, lambda) && isValid
        return isValid
    }

    private fun validateCallbackMembers(
        members: List<LimeTypedElement>,
        owner: LimeNamedElement,
    ): Boolean {
        var isValid = true
        members.forEach { member ->
            if (member.attributes.have(KOTLIN_COROUTINE)) {
                val roles = member.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
                val unsupportedRoles = roles - setOf(ERROR, RESULT)
                if (roles.isEmpty() || unsupportedRoles.isNotEmpty()) {
                    logger.error(member, "callback members only support `Error` and `Result` coroutine roles")
                    isValid = false
                }
            }
        }
        val errorMembers = members.filter { it.attributes.have(KOTLIN_COROUTINE, ERROR) }
        if (errorMembers.size > 1) {
            logger.error(owner, "a Kotlin coroutine callback can have at most one error member")
            isValid = false
        }
        val errorMember = errorMembers.singleOrNull()
        if (errorMember != null && !errorMember.typeRef.isNullable) {
            logger.error(errorMember, "a Kotlin coroutine error member must be nullable")
            isValid = false
        }

        val markedResults = members.filter { it.attributes.have(KOTLIN_COROUTINE, RESULT) }
        val resultMembers = markedResults.ifEmpty { members.filterNot { it === errorMember } }
        if (errorMember != null) {
            resultMembers.filterNot { it.typeRef.isNullable }.forEach {
                logger.error(it, "Kotlin coroutine results paired with an error member must be nullable")
                isValid = false
            }
        }
        return isValid
    }

    private fun validateParameterRoles(
        parameter: LimeParameter,
        allowedRoles: Set<LimeAttributeValueType>,
    ): Boolean {
        if (!parameter.attributes.have(KOTLIN_COROUTINE)) return true
        val roles = parameter.attributes.getAllAttributeValueTypes(KOTLIN_COROUTINE)
        val unsupportedRoles = roles - allowedRoles
        if (roles.isEmpty() || unsupportedRoles.isNotEmpty()) {
            logger.error(parameter, "unsupported Kotlin coroutine parameter roles: ${unsupportedRoles.ifEmpty { roles }.joinToString()}")
            return false
        }
        return true
    }

    private fun validateNonFunction(element: LimeNamedElement): Boolean {
        var isValid = true
        if (element.attributes.have(KOTLIN_COROUTINE)) {
            logger.error(element, "`@KotlinCoroutine` cannot be used on properties")
            isValid = false
        }
        return isValid
    }

    private fun hasFlowCleanup(
        function: LimeFunction,
        container: LimeContainer,
        callbackType: Any,
    ): Boolean {
        val returnContainer = function.returnType.typeRef.type.actualType as? LimeContainer
        // Must match `KotlinAsyncHelpers.findCancelFunction`: the generated cleanup calls `cancel()` without arguments.
        val hasCancellation = returnContainer?.functions?.any { it.name == "cancel" && it.parameters.isEmpty() } == true
        val hasUnregister =
            allFunctions(container).any { candidate ->
                candidate.attributes.have(KOTLIN_COROUTINE, UNREGISTER) &&
                    candidate.parameters.any { it.typeRef.type.actualType === callbackType }
            }
        return hasCancellation || hasUnregister
    }
}
