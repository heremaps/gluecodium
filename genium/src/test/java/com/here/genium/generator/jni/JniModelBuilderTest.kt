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

package com.here.genium.generator.jni

import com.here.genium.common.CollectionsHelper
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.java.JavaModelBuilder
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppClass
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppEnum
import com.here.genium.model.cpp.CppEnumItem
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaCustomType
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaEnumItem
import com.here.genium.model.java.JavaField
import com.here.genium.model.java.JavaInterface
import com.here.genium.model.java.JavaMethod
import com.here.genium.model.java.JavaPackage
import com.here.genium.model.java.JavaParameter
import com.here.genium.model.java.JavaPrimitiveType
import com.here.genium.model.java.JavaTopLevelElement
import com.here.genium.model.java.JavaValue
import com.here.genium.model.java.JavaVisibility
import com.here.genium.model.jni.JniContainer
import com.here.genium.model.jni.JniContainer.ContainerType
import com.here.genium.model.jni.JniElement
import com.here.genium.model.jni.JniEnum
import com.here.genium.model.jni.JniEnumerator
import com.here.genium.model.jni.JniField
import com.here.genium.model.jni.JniMethod
import com.here.genium.model.jni.JniParameter
import com.here.genium.model.jni.JniStruct
import com.here.genium.model.jni.JniType
import com.here.genium.test.ArrayEList
import com.here.genium.test.MockContextStack
import org.franca.core.franca.FArgument
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModel
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.MockitoAnnotations
import java.util.Arrays

@RunWith(JUnit4::class)
class JniModelBuilderTest {
    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel
    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaMethod: FMethod
    @Mock
    private lateinit var francaArgument: FArgument
    @Mock
    private lateinit var francaStructType: FStructType
    @Mock
    private lateinit var francaEnumType: FEnumerationType
    @Mock
    private lateinit var francaEnumerator: FEnumerator
    @Mock
    private lateinit var francaField: FField
    @Mock
    private lateinit var fModel: FModel
    @Mock
    private lateinit var francaAttribute: FAttribute

    @Mock
    private lateinit var javaBuilder: JavaModelBuilder
    @Mock
    private lateinit var cppBuilder: CppModelBuilder
    @Mock
    private lateinit var cppIncludeResolver: CppIncludeResolver

    private val javaClass = JavaClass(JAVA_CLASS_NAME)
    private val cppClass = CppClass(
        CPP_CLASS_NAME,
        "::$CPP_CLASS_NAME", null,
        false,
        emptyList(),
        emptyList(),
        emptyList()
    )
    private val javaEnum = JavaEnum(JAVA_CLASS_NAME)
    private val cppEnum = CppEnum(CPP_CLASS_NAME, "::$CPP_CLASS_NAME", false, emptyList())
    private val javaCustomType = JavaCustomType(JAVA_CLASS_NAME)
    private val javaField =
        JavaField(BASE_NAME_PARAMETER, javaCustomType, JavaValue(javaCustomType))
    private val cppCustomType = CppComplexTypeRef(CPP_CLASS_NAME)
    private val cppField = CppField(CPP_CLASS_NAME, cppCustomType)

    private val contextStack = MockContextStack<JniElement>()

    private val jniParameter = JniParameter(BASE_NAME_PARAMETER, null)
    private val javaGetter =
        JavaMethod("getFoo", null, JavaVisibility.PUBLIC, JavaCustomType("FooType"))
    private val cppGetter = CppMethod("shootFoot", "shootFoot", "", CppPrimitiveTypeRef.INT32)
    private val javaSetter = JavaMethod(
        "setFoo", null,
        JavaVisibility.PUBLIC,
        JavaPrimitiveType.VOID, null, null,
        listOf(JavaParameter("value", JavaPrimitiveType.INT))
    )
    private val cppSetter = CppMethod(
        "shootBothFeet",
        "shootBothFeet",
        "",
        CppPrimitiveTypeRef.VOID,
        "", null,
        false,
        listOf(CppParameter("value", CppPrimitiveTypeRef.INT8))
    )
    private val jniType = JniType(javaCustomType, cppCustomType)
    private val cppInclude = Include.createInternalInclude("Foo.h")
    private val cppStruct = CppStruct(CPP_CLASS_NAME)

    private lateinit var modelBuilder: JniModelBuilder

    private val arguments = ArrayEList<FArgument>()
    private val types = ArrayEList<FType>()

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)

        modelBuilder = JniModelBuilder(
            contextStack,
            deploymentModel,
            javaBuilder,
            cppBuilder,
            cppIncludeResolver,
            INTERNAL_NAMESPACE
        )

        javaClass.javaPackage = JavaPackage(JAVA_PACKAGES)

        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaClass)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppClass)
        `when`(cppIncludeResolver.resolveInclude(any())).thenReturn(cppInclude)

        `when`(francaInterface.eContainer()).thenReturn(fModel)
        `when`(francaInterface.types).thenReturn(types)
        `when`(francaTypeCollection.eContainer()).thenReturn(fModel)
        `when`(francaTypeCollection.types).thenReturn(types)
        `when`(fModel.name).thenReturn(CPP_NAMESPACE_MEMBERS.joinToString("."))
        `when`(francaMethod.outArgs).thenReturn(arguments)
    }

    private fun createJniMethod(jniContainer: JniContainer?): JniMethod {
        return JniMethod(jniContainer, JAVA_VOID_METHOD_NAME, CPP_VOID_METHOD_NAME)
    }

    @Test
    fun finishBuildingFrancaMethodReadsJavaCppMethods() {
        val javaMethod = createJavaMethod()
        val cppMethod = createCppMethod()
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaMethod)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppMethod)

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertEquals(javaMethod.name, jniMethod.javaMethodName)
        assertEquals(cppMethod.name, jniMethod.cppMethodName)
        assertNotNull(jniMethod.returnType)
        assertEquals(javaMethod.returnType.name, jniMethod.returnType.javaName)
        assertEquals(cppMethod.returnType.name, jniMethod.returnType.cppName)
    }

    @Test
    fun finishBuildingFrancaMethodReadsJniParameters() {
        contextStack.injectResult(jniParameter)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod())
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod())

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertEquals(1, jniMethod.parameters.size.toLong())
        assertEquals(jniParameter, jniMethod.parameters[0])
        assertFalse(jniMethod.isStatic)
    }

    @Test
    fun finishBuildingFrancaMethodReadsStaticMethods() {
        contextStack.injectResult(jniParameter)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod())
        val cppMethod = CppMethod(
            name = CPP_INT_METHOD_NAME,
            fullyQualifiedName = CPP_INT_METHOD_NAME,
            returnType = CppPrimitiveTypeRef.INT8,
            parameters = listOf(CppParameter("", CppPrimitiveTypeRef.INT8)),
            specifiers = setOf(CppMethod.Specifier.STATIC)
        )
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppMethod)

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertTrue(jniMethod.isStatic)
    }

    @Test
    fun finishBuildingFrancaMethodReadsConstMethods() {
        contextStack.injectResult(jniParameter)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod())
        val cppMethod = CppMethod(
            name = CPP_INT_METHOD_NAME,
            fullyQualifiedName = CPP_INT_METHOD_NAME,
            returnType = CppPrimitiveTypeRef.INT8,
            parameters = listOf(CppParameter("", CppPrimitiveTypeRef.INT8)),
            qualifiers = setOf(CppMethod.Qualifier.CONST)
        )
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppMethod)

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertTrue(jniMethod.isConst)
    }

    @Test
    fun finishBuildingFrancaMethodReadsSelector() {
        `when`(francaMethod.selector).thenReturn("Foo")
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod())
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod())

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertTrue(jniMethod.isOverloaded)

        verify(francaMethod).selector
    }

    @Test
    fun finishBuildingFrancaMethodReadsExceptionName() {
        val javaMethod = JavaMethod(
            JAVA_INT_METHOD_NAME, null,
            JavaVisibility.PUBLIC,
            JavaPrimitiveType.INT, null,
            JavaCustomType("FooException", JavaPackage.DEFAULT),
            listOf(JavaParameter(BASE_NAME_PARAMETER, JavaPrimitiveType.INT))
        )
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaMethod)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod())

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertNotNull(jniMethod.exception)
        assertEquals("com/example/FooException", jniMethod.exception?.javaClassName)
    }

    @Test
    fun finishBuildingFrancaMethodReadsExceptionEnum() {
        val javaMethod = JavaMethod(
            JAVA_INT_METHOD_NAME, null,
            JavaVisibility.PUBLIC,
            JavaPrimitiveType.INT, null,
            JavaCustomType("FooException", JavaPackage.DEFAULT),
            listOf(JavaParameter(BASE_NAME_PARAMETER, JavaPrimitiveType.INT))
        )
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaMethod)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod())
        contextStack.injectResult(jniType)

        modelBuilder.finishBuilding(francaMethod)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertNotNull(jniMethod.exception)
        assertEquals(jniType, jniMethod.exception?.jniEnum)
    }

    @Test
    fun finishBuildingInstantiableFrancaInterface() {
//        // arrange
//        cppClass.methods.add(CppMethod("nonStaticMethod"))

        // act
        modelBuilder.finishBuilding(francaInterface)

        // assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(ContainerType.CLASS, jniContainer.containerType)
        assertEquals(INTERNAL_NAMESPACE, jniContainer.internalNamespace)
    }

    @Test
    fun finishBuildingInstantiableFrancaInterfaceReadsJavaCppClasses() {
        // act
        modelBuilder.finishBuilding(francaInterface)

        // assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(CPP_CLASS_NAME, jniContainer.cppName)
        assertEquals(JAVA_CLASS_NAME, jniContainer.javaName)
        assertEquals(CPP_NAMESPACE_MEMBERS, jniContainer.cppNameSpaces)
        assertEquals(JAVA_PACKAGES, jniContainer.javaPackages)
        assertEquals(ContainerType.CLASS, jniContainer.containerType)
    }

    @Test
    fun finishBuildingInstantiableFrancaInterfaceReadsJavaInterface() {
        val javaInterface = JavaInterface(JAVA_INTERFACE_NAME)
        javaInterface.javaPackage = JavaPackage(JAVA_PACKAGES)
        `when`(javaBuilder.getFinalResult(JavaTopLevelElement::class.java)).thenReturn(
            javaInterface
        )
        `when`(javaBuilder.getFinalResult(JavaClass::class.java)).thenReturn(javaClass)

        modelBuilder.finishBuilding(francaInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(ContainerType.CLASS, jniContainer.containerType)
        assertEquals(JAVA_CLASS_NAME, jniContainer.javaName)
        assertEquals(JAVA_INTERFACE_NAME, jniContainer.javaInterfaceName)
        assertEquals(JAVA_PACKAGES, jniContainer.javaPackages)
    }

    @Test
    fun finishBuildingInstantiableFrancaInterfaceReadsMethods() {
        contextStack.injectResult(createJniMethod(null))

        // act
        modelBuilder.finishBuilding(francaInterface)

        // assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertFalse(jniContainer.methods.isEmpty())
        assertEquals(ContainerType.CLASS, jniContainer.containerType)
        assertEquals(createJniMethod(jniContainer), jniContainer.methods[0])
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsIsInterface() {
        // arrange
        `when`(deploymentModel.isInterface(francaInterface)).thenReturn(true)

        // act
        modelBuilder.finishBuilding(francaInterface)

        // assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(ContainerType.INTERFACE, jniContainer.containerType)
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsJavaCppClasses() {
        // arrange
        `when`(deploymentModel.isInterface(francaInterface)).thenReturn(true)

        // act
        modelBuilder.finishBuilding(francaInterface)

        // assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(ContainerType.INTERFACE, jniContainer.containerType)
        assertEquals(CPP_CLASS_NAME, jniContainer.cppName)
        assertEquals(JAVA_CLASS_NAME, jniContainer.javaName)
        assertEquals(CPP_NAMESPACE_MEMBERS, jniContainer.cppNameSpaces)
        assertEquals(JAVA_PACKAGES, jniContainer.javaPackages)
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsJavaInterface() {
        `when`(deploymentModel.isInterface(francaInterface)).thenReturn(true)
        val javaInterface = JavaInterface(JAVA_INTERFACE_NAME)
        javaInterface.javaPackage = JavaPackage(JAVA_PACKAGES)
        `when`(javaBuilder.getFinalResult(JavaTopLevelElement::class.java)).thenReturn(
            javaInterface
        )
        `when`(javaBuilder.getFinalResult(JavaClass::class.java)).thenReturn(javaClass)

        modelBuilder.finishBuilding(francaInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(ContainerType.INTERFACE, jniContainer.containerType)
        assertEquals(JAVA_CLASS_NAME, jniContainer.javaName)
        assertEquals(JAVA_INTERFACE_NAME, jniContainer.javaInterfaceName)
        assertEquals(JAVA_PACKAGES, jniContainer.javaPackages)
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsParentMethods() {
        // Arrange
        val parentContainer = JniContainer()
        parentContainer.parentMethods.add(createJniMethod(null))
        parentContainer.methods.add(createJniMethod(null))

        contextStack.injectResult(parentContainer)

        // Act
        modelBuilder.finishBuilding(francaInterface)

        // Assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(2, jniContainer.parentMethods.size.toLong())
        assertEquals(jniContainer, jniContainer.parentMethods[0].owningContainer)
        assertEquals(jniContainer, jniContainer.parentMethods[1].owningContainer)
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsInterfaceInclude() {
        modelBuilder.finishBuilding(francaInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(1, jniContainer.includes.size.toLong())
        verify<CppIncludeResolver>(cppIncludeResolver).resolveInclude(francaInterface)
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsTypeIncludes() {
        types.add(francaStructType)
        `when`(cppIncludeResolver.resolveInclude(any(FType::class.java)))
            .thenReturn(Include.createInternalInclude("Bar.h"))

        modelBuilder.finishBuilding(francaInterface)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(2, jniContainer.includes.size.toLong())
        verify(cppIncludeResolver).resolveInclude(francaStructType)
    }

    @Test
    fun finishBuildingInputArgumentReadsJavaCppParameters() {
        val javaParameter = JavaParameter("relative", javaCustomType)
        val cppParameter = CppParameter("absolute", CppComplexTypeRef(CPP_CLASS_NAME))
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaParameter)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppParameter)
        `when`(francaArgument.type).thenReturn(mock(FTypeRef::class.java))

        modelBuilder.finishBuildingInputArgument(francaArgument)

        val resultParameter = modelBuilder.getFinalResult(JniParameter::class.java)
        assertNotNull(resultParameter)
        assertEquals(javaParameter.name, resultParameter.name)
        assertEquals(javaParameter.type.name, resultParameter.type.javaName)
        assertEquals(cppParameter.type.name, resultParameter.type.cppName)
    }

    @Test
    fun finishBuildingFrancaStructReadsJavaCppClasses() {
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppStruct)

        modelBuilder.finishBuilding(francaStructType)

        val jniStruct = modelBuilder.getFinalResult(JniStruct::class.java)
        assertNotNull(jniStruct)
        assertEquals(javaClass, jniStruct.javaClass)
        assertEquals(cppStruct, jniStruct.cppStruct)
        assertEquals(javaClass.javaPackage, jniStruct.javaPackage)
    }

    @Test
    fun finishBuildingFrancaStructReadsFields() {
        val jniField = JniField(javaField, cppField)
        contextStack.injectResult(jniField)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaClass)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(null)

        modelBuilder.finishBuilding(francaStructType)

        val jniStruct = modelBuilder.getFinalResult(JniStruct::class.java)
        assertNotNull(jniStruct)
        assertFalse(jniStruct.fields.isEmpty())
        assertEquals(jniField, jniStruct.fields[0])
    }

    @Test
    fun finishBuildingFrancaFieldReadsJavaCppFields() {
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaField)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppField)

        modelBuilder.finishBuilding(francaField)

        val jniField = modelBuilder.getFinalResult(JniField::class.java)
        assertNotNull(jniField)
        assertEquals(javaField, jniField.javaField)
        assertEquals(cppField, jniField.cppField)
    }

    @Test
    fun finishBuildingFrancaFieldReadsExternalAccessors() {
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaField)
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppField)
        `when`(deploymentModel.getExternalGetter(any())).thenReturn("get_foo")
        `when`(deploymentModel.getExternalSetter(any())).thenReturn("setFoo")

        modelBuilder.finishBuilding(francaField)

        val jniField = modelBuilder.getFinalResult(JniField::class.java)
        assertNotNull(jniField)
        assertEquals("get_foo", jniField.cppGetterName)
        assertEquals("setFoo", jniField.cppSetterName)
    }

    @Test
    fun finishBuildingFrancaTypeCollectionReadsStructs() {
        `when`(francaTypeCollection.name).thenReturn(TYPE_COLLECTION_NAME)
        val jniStruct = JniStruct(javaClass, cppStruct, null)
        contextStack.injectResult(jniStruct)

        modelBuilder.finishBuilding(francaTypeCollection)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertFalse(jniContainer.structs.isEmpty())
        assertEquals(jniStruct.javaClass, jniContainer.structs[0].javaClass)
        val expectedNamespace = "my::cpp::stuffs::namespace"
        assertEquals(expectedNamespace, jniContainer.cppNameSpaces.joinToString("::"))
        assertNull(jniContainer.javaName)
        assertNull(jniContainer.cppName)
        assertEquals(INTERNAL_NAMESPACE, jniContainer.internalNamespace)
    }

    @Test
    fun finishBuildingFrancaTypeCollectionWithNoStruct() {
        `when`(francaTypeCollection.name).thenReturn(TYPE_COLLECTION_NAME)

        modelBuilder.finishBuilding(francaTypeCollection)
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)

        assertNotNull(jniContainer)
        assertTrue(jniContainer.structs.isEmpty())
        assertTrue(jniContainer.javaPackages.isEmpty())
        assertEquals("my.cpp.stuffs.namespace", jniContainer.cppNameSpaces.joinToString("."))
        assertNull(jniContainer.javaName)
        assertNull(jniContainer.cppName)
    }

    @Test
    fun finishBuildingFrancaTypeCollectionReadsTypeIncludes() {
        types.add(francaStructType)
        `when`(cppIncludeResolver.resolveInclude(any(FType::class.java)))
            .thenReturn(Include.createInternalInclude("Bar.h"))

        modelBuilder.finishBuilding(francaTypeCollection)

        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertEquals(1, jniContainer.includes.size.toLong())
        verify(cppIncludeResolver).resolveInclude(francaStructType)
    }

    @Test
    fun finishBuildingFrancaAttributeCreatesGetter() {
        `when`(javaBuilder.finalResults).thenReturn(
            Arrays.asList<JavaElement>(
                javaGetter,
                javaSetter
            )
        )
        `when`(cppBuilder.finalResults).thenReturn(
            Arrays.asList<CppElement>(
                cppGetter,
                cppSetter
            )
        )

        modelBuilder.finishBuilding(francaAttribute)

        val jniMethod = modelBuilder.getFinalResult(JniMethod::class.java)
        assertNotNull(jniMethod)
        assertEquals(javaGetter.name, jniMethod.javaMethodName)
        assertEquals(cppGetter.name, jniMethod.cppMethodName)
        assertNotNull(jniMethod.returnType)
        assertEquals(javaGetter.returnType.name, jniMethod.returnType.javaName)
        assertEquals(cppGetter.returnType.name, jniMethod.returnType.cppName)
        assertTrue(jniMethod.isConst)
    }

    @Test
    fun finishBuildingFrancaAttributeCreatesSetter() {
        `when`(javaBuilder.finalResults).thenReturn(
            Arrays.asList<JavaElement>(
                javaGetter,
                javaSetter
            )
        )
        `when`(cppBuilder.finalResults).thenReturn(
            Arrays.asList<CppElement>(
                cppGetter,
                cppSetter
            )
        )

        modelBuilder.finishBuilding(francaAttribute)

        val methods =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, JniMethod::class.java)
        assertEquals("Both a getter and a setter should be created", 2, methods.size.toLong())

        val (_, javaMethodName, cppMethodName, returnType) = methods[1]
        assertEquals(javaSetter.name, javaMethodName)
        assertEquals(cppSetter.name, cppMethodName)
        assertEquals("void", returnType.cppName)
        assertEquals("void", returnType.javaName)
    }

    @Test
    fun finishBuildingFrancaAttributeReadsParametersIntoSetter() {
        // Arrange
        `when`(javaBuilder.finalResults).thenReturn(
            Arrays.asList<JavaElement>(
                javaGetter,
                javaSetter
            )
        )
        `when`(cppBuilder.finalResults).thenReturn(
            Arrays.asList<CppElement>(
                cppGetter,
                cppSetter
            )
        )

        // Act
        modelBuilder.finishBuilding(francaAttribute)

        // Assert
        val methods =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, JniMethod::class.java)
        assertEquals("Both a getter and a setter should be created", 2, methods.size.toLong())
        val (_, _, _, _, _, _, _, _, _, parameters) = methods[1]
        assertEquals(1, parameters.size.toLong())
        val setterParameter = parameters[0]
        assertEquals(javaSetter.parameters[0].name, setterParameter.name)
        assertEquals(javaSetter.parameters[0].type.name, setterParameter.type.javaName)
        assertEquals(cppSetter.parameters[0].type.name, setterParameter.type.cppName)
    }

    @Test
    fun finishBuildingFrancaAttributeReadonly() {
        // Arrange
        `when`(francaAttribute.isReadonly).thenReturn(true)
        `when`(javaBuilder.finalResults).thenReturn(listOf<JavaElement>(javaGetter))
        `when`(cppBuilder.finalResults).thenReturn(listOf<CppElement>(cppGetter))

        // Act
        modelBuilder.finishBuilding(francaAttribute)

        // Assert
        val methods =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, JniMethod::class.java)
        assertEquals("Only a getter should be created", 1, methods.size.toLong())
        val (_, javaMethodName, cppMethodName, returnType) = methods[0]
        assertEquals(javaGetter.name, javaMethodName)
        assertEquals(cppGetter.name, cppMethodName)
        assertNotNull(returnType)
        assertEquals(javaGetter.returnType.name, returnType.javaName)
        assertEquals(cppGetter.returnType.name, returnType.cppName)
    }

    @Test
    fun finishBuildingFrancaAttributeStatic() {
        `when`(deploymentModel.isStatic(any(FAttribute::class.java))).thenReturn(true)
        `when`(javaBuilder.finalResults).thenReturn(
            Arrays.asList<JavaElement>(
                javaGetter,
                javaSetter
            )
        )
        `when`(cppBuilder.finalResults).thenReturn(
            Arrays.asList<CppElement>(
                cppGetter,
                cppSetter
            )
        )

        modelBuilder.finishBuilding(francaAttribute)

        val methods =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, JniMethod::class.java)
        assertTrue(methods[0].isStatic)
        assertTrue(methods[1].isStatic)
    }

    @Test
    fun finishBuildingFrancaEnumerationsReadsNames() {
        // Arrange
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppEnum, cppCustomType)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaEnum, javaCustomType)

        // Act
        modelBuilder.finishBuilding(francaEnumType)

        // Assert
        val jniEnum = modelBuilder.getFinalResult(JniEnum::class.java)
        assertNotNull(jniEnum)
        assertEquals(javaEnum.name, jniEnum.javaEnumName)
        assertEquals(cppEnum.fullyQualifiedName, jniEnum.cppEnumName)
    }

    @Test
    fun finishBuildingFrancaEnumerationsReadsEnumerators() {
        // Arrange
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppEnum, cppCustomType)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaEnum, javaCustomType)
        contextStack.injectResult(JniEnumerator("oneJ", "oneC"))
        contextStack.injectResult(JniEnumerator("twoJ", "twoC"))
        contextStack.injectResult(JniEnumerator("threeJ", "threeC"))

        // Act
        modelBuilder.finishBuilding(francaEnumType)

        // Assert
        val jniEnum = modelBuilder.getFinalResult(JniEnum::class.java)
        assertNotNull(jniEnum)
        assertEquals(3, jniEnum.enumerators.size.toLong())
        assertEquals("oneC", jniEnum.enumerators[0].cppName)
        assertEquals("oneJ", jniEnum.enumerators[0].javaName)
        assertEquals("twoC", jniEnum.enumerators[1].cppName)
        assertEquals("twoJ", jniEnum.enumerators[1].javaName)
        assertEquals("threeC", jniEnum.enumerators[2].cppName)
        assertEquals("threeJ", jniEnum.enumerators[2].javaName)
    }

    @Test
    fun finishBuildingFrancaEnumerationsReadsTypeReferences() {
        // Arrange
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(cppEnum, cppCustomType)
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(javaEnum, javaCustomType)

        // Act
        modelBuilder.finishBuilding(francaEnumType)

        // Assert
        val resultType = modelBuilder.getFinalResult(JniType::class.java)
        assertNotNull(resultType)
        assertEquals(javaCustomType.name, resultType.javaName)
        assertEquals(cppCustomType.name, resultType.cppName)
    }

    @Test
    fun finishBuildingFEnumerator() {
        // Arrange
        `when`<Any>(cppBuilder.getFinalResult(any())).thenReturn(
            CppEnumItem(
                "cppEnumerator",
                null
            )
        )
        `when`<Any>(javaBuilder.getFinalResult(any())).thenReturn(JavaEnumItem("javaEnumerator"))

        // Act
        modelBuilder.finishBuilding(francaEnumerator)

        // Assert
        val jniEnumItem = modelBuilder.getFinalResult(JniEnumerator::class.java)
        assertNotNull(jniEnumItem)
        assertEquals(jniEnumItem.cppName, "cppEnumerator")
        assertEquals(jniEnumItem.javaName, "javaEnumerator")
    }

    @Test
    fun finishBuildingFrancaTypeCollectionReadsEnums() {
        // Arrange
        `when`(francaTypeCollection.name).thenReturn(TYPE_COLLECTION_NAME)
        val jniEnum = JniEnum(JavaPackage.DEFAULT, "MyJavaEnumName", "MyCppEnumName")
        contextStack.injectResult(jniEnum)

        // Act
        modelBuilder.finishBuilding(francaTypeCollection)

        // Assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertFalse(jniContainer.enums.isEmpty())
        assertEquals(jniEnum, jniContainer.enums[0])
    }

    @Test
    fun finishBuildingFrancaInterfaceReadsEnums() {
        // Arrange
        val jniEnum = JniEnum(null, "MyJavaEnumName", "MyCppEnumName")
        contextStack.injectResult(jniEnum)

        // Act
        modelBuilder.finishBuilding(francaInterface)

        // Assert
        val jniContainer = modelBuilder.getFinalResult(JniContainer::class.java)
        assertNotNull(jniContainer)
        assertFalse(jniContainer.enums.isEmpty())
        assertEquals(jniEnum, jniContainer.enums[0])
    }

    companion object {
        private const val JAVA_CLASS_NAME = "jAvaClazz"
        private const val JAVA_INTERFACE_NAME = "javaFAce"
        private const val CPP_CLASS_NAME = "cPpClass"

        private const val CPP_VOID_METHOD_NAME = "cPpWork3R_vOid"
        private const val CPP_INT_METHOD_NAME = "cPpWork3R_iNt"

        private val JAVA_VOID_METHOD_NAME = "fancyMEthoD_v0id"
        private const val JAVA_INT_METHOD_NAME = "fancyMEthoD_integer"

        private const val BASE_NAME_PARAMETER = "theParam"
        private const val TYPE_COLLECTION_NAME = "TestTypeCollection"

        private val JAVA_PACKAGES = Arrays.asList("my", "java", "test")
        private val CPP_NAMESPACE_MEMBERS = Arrays.asList("my", "cpp", "stuffs", "namespace")

        private const val INTERNAL_NAMESPACE = "::very::internal"

        private fun createJavaMethod(): JavaMethod {
            return JavaMethod(
                JAVA_INT_METHOD_NAME, null,
                JavaVisibility.PUBLIC,
                JavaPrimitiveType.INT, null, null,
                listOf(JavaParameter(BASE_NAME_PARAMETER, JavaPrimitiveType.INT))
            )
        }

        private fun createCppMethod() =
            CppMethod(
                name = CPP_INT_METHOD_NAME,
                fullyQualifiedName = CPP_INT_METHOD_NAME,
                returnType = CppPrimitiveTypeRef.INT8,
                parameters = listOf(CppParameter("", CppPrimitiveTypeRef.INT8))
            )
    }
}
