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

    def ignoreWhitespace(String text) {
        return text
            .replaceAll("\\[ \\t]", " ") // ignore multiple spaces/tabs
            .replaceAll("\n+", "\n") // ignore empty lines
            .replaceAll("^\\s+","") // ignore leading empty lines
    }

    def checkAndStripCopyright(String text) {
        val copyright = '''
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
        '''
        assertTrue(text.startsWith(copyright))
        return text.substring(copyright.length)
    }

    def assertEqualContent(String expected, String actual) {
        val actualContent = checkAndStripCopyright(actual)
        assertEquals(ignoreWhitespace(expected), ignoreWhitespace(actualContent))
    }

    @Test
    def simpleInterfaceGeneration() {
        val swiftClass = new SwiftClass("ExampleClass", null)
        val expected = '''
            public class ExampleClass {

            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def interfaceWithCommentGeneration() {
        val swiftClass = new SwiftClass("ExampleClassWithComment", null) => [
            comment = "One really classy example"
        ]
        val expected = '''
            /**
             One really classy example
             */
            public class ExampleClassWithComment {

            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def simpleMethodGeneration() {
        val swiftClass = new SwiftClass("ExampleClass", null) => [
            methods = #[new SwiftMethod("myMethod",
                #[new SwiftMethodParameter("parameter", new SwiftType("Int"))]) => [
                    returnType = new SwiftType("Int")
                ]
            ]
        ]
        val expected = '''
            public class ExampleClass {

                public func myMethod(parameter: Int) -> Int {
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def methodParameterDifferentInterfaceAndVariableName() {
        val swiftClass = new SwiftClass("ExampleClass", null) => [
            methods = #[new SwiftMethod("myMethod",
                #[new SwiftMethodParameter("parameterInterfaceName", new SwiftType("Int"), "parameterVariableName")])
            ]
        ]
        val expected = '''
            public class ExampleClass {

                public func myMethod(parameterInterfaceName parameterVariableName: Int) {
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def methodWithMultipleParameters() {
        val swiftClass = new SwiftClass("ExampleClass", null) => [
            methods = #[new SwiftMethod("myMethod",
                #[new SwiftMethodParameter("parameterOne", new SwiftType("Int")),
                  new SwiftMethodParameter("parameterTwo", new SwiftType("String"))
                ])
            ]
        ]
        val expected = '''
            public class ExampleClass {

                public func myMethod(parameterOne: Int, parameterTwo: String) {
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def methodWithComment() {
        val swiftClass = new SwiftClass("CommentedExampleClass", null) => [
            methods = #[new SwiftMethod("myMethod",
                #[new SwiftMethodParameter("myParameter", new SwiftType("String"))]) => [
                    returnType = new SwiftType("Int")
                    comment = "Do something"
                ]
            ]
        ]
        val expected = '''
            public class CommentedExampleClass {
                /**
                 Do something
                 */
                public func myMethod(myParameter: String) -> Int {
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def staticMethod() {
        val swiftClass = new SwiftClass("MyClass", null) => [
            methods = #[new SwiftMethod("myStaticMethod") => [
                    isStatic = true
                ]
            ]
        ]
        val expected = '''
            public class MyClass {
                static func myStaticMethod() {
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def systemImport() {
        val swiftClass = new SwiftClass("SomeClass", null) => [
            includes = #[new SwiftIncludes() => [
                    type = SwiftIncludes.Type.SYSTEM
                    path = "Foundation"
                ]
            ]
        ]

        val expected = '''
            import Foundation

            public class SomeClass {
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def helloWorldGeneration() {
        val swiftClass = new SwiftClass("HelloWorld", null) => [
            includes = #[new SwiftIncludes() => [
                    type = SwiftIncludes.Type.SYSTEM
                    path = "Foundation"
                ]
            ]
            methods = #[new SwiftMethod("helloWorldMethod", #[
                    new SwiftMethodParameter("inputString",
                        new SwiftType("String"))
                ]) => [
                    returnType = new SwiftType("String")
                    isStatic = true
                ]
            ]
        ]
        val expected = '''
            import Foundation

            public class HelloWorld {
                static func helloWorldMethod(inputString: String) -> String {
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

}
