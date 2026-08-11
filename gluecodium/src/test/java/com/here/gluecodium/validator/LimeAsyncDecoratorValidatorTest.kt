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
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeLambdaParameter
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import io.mockk.verify
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class LimeAsyncDecoratorValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val logger = mockk<LimeLogger>(relaxed = true)
    private val validator = LimeAsyncDecoratorValidator(logger)

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
                        .addAttribute(ASYNC_DECORATOR)
                        .addAttribute(ASYNC_DECORATOR, NAME, "loadValue")
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

    @Test
    fun rejectAttributeOnContainer() {
        addElements(LimeClass(path("Client"), attributes = coroutineAttributes()))

        assertFalse(validate())
    }

    @Test
    fun rejectAttributeOnStruct() {
        addElements(LimeStruct(path("Options"), attributes = coroutineAttributes()))

        assertFalse(validate())
    }

    @Test
    fun rejectAttributeOnConstant() {
        val constant =
            LimeConstant(
                path("Client", "LIMIT"),
                attributes = coroutineAttributes(),
                typeRef = LimeBasicTypeRef.INT,
                value = LimeValue.Literal(LimeBasicTypeRef.INT, "1"),
            )
        addElements(constant)

        assertFalse(validate())
    }

    @Test
    fun rejectAttributeOnEnumeration() {
        addElements(LimeEnumeration(path("Status"), attributes = coroutineAttributes()))

        assertFalse(validate())
    }

    @Test
    fun rejectCallbackMemberWithoutRole() {
        val callback =
            LimeLambda(
                path("Callback"),
                parameters = listOf(lambdaParameter("value", LimeBasicTypeRef.INT)),
            )
        addElements(callback, LimeClass(path("Client"), functions = listOf(wrapperFunction("fetch", callback))))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("requires a role") }) }
    }

    @Test
    fun validateDefaultRoleOnNonCallbackParameter() {
        val callback =
            LimeLambda(
                path("Callback"),
                parameters = listOf(lambdaParameter("value", nullableString(), RESULT)),
            )
        val function =
            LimeFunction(
                path("Client", "fetch"),
                attributes = coroutineAttributes(),
                parameters =
                    listOf(
                        parameter("options", LimeBasicTypeRef.INT, DEFAULT),
                        parameter("callback", LimeDirectTypeRef(callback), CALLBACK),
                    ),
            )
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertTrue(validate())
    }

    @Test
    fun rejectDefaultRoleOnCallbackParameter() {
        val callback =
            LimeLambda(
                path("Callback"),
                parameters = listOf(lambdaParameter("value", nullableString(), RESULT)),
            )
        val function =
            LimeFunction(
                path("Client", "fetch"),
                attributes = coroutineAttributes(),
                parameters = listOf(parameter("callback", LimeDirectTypeRef(callback), CALLBACK, DEFAULT)),
            )
        addElements(callback, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("unsupported") }) }
    }

    @Test
    fun validateTaskHandleAnnotationOnClass() {
        val stopFn = LimeFunction(path("Handle", "stop"))
        val handle =
            LimeClass(
                path("Handle"),
                attributes =
                    LimeAttributes.Builder()
                        .addAttribute(ASYNC_TASK_HANDLE)
                        .addAttribute(ASYNC_TASK_HANDLE, LimeAttributeValueType.NAME, "stop")
                        .build(),
                functions = listOf(stopFn),
            )
        addElements(handle)

        assertTrue(validate())
    }

    @Test
    fun rejectTaskHandleWhenNamedFunctionMissing() {
        val handle =
            LimeClass(
                path("Handle"),
                attributes =
                    LimeAttributes.Builder()
                        .addAttribute(ASYNC_TASK_HANDLE)
                        .addAttribute(ASYNC_TASK_HANDLE, LimeAttributeValueType.NAME, "abort")
                        .build(),
                functions = listOf(LimeFunction(path("Handle", "stop"))),
            )
        addElements(handle)

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("`abort`") }) }
    }

    @Test
    fun rejectTaskHandleOnFunction() {
        val fn =
            LimeFunction(
                path("Handle", "stop"),
                attributes = LimeAttributes.Builder().addAttribute(ASYNC_TASK_HANDLE).build(),
            )
        addElements(LimeClass(path("Handle"), functions = listOf(fn)))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("must be placed on the handle class") }) }
    }

    @Test
    fun rejectTaskHandleOnEnumeration() {
        addElements(
            LimeEnumeration(
                path("Status"),
                attributes = LimeAttributes.Builder().addAttribute(ASYNC_TASK_HANDLE).build(),
            ),
        )

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("only be used on the handle type") }) }
    }

    @Test
    fun rejectDecoratorOnConstructor() {
        val callback = LimeLambda(path("Callback"))
        val constructor =
            LimeFunction(
                path("Client", "create"),
                attributes = coroutineAttributes(),
                parameters = listOf(parameter("callback", LimeDirectTypeRef(callback), CALLBACK)),
                isConstructor = true,
            )
        addElements(callback, LimeClass(path("Client"), functions = listOf(constructor)))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("cannot be used on constructors") }) }
    }

    @Test
    fun rejectDecoratorWithoutCallbackParameter() {
        val function =
            LimeFunction(
                path("Client", "fetch"),
                attributes = coroutineAttributes(),
                parameters = listOf(parameter("count", LimeBasicTypeRef.INT)),
            )
        addElements(LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("exactly one callback parameter") }) }
    }

    @Test
    fun rejectDecoratorWithMultipleCallbackParameters() {
        val callback = LimeLambda(path("Callback"))
        val otherCallback = LimeLambda(path("OtherCallback"))
        val function =
            LimeFunction(
                path("Client", "fetch"),
                attributes = coroutineAttributes(),
                parameters =
                    listOf(
                        parameter("first", LimeDirectTypeRef(callback)),
                        parameter("second", LimeDirectTypeRef(otherCallback)),
                    ),
            )
        addElements(callback, otherCallback, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("exactly one callback parameter") }) }
    }

    @Test
    fun rejectFlowListenerWithProperties() {
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
                properties =
                    listOf(
                        LimeProperty(
                            path("Listener", "state"),
                            typeRef = LimeBasicTypeRef.INT,
                            getter = LimeFunction(path("Listener", "state", "get")),
                        ),
                    ),
            )
        val handle = cancellationHandle()
        val function = wrapperFunction("observe", listener, FLOW, returnType = LimeReturnType(LimeDirectTypeRef(handle)))
        addElements(listener, handle, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
        verify { logger.error(any<LimeNamedElement>(), match<String> { it.contains("cannot declare properties") }) }
    }

    @Test
    fun rejectFlowListenerWithoutEmitFunction() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions =
                    listOf(
                        LimeFunction(
                            path("Listener", "onComplete"),
                            attributes = coroutineAttributes(COMPLETE),
                            parameters = listOf(parameter("error", nullableInt(), ERROR)),
                        ),
                    ),
            )
        val handle = cancellationHandle()
        val function = wrapperFunction("observe", listener, FLOW, returnType = LimeReturnType(LimeDirectTypeRef(handle)))
        addElements(listener, handle, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
        verify {
            logger.error(any<LimeNamedElement>(), match<String> { it.contains("at least one `@AsyncDecorator(Emit)` function") })
        }
    }

    @Test
    fun rejectErrorOnEmitFunctionWhenCompletionFunctionExists() {
        val listener =
            LimeInterface(
                path("Listener"),
                functions =
                    listOf(
                        LimeFunction(
                            path("Listener", "onChunk"),
                            attributes = coroutineAttributes(EMIT),
                            parameters = listOf(parameter("error", nullableInt(), ERROR)),
                        ),
                        LimeFunction(path("Listener", "onFinished"), attributes = coroutineAttributes(COMPLETE)),
                    ),
            )
        val handle = cancellationHandle()
        val function = wrapperFunction("observe", listener, FLOW, returnType = LimeReturnType(LimeDirectTypeRef(handle)))
        addElements(listener, handle, LimeClass(path("Client"), functions = listOf(function)))

        assertFalse(validate())
        verify {
            logger.error(
                any<LimeNamedElement>(),
                match<String> { it.contains("must be declared on the `@AsyncDecorator(Complete)` function") },
            )
        }
    }

    private fun namedWrapperFunction(
        name: String,
        coroutineName: String,
        callbackType: LimeType,
    ) = LimeFunction(
        path("Client", name),
        attributes =
            LimeAttributes.Builder()
                .addAttribute(ASYNC_DECORATOR)
                .addAttribute(ASYNC_DECORATOR, NAME, coroutineName)
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
        val builder = LimeAttributes.Builder().addAttribute(ASYNC_DECORATOR)
        roles.forEach { builder.addAttribute(ASYNC_DECORATOR, it) }
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
