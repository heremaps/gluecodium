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

import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN_COROUTINE
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributeValueType.CALLBACK
import com.here.gluecodium.model.lime.LimeAttributeValueType.COMPLETE
import com.here.gluecodium.model.lime.LimeAttributeValueType.EMIT
import com.here.gluecodium.model.lime.LimeAttributeValueType.ERROR
import com.here.gluecodium.model.lime.LimeAttributeValueType.FLOW
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeAttributeValueType.RESULT
import com.here.gluecodium.model.lime.LimeAttributeValueType.UNREGISTER
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeType
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeKotlinCoroutineValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val validator = LimeKotlinCoroutineValidator(mockk(relaxed = true))

    @Test
    fun validateOneShotWithOptionalErrorAndMultipleResults() {
        val callback =
            LimeLambda(
                path("Callback"),
                parameters =
                    listOf(
                        lambdaParameter("error", nullableInt(), ERROR),
                        lambdaParameter("count", nullableInt(), RESULT),
                        lambdaParameter("label", nullableInt(), RESULT),
                    ),
            )
        val function = wrapperFunction("load", callback)
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertTrue(validate())
    }

    @Test
    fun validateOneShotWithoutErrorOrResult() {
        val callback = LimeLambda(path("Callback"))
        val function = wrapperFunction("synchronize", callback)
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertTrue(validate())
    }

    @Test
    fun validateOneShotWithCustomName() {
        val callback = LimeLambda(path("Callback"))
        val function =
            LimeFunction(
                path("Client", "load"),
                attributes =
                    LimeAttributes.Builder()
                        .addAttribute(KOTLIN_COROUTINE)
                        .addAttribute(KOTLIN_COROUTINE, NAME, "loadValue")
                        .build(),
                parameters = listOf(parameter("callback", LimeDirectTypeRef(callback), CALLBACK)),
            )
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertTrue(validate())
    }

    @Test
    fun validateProgressFlowWithCancellation() {
        val listener =
            LimeInterface(
                path("ProgressListener"),
                functions =
                    listOf(
                        LimeFunction(
                            path("ProgressListener", "onProgress"),
                            attributes = coroutineAttributes(EMIT),
                            parameters = listOf(parameter("percentage", LimeBasicTypeRef.INT)),
                        ),
                        LimeFunction(
                            path("ProgressListener", "onComplete"),
                            attributes = coroutineAttributes(COMPLETE),
                            parameters = listOf(parameter("error", nullableInt(), ERROR)),
                        ),
                    ),
            )
        val handle = cancellationHandle()
        val function = wrapperFunction("download", listener, FLOW, returnType = LimeReturnType(LimeDirectTypeRef(handle)))
        addElements(listener, handle, LimeClass(path("Client"), functions = listOf(function)))

        assertTrue(validate())
    }

    @Test
    fun validateRepeatingFlowWithUnregister() {
        val listener =
            LimeInterface(
                path("UpdateListener"),
                functions =
                    listOf(
                        LimeFunction(
                            path("UpdateListener", "onUpdate"),
                            attributes = coroutineAttributes(EMIT),
                            parameters = listOf(parameter("value", LimeBasicTypeRef.INT)),
                        ),
                    ),
            )
        val addFunction = wrapperFunction("addListener", listener, FLOW)
        val removeFunction =
            LimeFunction(
                path("Client", "removeListener"),
                attributes = coroutineAttributes(UNREGISTER),
                parameters = listOf(parameter("listener", LimeDirectTypeRef(listener))),
            )
        addElements(listener, LimeClass(path("Client"), functions = listOf(addFunction, removeFunction)))

        assertTrue(validate())
    }

    @Test
    fun rejectInterfaceCallbackWithoutFlowRole() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions = listOf(LimeFunction(path("Listener", "onValue"), attributes = coroutineAttributes(EMIT))),
            )
        val function = wrapperFunction("observe", listener)
        addElements(listener, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
    }

    @Test
    fun rejectRepeatingFlowWithoutCleanup() {
        val callback =
            LimeLambda(
                path("TickCallback"),
                parameters = listOf(lambdaParameter("tick", LimeBasicTypeRef.INT, RESULT)),
            )
        val function = wrapperFunction("observe", callback, FLOW)
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
    }

    @Test
    fun rejectCallbackLambdaWithReturnValue() {
        val callback =
            LimeLambda(
                path("Callback"),
                returnType = LimeReturnType(LimeBasicTypeRef.INT),
            )
        val function = wrapperFunction("load", callback)
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
    }

    @Test
    fun rejectUnclassifiedFlowListenerFunction() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions =
                    listOf(
                        LimeFunction(path("Listener", "onValue"), attributes = coroutineAttributes(EMIT)),
                        LimeFunction(path("Listener", "onIgnored")),
                    ),
            )
        val handle = cancellationHandle()
        val function = wrapperFunction("observe", listener, FLOW, returnType = LimeReturnType(LimeDirectTypeRef(handle)))
        addElements(listener, handle, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
    }

    @Test
    fun rejectUnregisterFunctionWithAdditionalParameters() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions = listOf(LimeFunction(path("Listener", "onValue"), attributes = coroutineAttributes(EMIT))),
            )
        val addFunction = wrapperFunction("addListener", listener, FLOW)
        val removeFunction =
            LimeFunction(
                path("Client", "removeListener"),
                attributes = coroutineAttributes(UNREGISTER),
                parameters =
                    listOf(
                        parameter("listener", LimeDirectTypeRef(listener)),
                        parameter("identifier", LimeBasicTypeRef.INT),
                    ),
            )
        addElements(listener, LimeClass(path("Client"), functions = listOf(addFunction, removeFunction)))

        assertFalse(validate())
    }

    @Test
    fun rejectMultipleCompletionFunctions() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions =
                    listOf(
                        LimeFunction(path("Listener", "completeOne"), attributes = coroutineAttributes(COMPLETE)),
                        LimeFunction(path("Listener", "completeTwo"), attributes = coroutineAttributes(COMPLETE)),
                    ),
            )
        addElements(listener)

        assertFalse(validate())
    }

    @Test
    fun rejectNonNullableErrorMember() {
        val callback =
            LimeLambda(
                path("Callback"),
                parameters =
                    listOf(
                        lambdaParameter("error", LimeBasicTypeRef.INT, ERROR),
                        lambdaParameter("value", nullableInt(), RESULT),
                    ),
            )
        val function = wrapperFunction("load", callback)
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
    }

    @Test
    fun rejectCollidingExceptionNamesWithDifferentErrorTypes() {
        val intCallback =
            LimeLambda(path("IntCallback"), parameters = listOf(lambdaParameter("error", nullableInt(), ERROR)))
        val stringCallback =
            LimeLambda(path("StringCallback"), parameters = listOf(lambdaParameter("error", nullableString(), ERROR)))
        val first = namedWrapperFunction("loadFast", "load", intCallback)
        val second = namedWrapperFunction("loadSlow", "load", stringCallback)
        addElements(intCallback, stringCallback, LimeClass(path("Client"), functions = listOf(first, second)))

        assertFalse(validate())
    }

    @Test
    fun validateCollidingExceptionNamesWithSameErrorType() {
        val callback =
            LimeLambda(path("Callback"), parameters = listOf(lambdaParameter("error", nullableInt(), ERROR)))
        val first = namedWrapperFunction("loadFast", "load", callback)
        val second = namedWrapperFunction("loadSlow", "load", callback)
        addElements(callback, LimeClass(path("Client"), functions = listOf(first, second)))

        assertTrue(validate())
    }

    @Test
    fun rejectFlowWithMultipleMatchingUnregisterFunctions() {
        val listener =
            LimeInterface(
                path("UpdateListener"),
                functions =
                    listOf(
                        LimeFunction(
                            path("UpdateListener", "onUpdate"),
                            attributes = coroutineAttributes(EMIT),
                            parameters = listOf(parameter("value", LimeBasicTypeRef.INT)),
                        ),
                    ),
            )
        val addFunction = wrapperFunction("addListener", listener, FLOW)
        val removeFunction = unregisterFunction("removeListener", listener)
        val dropFunction = unregisterFunction("dropListener", listener)
        addElements(listener, LimeClass(path("Client"), functions = listOf(addFunction, removeFunction, dropFunction)))

        assertFalse(validate())
    }

    @Test
    fun rejectFlowWhenCancelFunctionHasParameters() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions =
                    listOf(
                        LimeFunction(
                            path("Listener", "onValue"),
                            attributes = coroutineAttributes(EMIT),
                            parameters = listOf(parameter("value", LimeBasicTypeRef.INT)),
                        ),
                    ),
            )
        val handle =
            LimeClass(
                path("OperationHandle"),
                functions =
                    listOf(
                        LimeFunction(
                            path("OperationHandle", "cancel"),
                            parameters = listOf(parameter("reason", LimeBasicTypeRef.INT)),
                        ),
                    ),
            )
        val function = wrapperFunction("observe", listener, FLOW, returnType = LimeReturnType(LimeDirectTypeRef(handle)))
        addElements(listener, handle, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
    }

    private fun namedWrapperFunction(
        name: String,
        coroutineName: String,
        callbackType: LimeType,
    ) = LimeFunction(
        path("Client", name),
        attributes =
            LimeAttributes.Builder()
                .addAttribute(KOTLIN_COROUTINE)
                .addAttribute(KOTLIN_COROUTINE, NAME, coroutineName)
                .build(),
        parameters = listOf(parameter("callback", LimeDirectTypeRef(callbackType), CALLBACK)),
    )

    private fun unregisterFunction(
        name: String,
        callbackType: LimeType,
    ) = LimeFunction(
        path("Client", name),
        attributes = coroutineAttributes(UNREGISTER),
        parameters = listOf(parameter("listener", LimeDirectTypeRef(callbackType))),
    )

    private fun wrapperFunction(
        name: String,
        callbackType: LimeType,
        vararg roles: LimeAttributeValueType,
        returnType: LimeReturnType = LimeReturnType.VOID,
    ) = LimeFunction(
        path("Client", name),
        attributes = coroutineAttributes(*roles),
        parameters = listOf(parameter("callback", LimeDirectTypeRef(callbackType), CALLBACK)),
        returnType = returnType,
    )

    private fun cancellationHandle(): LimeClass {
        val cancel = LimeFunction(path("OperationHandle", "cancel"))
        return LimeClass(path("OperationHandle"), functions = listOf(cancel))
    }

    private fun lambdaParameter(
        name: String,
        typeRef: com.here.gluecodium.model.lime.LimeTypeRef,
        vararg roles: LimeAttributeValueType,
    ) = LimeLambdaParameter(
        typeRef,
        path("Callback", name),
        attributes = coroutineAttributes(*roles),
    )

    private fun parameter(
        name: String,
        typeRef: com.here.gluecodium.model.lime.LimeTypeRef,
        vararg roles: LimeAttributeValueType,
    ) = LimeParameter(
        path("Owner", name),
        attributes = if (roles.isEmpty()) null else coroutineAttributes(*roles),
        typeRef = typeRef,
    )

    private fun coroutineAttributes(vararg roles: LimeAttributeValueType): LimeAttributes {
        val builder = LimeAttributes.Builder().addAttribute(KOTLIN_COROUTINE)
        roles.forEach { builder.addAttribute(KOTLIN_COROUTINE, it) }
        return builder.build()
    }

    private fun nullableInt() = LimeBasicTypeRef(LimeBasicType.TypeId.INT32, isNullable = true)

    private fun nullableString() = LimeBasicTypeRef(LimeBasicType.TypeId.STRING, isNullable = true)

    private fun path(vararg elements: String) = elements.fold(EMPTY_PATH) { current, element -> current.child(element) }

    private fun addElements(vararg elements: LimeElement) {
        elements.forEachIndexed { index, element -> allElements[index.toString()] = element }
    }

    private fun validate() = validator.validate(LimeModel(allElements, emptyList()))
}
