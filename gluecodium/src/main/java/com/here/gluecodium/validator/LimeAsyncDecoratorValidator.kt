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
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_DECORATOR
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_TASK_HANDLE
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
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.allAsyncDecoratorFunctions
import com.here.gluecodium.model.lime.allFunctionsWithInherited
import com.here.gluecodium.model.lime.findAsyncCallbackCandidates
import com.here.gluecodium.model.lime.findAsyncCancelFunction
import com.here.gluecodium.model.lime.findAsyncErrorMember
import com.here.gluecodium.model.lime.findAsyncErrorMembers
import com.here.gluecodium.model.lime.findAsyncResultMembers
import com.here.gluecodium.model.lime.findAsyncUnregisterFunctions
import com.here.gluecodium.model.lime.isAsyncCallbackTyped

/** Validates `@AsyncDecorator` annotation roles. Platform-agnostic: runs regardless of the selected generators. */
internal class LimeAsyncDecoratorValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val allElements = limeModel.referenceMap.values
        var isValid = true

        allElements.filterIsInstance<LimeContainer>().forEach {
            isValid = validateContainer(it) && isValid
        }
        allElements.filterIsInstance<LimeLambda>().forEach {
            isValid = validateLambda(it) && isValid
        }
        listOf(
            allElements.filterIsInstance<LimeProperty>(),
            allElements.filterIsInstance<LimeField>(),
            allElements.filterIsInstance<LimeConstant>(),
            allElements.filterIsInstance<LimeEnumeration>(),
            allElements.filterIsInstance<LimeEnumerator>(),
            allElements.filterIsInstance<LimeException>(),
            allElements.filterIsInstance<LimeTypeAlias>(),
        ).flatten().forEach {
            isValid = validateUnsupportedTarget(it) && isValid
            isValid = validateTaskHandleTarget(it) && isValid
        }

        return isValid
    }

    private fun validateContainer(container: LimeContainer): Boolean {
        var isValid = validateUnsupportedTarget(container)
        val completionFunctions = container.functions.filter { it.attributes.have(ASYNC_DECORATOR, COMPLETE) }
        if (completionFunctions.size > 1) {
            logger.error(container, "an `@AsyncDecorator(Flow)` listener can have at most one `@AsyncDecorator(Complete)` function")
            isValid = false
        }

        container.functions.forEach {
            isValid = validateFunction(it, container) && isValid
        }
        isValid = validateExceptionNames(container) && isValid
        isValid = validateTaskHandle(container) && isValid
        return isValid
    }

    /** `@AsyncTaskHandle` annotates the handle class itself; the `Name` value names the cancel function. */
    private fun validateTaskHandle(container: LimeContainer): Boolean {
        if (!container.attributes.have(ASYNC_TASK_HANDLE)) return true
        val cancelName = container.attributes.get(ASYNC_TASK_HANDLE, LimeAttributeValueType.NAME) ?: "cancel"
        val cancelFunction = container.functions.firstOrNull { it.name == cancelName }
        if (cancelFunction == null) {
            logger.error(container, "`@AsyncTaskHandle` names function `$cancelName` but no such function exists in this type")
            return false
        }
        if (cancelFunction.parameters.isNotEmpty()) {
            logger.error(cancelFunction, "the `@AsyncTaskHandle` cancel function cannot have parameters")
            return false
        }
        return true
    }

    /**
     * Generated exception classes are named after the decorated name, so two wrapper functions sharing a decorated name
     * must agree on the error type. Overloads are the usual cause, and `@AsyncDecorator(Name = "...")` resolves it.
     */
    private fun validateExceptionNames(container: LimeContainer): Boolean {
        var isValid = true
        allFunctions(container)
            .filter { it.attributes.have(ASYNC_DECORATOR) && !it.attributes.have(ASYNC_DECORATOR, UNREGISTER) }
            .mapNotNull { function -> findErrorTypeName(function)?.let { decoratedName(function) to it } }
            .groupBy({ it.first }, { it.second })
            .filterValues { errorTypes -> errorTypes.distinct().size > 1 }
            .forEach { (decoratedName, errorTypes) ->
                logger.error(
                    container,
                    "`@AsyncDecorator` functions named `$decoratedName` declare conflicting error types " +
                        "(${errorTypes.distinct().sorted().joinToString()}); " +
                        "use `@AsyncDecorator(Name = \"...\")` to give them distinct names",
                )
                isValid = false
            }
        return isValid
    }

    /** Functions visible on the container, including the ones a class inherits from its interfaces. */
    private fun allFunctions(container: LimeContainer): List<LimeFunction> = container.allAsyncDecoratorFunctions()

    private fun decoratedName(function: LimeFunction) = function.attributes.get(ASYNC_DECORATOR, NAME) ?: function.name

    /** Fully qualified type name of the callback's `@AsyncDecorator(Error)` member, or null when there is none. */
    private fun findErrorTypeName(function: LimeFunction): String? = function.findAsyncErrorMember()?.typeRef?.type?.actualType?.fullName

    private fun validateFunction(
        function: LimeFunction,
        container: LimeContainer,
    ): Boolean {
        var isValid = true
        if (!function.attributes.have(ASYNC_DECORATOR)) {
            if (function.attributes.have(ASYNC_TASK_HANDLE)) {
                logger.error(function, "`@AsyncTaskHandle` must be placed on the handle class, not on a function")
                isValid = false
            }
            function.parameters.forEach { parameter ->
                if (parameter.attributes.have(ASYNC_DECORATOR)) {
                    logger.error(parameter, "`@AsyncDecorator` parameter roles require an `@AsyncDecorator` function")
                    isValid = false
                }
            }
            return isValid
        }

        val roles = function.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
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
        val roles = function.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
        val unsupportedRoles = roles - setOf(FLOW, NAME)
        if (unsupportedRoles.isNotEmpty()) {
            logger.error(function, "unsupported `@AsyncDecorator` function roles: ${unsupportedRoles.joinToString()}")
            isValid = false
        }
        if (function.isConstructor) {
            logger.error(function, "`@AsyncDecorator` cannot be used on constructors")
            isValid = false
        }

        val callbackCandidates = function.findAsyncCallbackCandidates()
        val callbackParameter = callbackCandidates.singleOrNull()
        if (callbackCandidates.size != 1) {
            logger.error(function, "`@AsyncDecorator` requires exactly one callback parameter")
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
                    logger.error(callbackType, "an `@AsyncDecorator` callback lambda must return `Void`")
                    isValid = false
                }
                isValid = validateCallbackMembers(callbackType.parameters, callbackType) && isValid
            }
            is LimeInterface -> {
                if (!roles.contains(FLOW)) {
                    logger.error(function, "interface callbacks require `@AsyncDecorator(Flow)`")
                    isValid = false
                }
                isValid = validateFlowInterface(callbackType) && isValid
            }
            null -> Unit
            else -> {
                logger.error(callbackParameter, "`@AsyncDecorator` callback must be lambda- or interface-typed")
                isValid = false
            }
        }

        if (roles.contains(FLOW) && callbackType != null) {
            val unregisterFunctions = allFunctions(container).findAsyncUnregisterFunctions(callbackType)
            if (unregisterFunctions.size > 1) {
                logger.error(
                    function,
                    "`@AsyncDecorator(Flow)` matches more than one `@AsyncDecorator(Unregister)` function",
                )
                isValid = false
            }
        }

        if (roles.contains(FLOW) && callbackType != null && !hasFlowCleanup(function, container, callbackType)) {
            val selfCompleting =
                callbackType is LimeInterface &&
                    callbackType.allFunctionsWithInherited().any { it.attributes.have(ASYNC_DECORATOR, COMPLETE) }
            if (!selfCompleting) {
                logger.error(
                    function,
                    "`@AsyncDecorator(Flow)` requires a cancellation handle, completion function, or unregister function",
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
        val roles = function.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
        val listenerRoles = roles.intersect(setOf(EMIT, COMPLETE))
        if (container !is LimeInterface) {
            logger.error(function, "`@AsyncDecorator(Emit/Complete)` can only be used on interface functions")
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
        val roles = function.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
        if (roles != setOf(UNREGISTER)) {
            logger.error(function, "`@AsyncDecorator(Unregister)` cannot be combined with other `@AsyncDecorator` roles")
            isValid = false
        }
        if (!function.returnType.isVoid) {
            logger.error(function, "an `@AsyncDecorator(Unregister)` function must return `Void`")
            isValid = false
        }
        val callbackParameters = function.parameters.filter { it.isAsyncCallbackTyped() }
        if (function.parameters.size != 1 || callbackParameters.size != 1) {
            logger.error(function, "an `@AsyncDecorator(Unregister)` function must have exactly one parameter: the callback")
            isValid = false
        }
        function.parameters.forEach {
            if (it.attributes.have(ASYNC_DECORATOR)) {
                logger.error(it, "unregister function parameters must not have `@AsyncDecorator` roles")
                isValid = false
            }
        }
        return isValid
    }

    private fun validateFlowInterface(callbackInterface: LimeInterface): Boolean {
        val functions = callbackInterface.allFunctionsWithInherited()
        var isValid = true
        val properties = callbackInterface.properties + callbackInterface.inheritedProperties
        if (properties.isNotEmpty()) {
            logger.error(callbackInterface, "an `@AsyncDecorator(Flow)` listener cannot declare properties")
            isValid = false
        }
        functions.forEach { function ->
            val flowRoles =
                function.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
                    .intersect(setOf(EMIT, COMPLETE))
            if (flowRoles.size != 1) {
                logger.error(function, "every `@AsyncDecorator(Flow)` listener function must declare exactly one `Emit` or `Complete` role")
                isValid = false
            }
        }
        if (functions.none { it.attributes.have(ASYNC_DECORATOR, EMIT) }) {
            logger.error(callbackInterface, "an `@AsyncDecorator(Flow)` listener must have at least one `@AsyncDecorator(Emit)` function")
            isValid = false
        }
        if (functions.count { it.attributes.have(ASYNC_DECORATOR, COMPLETE) } > 1) {
            logger.error(callbackInterface, "an `@AsyncDecorator(Flow)` listener can have at most one completion function")
            isValid = false
        }
        // With a completion function present, the generated exception type is derived from its members alone, so an
        // error declared on an `Emit` function would be referenced by the generated Flow without ever being generated.
        if (functions.any { it.attributes.have(ASYNC_DECORATOR, COMPLETE) }) {
            functions
                .filter { it.attributes.have(ASYNC_DECORATOR, EMIT) }
                .flatMap { it.parameters.findAsyncErrorMembers() }
                .forEach {
                    logger.error(
                        it,
                        "an `@AsyncDecorator(Error)` member must be declared on the `@AsyncDecorator(Complete)` " +
                            "function when the listener has one",
                    )
                    isValid = false
                }
        }
        return isValid
    }

    private fun validateLambda(lambda: LimeLambda): Boolean {
        var isValid = true
        if (lambda.attributes.have(ASYNC_DECORATOR)) {
            logger.error(lambda, "`@AsyncDecorator` attributes cannot be applied to a lambda declaration")
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
            if (member.attributes.have(ASYNC_DECORATOR)) {
                val roles = member.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
                val unsupportedRoles = roles - setOf(ERROR, RESULT)
                when {
                    roles.isEmpty() -> {
                        logger.error(member, "`@AsyncDecorator` on a callback member requires a role: `$ERROR` or `$RESULT`")
                        isValid = false
                    }
                    unsupportedRoles.isNotEmpty() -> {
                        logger.error(member, "unsupported `@AsyncDecorator` callback member roles: ${unsupportedRoles.joinToString()}")
                        isValid = false
                    }
                }
            }
        }
        val errorMembers = members.findAsyncErrorMembers()
        if (errorMembers.size > 1) {
            logger.error(owner, "an `@AsyncDecorator` callback can have at most one error member")
            isValid = false
        }
        val errorMember = errorMembers.singleOrNull()
        if (errorMember != null && !errorMember.typeRef.isNullable) {
            logger.error(errorMember, "an `@AsyncDecorator` error member must be nullable")
            isValid = false
        }

        val resultMembers = members.findAsyncResultMembers(errorMember)
        if (errorMember != null) {
            resultMembers.filterNot { it.typeRef.isNullable }.forEach {
                logger.error(it, "`@AsyncDecorator` results paired with an error member must be nullable")
                isValid = false
            }
        }
        return isValid
    }

    private fun validateParameterRoles(
        parameter: LimeParameter,
        allowedRoles: Set<LimeAttributeValueType>,
    ): Boolean {
        if (!parameter.attributes.have(ASYNC_DECORATOR)) return true
        val roles = parameter.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
        if (roles.isEmpty()) {
            val roleNames = allowedRoles.joinToString { "`$it`" }
            logger.error(parameter, "`@AsyncDecorator` on a parameter requires a role: $roleNames")
            return false
        }
        val unsupportedRoles = roles - allowedRoles
        if (unsupportedRoles.isNotEmpty()) {
            logger.error(parameter, "unsupported `@AsyncDecorator` parameter roles: ${unsupportedRoles.joinToString()}")
            return false
        }
        return true
    }

    /** `@AsyncDecorator` is only meaningful on functions, their parameters, and callback lambda/interface members. */
    private fun validateUnsupportedTarget(element: LimeNamedElement): Boolean {
        if (!element.attributes.have(ASYNC_DECORATOR)) return true
        logger.error(element, "`@AsyncDecorator` cannot be used here")
        return false
    }

    /** `@AsyncTaskHandle` describes a handle type, so it is only meaningful on the type itself. */
    private fun validateTaskHandleTarget(element: LimeNamedElement): Boolean {
        if (!element.attributes.have(ASYNC_TASK_HANDLE)) return true
        logger.error(element, "`@AsyncTaskHandle` can only be used on the handle type")
        return false
    }

    private fun hasFlowCleanup(
        function: LimeFunction,
        container: LimeContainer,
        callbackType: Any,
    ): Boolean {
        val hasCancellation = function.findAsyncCancelFunction() != null
        val hasUnregister = allFunctions(container).findAsyncUnregisterFunctions(callbackType).isNotEmpty()
        return hasCancellation || hasUnregister
    }
}
