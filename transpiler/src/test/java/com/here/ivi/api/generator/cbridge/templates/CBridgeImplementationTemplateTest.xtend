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
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cmodel.CParameter
import org.junit.rules.TemporaryFolder
import org.junit.Rule
import static com.here.ivi.api.test.TemplateComparison.assertEqualImplementationContent

@RunWith(typeof(XtextRunner))
class CBridgeImplementationTemplateTest {

    @Rule public val tempFolder = new TemporaryFolder;

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
}
