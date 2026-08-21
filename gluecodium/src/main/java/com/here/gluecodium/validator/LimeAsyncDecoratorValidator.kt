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
import com.here.gluecodium.model.lime.LimeAttributeValueType.DEFAULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributeValueType.RESULT
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.findAsyncCallbackCandidates
import com.here.gluecodium.model.lime.findAsyncCallbackParameter
import com.here.gluecodium.model.lime.findAsyncErrorMember
import com.here.gluecodium.model.lime.findAsyncErrorMembers
import com.here.gluecodium.model.lime.findAsyncNamedCallbackParameter
import com.here.gluecodium.model.lime.findAsyncResultMembers
import com.here.gluecodium.model.lime.getAsyncCallbackName
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

        container.functions.forEach {
            isValid = validateFunction(it, container) && isValid
        }
        isValid = validateExceptionNames(container) && isValid
        isValid = validateWrapperSignatures(container) && isValid
        isValid = validateTaskHandle(container) && isValid
        return isValid
    }

    /**
     * The generated wrapper drops the callback parameter, so two functions differing only by callback type collapse
     * into the same declaration. Overloads that keep distinct non-callback parameters stay valid Kotlin overloads.
     */
    private fun validateWrapperSignatures(container: LimeContainer): Boolean {
        var isValid = true
        container.functions
            .filter { it.attributes.have(ASYNC_DECORATOR) }
            .mapNotNull { function -> function.findAsyncCallbackParameter()?.let { function to it } }
            .groupBy { (function, callbackParameter) ->
                normalizeDecoratedName(decoratedName(function)) to
                    function.parameters.filterNot { it === callbackParameter }.map { parameterSignature(it) }
            }
            .filterValues { it.size > 1 }
            .forEach { (_, entries) ->
                val names = entries.map { it.first.name }.distinct().sorted().joinToString { "`$it`" }
                logger.error(
                    container,
                    "`@AsyncDecorator` functions named $names generate the same coroutine wrapper signature; " +
                        "use `@AsyncDecorator(Name = \"...\")` to give them distinct names",
                )
                isValid = false
            }
        return isValid
    }

    private fun parameterSignature(parameter: LimeParameter): String =
        parameter.typeRef.type.actualType.fullName + if (parameter.typeRef.isNullable) "?" else ""

    /** `@AsyncTaskHandle` annotates the handle class itself; the `Name` value names the cancel function. */
    private fun validateTaskHandle(container: LimeContainer): Boolean {
        if (!container.attributes.have(ASYNC_TASK_HANDLE)) return true
        val cancelName = container.attributes.get(ASYNC_TASK_HANDLE, LimeAttributeValueType.NAME) ?: "cancel"
        val cancelOverloads = container.functions.filter { it.name == cancelName }
        if (cancelOverloads.isEmpty()) {
            logger.error(container, "`@AsyncTaskHandle` names function `$cancelName` but no such function exists in this type")
            return false
        }
        // Matches `findAsyncCancelFunction`, which resolves on name *and* zero arity, so overloads are fine
        // as long as one of them is parameterless.
        if (cancelOverloads.none { it.parameters.isEmpty() }) {
            logger.error(cancelOverloads.first(), "the `@AsyncTaskHandle` cancel function cannot have parameters")
            return false
        }
        return true
    }

    /**
     * Generated exception classes are named after the decorated name, so two wrapper functions sharing a decorated name
     * must agree on the error type. Overloads are the usual cause, and `@AsyncDecorator(Name = "...")` resolves it.
     *
     * Only declared functions are compared, because an inherited function's wrapper (and its exception) is generated
     * on the interface declaring it, under that interface's own name.
     */
    private fun validateExceptionNames(container: LimeContainer): Boolean {
        var isValid = true
        container.functions
            .filter { it.attributes.have(ASYNC_DECORATOR) }
            .mapNotNull { function -> findErrorTypeName(function)?.let { decoratedName(function) to it } }
            .groupBy { normalizeDecoratedName(it.first) }
            .filterValues { entries -> entries.map { it.second }.distinct().size > 1 }
            .forEach { (_, entries) ->
                val names = entries.map { it.first }.distinct().sorted().joinToString { "`$it`" }
                val errorTypes = entries.map { it.second }.distinct().sorted().joinToString()
                logger.error(
                    container,
                    "`@AsyncDecorator` functions named $names declare conflicting error types ($errorTypes); " +
                        "use `@AsyncDecorator(Name = \"...\")` to give them distinct names",
                )
                isValid = false
            }
        return isValid
    }

    /** Generators normalize LIME names, so `load_value` and `loadValue` end up as one and the same generated symbol. */
    private fun normalizeDecoratedName(name: String) = name.replace("_", "").lowercase()

    /** Fully qualified type name of the callback's `@AsyncDecorator(Error)` member, or null when there is none. */
    private fun findErrorTypeName(function: LimeFunction): String? = function.findAsyncErrorMember()?.typeRef?.type?.actualType?.fullName

    private fun decoratedName(function: LimeFunction) = function.attributes.get(ASYNC_DECORATOR, NAME) ?: function.name

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

        return validateWrapperFunction(function) && isValid
    }

    private fun validateWrapperFunction(function: LimeFunction): Boolean {
        var isValid = true
        val roles = function.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
        val unsupportedRoles = roles - setOf(NAME, CALLBACK)
        if (unsupportedRoles.isNotEmpty()) {
            logger.error(function, "unsupported `@AsyncDecorator` function roles: ${unsupportedRoles.joinToString()}")
            isValid = false
        }
        if (function.isConstructor) {
            logger.error(function, "`@AsyncDecorator` cannot be used on constructors")
            isValid = false
        }

        val callbackName = function.getAsyncCallbackName()
        val callbackParameter =
            when {
                function.attributes.have(ASYNC_DECORATOR, CALLBACK) && callbackName == null -> {
                    logger.error(function, "`@AsyncDecorator(Callback = \"...\")` on a function requires a string value")
                    isValid = false
                    null
                }
                callbackName != null && callbackName.isBlank() -> {
                    logger.error(function, "`@AsyncDecorator(Callback = \"...\")` requires a non-empty callback parameter name")
                    isValid = false
                    null
                }
                callbackName != null -> {
                    val namedParameter = function.findAsyncNamedCallbackParameter()
                    when {
                        namedParameter == null -> {
                            logger.error(
                                function,
                                "`@AsyncDecorator(Callback = \"$callbackName\")` names no parameter on `${function.name}`",
                            )
                            isValid = false
                            null
                        }
                        !namedParameter.isAsyncCallbackTyped() -> {
                            logger.error(namedParameter, "`@AsyncDecorator` callback must be lambda-typed")
                            isValid = false
                            null
                        }
                        else -> namedParameter
                    }
                }
                else -> {
                    val callbackCandidates = function.findAsyncCallbackCandidates()
                    callbackCandidates.singleOrNull().also {
                        if (callbackCandidates.size != 1) {
                            logger.error(function, "`@AsyncDecorator` requires exactly one callback parameter")
                            isValid = false
                        }
                    }
                }
            }

        if (callbackName == null) {
            function.parameters.filter { it.attributes.have(ASYNC_DECORATOR, CALLBACK) }.forEach {
                logger.error(it, "one-shot `@AsyncDecorator` callback selection must be declared on the function")
                isValid = false
            }
        }

        function.parameters.forEach { parameter ->
            val allowedRoles = if (parameter === callbackParameter) emptySet() else setOf(DEFAULT)
            isValid = validateParameterRoles(parameter, allowedRoles) && isValid
            if (parameter !== callbackParameter) {
                isValid = validateDefaultParameter(parameter) && isValid
            }
        }

        val callbackType = callbackParameter?.typeRef?.type?.actualType
        when (callbackType) {
            is LimeLambda -> {
                // Members are validated once per lambda declaration in `validateLambda`, so checking them again here
                // would report every member problem twice.
                if (!callbackType.returnType.isVoid) {
                    logger.error(callbackType, "an `@AsyncDecorator` callback lambda must return `Void`")
                    isValid = false
                }
            }
            null -> Unit
            else -> {
                logger.error(callbackParameter, "`@AsyncDecorator` callback must be lambda-typed")
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

        // Marking any member `Result` narrows the results to just those, so unmarked ones are dropped without a trace.
        (members.filterNot { it === errorMember } - resultMembers.toSet()).forEach {
            logger.warning(
                it,
                "`@AsyncDecorator` callback member is not marked `$RESULT`, so it is dropped by the coroutine wrapper; " +
                    "mark it `$RESULT` to return it, or remove `$RESULT` from the other members to return all of them",
            )
        }
        return isValid
    }

    /** `@AsyncDecorator(Default)` generates a `Type()` default argument, so the type needs a no-argument constructor. */
    private fun validateDefaultParameter(parameter: LimeParameter): Boolean {
        if (!parameter.attributes.have(ASYNC_DECORATOR, DEFAULT)) return true
        val limeType = parameter.typeRef.type.actualType
        if (isDefaultConstructible(limeType)) return true
        logger.error(
            parameter,
            "`@AsyncDecorator(Default)` requires a type constructible without arguments, but `${limeType.fullName}` is not",
        )
        return false
    }

    private fun isDefaultConstructible(limeType: LimeType): Boolean =
        when (limeType) {
            // A struct without explicit constructors gets a generated one taking only its fields that lack defaults.
            is LimeStruct ->
                limeType.constructors.any { it.parameters.isEmpty() } ||
                    (
                        limeType.constructors.isEmpty() && limeType.fieldConstructors.isEmpty() &&
                            limeType.uninitializedFields.isEmpty()
                    )
            is LimeClass -> limeType.constructors.any { it.parameters.isEmpty() }
            else -> false
        }

    private fun validateParameterRoles(
        parameter: LimeParameter,
        allowedRoles: Set<LimeAttributeValueType>,
    ): Boolean {
        if (!parameter.attributes.have(ASYNC_DECORATOR)) return true
        val roles = parameter.attributes.getAllAttributeValueTypes(ASYNC_DECORATOR)
        if (roles.isEmpty()) {
            if (allowedRoles.isEmpty()) {
                logger.error(parameter, "`@AsyncDecorator` is not supported on the inferred callback parameter")
                return false
            }
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

    /** `@AsyncDecorator` is only meaningful on functions, their parameters, and callback lambda members. */
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
}
