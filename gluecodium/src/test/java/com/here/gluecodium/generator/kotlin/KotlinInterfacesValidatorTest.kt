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

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeValue
import io.mockk.mockk
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class KotlinInterfacesValidatorTest {
    private val allElements = mutableMapOf<String, LimeElement>()
    private val interfacePath = LimePath(emptyList(), listOf("SomeInterface"))
    private val classPath = LimePath(emptyList(), listOf("SomeClass"))
    private val internalAttribute = LimeAttributes.Builder().addAttribute(LimeAttributeType.INTERNAL).build()
    private val kotlinInterfaceAttribute =
        LimeAttributes.Builder().addAttribute(LimeAttributeType.KOTLIN, LimeAttributeValueType.INTERFACE).build()
    private val cppRefAttribute =
        LimeAttributes.Builder().addAttribute(LimeAttributeType.CPP, LimeAttributeValueType.REF).build()
    private val validator = KotlinInterfacesValidator(mockk(relaxed = true))

    @Test
    fun validateMarkedClassWithReadOnlyPropertiesAndStaticFunctions() {
        val propertyPath = classPath.child("title")
        val readOnlyProperty =
            LimeProperty(
                path = propertyPath,
                getter = LimeFunction(path = propertyPath.child("get")),
                typeRef = LimeBasicTypeRef.INT,
            )
        val staticFunction = LimeFunction(path = classPath.child("defaultTitle"), isStatic = true)
        val markedClass =
            LimeClass(
                path = classPath,
                attributes = kotlinInterfaceAttribute,
                properties = listOf(readOnlyProperty),
                functions = listOf(staticFunction),
            )

        assertTrue(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedClassWithConstructor() {
        val constructor = LimeFunction(path = classPath.child("constructor"), isConstructor = true)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(constructor))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedClassWithWritableProperty() {
        val propertyPath = classPath.child("title")
        val writableProperty =
            LimeProperty(
                path = propertyPath,
                getter = LimeFunction(path = propertyPath.child("get")),
                setter = LimeFunction(path = propertyPath.child("set")),
                typeRef = LimeBasicTypeRef.INT,
            )
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, properties = listOf(writableProperty))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun validateMarkedOutputOnlyClassWithInternalMembers() {
        val internalFunction = LimeFunction(path = classPath.child("internalFunction"), attributes = internalAttribute)
        val internalPropertyPath = classPath.child("relevance")
        val internalProperty =
            LimeProperty(
                path = internalPropertyPath,
                attributes = internalAttribute,
                getter = LimeFunction(path = internalPropertyPath.child("get")),
                typeRef = LimeBasicTypeRef.INT,
            )
        val markedClass =
            LimeClass(
                path = classPath,
                attributes = kotlinInterfaceAttribute,
                functions = listOf(internalFunction),
                properties = listOf(internalProperty),
            )

        assertTrue(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedInputCapableClassWithInternalFunction() {
        val internalFunction = LimeFunction(path = classPath.child("internalFunction"), attributes = internalAttribute)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(internalFunction))
        val consumerPath = LimePath(emptyList(), listOf("SomeConsumer"))
        val consumerFunctionPath = consumerPath.child("consume")
        val consumerFunction =
            LimeFunction(
                path = consumerFunctionPath,
                parameters =
                    listOf(LimeParameter(path = consumerFunctionPath.child("value"), typeRef = LimeDirectTypeRef(markedClass))),
            )
        val consumerClass = LimeClass(path = consumerPath, functions = listOf(consumerFunction))

        val elements = mapOf(markedClass.path.toString() to markedClass, consumerClass.path.toString() to consumerClass)

        assertFalse(validator.validate(elements))
    }

    @Test
    fun rejectMarkedClassReturnedByImplementableInterfaceWithInternalFunction() {
        val internalFunction = LimeFunction(path = classPath.child("internalFunction"), attributes = internalAttribute)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(internalFunction))
        val callbackPath = LimePath(emptyList(), listOf("SomeCallback"))
        val callbackFunctionPath = callbackPath.child("createValue")
        val callbackFunction =
            LimeFunction(
                path = callbackFunctionPath,
                returnType = LimeReturnType(LimeDirectTypeRef(markedClass)),
            )
        val callbackInterface = LimeInterface(path = callbackPath, functions = listOf(callbackFunction))
        val consumerPath = LimePath(emptyList(), listOf("SomeConsumer"))
        val consumerFunctionPath = consumerPath.child("setCallback")
        val consumerFunction =
            LimeFunction(
                path = consumerFunctionPath,
                parameters =
                    listOf(
                        LimeParameter(path = consumerFunctionPath.child("callback"), typeRef = LimeDirectTypeRef(callbackInterface)),
                    ),
            )
        val consumerClass = LimeClass(path = consumerPath, functions = listOf(consumerFunction))

        val elements =
            mapOf(
                markedClass.path.toString() to markedClass,
                callbackInterface.path.toString() to callbackInterface,
                consumerClass.path.toString() to consumerClass,
            )

        assertFalse(validator.validate(elements))
    }

    @Test
    fun rejectMarkedClassReturnedByImplementableInterfacePropertyWithInternalFunction() {
        val internalFunction = LimeFunction(path = classPath.child("internalFunction"), attributes = internalAttribute)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(internalFunction))
        val callbackPath = LimePath(emptyList(), listOf("SomeCallback"))
        val propertyPath = callbackPath.child("value")
        val callbackProperty =
            LimeProperty(
                path = propertyPath,
                getter = LimeFunction(path = propertyPath.child("get")),
                typeRef = LimeDirectTypeRef(markedClass),
            )
        val callbackInterface = LimeInterface(path = callbackPath, properties = listOf(callbackProperty))
        val consumerPath = LimePath(emptyList(), listOf("SomeConsumer"))
        val consumerFunctionPath = consumerPath.child("setCallback")
        val consumerFunction =
            LimeFunction(
                path = consumerFunctionPath,
                parameters =
                    listOf(
                        LimeParameter(path = consumerFunctionPath.child("callback"), typeRef = LimeDirectTypeRef(callbackInterface)),
                    ),
            )
        val consumerClass = LimeClass(path = consumerPath, functions = listOf(consumerFunction))

        val elements =
            mapOf(
                markedClass.path.toString() to markedClass,
                callbackInterface.path.toString() to callbackInterface,
                consumerClass.path.toString() to consumerClass,
            )

        assertFalse(validator.validate(elements))
    }

    @Test
    fun validateOutputOnlyClassPassedToNativeCallback() {
        val internalFunction = LimeFunction(path = classPath.child("internalFunction"), attributes = internalAttribute)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(internalFunction))
        val callbackPath = LimePath(emptyList(), listOf("SomeCallback"))
        val callbackFunctionPath = callbackPath.child("onValue")
        val callbackFunction =
            LimeFunction(
                path = callbackFunctionPath,
                parameters = listOf(LimeParameter(path = callbackFunctionPath.child("value"), typeRef = LimeDirectTypeRef(markedClass))),
            )
        val callbackInterface = LimeInterface(path = callbackPath, functions = listOf(callbackFunction))

        val elements = mapOf(markedClass.path.toString() to markedClass, callbackInterface.path.toString() to callbackInterface)

        assertTrue(validator.validate(elements))
    }

    @Test
    fun rejectMarkedClassWithInternalConstant() {
        val internalConstant =
            LimeConstant(
                path = classPath.child("internalConstant"),
                attributes = internalAttribute,
                typeRef = LimeBasicTypeRef.INT,
                value = LimeValue.ZERO,
            )
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, constants = listOf(internalConstant))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun validateMarkedClassWithPublicConstantAndStaticFunction() {
        val publicConstant =
            LimeConstant(
                path = classPath.child("publicConstant"),
                typeRef = LimeBasicTypeRef.INT,
                value = LimeValue.ZERO,
            )
        val staticFunction = LimeFunction(path = classPath.child("defaultTitle"), isStatic = true)
        val markedClass =
            LimeClass(
                path = classPath,
                attributes = kotlinInterfaceAttribute,
                constants = listOf(publicConstant),
                functions = listOf(staticFunction),
            )

        assertTrue(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedClassWithInternalStaticFunction() {
        val internalStaticFunction =
            LimeFunction(path = classPath.child("internalStatic"), isStatic = true, attributes = internalAttribute)
        val markedClass =
            LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(internalStaticFunction))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedClassWithInternalStaticProperty() {
        val propertyPath = classPath.child("internalStaticProperty")
        val internalStaticProperty =
            LimeProperty(
                path = propertyPath,
                attributes = internalAttribute,
                getter = LimeFunction(path = propertyPath.child("get"), isStatic = true),
                typeRef = LimeBasicTypeRef.INT,
                isStatic = true,
            )
        val markedClass =
            LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, properties = listOf(internalStaticProperty))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedClassWithCppRefFunction() {
        val cppRefFunction = LimeFunction(path = classPath.child("getItems"), attributes = cppRefAttribute)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, functions = listOf(cppRefFunction))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedClassWithUncachedCppRefProperty() {
        val markedClass =
            LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, properties = listOf(cppRefProperty(cached = false)))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun validateMarkedClassWithCachedCppRefProperty() {
        val markedClass =
            LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, properties = listOf(cppRefProperty(cached = true)))

        assertTrue(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun validateUnmarkedClassWithUncachedCppRefProperty() {
        val someClass = LimeClass(path = classPath, properties = listOf(cppRefProperty(cached = false)))

        assertTrue(validator.validate(mapOf(someClass.path.toString() to someClass)))
    }

    private fun cppRefProperty(cached: Boolean): LimeProperty {
        val propertyPath = classPath.child("items")
        val builder = LimeAttributes.Builder().addAttribute(LimeAttributeType.CPP, LimeAttributeValueType.REF)
        if (cached) builder.addAttribute(LimeAttributeType.CACHED)
        return LimeProperty(
            path = propertyPath,
            attributes = builder.build(),
            getter = LimeFunction(path = propertyPath.child("get")),
            typeRef = LimeBasicTypeRef.INT,
        )
    }

    @Test
    fun rejectInputCapableClassWithInternalConstant() {
        val internalConstant =
            LimeConstant(
                path = classPath.child("internalConstant"),
                attributes = internalAttribute,
                typeRef = LimeBasicTypeRef.INT,
                value = LimeValue.ZERO,
            )
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, constants = listOf(internalConstant))
        val consumerPath = LimePath(emptyList(), listOf("SomeConsumer"))
        val consumerFunctionPath = consumerPath.child("consume")
        val consumerFunction =
            LimeFunction(
                path = consumerFunctionPath,
                parameters =
                    listOf(LimeParameter(path = consumerFunctionPath.child("value"), typeRef = LimeDirectTypeRef(markedClass))),
            )
        val consumerClass = LimeClass(path = consumerPath, functions = listOf(consumerFunction))

        val elements = mapOf(markedClass.path.toString() to markedClass, consumerClass.path.toString() to consumerClass)

        assertFalse(validator.validate(elements))
    }

    @Test
    fun rejectMarkedClassWithInheritance() {
        val parentInterface = LimeInterface(path = LimePath(emptyList(), listOf("ParentInterface")))
        val markedClass =
            LimeClass(
                path = classPath,
                attributes = kotlinInterfaceAttribute,
                parents = listOf(LimeDirectTypeRef(parentInterface)),
            )

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun rejectMarkedNestedClass() {
        val nestedClass = LimeClass(path = classPath.child("NestedClass"), attributes = kotlinInterfaceAttribute)
        val markedClass = LimeClass(path = classPath, attributes = kotlinInterfaceAttribute, classes = listOf(nestedClass))

        assertFalse(validator.validate(mapOf(markedClass.path.toString() to markedClass)))
    }

    @Test
    fun validateInterfaceWithInternalStruct() {
        // Given an interface with internal struct inside.
        val internalStruct =
            LimeStruct(
                path = interfacePath.child("SomeInternalStruct"),
                attributes = internalAttribute,
            )
        allElements[internalStruct.path.toString()] = internalStruct

        val someInterface = LimeInterface(path = interfacePath, structs = listOf(internalStruct))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithInternalClass() {
        // Given an interface with internal class inside.
        val internalClass =
            LimeClass(
                path = interfacePath.child("SomeInternalClass"),
                attributes = internalAttribute,
            )
        allElements[internalClass.path.toString()] = internalClass

        val someInterface = LimeInterface(path = interfacePath, classes = listOf(internalClass))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithInternalInterface() {
        // Given an interface with internal interface inside.
        val internalInterface =
            LimeInterface(
                path = interfacePath.child("SomeInternalInterface"),
                attributes = internalAttribute,
            )
        allElements[internalInterface.path.toString()] = internalInterface

        val someInterface = LimeInterface(path = interfacePath, interfaces = listOf(internalInterface))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithInternalLambda() {
        // Given an interface with internal lambda inside.
        val internalLambda =
            LimeLambda(
                path = interfacePath.child("SomeInternalLambda"),
                attributes = internalAttribute,
            )
        allElements[internalLambda.path.toString()] = internalLambda

        val someInterface = LimeInterface(path = interfacePath, lambdas = listOf(internalLambda))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithInternalEnum() {
        // Given an interface with internal lambda inside.
        val internalEnum =
            LimeEnumeration(
                path = interfacePath.child("SomeInternalEnum"),
                attributes = internalAttribute,
            )
        allElements[internalEnum.path.toString()] = internalEnum

        val someInterface = LimeInterface(path = interfacePath, enumerations = listOf(internalEnum))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithInternalException() {
        // Given an interface with internal exception inside.
        val internalException =
            LimeException(
                path = interfacePath.child("SomeInternalException"),
                attributes = internalAttribute,
                errorType = LimeBasicTypeRef.INT,
            )
        allElements[internalException.path.toString()] = internalException

        val someInterface = LimeInterface(path = interfacePath, exceptions = listOf(internalException))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithInternalTypeAlias() {
        // Given an interface with internal type alias to public class inside.
        val someClass = LimeClass(path = LimePath(emptyList(), listOf("SomeClass")))
        allElements[someClass.path.toString()] = someClass

        val internalTypeAlias =
            LimeTypeAlias(
                path = interfacePath.child("SomeTypeAlias"),
                typeRef = LimeDirectTypeRef(type = someClass),
                attributes = internalAttribute,
            )

        val someInterface = LimeInterface(path = interfacePath, typeAliases = listOf(internalTypeAlias))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithNonStaticInternalFunction() {
        // Given an interface with internal non-static function inside.
        val internalFunction =
            LimeFunction(
                path = interfacePath.child("someInternalFunction"),
                attributes = internalAttribute,
                isStatic = false,
            )
        allElements[internalFunction.path.toString()] = internalFunction

        val someInterface = LimeInterface(path = interfacePath, functions = listOf(internalFunction))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithStaticInternalFunction() {
        // Given an interface with internal static function inside.
        val internalFunction =
            LimeFunction(
                path = interfacePath.child("someInternalStaticFunction"),
                attributes = internalAttribute,
                isStatic = true,
            )
        allElements[internalFunction.path.toString()] = internalFunction

        val someInterface = LimeInterface(path = interfacePath, functions = listOf(internalFunction))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported --> we cannot use JvmStatic for such elements.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithNonStaticInternalProperty() {
        // Given an interface with internal non-static property inside.
        val internalPropertyPath = interfacePath.child("someInternalProperty")
        val internalProperty =
            LimeProperty(
                path = internalPropertyPath,
                attributes = internalAttribute,
                getter = LimeFunction(path = internalPropertyPath.child("get")),
                typeRef = LimeBasicTypeRef.INT,
                isStatic = false,
            )
        allElements[internalProperty.path.toString()] = internalProperty

        val someInterface = LimeInterface(path = interfacePath, properties = listOf(internalProperty))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithStaticInternalProperty() {
        // Given an interface with internal static property inside.
        val internalPropertyPath = interfacePath.child("someStaticInternalProperty")
        val internalProperty =
            LimeProperty(
                path = internalPropertyPath,
                attributes = internalAttribute,
                getter = LimeFunction(path = internalPropertyPath.child("get")),
                typeRef = LimeBasicTypeRef.INT,
                isStatic = true,
            )
        allElements[internalProperty.path.toString()] = internalProperty

        val someInterface = LimeInterface(path = interfacePath, properties = listOf(internalProperty))
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation failure is reported --> we cannot use JvmStatic for such elements.
        assertFalse(result)
    }

    @Test
    fun validateInterfaceWithoutInternalMembers() {
        // Given an interface with public elements inside.
        val someStruct = LimeStruct(path = interfacePath.child("SomeInternalStruct"))
        allElements[someStruct.path.toString()] = someStruct

        val someClass = LimeClass(path = LimePath(emptyList(), listOf("SomeClass")))
        allElements[someClass.path.toString()] = someClass

        val someFunction = LimeFunction(path = interfacePath.child("someInternalFunction"), isStatic = false)
        allElements[someFunction.path.toString()] = someFunction

        val someInterface =
            LimeInterface(
                path = interfacePath,
                structs = listOf(someStruct),
                classes = listOf(someClass),
                functions = listOf(someFunction),
            )
        allElements[someInterface.path.toString()] = someInterface

        // When validating it.
        val result = validator.validate(allElements)

        // Then validation success is reported.
        assertTrue(result)
    }
}
