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

package com.here.genium.generator.cbridge

import com.here.genium.common.CollectionsHelper
import com.here.genium.common.FrancaTypeHelper
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.swift.SwiftModelBuilder
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CElement
import com.here.genium.model.cbridge.CEnum
import com.here.genium.model.cbridge.CField
import com.here.genium.model.cbridge.CFunction
import com.here.genium.model.cbridge.CInParameter
import com.here.genium.model.cbridge.CInterface
import com.here.genium.model.cbridge.CMap
import com.here.genium.model.cbridge.COutParameter
import com.here.genium.model.cbridge.CStruct
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppComplexTypeRef
import com.here.genium.model.cpp.CppElement
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppIncludeResolver
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftProperty
import com.here.genium.model.swift.SwiftType
import com.here.genium.test.MockContextStack
import io.mockk.every
import io.mockk.mockkObject
import io.mockk.mockkStatic
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeRef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.ArgumentMatchers.any
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.MockitoAnnotations
import java.util.Arrays.asList

@RunWith(JUnit4::class)
class CBridgeModelBuilderTest {

    private val contextStack = MockContextStack<CElement>()

    @Mock
    private lateinit var deploymentModel: FrancaDeploymentModel

    @Mock
    private lateinit var cppModelbuilder: CppModelBuilder
    @Mock
    private lateinit var swiftModelBuilder: SwiftModelBuilder
    @Mock
    private lateinit var cppIncludeResolver: CppIncludeResolver
    @Mock
    private lateinit var includeResolver: CBridgeIncludeResolver
    @Mock
    private lateinit var typeMapper: CBridgeTypeMapper

    @Mock
    private lateinit var francaInterface: FInterface
    @Mock
    private lateinit var francaMethod: FMethod
    @Mock
    private lateinit var francaArgument: FArgument
    @Mock
    private lateinit var francaStruct: FStructType
    @Mock
    private lateinit var francaField: FField
    @Mock
    private lateinit var francaTypeCollection: FTypeCollection
    @Mock
    private lateinit var francaAttribute: FAttribute
    @Mock
    private lateinit var francaTypeRef: FTypeRef
    @Mock
    private lateinit var francaArray: FArrayType
    @Mock
    private lateinit var francaMap: FMapType

    private val cppTypeInfo = CppTypeInfo(CType.FLOAT)
    private val cppArrayTypeInfo = CppArrayTypeInfo(
        "FooArrayType", CType.BOOL, CType.BOOL, listOf(), cppTypeInfo
    )
    private val swiftMethod = SwiftMethod(
        "swiftFoo", null, null, SwiftType.VOID, null, "NOT", "SHORT_FUNCTION_NAME"
    )
    private val cppField = CppField("CppFieldName", CppPrimitiveTypeRef.BOOL)

    private lateinit var modelBuilder: CBridgeModelBuilder

    @Before
    fun setUp() {
        MockitoAnnotations.initMocks(this)
        mockkObject(CArrayMapper)
        mockkStatic(FrancaTypeHelper::class, CBridgeNameRules::class)

        val typeInfo = CppTypeInfo(CType(""))

        every { CBridgeNameRules.getStructBaseName(any()) } returns STRUCT_NAME
        every { CBridgeNameRules.getInterfaceName(any()) } returns null

        `when`(cppModelbuilder.getFinalResult(CppMethod::class.java)).thenReturn(CppMethod(""))
        `when`(cppModelbuilder.getFinalResult(CppStruct::class.java)).thenReturn(
            CppStruct(STRUCT_NAME)
        )
        `when`(swiftModelBuilder.getFinalResult(SwiftMethod::class.java)).thenReturn(swiftMethod)

        `when`(typeMapper.createCustomTypeInfo(any(), any())).thenReturn(typeInfo)

        `when`(francaArgument.name).thenReturn(PARAM_NAME)
        `when`(francaAttribute.name).thenReturn("someAttributeName")

        `when`(includeResolver.resolveInclude(any())).thenReturn(Include.createInternalInclude(""))

        modelBuilder = CBridgeModelBuilder(
            contextStack,
            deploymentModel,
            cppIncludeResolver,
            includeResolver,
            cppModelbuilder,
            swiftModelBuilder,
            typeMapper,
            INTERNAL_NAMESPACE
        )
    }

    @Test
    fun finishBuildingOutputArgumentReturnsCreatedParam() {
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuildingOutputArgument(francaArgument)

        val param = modelBuilder.getFinalResult(COutParameter::class.java)
        assertNotNull(param)

        assertEquals("result", param.name)
        assertSame(cppTypeInfo, param.mappedType)
    }

    @Test
    fun finishBuildingInstanceMethodNoParams() {
        contextStack.parentContext.currentResults.add(CppTypeInfo(CType.VOID))

        modelBuilder.finishBuilding(francaMethod)

        val interfaceFunction = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(interfaceFunction.selfParameter)
        assertEquals(
            "Instance parameter should not be part of normal parameters",
            0,
            interfaceFunction.parameters.size.toLong()
        )
        assertNotNull(
            "Instance should be part of C signature parameters", interfaceFunction.selfParameter
        )
    }

    @Test
    fun finishBuildingInstanceMethodWithParams() {
        contextStack.parentContext.currentResults.add(CppTypeInfo(CType.VOID))
        contextStack.injectResult(CInParameter(PARAM_NAME, CppTypeInfo(CType.DOUBLE)))

        modelBuilder.finishBuilding(francaMethod)

        val interfaceFunction = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals(
            "Instance function should only take normal parameters",
            1,
            interfaceFunction.parameters.size.toLong()
        )
        assertNotNull(
            "Instance parameter should be part of signature", interfaceFunction.selfParameter
        )
    }

    @Test
    fun finishBuildingFrancaMethodReadsName() {
        every { CBridgeNameRules.getNestedSpecifierString(any()) } returns "NOT"

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertEquals("NOT_SHORT_FUNCTION_NAME", function.name)
        assertEquals("SHORT_FUNCTION_NAME", function.shortName)
    }

    @Test
    fun finishBuildingCreatesMethodWithoutParams() {
        val cppMethod = CppMethod(DELEGATE_NAME)
        `when`(cppModelbuilder.getFinalResult(CppMethod::class.java)).thenReturn(cppMethod)

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertEquals(CType.VOID, function.returnType.functionReturnType)
        assertEquals(0, function.parameters.size.toLong())
        assertEquals(DELEGATE_NAME, function.delegateCall)
    }

    @Test
    fun finishBuildingCreatesMethodWithParam() {
        val cppMethod = CppMethod(DELEGATE_NAME)
        `when`(cppModelbuilder.getFinalResult(CppMethod::class.java)).thenReturn(cppMethod)
        val param = CInParameter(PARAM_NAME, CppTypeInfo(CType.DOUBLE))
        contextStack.injectResult(param)

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertEquals(CType.VOID, function.returnType.functionReturnType)
        assertEquals(DELEGATE_NAME, function.delegateCall)
        assertEquals(1, function.parameters.size.toLong())
        assertSame(param, function.parameters[0])
    }

    @Test
    fun finishBuildingFrancaMethodReadsIsConst() {
        `when`(deploymentModel.isConst(any())).thenReturn(true)

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertTrue(function.isConst)
    }

    @Test
    fun finishBuildingFrancaMethodReadsCppTypeName() {
        val cppMethod =
            CppMethod(DELEGATE_NAME, DELEGATE_NAME, "", CppComplexTypeRef("::std::FooType"))
        `when`(cppModelbuilder.getFinalResult(CppMethod::class.java)).thenReturn(cppMethod)
        every { CBridgeNameRules.getNestedSpecifierString(any()) } returns "NOT"

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertEquals("::std::FooType", function.cppReturnTypeName)
    }

    @Test
    fun finishBuildingFrancaMethodReadsIsStatic() {
        `when`(deploymentModel.isStatic(any(FMethod::class.java))).thenReturn(true)

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertNull(function.selfParameter)
    }

    @Test
    fun finishBuildingFrancaMethodReadsIsConstructor() {
        `when`(deploymentModel.isConstructor(any())).thenReturn(true)
        `when`(typeMapper.createCustomTypeInfo(any(), any())).thenReturn(cppTypeInfo)

        modelBuilder.finishBuilding(francaMethod)

        val function = modelBuilder.getFinalResult(CFunction::class.java)
        assertNotNull(function)
        assertNull(function.selfParameter)
        assertEquals(cppTypeInfo, function.returnType)
    }

    @Test
    fun finishBuildingCreatesCInterfaceForFInterface() {
        val function = CFunction("SomeName", "foo")
        contextStack.injectResult(function)

        modelBuilder.finishBuilding(francaInterface)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(1, iface.functions.size.toLong())
        assertSame(function, iface.functions[0])
    }

    @Test
    fun finishBuildingCreatesCInterfaceForFTypeCollection() {
        val function = CFunction("SomeName", "foo")
        contextStack.injectResult(function)

        modelBuilder.finishBuilding(francaTypeCollection)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(1, iface.functions.size.toLong())
        assertSame(function, iface.functions[0])
    }

    @Test
    fun properIncludesForVoidFunctionNotCallingToBaseApi() {
        val function = CFunction("SomeName", "foo")
        contextStack.injectResult(function)

        modelBuilder.finishBuilding(francaInterface)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(0, iface.headerIncludes.size.toLong())
        assertEquals(1, iface.implementationIncludes.size.toLong())
        assertEquals(0, iface.privateHeaderIncludes.size.toLong())
    }

    @Test
    fun properIncludesForVoidFunctionCallingToBaseApi() {
        val function = CFunction(
            "SomeName",
            "foo",
            CppTypeInfo(CType.VOID),
            emptyList(), null,
            "someBaseApiFunc()",
            setOf(Include.createInternalInclude("baseApiInclude.h"))
        )
        contextStack.injectResult(function)

        modelBuilder.finishBuilding(francaInterface)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(0, iface.headerIncludes.size.toLong())
        assertEquals(2, iface.implementationIncludes.size.toLong())
        assertEquals(0, iface.privateHeaderIncludes.size.toLong())
    }

    @Test
    fun finishBuildingStructContainsFields() {
        contextStack.injectResult(CField("SwiftName1", "CppName1", cppTypeInfo))
        contextStack.injectResult(CField("SwiftName2", "CppName2", cppTypeInfo))

        modelBuilder.finishBuilding(francaStruct)

        val cStruct = modelBuilder.getFinalResult(CStruct::class.java)
        assertNotNull(cStruct)
        assertEquals("There should be 2 fields in struct", 2, cStruct.fields.size.toLong())
        assertEquals("SwiftName1", cStruct.fields[0].name)
        assertEquals("CppName1", cStruct.fields[0].baseLayerName)
        assertEquals("SwiftName2", cStruct.fields[1].name)
        assertEquals("CppName2", cStruct.fields[1].baseLayerName)
    }

    @Test
    fun finishBuildingStructCreatesStructWithProperName() {
        modelBuilder.finishBuilding(francaStruct)

        val cStruct = modelBuilder.getFinalResult(CStruct::class.java)
        assertNotNull(cStruct)
        assertEquals(STRUCT_NAME, cStruct.name)
    }

    @Test
    fun finishBuildingStructReadsImmutable() {
        `when`(cppModelbuilder.getFinalResult(CppStruct::class.java))
            .thenReturn(
                CppStruct(
                    STRUCT_NAME, STRUCT_NAME, "", false, listOf(), false, true
                )
            )

        modelBuilder.finishBuilding(francaStruct)

        val cStruct = modelBuilder.getFinalResult(CStruct::class.java)
        assertNotNull(cStruct)
        assertTrue(cStruct.hasImmutableFields)
    }

    @Test
    fun finishBuildingStructReadsHasImmutableFields() {
        val immutableTypeField = CppField("", CppPrimitiveTypeRef.BOOL, null, false, false, true)
        `when`(cppModelbuilder.getFinalResult(CppStruct::class.java))
            .thenReturn(
                CppStruct(
                    STRUCT_NAME,
                    STRUCT_NAME,
                    "",
                    false,
                    listOf(immutableTypeField)
                )
            )

        modelBuilder.finishBuilding(francaStruct)

        val cStruct = modelBuilder.getFinalResult(CStruct::class.java)
        assertNotNull(cStruct)
        assertTrue(cStruct.hasImmutableFields)
    }

    @Test
    fun finishBuildingInterfaceDoesNotAddStructs() {
        val struct = CStruct("name", "baseApiName", CppTypeInfo(CType.VOID), false)
        contextStack.injectResult(struct)

        modelBuilder.finishBuilding(francaInterface)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(
            "There should be 1 struct typedefs (structRef and function table)",
            1,
            iface.structs.size.toLong()
        )
        assertSame(struct, iface.structs[0])
    }

    @Test
    fun finishBuildingTypeCollectionContainsStructs() {
        val struct = CStruct("name", "baseApiName", CppTypeInfo(CType.VOID), false)
        contextStack.injectResult(struct)

        modelBuilder.finishBuilding(francaTypeCollection)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(
            "There should be 1 struct typedefs (structRef)",
            1,
            iface.structs.size.toLong()
        )
        assertSame(struct, iface.structs[0])
    }

    @Test
    fun finishBuildingFrancaFieldReadsName() {
        `when`<Any>(cppModelbuilder.getFinalResult(any())).thenReturn(cppField)
        `when`<Any>(swiftModelBuilder.getFinalResult(any()))
            .thenReturn(SwiftField(SWIFT_FIELD_NAME, null, null, null))
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(francaField)

        val field = modelBuilder.getFinalResult(CField::class.java)
        assertNotNull(field)
        assertEquals(SWIFT_FIELD_NAME, field.name)
        assertEquals("CppFieldName", field.baseLayerName)
    }

    @Test
    fun finishBuildingFrancaFieldReadsTypeInfo() {
        `when`<Any>(cppModelbuilder.getFinalResult(any())).thenReturn(cppField)
        `when`<Any>(swiftModelBuilder.getFinalResult(any()))
            .thenReturn(SwiftField(SWIFT_FIELD_NAME, null, null, null))
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(francaField)

        val field = modelBuilder.getFinalResult(CField::class.java)
        assertNotNull(field)
        assertEquals(cppTypeInfo, field.type)
    }

    @Test
    fun finishBuildingFrancaFieldReadsExternalAccessors() {
        `when`<Any>(cppModelbuilder.getFinalResult(any())).thenReturn(cppField)
        `when`<Any>(swiftModelBuilder.getFinalResult(any()))
            .thenReturn(SwiftField(SWIFT_FIELD_NAME, null, null, null))
        `when`(deploymentModel.getExternalGetter(any())).thenReturn("get_foo")
        `when`(deploymentModel.getExternalSetter(any())).thenReturn("setFoo")
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(francaField)

        val field = modelBuilder.getFinalResult(CField::class.java)
        assertNotNull(field)
        assertEquals("get_foo", field.baseLayerGetterName)
        assertEquals("setFoo", field.baseLayerSetterName)
    }

    @Test
    fun finishBuildingCreatesCEnum() {
        val francaEnumerationType = mock(FEnumerationType::class.java)
        every { CBridgeNameRules.getEnumName(francaEnumerationType) } returns null

        modelBuilder.finishBuilding(francaEnumerationType)

        val anEnum = modelBuilder.getFinalResult(CEnum::class.java)
        assertNotNull("Should be 1 enum created", anEnum)
    }

    @Test
    fun finishBuildingCreatesCppTypeInfo() {
        `when`(typeMapper.mapType(any())).thenReturn(cppTypeInfo)

        modelBuilder.finishBuilding(francaTypeRef)

        val typeInfo = modelBuilder.getFinalResult(CppTypeInfo::class.java)
        assertNotNull("Should be 1 CppTypeInfo created", typeInfo)
        assertSame(cppTypeInfo, typeInfo)
    }

    @Test
    fun finishBuildingCreatesFunctionsForAttribute() {
        val classTypeInfo = CppTypeInfo(CType(""))
        val cppMethods =
            asList<CppElement>(CppMethod(CPP_ATTR_GETTER_NAME), CppMethod(CPP_ATTR_SETTER_NAME))
        `when`(cppModelbuilder.finalResults).thenReturn(cppMethods)

        `when`(francaAttribute.isReadonly).thenReturn(false)
        val swiftProperty = SwiftProperty(
            "", null,
            SwiftType("", ""),
            SwiftMethod("", null, null, SwiftType.VOID, null, null, CBRIDGE_ATTR_GETTER_NAME),
            SwiftMethod("", null, null, SwiftType.VOID, null, null, CBRIDGE_ATTR_SETTER_NAME),
            false
        )
        `when`<Any>(swiftModelBuilder.getFinalResult(any())).thenReturn(swiftProperty)

        contextStack.injectResult(cppTypeInfo)
        contextStack.parentContext.currentResults.add(classTypeInfo)

        modelBuilder.finishBuilding(francaAttribute)

        val functions =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, CFunction::class.java)
        assertEquals("There should be getter and setter", 2, functions.size.toLong())
        verifyAttributeGetter(classTypeInfo, functions[0])
        verifyAttributeSetter(classTypeInfo, functions[1])
    }

    @Test
    fun finishBuildingCreatesFunctionForReadonlyAttribute() {
        val classTypeInfo = CppTypeInfo(CType(""))
        val cppMethods = listOf<CppElement>(CppMethod(CPP_ATTR_GETTER_NAME))
        `when`(cppModelbuilder.finalResults).thenReturn(cppMethods)

        `when`(francaAttribute.isReadonly).thenReturn(true)
        val swiftProperty = SwiftProperty(
            "", null,
            SwiftType("", ""),
            SwiftMethod("", null, null, SwiftType.VOID, null, null, CBRIDGE_ATTR_GETTER_NAME), null,
            false
        )
        `when`<Any>(swiftModelBuilder.getFinalResult(any())).thenReturn(swiftProperty)

        contextStack.injectResult(cppTypeInfo)
        contextStack.parentContext.currentResults.add(classTypeInfo)

        modelBuilder.finishBuilding(francaAttribute)

        val functions =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, CFunction::class.java)
        assertEquals("There should be only getter", 1, functions.size.toLong())
        verifyAttributeGetter(classTypeInfo, functions[0])
    }

    @Test
    fun finishBuildingStaticAttribute() {
        val swiftProperty = SwiftProperty(
            "", null, SwiftType("", ""), SwiftMethod(""), SwiftMethod(""), false
        )
        `when`<Any>(swiftModelBuilder.getFinalResult(any())).thenReturn(swiftProperty)
        `when`(cppModelbuilder.finalResults)
            .thenReturn(asList<CppElement>(CppMethod(""), CppMethod("")))
        `when`(deploymentModel.isStatic(any(FAttribute::class.java))).thenReturn(true)
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(francaAttribute)

        val functions =
            CollectionsHelper.getAllOfType(modelBuilder.finalResults, CFunction::class.java)
        assertNull(functions[0].selfParameter)
        assertNull(functions[1].selfParameter)
    }

    @Test
    fun finishBuildingFrancaArrayTypeCreatesArray() {
        every { CArrayMapper.getArrayName(any<FArrayType>()) } returns "FooArray"
        every { CArrayMapper.createArrayReference(any()) } returns cppArrayTypeInfo

        modelBuilder.finishBuilding(francaArray)

        val arrays = modelBuilder.arraysCollector.values
        assertEquals("There should one array", 1, arrays.size.toLong())
        assertEquals("FooArray", arrays.iterator().next().name)
    }

    @Test
    fun finishBuildingFrancaTypeRefCreatesInlineArray() {
        val arrayType = CppArrayTypeInfo(
            "ArrayTest",
            CType("ArrayTest"),
            CType("ArrayTest"),
            listOf(),
            cppTypeInfo
        )
        arrayType.typeCategory = CppTypeInfo.TypeCategory.ARRAY
        `when`(typeMapper.mapType(any())).thenReturn(arrayType)
        every { FrancaTypeHelper.isImplicitArray(any()) } returns true
        every { CArrayMapper.getArrayName(any<FTypeRef>()) } returns "FooArray"

        modelBuilder.finishBuilding(francaTypeRef)

        val arrays = modelBuilder.arraysCollector.values
        assertEquals("There should one array", 1, arrays.size.toLong())
        assertEquals("FooArray", arrays.iterator().next().name)
    }

    private fun verifyAttributeSetter(classTypeInfo: CppTypeInfo, cSetter: CFunction) {
        assertEquals(CBRIDGE_ATTR_SETTER_NAME, cSetter.name)
        assertEquals(CPP_ATTR_SETTER_NAME, cSetter.functionName)
        assertSame(classTypeInfo, cSetter.selfParameter?.mappedType)
        assertSame(CType.VOID, cSetter.returnType.functionReturnType)
        assertEquals(
            "Setter should have two parameters, new value and instance (not included here)",
            1,
            cSetter.parameters.size.toLong()
        )
    }

    private fun verifyAttributeGetter(classTypeInfo: CppTypeInfo, cGetter: CFunction) {
        assertEquals(CBRIDGE_ATTR_GETTER_NAME, cGetter.name)
        assertEquals(CPP_ATTR_GETTER_NAME, cGetter.functionName)
        assertSame(classTypeInfo, cGetter.selfParameter?.mappedType)
        assertSame(cppTypeInfo, cGetter.returnType)
        assertEquals(
            "Getter should have only one parameter, instance but not included here",
            0,
            cGetter.parameters.size.toLong()
        )
    }

    @Test
    fun finishBuildingInterfacePropagatesFunctionsFromBase() {
        val base = CInterface("Base", INTERNAL_NAMESPACE)
        base.inheritedFunctions.add(CFunction("GrandParentFunction"))
        base.functions.add(CFunction("ParentFunction"))
        contextStack.injectResult(base)
        val function = CFunction("ChildFunction")
        contextStack.injectResult(function)

        modelBuilder.finishBuilding(francaInterface)

        val iface = modelBuilder.getFinalResult(CInterface::class.java)
        assertNotNull(iface)
        assertEquals(2, iface.inheritedFunctions.size.toLong())
        assertEquals(1, iface.functions.size.toLong())
    }

    @Test
    fun finishBuildingFrancaMapType() {
        every { CBridgeNameRules.getMapName(any()) } returns "FooMap"
        contextStack.injectResult(CppTypeInfo.STRING)
        contextStack.injectResult(cppTypeInfo)
        val fooInclude = Include.createInternalInclude("Foo")
        `when`(cppIncludeResolver.resolveIncludes(any())).thenReturn(listOf(fooInclude))

        modelBuilder.finishBuilding(francaMap)

        val cMap = modelBuilder.getFinalResult(CMap::class.java)
        assertNotNull(cMap)
        assertEquals("FooMap", cMap.name)
        assertEquals(CppTypeInfo.STRING, cMap.keyType)
        assertEquals(cppTypeInfo, cMap.valueType)
        assertEquals(fooInclude, cMap.include)
    }

    companion object {
        private const val DELEGATE_NAME = "DELEGATE_NAME"
        private const val PARAM_NAME = "inputParam"
        private const val STRUCT_NAME = "SomeStruct"
        private const val CBRIDGE_ATTR_GETTER_NAME = "C_ATTR_GETTER"
        private const val CBRIDGE_ATTR_SETTER_NAME = "C_ATTR_SETTER"
        private const val CPP_ATTR_GETTER_NAME = "CPP_ATTR_GETTER"
        private const val CPP_ATTR_SETTER_NAME = "CPP_ATTR_SETTER"
        private const val SWIFT_FIELD_NAME = "SwiftFieldName"
        private final val INTERNAL_NAMESPACE = listOf("very", "internal")
    }
}
