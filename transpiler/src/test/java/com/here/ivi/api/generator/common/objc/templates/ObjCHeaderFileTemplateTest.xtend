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

package com.here.ivi.api.generator.common.objc.templates

import org.eclipse.xtext.junit4.XtextRunner;
import org.junit.Test;
import org.junit.runner.RunWith;
import com.here.ivi.api.generator.objc.model.ObjCClass
import com.here.ivi.api.generator.objc.templates.ObjCHeaderFileTemplate
import static org.junit.Assert.*
import com.here.ivi.api.generator.objc.model.ObjCMethod
import com.here.ivi.api.generator.objc.model.ObjCMethodParameter
import com.here.ivi.api.generator.objc.model.ObjCType
import com.here.ivi.api.generator.objc.model.ObjCIncludes

@RunWith(typeof(XtextRunner))
class ObjCHeaderFileTemplateTest {

    @Test
    def simpleInterfaceGeneration() {
        val objCClass = new ObjCClass("ExampleClass", null)
        val expected = '''
            //
            //  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).
            //
            //  All rights reserved. This software and other materials contain
            //  proprietary information of HERE and are protected by applicable
            //  copyright legislation. Any use and utilization of this software
            //  and other materials and disclosure to any third parties is
            //  conditional upon having a separate agreement with HERE for the
            //  use, utilization or disclosure of this software. In the absence
            //  of such agreement, the use of the software is not allowed.
            //
            //  Automatically generated. Do not modify. Your changes will be lost.

            @interface ExampleClass


            @end
        '''

        val generated = ObjCHeaderFileTemplate.generate(objCClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def interfaceWithCommentGeneration() {
        val objCClass = new ObjCClass("ExampleClass", null) => [
            comment = "One really classy example"
        ]
        val expected = '''
            //
            //  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).
            //
            //  All rights reserved. This software and other materials contain
            //  proprietary information of HERE and are protected by applicable
            //  copyright legislation. Any use and utilization of this software
            //  and other materials and disclosure to any third parties is
            //  conditional upon having a separate agreement with HERE for the
            //  use, utilization or disclosure of this software. In the absence
            //  of such agreement, the use of the software is not allowed.
            //
            //  Automatically generated. Do not modify. Your changes will be lost.

            /**
             * One really classy example
             */
            @interface ExampleClass


            @end
        '''

        val generated = ObjCHeaderFileTemplate.generate(objCClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def simpleMethodGeneration() {
        val objCClass = new ObjCClass("ExampleClass", null) => [
            methods = #[new ObjCMethod(
                #[new ObjCMethodParameter("myMethod", new ObjCType("int"), "input")]) => [
                    returnType = new ObjCType("int")
                ]
            ]
        ]
        val expected = '''
            //
            //  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).
            //
            //  All rights reserved. This software and other materials contain
            //  proprietary information of HERE and are protected by applicable
            //  copyright legislation. Any use and utilization of this software
            //  and other materials and disclosure to any third parties is
            //  conditional upon having a separate agreement with HERE for the
            //  use, utilization or disclosure of this software. In the absence
            //  of such agreement, the use of the software is not allowed.
            //
            //  Automatically generated. Do not modify. Your changes will be lost.

            @interface ExampleClass

            -(int)myMethod:(int) input;

            @end
        '''

        val generated = ObjCHeaderFileTemplate.generate(objCClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def methodWithComment() {
        val objCClass = new ObjCClass("ExampleClass", null) => [
            methods = #[new ObjCMethod(
                #[new ObjCMethodParameter("myMethod", new ObjCType("int"), "input")]) => [
                    returnType = new ObjCType("int")
                    comment = "Do something"
                ]
            ]
        ]
        val expected = '''
            //
            //  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).
            //
            //  All rights reserved. This software and other materials contain
            //  proprietary information of HERE and are protected by applicable
            //  copyright legislation. Any use and utilization of this software
            //  and other materials and disclosure to any third parties is
            //  conditional upon having a separate agreement with HERE for the
            //  use, utilization or disclosure of this software. In the absence
            //  of such agreement, the use of the software is not allowed.
            //
            //  Automatically generated. Do not modify. Your changes will be lost.

            @interface ExampleClass

            /**
             * Do something
             */
            -(int)myMethod:(int) input;

            @end
        '''

        val generated = ObjCHeaderFileTemplate.generate(objCClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def helloWorldGeneration() {
        val objCClass = new ObjCClass("HelloWorld", "NSObject") => [
            includes = #[new ObjCIncludes() => [
                    type = ObjCIncludes.Type.SYSTEM
                    path = "Foundation/Foundation.h"
                ]
            ]
            methods = #[new ObjCMethod(#[
                    new ObjCMethodParameter("helloWorldMethod",
                        new ObjCType("NSString", ObjCType.Subtype.POINTER), "inputString")
                ]) => [
                    returnType = new ObjCType("NSString", ObjCType.Subtype.POINTER)
                    isStatic = true
                ]
            ]
        ]
        val expected = '''
            //
            //  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).
            //
            //  All rights reserved. This software and other materials contain
            //  proprietary information of HERE and are protected by applicable
            //  copyright legislation. Any use and utilization of this software
            //  and other materials and disclosure to any third parties is
            //  conditional upon having a separate agreement with HERE for the
            //  use, utilization or disclosure of this software. In the absence
            //  of such agreement, the use of the software is not allowed.
            //
            //  Automatically generated. Do not modify. Your changes will be lost.

            #import <Foundation/Foundation.h>

            @interface HelloWorld : NSObject

            +(NSString *)helloWorldMethod:(NSString *) inputString;

            @end
        '''

        val generated = ObjCHeaderFileTemplate.generate(objCClass)

        assertEquals(expected, generated.toString)
    }

}
