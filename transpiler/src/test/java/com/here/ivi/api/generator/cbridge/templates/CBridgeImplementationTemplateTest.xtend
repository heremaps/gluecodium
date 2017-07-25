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
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cmodel.CParameter
import org.junit.rules.TemporaryFolder
import org.junit.Rule
import static com.here.ivi.api.test.TemplateComparison.assertEqualImplementationContent
import com.here.ivi.api.model.cmodel.CStruct

@RunWith(typeof(XtextRunner))
class CBridgeImplementationTemplateTest {

    @Rule public val tempFolder = new TemporaryFolder;

    @Test
    def systemInclude() {
        val cInterface = new CInterface() => [
            implementationIncludes = #{Include.createSystemInclude("header.h")}
        ]
        val expected = '''
            #include <header.h>
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def projectInclude() {
        val cInterface = new CInterface() => [
            implementationIncludes = #{Include.createInternalInclude("header.h")}
        ]
        val expected = '''
            #include "header.h"
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def function() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("functionName").delegateCallTemplate("functionDelegate()").build()]

        ]
        val expected = '''
        void functionName() {
            functionDelegate();
        }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def functionWithOneParameter() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("parameterFunctionName")
                    .parameters(#[new CParameter("one", CType.INT32)])
                    .delegateCallTemplate("delegator(%1$s)")
                    .build()
             ]
        ]
        val expected = '''
        void parameterFunctionName(int32_t one) {
            auto cpp_one = one;
            delegator(cpp_one);
        }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def functionWithTwoParameters() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("doubleFunction")
                 .parameters(#[
                     new CParameter("first", CType.INT16),
                     new CParameter("second", CType.DOUBLE)])
                 .delegateCallTemplate("namespacy::classy::doubleFunction(%1$s, %2$s)")
                 .build()
             ]
        ]
        val expected = '''
        void doubleFunction(int16_t first, double second) {
            auto cpp_first = first;
            auto cpp_second = second;
            namespacy::classy::doubleFunction(cpp_first, cpp_second);
        }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def functionWithReturnValue() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction.Builder("returner")
                    .returnType(CType.FLOAT)
                    .delegateCallTemplate("delegate()")
                    .build()
             ]
        ]
        val expected = '''
        float returner() {
            {
                auto&& cpp_result = delegate();
                return cpp_result;
            }
        }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def structDefinition() {
        val cInterface = new CInterface() => [
            structs = #[
                new CStruct("Struct1Name", "BaseAPIStruct1Name"),
                new CStruct("Struct2Name", "BaseAPIStruct2Name")
            ]
        ]
        val expected = '''
            BaseAPIStruct1Name* get_pointer(Struct1NameRef handle) {
                return static_cast<BaseAPIStruct1Name*>(handle.private_pointer);
            }
            BaseAPIStruct2Name* get_pointer(Struct2NameRef handle) {
                return static_cast<BaseAPIStruct2Name*>(handle.private_pointer);
            }

            Struct1NameRef Struct1Name_create() {
                return {new BaseAPIStruct1Name};
            }

            void Struct1Name_release(Struct1NameRef handle) {
                delete get_pointer(handle);
            }

            Struct2NameRef Struct2Name_create() {
                return {new BaseAPIStruct2Name};
            }

            void Struct2Name_release(Struct2NameRef handle) {
                delete get_pointer(handle);
            }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface).toString

        assertEqualImplementationContent(expected, generated)
    }
}
