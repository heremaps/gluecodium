/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppModelBuilder
import com.here.gluecodium.generator.java.JavaModelBuilder
import com.here.gluecodium.generator.java.JavaSignatureResolver
import com.here.gluecodium.model.common.Comments
import com.here.gluecodium.model.common.Include
import com.here.gluecodium.model.cpp.CppClass
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppEnum
import com.here.gluecodium.model.cpp.CppEnumItem
import com.here.gluecodium.model.cpp.CppField
import com.here.gluecodium.model.cpp.CppMethod
import com.here.gluecodium.model.cpp.CppParameter
import com.here.gluecodium.model.cpp.CppPrimitiveTypeRef
import com.here.gluecodium.model.cpp.CppStruct
import com.here.gluecodium.model.cpp.CppValue
import com.here.gluecodium.model.java.JavaClass
import com.here.gluecodium.model.java.JavaCustomTypeRef
import com.here.gluecodium.model.java.JavaEnum
import com.here.gluecodium.model.java.JavaEnumItem
import com.here.gluecodium.model.java.JavaExceptionTypeRef
import com.here.gluecodium.model.java.JavaField
import com.here.gluecodium.model.java.JavaImport
import com.here.gluecodium.model.java.JavaInterface
import com.here.gluecodium.model.java.JavaMethod
import com.here.gluecodium.model.java.JavaPackage
import com.here.gluecodium.model.java.JavaParameter
import com.here.gluecodium.model.java.JavaPrimitiveTypeRef
import com.here.gluecodium.model.java.JavaTopLevelElement
import com.here.gluecodium.model.java.JavaValue
import com.here.gluecodium.model.java.JavaVisibility
import com.here.gluecodium.model.jni.JniContainer
import com.here.gluecodium.model.jni.JniElement
import com.here.gluecodium.model.jni.JniEnum
import com.here.gluecodium.model.jni.JniEnumerator
import com.here.gluecodium.model.jni.JniField
import com.here.gluecodium.model.jni.JniMethod
import com.here.gluecodium.model.jni.JniParameter
import com.here.gluecodium.model.jni.JniStruct
import com.here.gluecodium.model.jni.JniType
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLazyTypeRef
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeThrownType
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.test.AssertHelpers.assertContains
import com.here.gluecodium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JniModelBuilderTest {
    @MockK private lateinit var javaBuilder: JavaModelBuilder
    @MockK private lateinit var javaSignatureResolver: JavaSignatureResolver
    @MockK private lateinit var cppBuilder: CppModelBuilder
    @MockK private lateinit var cppIncludeResolver: CppIncludeResolver

    private val javaMethodName = "fancyMEthoD_integer"
    private val mangledMethodName = "fancyMEthoD_1integer"
    private val javaMethod = JavaMethod(
        name = javaMethodName,
        returnType = JavaPrimitiveTypeRef.INT,
        parameters = listOf(JavaParameter("theParam", JavaPrimitiveTypeRef.INT))
    )
    private val cppMethod = CppMethod(
        name = "cPpWork3R_iNt",
        fullyQualifiedName = "cPpWork3R_iNt",
        returnType = CppPrimitiveTypeRef.INT8,
        parameters = listOf(CppParameter("", CppPrimitiveTypeRef.INT8))
    )
    private val javaClassName = "jAvaClazz"
    private val javaClass = JavaClass(javaClassName)
    private val cppClass = CppClass("cPpClass", "::cPpClass")
    private val javaEnum = JavaEnum("jAvaClazz")
    private val cppEnum = CppEnum("cPpClass", "::cPpClass", emptyList(), false, emptyList())
    private val javaCustomType = JavaCustomTypeRef("jAvaClazz")
    private val javaField = JavaField("theParam", javaCustomType, JavaValue(""))
    private val cppCustomType = CppComplexTypeRef("cPpClass")
    private val cppField = CppField("cPpClass", "neSTed::cPpClass", cppCustomType)
    private val jniParameter = JniParameter("theParam", JniType.VOID)
    private val javaGetter =
        JavaMethod("getFoo", Comments(), JavaVisibility.PUBLIC, JavaCustomTypeRef("FooType"))
    private val cppGetter =
        CppMethod("shootFoot", "shootFoot", Comments(), CppPrimitiveTypeRef.INT32)
    private val javaSetter = JavaMethod(
        name = "setFoo",
        visibility = JavaVisibility.PUBLIC,
        returnType = JavaPrimitiveTypeRef.VOID,
        parameters = listOf(JavaParameter("value", JavaPrimitiveTypeRef.INT))
    )
    private val cppSetter = CppMethod(
        name = "shootBothFeet",
        fullyQualifiedName = "shootBothFeet",
        parameters = listOf(CppParameter("value", CppPrimitiveTypeRef.INT8))
    )
    private val jniType = JniType(javaCustomType, cppCustomType)
    private val cppInclude = Include.createInternalInclude("Foo.h")
    private val cppStruct = CppStruct("cPpClass")
    private val transientModel = mutableListOf<JniContainer>()

    private val fooPath = LimePath(listOf("foo", "bar"), emptyList())
    private val limeMethod = LimeFunction(EMPTY_PATH)
    private val limeTypeCollection = LimeTypesCollection(EMPTY_PATH)
    private val limeInterface = LimeInterface(fooPath)
    private val limeTypeRef = LimeLazyTypeRef("", emptyMap())
    private val limeStruct = LimeStruct(EMPTY_PATH)
    private val limeEnum = LimeEnumeration(EMPTY_PATH)
    private val limeParameter = LimeParameter(EMPTY_PATH, typeRef = LimeBasicTypeRef.INT)
    private val limeSetter = LimeFunction(EMPTY_PATH, parameters = listOf(limeParameter))
    private val limeProperty = LimeProperty(
        EMPTY_PATH,
        typeRef = limeTypeRef,
        getter = LimeFunction(EMPTY_PATH),
        setter = limeSetter
    )

    private val contextStack = MockContextStack<JniElement>()

    private lateinit var modelBuilder: JniModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)

        modelBuilder = JniModelBuilder(
            contextStack = contextStack,
            javaBuilder = javaBuilder,
            javaSignatureResolver = javaSignatureResolver,
            cppBuilder = cppBuilder,
            cppIncludeResolver = cppIncludeResolver,
            internalNamespace = INTERNAL_NAMESPACE,
            buildTransientModel = { transientModel }
        )

        javaClass.javaPackage = JavaPackage(listOf("my", "java", "test"))

        every { cppIncludeResolver.resolveIncludes(any()) } returns listOf(cppInclude)
        every { javaBuilder.getFinalResult(JavaTopLevelElement::class.java) } returns javaClass
        every { javaBuilder.getFinalResult(JavaClass::class.java) } returns javaClass
        every { cppBuilder.getFinalResult(CppClass::class.java) } returns cppClass
        every { javaBuilder.getFinalResult(JavaMethod::class.java) } returns javaMethod
        every { cppBuilder.getFinalResult(CppMethod::class.java) } returns cppMethod
        every { cppBuilder.getFinalResult(CppStruct::class.java) } returns cppStruct
        every { javaBuilder.getFinalResult(JavaField::class.java) } returns javaField
        every { cppBuilder.getFinalResult(CppField::class.java) } returns cppField
        every { javaBuilder.getFinalResult(JavaEnum::class.java) } returns javaEnum
        every { cppBuilder.getFinalResult(CppEnum::class.java) } returns cppEnum
        every { javaBuilder.finalResults } returns listOf(javaGetter, javaSetter)
        every { cppBuilder.finalResults } returns listOf(cppGetter, cppSetter)
    }

    @Test
    fun finishBuildingTypeCollectionReadsStructs() {
        val limeElement = LimeTypesCollection(EMPTY_PATH)
        val jniStruct = JniStruct(javaClass.name, "cPpClass", javaClass.javaPackage)
        contextStack.injectResult(jniStruct)

        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(jniStruct.javaClass, jniContainer.structs.first().javaClass)
        assertEquals(emptyList<String>(), jniContainer.cppNameSpaces)
        assertEquals(INTERNAL_NAMESPACE, jniContainer.internalNamespace)
    }

    @Test
    fun finishBuildingTypeCollectionReadsTypeIncludes() {
        val limeElement = LimeTypesCollection(EMPTY_PATH, structs = listOf(limeStruct))

        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(1, jniContainer.includes.size)
        assertContains(cppInclude, jniContainer.includes)
    }

    @Test
    fun finishBuildingTypeCollectionReadsEnums() {
        val jniEnum = JniEnum("MyJavaEnumName", "MyCppEnumName", JavaPackage.DEFAULT)
        contextStack.injectResult(jniEnum)

        modelBuilder.finishBuilding(limeTypeCollection)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertContains(jniEnum, jniContainer.enums)
    }

    @Test
    fun finishBuildingClass() {
        val limeElement = LimeClass(EMPTY_PATH)

        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(JniContainer.ContainerType.CLASS, jniContainer.containerType)
    }

    @Test
    fun finishBuildingInterface() {
        modelBuilder.finishBuilding(limeInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(JniContainer.ContainerType.INTERFACE, jniContainer.containerType)
        assertEquals("cPpClass", jniContainer.cppName)
        assertEquals("jAvaClazz", jniContainer.javaNames.first())
        assertEquals(listOf("foo", "bar"), jniContainer.cppNameSpaces)
        assertEquals(listOf("my", "java", "test"), jniContainer.javaPackage.packageNames)
        assertEquals(INTERNAL_NAMESPACE, jniContainer.internalNamespace)
    }

    @Test
    fun finishBuildingInterfaceReadsJavaInterface() {
        val javaInterface = JavaInterface("javaFAce")
        javaInterface.javaPackage = JavaPackage(listOf("my", "java", "test"))
        every { javaBuilder.getFinalResult(JavaTopLevelElement::class.java) } returns javaInterface

        modelBuilder.finishBuilding(limeInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals("javaFAce", jniContainer.javaInterfaceNames.first())
    }

    @Test
    fun finishBuildingInterfaceReadsParentMethods() {
        val parentContainer = JniContainer()
        parentContainer.parentMethods.add(JniMethod())
        parentContainer.methods.add(JniMethod())
        transientModel += parentContainer
        val limeElement = LimeInterface(fooPath, parent = LimeBasicTypeRef.INT)

        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(2, jniContainer.parentMethods.size)
    }

    @Test
    fun finishBuildingInterfaceReadsInterfaceInclude() {
        modelBuilder.finishBuilding(limeInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(1, jniContainer.includes.size)
        assertContains(cppInclude, jniContainer.includes)
    }

    @Test
    fun finishBuildingInterfaceReadsTypeIncludes() {
        val limeElement = LimeInterface(
            LimePath(listOf("foo", "bar"), emptyList()),
            structs = listOf(limeStruct)
        )
        val cppStructInclude = Include.createInternalInclude("Foo")
        every { cppIncludeResolver.resolveIncludes(limeStruct) } returns listOf(cppStructInclude)

        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertEquals(2, jniContainer.includes.size.toLong())
        assertContains(cppStructInclude, jniContainer.includes)
    }

    @Test
    fun finishBuildingInterfaceReadsEnums() {
        val jniEnum = JniEnum("MyJavaEnumName", "MyCppEnumName", JavaPackage.DEFAULT)
        contextStack.injectResult(jniEnum)

        modelBuilder.finishBuilding(limeInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertContains(jniEnum, jniContainer.enums)
    }

    @Test
    fun finishBuildingInterfaceReadsPointerEquatable() {
        val limeElement = LimeClass(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.POINTER_EQUATABLE)
                .build()
        )
        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertTrue(jniContainer.isPointerEquatable)
    }

    @Test
    fun finishBuildingInterfaceReadsEquatable() {
        val limeElement = LimeClass(
            fooPath,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EQUATABLE)
                .build()
        )
        modelBuilder.finishBuilding(limeElement)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertTrue(jniContainer.isEquatable)
    }

    @Test
    fun finishBuildingMethodReadsJavaCppMethods() {
        modelBuilder.finishBuilding(limeMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertEquals(mangledMethodName, jniMethod.javaMethodName)
        assertEquals(cppMethod.name, jniMethod.cppMethodName)
        assertNotNull(jniMethod.returnType)
        assertEquals(javaMethod.returnType.name, jniMethod.returnType.javaName)
        assertEquals(cppMethod.returnType.name, jniMethod.returnType.cppName)
    }

    @Test
    fun finishBuildingMethodReadsJniParameters() {
        contextStack.injectResult(jniParameter)

        modelBuilder.finishBuilding(limeMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertEquals(jniParameter, jniMethod.parameters.first())
        assertFalse(jniMethod.isStatic)
    }

    @Test
    fun finishBuildingMethodReadsStaticMethods() {
        contextStack.injectResult(jniParameter)
        val cppStaticMethod = CppMethod(
            name = "cPpWork3R_iNt",
            fullyQualifiedName = "cPpWork3R_iNt",
            returnType = CppPrimitiveTypeRef.INT8,
            parameters = listOf(CppParameter("", CppPrimitiveTypeRef.INT8)),
            specifiers = setOf(CppMethod.Specifier.STATIC)
        )
        every { cppBuilder.getFinalResult(CppMethod::class.java) } returns cppStaticMethod

        modelBuilder.finishBuilding(limeMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertTrue(jniMethod.isStatic)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        contextStack.injectResult(jniParameter)
        val javaConstructor =
            JavaMethod("", isConstructor = true, returnType = JavaPrimitiveTypeRef.LONG)
        every { javaBuilder.getFinalResult(JavaMethod::class.java) } returns javaConstructor

        modelBuilder.finishBuilding(limeMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertTrue(jniMethod.returnsOpaqueHandle)
    }

    @Test
    fun finishBuildingMethodReadsConstMethods() {
        contextStack.injectResult(jniParameter)
        val cppConstMethod = CppMethod(
            name = "cPpWork3R_iNt",
            fullyQualifiedName = "cPpWork3R_iNt",
            returnType = CppPrimitiveTypeRef.INT8,
            parameters = listOf(CppParameter("", CppPrimitiveTypeRef.INT8)),
            qualifiers = setOf(CppMethod.Qualifier.CONST)
        )
        every { cppBuilder.getFinalResult(CppMethod::class.java) } returns cppConstMethod

        modelBuilder.finishBuilding(limeMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertTrue(jniMethod.isConst)
    }

    @Test
    fun finishBuildingMethodReadsDisambiguationSuffix() {
        every { javaSignatureResolver.isOverloaded(limeMethod) } returns true

        modelBuilder.finishBuilding(limeMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertTrue(jniMethod.isOverloaded)
    }

    @Test
    fun finishBuildingMethodReadsException() {
        val limeException = LimeException(EMPTY_PATH, errorType = LimeBasicTypeRef.INT)
        val limeElement =
            LimeFunction(EMPTY_PATH, thrownType = LimeThrownType(LimeDirectTypeRef(limeException)))
        val javaExceptionType = JavaExceptionTypeRef(
            "",
            JavaImport("", JavaPackage.DEFAULT),
            listOf("FooException"),
            javaCustomType
        )
        val javaThrowingMethod =
            JavaMethod(name = "fancyMEthoD_integer", exception = javaExceptionType)
        val cppMethodWithError = CppMethod(name = "cPpWork3R_iNt", errorType = cppCustomType)
        every { javaBuilder.getFinalResult(JavaMethod::class.java) } returns javaThrowingMethod
        every { cppBuilder.getFinalResult(CppMethod::class.java) } returns cppMethodWithError

        modelBuilder.finishBuilding(limeElement)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertEquals("com/example/FooException", jniMethod.exception?.javaClassName)
        assertEquals(javaCustomType.name, jniMethod.exception?.errorType?.javaName)
        assertEquals(cppCustomType.name, jniMethod.exception?.errorType?.cppName)
    }

    @Test
    fun finishBuildingParameterReadsJavaCppParameters() {
        val javaParameter = JavaParameter("relative", javaCustomType)
        val cppParameter = CppParameter("absolute", CppComplexTypeRef("foobar"))
        every { javaBuilder.getFinalResult(JavaParameter::class.java) } returns javaParameter
        every { cppBuilder.getFinalResult(CppParameter::class.java) } returns cppParameter

        modelBuilder.finishBuilding(limeParameter)

        val resultParameter = modelBuilder.getFinalResult(JniParameter::class.java)
        assertEquals(javaParameter.name, resultParameter.name)
        assertEquals(javaParameter.type.name, resultParameter.type.javaName)
        assertEquals(cppParameter.type.name, resultParameter.type.cppName)
    }

    @Test
    fun finishBuildingStructReadsJavaCppClasses() {
        modelBuilder.finishBuilding(limeStruct)

        val jniStruct = modelBuilder.getFinalResult(JniStruct::class.java)
        assertEquals(javaClass.name, jniStruct.javaName)
        assertEquals(javaClass.javaPackage, jniStruct.javaPackage)
        assertEquals(cppStruct.fullyQualifiedName, jniStruct.cppFullyQualifiedName)
        assertEquals(cppStruct.hasImmutableFields, jniStruct.hasImmutableFields)
    }

    @Test
    fun finishBuildingStructReadsFields() {
        val jniField = JniField(jniType, "javaName", null, cppField)
        contextStack.injectResult(jniField)

        modelBuilder.finishBuilding(limeStruct)

        val jniStruct = modelBuilder.getFinalResult(JniStruct::class.java)
        assertContains(jniField, jniStruct.fields)
    }

    @Test
    fun finishBuildingStructReadsMethods() {
        val jniMethod = JniMethod("foo", "bar")
        contextStack.injectResult(jniMethod)

        modelBuilder.finishBuilding(limeStruct)

        val jniStruct = modelBuilder.getFinalResult(JniStruct::class.java)
        assertContains(jniMethod, jniStruct.methods)
    }

    @Test
    fun finishBuildingFieldReadsJavaCppFields() {
        val limeElement = LimeField(EMPTY_PATH, typeRef = limeTypeRef)
        contextStack.injectResult(jniType)

        modelBuilder.finishBuilding(limeElement)

        val jniField = modelBuilder.getFinalResult(JniField::class.java)
        assertNotNull(jniField)
        assertEquals(javaField.name, jniField.javaName)
        assertEquals(javaClassName, jniField.javaCustomType)
        assertEquals(cppField, jniField.cppField)
    }

    @Test
    fun finishBuildingFieldReadsExternalAccessors() {
        val limeElement = LimeField(EMPTY_PATH, typeRef = limeTypeRef)
        val cppFieldWithAccessors = CppField(
            name = "cPpClass",
            fullyQualifiedName = "neSTed::cPpClass",
            type = cppCustomType,
            getterName = "get_foo",
            setterName = "setFoo"
        )
        every { cppBuilder.getFinalResult(CppField::class.java) } returns cppFieldWithAccessors
        contextStack.injectResult(jniType)

        modelBuilder.finishBuilding(limeElement)

        val jniField = modelBuilder.getFinalResult(JniField::class.java)
        assertNotNull(jniField)
        assertEquals("get_foo", jniField.cppGetterName)
        assertEquals("setFoo", jniField.cppSetterName)
    }

    @Test
    fun finishBuildingEnumerationsReadsNames() {
        modelBuilder.finishBuilding(limeEnum)

        val jniEnum = modelBuilder.getFinalResult(JniEnum::class.java)
        assertEquals(javaEnum.name, jniEnum.javaName)
        assertEquals(cppEnum.fullyQualifiedName, jniEnum.cppFullyQualifiedName)
    }

    @Test
    fun finishBuildingEnumerationsReadsEnumerators() {
        val jniEnumerator = JniEnumerator("oneJ", "oneC")
        contextStack.injectResult(jniEnumerator)

        modelBuilder.finishBuilding(limeEnum)

        val jniEnum = modelBuilder.getFinalResult(JniEnum::class.java)
        assertContains(jniEnumerator, jniEnum.enumerators)
    }

    @Test
    fun finishBuildingEnumerator() {
        val javaEnumItem = JavaEnumItem("javaEnumerator")
        val cppEnumItem = CppEnumItem("cppEnumerator", "nested::cppEnumerator", null, CppValue("0"))
        every { javaBuilder.getFinalResult(JavaEnumItem::class.java) } returns javaEnumItem
        every { cppBuilder.getFinalResult(CppEnumItem::class.java) } returns cppEnumItem
        val limeElement = LimeEnumerator(EMPTY_PATH)

        modelBuilder.finishBuilding(limeElement)

        val jniEnumItem = modelBuilder.getFinalResult(JniEnumerator::class.java)
        assertEquals(jniEnumItem.cppName, "cppEnumerator")
        assertEquals(jniEnumItem.javaName, "javaEnumerator")
    }

    @Test
    fun finishBuildingAttributeCreatesGetter() {
        modelBuilder.finishBuilding(limeProperty)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertEquals(javaGetter.name, jniMethod.javaMethodName)
        assertEquals(cppGetter.name, jniMethod.cppMethodName)
        assertEquals(javaGetter.returnType.name, jniMethod.returnType.javaName)
        assertEquals(cppGetter.returnType.name, jniMethod.returnType.cppName)
        assertTrue(jniMethod.isConst)
    }

    @Test
    fun finishBuildingAttributeCreatesSetter() {
        modelBuilder.finishBuilding(limeProperty)

        val methods = modelBuilder.finalResults.filterIsInstance<JniMethod>()
        assertEquals(2, methods.size)
        assertEquals(javaSetter.name, methods.last().javaMethodName)
        assertEquals(cppSetter.name, methods.last().cppMethodName)
        assertEquals("void", methods.last().returnType.cppName)
        assertEquals("void", methods.last().returnType.javaName)
    }

    @Test
    fun finishBuildingAttributeReadsParametersIntoSetter() {
        modelBuilder.finishBuilding(limeProperty)

        val methods = modelBuilder.finalResults.filterIsInstance<JniMethod>()
        assertEquals(2, methods.size)
        val setterParameter = methods.last().parameters.first()
        assertEquals(javaSetter.parameters.first().name, setterParameter.name)
        assertEquals(javaSetter.parameters.first().type.name, setterParameter.type.javaName)
        assertEquals(cppSetter.parameters.first().type.name, setterParameter.type.cppName)
    }

    @Test
    fun finishBuildingAttributeReadonly() {
        val limeElement =
            LimeProperty(EMPTY_PATH, typeRef = limeTypeRef, getter = LimeFunction(EMPTY_PATH))

        modelBuilder.finishBuilding(limeElement)

        val methods = modelBuilder.finalResults.filterIsInstance<JniMethod>()
        assertEquals(1, methods.size)
        assertEquals(javaGetter.name, methods.first().javaMethodName)
        assertEquals(cppGetter.name, methods.first().cppMethodName)
        assertEquals(javaGetter.returnType.name, methods.first().returnType.javaName)
        assertEquals(cppGetter.returnType.name, methods.first().returnType.cppName)
    }

    @Test
    fun finishBuildingAttributeStatic() {
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = limeTypeRef,
            getter = LimeFunction(EMPTY_PATH),
            setter = limeSetter,
            isStatic = true
        )

        modelBuilder.finishBuilding(limeElement)

        val methods = modelBuilder.finalResults.filterIsInstance<JniMethod>()
        assertEquals(2, methods.size)
        assertTrue(methods.first().isStatic)
        assertTrue(methods.last().isStatic)
    }

    companion object {
        private val INTERNAL_NAMESPACE = listOf("very", "internal")
    }
}
