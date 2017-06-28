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
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cmodel.CParameter
import static com.here.ivi.api.test.TemplateComparison.assertEqualImplementationContent

@RunWith(typeof(XtextRunner))
class CBridgeImplementationTemplateTest {
    @Test
    def systemInclude() {
        val cInterface = new CInterface() => [
            implementationIncludes = #{new Includes.SystemInclude("header.h")}
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
            implementationIncludes = #{new Includes.InternalPublicInclude("header.h")}
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
             functions = #[new CFunction("functionName") => [ delegateName = "functionDelegate" ]]

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
             functions = #[new CFunction("parameterFunctionName", #[new CParameter("one", CType.INT32)]) => [
                     delegateName = "delegator"
                 ]
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
             functions = #[new CFunction("doubleFunction", #[
                     new CParameter("first", CType.INT16),
                     new CParameter("second", CType.DOUBLE)]) => [
                     delegateName = "namespacy::classy::doubleFunction"
                 ]
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
             functions = #[new CFunction("returner", CType.FLOAT) => [
                     delegateName = "delegate"
                 ]
             ]
        ]
        val expected = '''
        float returner() {
            {
                auto&& result = delegate();
                return result;
            }
        }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }

    @Test
    def helloWorldTest() {
         val cInterface = new CInterface() => [
             functions = #[new CFunction(
                         "HelloWorldStub_helloWorldMethod",
                         CPointerType.CONST_CHAR_PTR,
                         #[new CParameter("inputString", CPointerType.CONST_CHAR_PTR)]) => [
                     delegateName = "HelloWorldStub::helloWorldMethod"
                 ]
             ]
        ]
        val expected = '''
        const char* HelloWorldStub_helloWorldMethod(const char* inputString) {
            auto cpp_inputString = std::string(inputString);
            {
                auto&& result = HelloWorldStub::helloWorldMethod(cpp_inputString);
                return strdup(result.c_str());
            }
        }
        '''

        val generated = CBridgeImplementationTemplate.generate(cInterface)

        assertEqualImplementationContent(expected, generated.toString)
    }
}
