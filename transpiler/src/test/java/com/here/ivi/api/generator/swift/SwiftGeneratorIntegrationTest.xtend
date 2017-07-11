/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.swift

import org.junit.Test
import org.mockito.Mock
import static org.mockito.Mockito.*
import static extension org.mockito.MockitoAnnotations.initMocks
import org.junit.Before
import static org.junit.Assert.*
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory
import static org.junit.Assert.*
import static com.here.ivi.api.generator.utils.LoadModelHelper.readInFrancaModel
import static extension com.here.ivi.api.generator.utils.LoadModelHelper.extractNthInterfaceFromModel

class SwiftGeneratorIntegrationTest {
    @Mock private SwiftNameRules nameRules
    @Mock private SwiftIncludeResolver includeResolver
    private static val TEST_FIDL_FILE = "swift/fidl/test/SwiftGeneratorTest.fdepl"
    private val francaModel = readInFrancaModel(TEST_FIDL_FILE, new BaseApiSpecAccessorFactory)
    private extension SwiftGenerator generator
    private val CLASS_NAME = "MockedClassName"
    private val METHOD_NAME = "MockedMethodName"
    private val PARAM_NAME = "MockedParameterName"

    @Before
    def void setUp() {
        initMocks;
        generator = new SwiftGenerator(nameRules, includeResolver)
        when(nameRules.getClassName(any())).thenReturn(CLASS_NAME)
        when(nameRules.getMethodName(any())).thenReturn(METHOD_NAME)
        when(nameRules.getParameterName(any())).thenReturn(PARAM_NAME)
    }

    @Test
    def modelForIfaceWithStaticMethod() {
        val clazz = francaModel.extractNthInterfaceFromModel(6).buildSwiftModel

        assertNotNull(clazz.methods)
        assertEquals(1, clazz.methods.size)
        val method = clazz.methods.get(0)

        assertTrue(method.isStatic)
    }

    @Test
    def modelForIfaceWithTwoMethodsWithInAndOutParams() {
        val EXPECTED_NUMBER_OF_METHODS = 2
        val EXPECTED_NUMBER_OF_PARAMS = 2

        val clazz = francaModel.extractNthInterfaceFromModel(5).buildSwiftModel

        assertNotNull(clazz.methods)
        assertEquals(EXPECTED_NUMBER_OF_METHODS, clazz.methods.size)
        for (method : clazz.methods) {
            assertNotNull(method.parameters)
            assertEquals(EXPECTED_NUMBER_OF_PARAMS, method.parameters.size)
            for (param : method.parameters) {
                assertNotNull(param)
                assertEquals(PARAM_NAME, param.name)
            }
            assertNotNull(method.returnType)
            assertEquals("String", method.returnType.name)
        }
    }

    @Test
    def modelForIfaceWithOneMethodWithOutParam() {
        val clazz = francaModel.extractNthInterfaceFromModel(4).buildSwiftModel

        assertNotNull(clazz.methods)
        assertEquals(1, clazz.methods.size)
        val method = clazz.methods.get(0)

        assertNotNull(method.returnType)
        assertEquals("String", method.returnType.name)
    }

    @Test
    def modelForIfaceWithOneMethodWithMultipleInParams() {
        val EXPECTED_NUMBER_OF_PARAMS = 3

        val clazz = francaModel.extractNthInterfaceFromModel(3).buildSwiftModel

        assertNotNull(clazz.methods)
        assertEquals(1, clazz.methods.size)
        val method = clazz.methods.get(0)

        assertNotNull(method.parameters)
        assertEquals(EXPECTED_NUMBER_OF_PARAMS, method.parameters.size)
        for (param : method.parameters) {
            assertNotNull(param)
            assertEquals(PARAM_NAME, param.name)
        }
    }

    @Test
    def modelForIfaceWithOneMethodWithOneInParam() {
        val clazz = francaModel.extractNthInterfaceFromModel(2).buildSwiftModel

        assertNotNull(clazz.methods)
        assertEquals(1, clazz.methods.size)
        val method = clazz.methods.get(0)

        assertEquals(METHOD_NAME, method.name)
        assertTrue(method.comment.isEmpty)
        assertFalse(method.isStatic)

        assertNotNull(method.parameters)
        assertEquals(1, method.parameters.size)
        val param = method.parameters.get(0)

        assertNotNull(param)
        assertEquals(PARAM_NAME, param.name)
    }

    @Test
    def modelForIfaceWithOneSimpleMethod() {
        val clazz = francaModel.extractNthInterfaceFromModel(1).buildSwiftModel

        assertNull(clazz.parentClass)
        assertNotNull(clazz.comment)
        assertTrue(clazz.comment.isEmpty)
        assertNotNull(clazz.implementsProtocols)
        assertTrue(clazz.implementsProtocols.isEmpty)
        assertNotNull(clazz.properties)
        assertTrue(clazz.properties.isEmpty)
        assertNotNull(clazz.imports)
        assertEquals("By default it should not include anything", 0, clazz.imports.size)
        assertEquals("The base namespace should be set to its c_bridge class", "swift_fidl_test", clazz.nameSpace)
        assertEquals(CLASS_NAME, clazz.name)

        assertNotNull(clazz.methods)
        assertEquals(1, clazz.methods.size)
        val method = clazz.methods.get(0)

        assertEquals(METHOD_NAME, method.name)
        assertTrue(method.parameters.isEmpty)
        assertTrue(method.comment.isEmpty)
        assertFalse(method.isStatic)
    }

    @Test
    def modelForIfaceWithoutElements() {
        val clazz = francaModel.extractNthInterfaceFromModel(0).buildSwiftModel

        assertNull(clazz.parentClass)
        assertNotNull(clazz.methods)
        assertTrue(clazz.methods.isEmpty)
        assertNotNull(clazz.comment)
        assertTrue(clazz.comment.isEmpty)
        assertNotNull(clazz.implementsProtocols)
        assertTrue(clazz.implementsProtocols.isEmpty)
        assertNotNull(clazz.properties)
        assertTrue(clazz.properties.isEmpty)
        assertNotNull(clazz.imports)
        assertEquals("By default it should not include anything", 0, clazz.imports.size)
        assertEquals("The base namespace should be set to its c_bridge class", "swift_fidl_test", clazz.nameSpace)
        assertEquals(CLASS_NAME, clazz.name)
    }

}
