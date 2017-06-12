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

package com.here.ivi.api.generator.common.swift.templates

import org.eclipse.xtext.junit4.XtextRunner;
import org.junit.Test;
import org.junit.runner.RunWith;
import com.here.ivi.api.model.swift.SwiftClass
import com.here.ivi.api.generator.swift.templates.SwiftFileTemplate
import static org.junit.Assert.*
import com.here.ivi.api.model.swift.SwiftMethod
import com.here.ivi.api.model.swift.SwiftMethodParameter
import com.here.ivi.api.model.swift.SwiftType
import com.here.ivi.api.model.swift.SwiftIncludes

@RunWith(typeof(XtextRunner))
class SwiftFileTemplateTest {

    @Test
    def simpleInterfaceGeneration() {
        val swiftClass = new SwiftClass("ExampleClass", null)
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

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def interfaceWithCommentGeneration() {
        val swiftClass = new SwiftClass("ExampleClass", null) => [
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

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def simpleMethodGeneration() {
        val swiftClass = new SwiftClass("ExampleClass", null) => [
            methods = #[new SwiftMethod(
                #[new SwiftMethodParameter("myMethod", new SwiftType("int"), "input")]) => [
                    returnType = new SwiftType("int")
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

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def methodWithComment() {
        val swiftClass = new SwiftClass("ExampleClass", null) => [
            methods = #[new SwiftMethod(
                #[new SwiftMethodParameter("myMethod", new SwiftType("int"), "input")]) => [
                    returnType = new SwiftType("int")
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

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEquals(expected, generated.toString)
    }

    @Test
    def helloWorldGeneration() {
        val swiftClass = new SwiftClass("HelloWorld", "NSObject") => [
            includes = #[new SwiftIncludes() => [
                    type = SwiftIncludes.Type.SYSTEM
                    path = "Foundation/Foundation.h"
                ]
            ]
            methods = #[new SwiftMethod(#[
                    new SwiftMethodParameter("helloWorldMethod",
                        new SwiftType("NSString", SwiftType.Subtype.POINTER), "inputString")
                ]) => [
                    returnType = new SwiftType("NSString", SwiftType.Subtype.POINTER)
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

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEquals(expected, generated.toString)
    }

}
