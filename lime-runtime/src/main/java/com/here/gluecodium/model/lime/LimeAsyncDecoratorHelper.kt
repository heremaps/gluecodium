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

package com.here.gluecodium.model.lime

import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_DECORATOR
import com.here.gluecodium.model.lime.LimeAttributeType.ASYNC_TASK_HANDLE
import com.here.gluecodium.model.lime.LimeAttributeValueType.CALLBACK
import com.here.gluecodium.model.lime.LimeAttributeValueType.COMPLETE
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributeValueType.RESULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.UNREGISTER

// Shared `@AsyncDecorator` model lookups, used by both the generators and the LIME validator so the two never
// independently re-implement (and risk disagreeing on) what counts as a callback, error member, result member, or
// cancellation/unregistration hook.

/** An interface's own functions plus the ones it inherits from its parents. */
fun LimeInterface.allFunctionsWithInherited(): List<LimeFunction> = (functions + inheritedFunctions).distinct()

/** This container's own functions plus any it inherits from implemented/extended interfaces. */
fun LimeContainer.allAsyncDecoratorFunctions(): List<LimeFunction> =
    when (this) {
        is LimeClass -> (functions + interfaceInheritedFunctions).distinct()
        is LimeInterface -> allFunctionsWithInherited()
        else -> functions
    }

/** An `@AsyncDecorator` callback is always lambda- or interface-typed. */
fun LimeParameter.isAsyncCallbackTyped(): Boolean {
    val type = typeRef.type.actualType
    return type is LimeLambda || type is LimeInterface
}

/** The parameters marked `@AsyncDecorator(Callback)`, or by convention any lambda/interface-typed parameters. */
fun LimeFunction.findAsyncCallbackCandidates(): List<LimeParameter> {
    val annotated = parameters.filter { it.attributes.have(ASYNC_DECORATOR, CALLBACK) }
    return annotated.ifEmpty { parameters.filter { it.isAsyncCallbackTyped() } }
}

/** The `@AsyncDecorator(Callback)` parameter, or by convention the sole callback-typed parameter. */
fun LimeFunction.findAsyncCallbackParameter(): LimeParameter? = findAsyncCallbackCandidates().singleOrNull()

/**
 * This function's callback members: a lambda's parameters, or an interface's completion-function parameters
 * (falling back to all its function parameters when there is no completion function).
 */
fun LimeFunction.findAsyncCallbackMembers(): List<LimeTypedElement> =
    when (val callbackType = findAsyncCallbackParameter()?.typeRef?.type?.actualType) {
        is LimeLambda -> callbackType.parameters
        is LimeInterface -> {
            val callbackFunctions = callbackType.allFunctionsWithInherited()
            val completionFunction = callbackFunctions.firstOrNull { it.attributes.have(ASYNC_DECORATOR, COMPLETE) }
            completionFunction?.parameters ?: callbackFunctions.flatMap { it.parameters }
        }
        else -> emptyList()
    }

/** The `@AsyncDecorator(Error)` members among these members. More than one is a validation error. */
fun <T : LimeTypedElement> List<T>.findAsyncErrorMembers(): List<T> = filter { it.attributes.have(ASYNC_DECORATOR, ERROR) }

/** The `@AsyncDecorator(Error)` member among these members, or null if none. */
fun <T : LimeTypedElement> List<T>.findAsyncErrorMember(): T? = findAsyncErrorMembers().firstOrNull()

/** The `@AsyncDecorator(Error)` member of this function's callback, or null if none. */
fun LimeFunction.findAsyncErrorMember(): LimeTypedElement? = findAsyncCallbackMembers().findAsyncErrorMember()

/**
 * The members marked `@AsyncDecorator(Result)`, or by convention every member except [errorMember]. The validator
 * enforces nullability on exactly this set, so the generators must resolve it identically or they emit code whose
 * null-handling contradicts what was validated.
 */
fun <T : LimeTypedElement> List<T>.findAsyncResultMembers(errorMember: T?): List<T> {
    val markedResults = filter { it.attributes.have(ASYNC_DECORATOR, RESULT) }
    return markedResults.ifEmpty { filterNot { it === errorMember } }
}

/**
 * The cancellation hook on the returned handle: the function named by `@AsyncTaskHandle(Name = "...")` on the
 * handle class, defaulting to a parameterless `cancel()` when the annotation is absent.
 */
fun LimeFunction.findAsyncCancelFunction(): LimeFunction? {
    val returnContainer = returnType.typeRef.type.actualType as? LimeContainer ?: return null
    if (returnContainer.attributes.have(ASYNC_TASK_HANDLE)) {
        val cancelName = returnContainer.attributes.get(ASYNC_TASK_HANDLE, NAME) ?: "cancel"
        return returnContainer.functions.firstOrNull { it.name == cancelName && it.parameters.isEmpty() }
    }
    return returnContainer.functions.firstOrNull { it.name == "cancel" && it.parameters.isEmpty() }
}

/** The `@AsyncDecorator(Unregister)` functions among these functions matching [callbackType]. */
fun List<LimeFunction>.findAsyncUnregisterFunctions(callbackType: Any?): List<LimeFunction> =
    filter { candidate ->
        candidate.attributes.have(ASYNC_DECORATOR, UNREGISTER) &&
            candidate.parameters.any { it.typeRef.type.actualType === callbackType }
    }
