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

package com.here.ivi.api.generator.cbridge.templates

import org.eclipse.xtext.junit4.XtextRunner;
import org.junit.Test;
import org.junit.runner.RunWith;
import com.here.ivi.api.model.cmodel.CInterface
import com.here.ivi.api.model.cmodel.CFunction
import com.here.ivi.api.model.cmodel.CType
import com.here.ivi.api.model.cmodel.CPointerType
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cmodel.CParameter
import com.here.ivi.api.generator.cbridge.CppTypeInfo
import com.here.ivi.api.model.cmodel.CStruct
import static com.here.ivi.api.test.TemplateComparison.assertEqualHeaderContent
import static org.mockito.Mockito.mock;

@RunWith(typeof(XtextRunner))
class CBridgeHeaderTemplateTest {

    @Test
    def systemInclude() {
        val cInterface = new CInterface() => [
            headerIncludes = #{Include.createSystemInclude("header.h")}
        ]
        val expected = '''
            #include <header.h>
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface).toString

        assertEqualHeaderContent(expected, generated)
    }

    @Test
    def projectInclude() {
        val cInterface = new CInterface() => [
            headerIncludes = #{Include.createInternalInclude("header.h")}
        ]
        val expected = '''
            #include "header.h"
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface).toString

        assertEqualHeaderContent(expected, generated)
    }

    @Test
    def function() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("functionName").build()]

        ]
        val expected = '''
        void functionName();
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface)

        assertEqualHeaderContent(expected, generated.toString)
    }

    @Test
    def functionWithOneParameter() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("parameterFunctionName")
                 .parameters(#[new CParameter("one", CType.INT32)])
                 .build()
             ]
        ]
        val expected = '''
        void parameterFunctionName(int32_t one);
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface)

        assertEqualHeaderContent(expected, generated.toString)
    }

    @Test
    def functionWithTwoParameters() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("doubleFunction")
                 .parameters(#[
                     new CParameter("first", CType.INT16),
                     new CParameter("second", CType.DOUBLE)])
                 .build()
             ]
        ]
        val expected = '''
        void doubleFunction(int16_t first, double second);
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface)

        assertEqualHeaderContent(expected, generated.toString)
    }

    @Test
    def functionWithReturnValue() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("returner")
                 .returnType(CType.FLOAT)
                 .build()
             ]
        ]
        val expected = '''
        float returner();
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface)

        assertEqualHeaderContent(expected, generated.toString)
    }

    @Test
    def helloWorldTest() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("HelloWorldStub_HelloWorldMethod")
                 .returnType(CPointerType.CONST_CHAR_PTR)
                 .parameters(#[new CParameter("inputString",CPointerType.CONST_CHAR_PTR)])
                 .build()
             ]
        ]
        val expected = '''
        const char* HelloWorldStub_HelloWorldMethod(const char* inputString);
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface)

        assertEqualHeaderContent(expected, generated.toString)
    }

    @Test
    def emptyStructsDefinition() {
        val fakeType = mock(CType);
        fakeType.includes = newHashSet();
        val cppTypeInfo = new CppTypeInfo(fakeType);
        val cInterface = new CInterface() => [
            structs = #[
                new CStruct("Struct1NameRef", "Struct1Name", "BaseAPIStruct1Name", cppTypeInfo),
                new CStruct("Struct2NameRef", "Struct2Name", "BaseAPIStruct2Name", cppTypeInfo)
            ]
        ]
        val expected = '''
            typedef struct {
                void* const private_pointer;
            } Struct1NameRef;

            typedef struct {
                void* const private_pointer;
            } Struct2NameRef;
        '''

        val generated = CBridgeHeaderTemplate.generate(cInterface).toString

        assertEqualHeaderContent(expected, generated)
    }
}
