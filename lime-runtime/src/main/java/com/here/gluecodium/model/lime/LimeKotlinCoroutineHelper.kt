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

import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN_COROUTINE
import com.here.gluecodium.model.lime.LimeAttributeValueType.CALLBACK
import com.here.gluecodium.model.lime.LimeAttributeValueType.COMPLETE
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.UNREGISTER

/**
 * Shared `@KotlinCoroutine` model lookups, used by both the Kotlin generator and the LIME validator so the two
 * never independently re-implement (and risk disagreeing on) what counts as a callback, error member, or
 * cancellation/unregistration hook.
 */

/** This container's own functions plus any it inherits from implemented/extended interfaces. */
fun LimeContainer.allCoroutineFunctions(): List<LimeFunction> =
    when (this) {
        is LimeClass -> (functions + interfaceInheritedFunctions).distinct()
        is LimeInterface -> (functions + inheritedFunctions).distinct()
        else -> functions
    }

/** The parameters marked `@KotlinCoroutine(Callback)`, or by convention any lambda/interface-typed parameters. */
fun LimeFunction.findCoroutineCallbackCandidates(): List<LimeParameter> {
    val annotated = parameters.filter { it.attributes.have(KOTLIN_COROUTINE, CALLBACK) }
    if (annotated.isNotEmpty()) return annotated
    return parameters.filter {
        val type = it.typeRef.type.actualType
        type is LimeLambda || type is LimeInterface
    }
}

/** The `@KotlinCoroutine(Callback)` parameter, or by convention the sole callback-typed parameter. */
fun LimeFunction.findCoroutineCallbackParameter(): LimeParameter? = findCoroutineCallbackCandidates().singleOrNull()

/**
 * This function's callback members: a lambda's parameters, or an interface's completion-function parameters
 * (falling back to all its function parameters when there is no completion function).
 */
fun LimeFunction.findCoroutineCallbackMembers(): List<LimeTypedElement> =
    when (val callbackType = findCoroutineCallbackParameter()?.typeRef?.type?.actualType) {
        is LimeLambda -> callbackType.parameters
        is LimeInterface -> {
            val callbackFunctions = callbackType.functions + callbackType.inheritedFunctions
            val completionFunction = callbackFunctions.firstOrNull { it.attributes.have(KOTLIN_COROUTINE, COMPLETE) }
            completionFunction?.parameters ?: callbackFunctions.flatMap { it.parameters }
        }
        else -> emptyList()
    }

/** The `@KotlinCoroutine(Error)` member among these members, or null if none. */
fun <T : LimeTypedElement> List<T>.findCoroutineErrorMember(): T? = firstOrNull { it.attributes.have(KOTLIN_COROUTINE, ERROR) }

/** The `@KotlinCoroutine(Error)` member of this function's callback, or null if none. */
fun LimeFunction.findCoroutineErrorMember(): LimeTypedElement? = findCoroutineCallbackMembers().findCoroutineErrorMember()

/** The cancellation hook on the returned handle: by convention a parameterless `cancel()` method. */
fun LimeFunction.findCoroutineCancelFunction(): LimeFunction? {
    val returnContainer = returnType.typeRef.type.actualType as? LimeContainer ?: return null
    return returnContainer.functions.firstOrNull { it.name == "cancel" && it.parameters.isEmpty() }
}

/** The `@KotlinCoroutine(Unregister)` functions among these functions matching [callbackType]. */
fun List<LimeFunction>.findCoroutineUnregisterFunctions(callbackType: Any?): List<LimeFunction> =
    filter { candidate ->
        candidate.attributes.have(KOTLIN_COROUTINE, UNREGISTER) &&
            candidate.parameters.any { it.typeRef.type.actualType === callbackType }
    }
