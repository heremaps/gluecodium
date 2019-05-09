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

import com.here.genium.generator.cpp.CppIncludeResolver
import com.here.genium.generator.cpp.CppLibraryIncludes
import com.here.genium.generator.cpp.CppModelBuilder
import com.here.genium.generator.swift.SwiftModelBuilder
import com.here.genium.model.cbridge.CBridgeIncludeResolver
import com.here.genium.model.cbridge.CElement
import com.here.genium.model.cbridge.CEnum
import com.here.genium.model.cbridge.CField
import com.here.genium.model.cbridge.CFunction
import com.here.genium.model.cbridge.CInterface
import com.here.genium.model.cbridge.CMap
import com.here.genium.model.cbridge.CParameter
import com.here.genium.model.cbridge.CStruct
import com.here.genium.model.cbridge.CType
import com.here.genium.model.common.Include
import com.here.genium.model.cpp.CppField
import com.here.genium.model.cpp.CppMethod
import com.here.genium.model.cpp.CppParameter
import com.here.genium.model.cpp.CppPrimitiveTypeRef
import com.here.genium.model.cpp.CppStruct
import com.here.genium.model.cpp.CppTypeRef
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeAttributes
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicTypeRef
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMap
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimePath
import com.here.genium.model.lime.LimePath.Companion.EMPTY_PATH
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeReturnType
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.swift.SwiftField
import com.here.genium.model.swift.SwiftMethod
import com.here.genium.model.swift.SwiftProperty
import com.here.genium.test.AssertHelpers.assertContains
import com.here.genium.test.MockContextStack
import io.mockk.MockKAnnotations
import io.mockk.Runs
import io.mockk.every
import io.mockk.impl.annotations.MockK
import io.mockk.just
import io.mockk.mockkStatic
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CBridgeModelBuilderTest {
    @MockK private lateinit var includeResolver: CBridgeIncludeResolver
    @MockK private lateinit var cppIncludeResolver: CppIncludeResolver
    @MockK private lateinit var cppModelBuilder: CppModelBuilder
    @MockK private lateinit var swiftModelBuilder: SwiftModelBuilder
    @MockK private lateinit var typeMapper: CBridgeTypeMapper

    private val fooPath = LimePath(emptyList(), listOf("foo"))
    private val limeContainer = LimeContainer(fooPath, type = ContainerType.TYPE_COLLECTION)
    private val limeMethod = LimeMethod(fooPath)
    private val limeMap = LimeMap(
        LimeBasicTypeRef(LimeBasicType.TypeId.STRING),
        LimeBasicTypeRef.DOUBLE
    )
    private val limeStruct = LimeStruct(fooPath)

    private val limeTypeDefToMap = LimeTypeDef(
        LimePath(emptyList(), listOf("foo", "bar")),
        typeRef = LimeTypeRef(mapOf("baz" to limeMap), "baz")
    )

    private val fooInclude = Include.createInternalInclude("")
    private val cppTypeInfo = CppTypeInfo(CType.DOUBLE)
    private val cppArrayTypeInfo =
        CppArrayTypeInfo("", CType.DOUBLE, CType.DOUBLE, emptyList(), cppTypeInfo)
    private val cppMethod = CppMethod(
        "nonsenseName",
        fullyQualifiedName = "someFqn",
        returnType = object : CppTypeRef("returnTypeFqn", emptyList()) {}
    )
    private val swiftMethod = SwiftMethod(
        "",
        cShortName = "nonsenseShortName",
        cNestedSpecifier = "someNestedSpecifier"
    )
    private val cppField = CppField("cppFooField", type = CppPrimitiveTypeRef.VOID)
    private val swiftField = SwiftField("swiftBarField", null, null, null)

    private val contextStack = MockContextStack<CElement>()
    private val limeReferenceMap =
        mutableMapOf<String, LimeElement>("" to object : LimeNamedElement(EMPTY_PATH) {})

    private lateinit var modelBuilder: CBridgeModelBuilder

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxed = true)
        mockkStatic(CppLibraryIncludes::class)

        modelBuilder = CBridgeModelBuilder(
            contextStack,
            limeReferenceMap,
            includeResolver,
            cppIncludeResolver,
            cppModelBuilder,
            swiftModelBuilder,
            typeMapper,
            emptyList()
        )

        every { CppLibraryIncludes.filterIncludes(any(), any()) } just Runs
        every { cppModelBuilder.getFinalResult(CppMethod::class.java) } returns cppMethod
        every { swiftModelBuilder.getFinalResult(SwiftMethod::class.java) } returns swiftMethod
        every { cppModelBuilder.getFinalResult(CppField::class.java) } returns cppField
        every { swiftModelBuilder.getFinalResult(SwiftField::class.java) } returns swiftField
    }

    @Test
    fun startBuildingTypeCollection() {
        val limeElement = LimeContainer(EMPTY_PATH, type = ContainerType.TYPE_COLLECTION)

        modelBuilder.startBuilding(limeElement)

        assertTrue(contextStack.currentContext.currentResults.isEmpty())
    }

    @Test
    fun startBuildingContainer() {
        val limeElement = LimeContainer(EMPTY_PATH, type = ContainerType.INTERFACE)
        every {
            typeMapper.createCustomTypeInfo(limeElement, CppTypeInfo.TypeCategory.CLASS)
        } returns cppTypeInfo

        modelBuilder.startBuilding(limeElement)

        val result = contextStack.currentContext.currentResults.first()
        assertEquals(cppTypeInfo, result)
    }

    @Test
    fun startBuildingStruct() {
        every {
            typeMapper.createCustomTypeInfo(limeStruct, CppTypeInfo.TypeCategory.STRUCT)
        } returns cppTypeInfo

        modelBuilder.startBuilding(limeStruct)

        val result = contextStack.currentContext.currentResults.first()
        assertEquals(cppTypeInfo, result)
    }

    @Test
    fun finishBuildingContainer() {
        every { includeResolver.resolveInclude(limeContainer) } returns fooInclude

        modelBuilder.finishBuilding(limeContainer)

        val result = modelBuilder.getFinalResult(CInterface::class.java)
        assertEquals("Foo", result.name)
        assertContains(fooInclude, result.implementationIncludes)
    }

    @Test
    fun finishBuildingContainerReadsTypeInfo() {
        contextStack.injectCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeContainer)

        val result = modelBuilder.getFinalResult(CInterface::class.java)
        assertEquals(cppTypeInfo, result.selfType)
    }

    @Test
    fun finishBuildingContainerReadsParentFunctions() {
        val parentInterface = CInterface("", emptyList())
        val parentFunction = CFunction("foo")
        val parentInheritedFunction = CFunction("bar")
        parentInterface.functions += parentFunction
        parentInterface.inheritedFunctions += parentInheritedFunction
        contextStack.injectResult(parentInterface)

        modelBuilder.finishBuilding(limeContainer)

        val result = modelBuilder.getFinalResult(CInterface::class.java)
        assertContains(parentFunction, result.inheritedFunctions)
        assertContains(parentInheritedFunction, result.inheritedFunctions)
    }

    @Test
    fun finishBuildingContainerReadsMembers() {
        val cFunction = CFunction("")
        val cStruct = CStruct("", "", cppTypeInfo, false)
        val cEnum = CEnum("", cppTypeInfo)
        val cMap = CMap("", cppTypeInfo, cppTypeInfo, "", fooInclude)
        contextStack.injectResult(cFunction)
        contextStack.injectResult(cStruct)
        contextStack.injectResult(cEnum)
        contextStack.injectResult(cMap)

        modelBuilder.finishBuilding(limeContainer)

        val result = modelBuilder.getFinalResult(CInterface::class.java)
        assertContains(cFunction, result.functions)
        assertContains(cStruct, result.structs)
        assertContains(cEnum, result.enums)
        assertContains(cMap, result.maps)
    }

    @Test
    fun finishBuildingInterface() {
        val limeElement =
            LimeContainer(fooPath, type = ContainerType.INTERFACE)
        every { includeResolver.resolveInclude(limeElement) } returns fooInclude

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CInterface::class.java)
        assertEquals("Foo_FunctionTable", result.functionTableName)
        assertEquals(
            CBridgeComponents.PROXY_CACHE_FILENAME,
            result.implementationIncludes.last().fileName
        )
    }

    @Test
    fun finishBuildingMethod() {
        contextStack.injectParentCurrentResult(cppTypeInfo)
        every { cppIncludeResolver.resolveIncludes(limeMethod) } returns listOf(fooInclude)
        every { typeMapper.mapType(any()) } returns CppTypeInfo.STRING

        modelBuilder.finishBuilding(limeMethod)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals("someNestedSpecifier_nonsenseShortName", result.name)
        assertEquals("someFqn", result.delegateCall)
        assertEquals("nonsenseName", result.functionName)
        assertEquals("returnTypeFqn", result.cppReturnTypeName)
        assertEquals(CppTypeInfo.STRING, result.returnType)
        assertEquals(cppTypeInfo, result.selfParameter?.mappedType)
        assertContains(fooInclude, result.delegateCallIncludes)
    }

    @Test
    fun finishBuildingMethodReadsParameters() {
        val cParameter = CParameter("", CppTypeInfo.STRING)
        contextStack.injectResult(cParameter)
        contextStack.injectParentCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeMethod)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertContains(cParameter, result.parameters)
    }

    @Test
    fun finishBuildingMethodReadsConstructor() {
        val limeElement = LimeMethod(
            LimePath(emptyList(), listOf("foo", "bar")),
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.CONSTRUCTOR)
                .build()
        )
        limeReferenceMap["foo"] = limeContainer
        every {
            typeMapper.createCustomTypeInfo(limeContainer, CppTypeInfo.TypeCategory.CLASS)
        } returns cppTypeInfo

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals(cppTypeInfo, result.returnType)
        assertNull(result.selfParameter)
    }

    @Test
    fun finishBuildingMethodReadsStructConstructor() {
        val limeElement = LimeMethod(
            LimePath(emptyList(), listOf("foo", "bar")),
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.CONSTRUCTOR)
                .build()
        )
        limeReferenceMap["foo"] = limeStruct
        every { typeMapper.mapType(any()) } returns cppTypeInfo

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals(cppTypeInfo, result.returnType)
    }

    @Test
    fun finishBuildingMethodReadsStatic() {
        val limeElement = LimeMethod(fooPath, isStatic = true)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertNull(result.selfParameter)
    }

    @Test
    fun finishBuildingMethodReadsNullable() {
        val limeReturnType = LimeReturnType(
            LimeBasicTypeRef.DOUBLE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        val limeElement = LimeMethod(fooPath, returnType = limeReturnType)
        contextStack.injectParentCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.returnType.cType.name)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.returnType.functionReturnType.name)
    }

    @Test
    fun finishBuildingMethodReadsArrayReturnType() {
        contextStack.injectParentCurrentResult(cppTypeInfo)
        every { typeMapper.mapType(any()) } returns cppArrayTypeInfo

        modelBuilder.finishBuilding(limeMethod)

        assertEquals(cppArrayTypeInfo, modelBuilder.arraysCollector.values.first().arrayType)
    }

    @Test
    fun finishBuildingMethodReadsErrorType() {
        val limeElement = LimeMethod(fooPath, errorType = LimeBasicTypeRef.FLOAT)
        val enumTypeInfo = CppTypeInfo(CType.UINT32)
        contextStack.injectParentCurrentResult(cppTypeInfo)
        every { typeMapper.createEnumTypeInfo(any()) } returns enumTypeInfo

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals(enumTypeInfo, result.error)
        assertContains(CType.BOOL_INCLUDE, result.error!!.functionReturnType.includes)
    }

    @Test
    fun finishBuildingParameter() {
        val limeElement = LimeParameter(
            LimePath(emptyList(), listOf("Foo")),
            typeRef = LimeBasicTypeRef.DOUBLE
        )
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CParameter::class.java)
        assertEquals("Foo", result.name)
        assertEquals(cppTypeInfo, result.mappedType)
    }

    @Test
    fun finishBuildingParameterReadsNullable() {
        val limeElement = LimeParameter(
            LimePath(emptyList(), listOf("Foo")),
            typeRef = LimeBasicTypeRef.DOUBLE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        val cppParameter = CppParameter("", type = CppPrimitiveTypeRef.VOID)
        contextStack.injectResult(cppTypeInfo)
        every { cppModelBuilder.getFinalResult(CppParameter::class.java) } returns cppParameter

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CParameter::class.java)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.mappedType.cType.name)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.mappedType.functionReturnType.name)
    }

    @Test
    fun finishBuildingStruct() {
        val limeElement = LimeStruct(LimePath(emptyList(), listOf("foo", "bar")))
        val cppStruct = CppStruct("Baz")
        every { cppModelBuilder.getFinalResult(CppStruct::class.java) } returns cppStruct
        contextStack.injectCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CStruct::class.java)
        assertEquals("Foo_Bar", result.name)
        assertEquals("Baz", result.baseApiName)
        assertEquals(cppTypeInfo, result.mappedType)
    }

    @Test
    fun finishBuildingStructReadsFields() {
        val cField = CField("", "", cppTypeInfo)
        contextStack.injectResult(cField)
        every { cppModelBuilder.getFinalResult(CppStruct::class.java) } returns CppStruct("")
        contextStack.injectCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CStruct::class.java)
        assertContains(cField, result.fields)
    }

    @Test
    fun finishBuildingStructReadsMethods() {
        val cFunction = CFunction("bar")
        contextStack.injectResult(cFunction)
        every { cppModelBuilder.getFinalResult(CppStruct::class.java) } returns CppStruct("")
        contextStack.injectCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CStruct::class.java)
        assertContains(cFunction, result.methods)
    }

    @Test
    fun finishBuildingStructReadsImmutableFields() {
        every {
            cppModelBuilder.getFinalResult(CppStruct::class.java)
        } returns CppStruct("", isImmutable = true)
        contextStack.injectCurrentResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeStruct)

        val result = modelBuilder.getFinalResult(CStruct::class.java)
        assertTrue(result.hasImmutableFields)
    }

    @Test
    fun finishBuildingField() {
        val limeElement = LimeField(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CField::class.java)
        assertEquals("swiftBarField", result.name)
        assertEquals("cppFooField", result.baseLayerName)
        assertEquals(cppTypeInfo, result.type)
    }

    @Test
    fun finishBuildingFieldReadsNullable() {
        val limeElement = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CField::class.java)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.type.cType.name)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, result.type.functionReturnType.name)
    }

    @Test
    fun finishBuildingFieldReadsExternalAccessors() {
        val limeElement = LimeField(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.EXTERNAL_GETTER, "getFooBar")
                .addAttribute(LimeAttributeType.EXTERNAL_SETTER, "setBarBaz")
                .build()
        )
        contextStack.injectResult(cppTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CField::class.java)
        assertEquals("getFooBar", result.baseLayerGetterName)
        assertEquals("setBarBaz", result.baseLayerSetterName)
    }

    @Test
    fun finishBuildingEnumeration() {
        val limeElement = LimeEnumeration(LimePath(emptyList(), listOf("foo", "bar")))
        every { typeMapper.createEnumTypeInfo(limeElement) } returns cppTypeInfo

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CEnum::class.java)
        assertEquals("Foo_Bar", result.name)
        assertEquals(cppTypeInfo, result.mappedType)
    }

    @Test
    fun finishBuildingPropertyCreatesGetter() {
        val limeElement = LimeProperty(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
        val swiftProperty = SwiftProperty("", null, null, swiftMethod, SwiftMethod(""), false)
        every { cppModelBuilder.finalResults } returns listOf(cppMethod, CppMethod(""))
        every { swiftModelBuilder.getFinalResult(SwiftProperty::class.java) } returns swiftProperty
        every { cppIncludeResolver.resolveIncludes(limeElement) } returns listOf(fooInclude)
        contextStack.injectParentCurrentResult(cppTypeInfo)
        contextStack.injectResult(cppArrayTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CFunction::class.java)
        assertEquals("someNestedSpecifier_nonsenseShortName", result.name)
        assertEquals("someFqn", result.delegateCall)
        assertEquals("nonsenseName", result.functionName)
        assertEquals("returnTypeFqn", result.cppReturnTypeName)
        assertEquals(cppArrayTypeInfo, result.returnType)
        assertEquals(cppTypeInfo, result.selfParameter?.mappedType)
        assertContains(fooInclude, result.delegateCallIncludes)
    }

    @Test
    fun finishBuildingPropertyCreatesSetter() {
        val limeElement = LimeProperty(EMPTY_PATH, typeRef = LimeBasicTypeRef.DOUBLE)
        val swiftProperty = SwiftProperty("", null, null, SwiftMethod(""), swiftMethod, false)
        every { cppModelBuilder.finalResults } returns listOf(CppMethod(""), cppMethod)
        every { swiftModelBuilder.getFinalResult(SwiftProperty::class.java) } returns swiftProperty
        every { cppIncludeResolver.resolveIncludes(limeElement) } returns listOf(fooInclude)
        contextStack.injectParentCurrentResult(cppTypeInfo)
        contextStack.injectResult(cppArrayTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<CFunction>()
        assertEquals(2, results.size)
        val result = results.last()
        assertEquals("someNestedSpecifier_nonsenseShortName", result.name)
        assertEquals("someFqn", result.delegateCall)
        assertEquals("nonsenseName", result.functionName)
        assertEquals("returnTypeFqn", result.cppReturnTypeName)
        assertEquals(cppArrayTypeInfo, result.parameters.first().mappedType)
        assertEquals(cppTypeInfo, result.selfParameter?.mappedType)
        assertContains(fooInclude, result.delegateCallIncludes)
    }

    @Test
    fun finishBuildingPropertyReadsReadonly() {
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            isReadonly = true
        )
        val swiftProperty = SwiftProperty("", null, null, SwiftMethod(""), SwiftMethod(""), false)
        every { cppModelBuilder.finalResults } returns listOf(CppMethod(""), CppMethod(""))
        every { swiftModelBuilder.getFinalResult(SwiftProperty::class.java) } returns swiftProperty
        contextStack.injectParentCurrentResult(cppTypeInfo)
        contextStack.injectResult(cppArrayTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<CFunction>()
        assertEquals(1, results.size)
    }

    @Test
    fun finishBuildingPropertyReadsStatic() {
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            isStatic = true
        )
        val swiftProperty = SwiftProperty("", null, null, SwiftMethod(""), SwiftMethod(""), false)
        every { cppModelBuilder.finalResults } returns listOf(CppMethod(""), CppMethod(""))
        every { swiftModelBuilder.getFinalResult(SwiftProperty::class.java) } returns swiftProperty
        contextStack.injectParentCurrentResult(cppTypeInfo)
        contextStack.injectResult(cppArrayTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<CFunction>()
        assertEquals(2, results.size)
        assertNull(results.first().selfParameter)
        assertNull(results.last().selfParameter)
    }

    @Test
    fun finishBuildingPropertyReadsNullable() {
        val limeElement = LimeProperty(
            EMPTY_PATH,
            typeRef = LimeBasicTypeRef.DOUBLE,
            attributes = LimeAttributes.Builder()
                .addAttribute(LimeAttributeType.NULLABLE)
                .build()
        )
        val swiftProperty = SwiftProperty("", null, null, SwiftMethod(""), SwiftMethod(""), false)
        every { cppModelBuilder.finalResults } returns listOf(CppMethod(""), CppMethod(""))
        every { swiftModelBuilder.getFinalResult(SwiftProperty::class.java) } returns swiftProperty
        contextStack.injectParentCurrentResult(cppTypeInfo)
        contextStack.injectResult(cppArrayTypeInfo)

        modelBuilder.finishBuilding(limeElement)

        val results = modelBuilder.finalResults.filterIsInstance<CFunction>()
        assertEquals(2, results.size)
        assertEquals(CBridgeNameRules.BASE_REF_NAME, results.first().returnType.cType.name)
        assertEquals(
            CBridgeNameRules.BASE_REF_NAME,
            results.first().returnType.functionReturnType.name
        )
        assertEquals(
            CBridgeNameRules.BASE_REF_NAME,
            results.last().parameters.first().mappedType.cType.name
        )
        assertEquals(
            CBridgeNameRules.BASE_REF_NAME,
            results.last().parameters.first().mappedType.functionReturnType.name
        )
    }

    @Test
    fun finishBuildingTypeDefToMap() {
        val cppValueTypeInfo = CppTypeInfo(CType.BOOL)
        every { typeMapper.mapType(any()) }.returnsMany(cppTypeInfo, cppValueTypeInfo)
        every { cppIncludeResolver.resolveIncludes(limeTypeDefToMap) } returns listOf(fooInclude)

        modelBuilder.finishBuilding(limeTypeDefToMap)

        val result = modelBuilder.getFinalResult(CMap::class.java)
        assertEquals("Foo_Bar", result.name)
        assertEquals(cppTypeInfo, result.keyType)
        assertEquals(cppValueTypeInfo, result.valueType)
        assertEquals(fooInclude, result.include)
    }

    @Test
    fun finishBuildingTypeDefToMapWithEnumKey() {
        val cppKeyTypeInfo = CppTypeInfo(CType.BOOL, CppTypeInfo.TypeCategory.ENUM)
        every { typeMapper.mapType(any()) }.returnsMany(cppKeyTypeInfo, cppTypeInfo)
        every { cppIncludeResolver.resolveIncludes(limeTypeDefToMap) } returns listOf(fooInclude)
        every { typeMapper.enumHashType } returns "nonsenseHash"

        modelBuilder.finishBuilding(limeTypeDefToMap)

        val result = modelBuilder.getFinalResult(CMap::class.java)
        assertEquals("nonsenseHash", result.enumHashType)
    }

    @Test
    fun finishBuildingTypeDefToMapWithArrayValue() {
        every { typeMapper.mapType(any()) }.returnsMany(cppTypeInfo, cppArrayTypeInfo)
        every { cppIncludeResolver.resolveIncludes(limeTypeDefToMap) } returns listOf(fooInclude)

        modelBuilder.finishBuilding(limeTypeDefToMap)

        assertEquals(cppArrayTypeInfo, modelBuilder.arraysCollector.values.first().arrayType)
    }

    @Test
    fun finishBuildingTypeRef() {
        val limeElement = LimeBasicTypeRef.DOUBLE
        every { typeMapper.mapType(any()) } returns cppTypeInfo

        modelBuilder.finishBuilding(limeElement)

        val result = modelBuilder.getFinalResult(CppTypeInfo::class.java)
        assertEquals(cppTypeInfo, result)
    }

    @Test
    fun finishBuildingTypeRefToArray() {
        val limeElement = LimeBasicTypeRef.DOUBLE
        every { typeMapper.mapType(any()) } returns cppArrayTypeInfo

        modelBuilder.finishBuilding(limeElement)

        assertEquals(cppArrayTypeInfo, modelBuilder.arraysCollector.values.first().arrayType)
    }
}
