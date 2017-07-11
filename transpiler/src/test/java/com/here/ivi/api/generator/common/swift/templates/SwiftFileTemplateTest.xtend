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
import com.here.ivi.api.model.swift.SwiftMethod
import com.here.ivi.api.model.swift.SwiftParameter
import com.here.ivi.api.model.swift.SwiftType
import com.here.ivi.api.model.swift.SwiftArrayType
import static com.here.ivi.api.test.TemplateComparison.assertEqualContent

@RunWith(typeof(XtextRunner))
class SwiftFileTemplateTest {
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
             * One really classy example
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
                #[new SwiftParameter("parameter", new SwiftType("Int"))]) => [
                    returnType = new SwiftType("Int")
                ]
            ]
            nameSpace = "myPackage"

        ]
        val expected = '''
            public class ExampleClass {

                public func myMethod(parameter: Int) -> Int {
                    let c_parameter = parameter
                    return myPackage_ExampleClass_myMethod(c_parameter)
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
                #[new SwiftParameter("parameterInterfaceName", new SwiftType("Int"), "parameterVariableName")])
            ]
        ]
        val expected = '''
            public class ExampleClass {

                public func myMethod(parameterInterfaceName parameterVariableName: Int) -> Void {
                    let c_parameterVariableName = parameterVariableName
                    return ExampleClass_myMethod(c_parameterVariableName)
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
                #[new SwiftParameter("parameterOne", new SwiftType("Int")),
                  new SwiftParameter("parameterTwo", new SwiftType("String"))
                ])
            ]
        ]
        val expected = '''
            public class ExampleClass {

                public func myMethod(parameterOne: Int, parameterTwo: String) -> Void {
                    let c_parameterOne = parameterOne
                    let c_parameterTwo = parameterTwo
                    return ExampleClass_myMethod(c_parameterOne, c_parameterTwo)
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def methodWithArrayParameter() {
        val swiftClass = new SwiftClass("MyClass", null) => [
            methods = #[new SwiftMethod("myMethod", #[new SwiftParameter("array", new SwiftArrayType("UInt8"))])]
        ]
        val expected = '''
            public class MyClass {
                public func myMethod(array: [UInt8]) -> Void {
                    let c_array = array
                    return MyClass_myMethod(c_array)
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
                #[new SwiftParameter("myParameter", new SwiftType("String"))]) => [
                    returnType = new SwiftType("Int")
                    comment = "Do something"
                ]
            ]
        ]
        val expected = '''
            public class CommentedExampleClass {
                /**
                 * Do something
                 */
                public func myMethod(myParameter: String) -> Int {
                    let c_myParameter = myParameter
                    return CommentedExampleClass_myMethod(c_myParameter)
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
                public static func myStaticMethod() -> Void {
                    return MyClass_myStaticMethod()
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

    @Test
    def systemImport() {
        val swiftClass = new SwiftClass("SomeClass", null) => [
            imports = #["Foundation"]
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
            imports = #["Foundation"]
            methods = #[new SwiftMethod("helloWorldMethod", #[
                    new SwiftParameter("inputString",
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
                public static func helloWorldMethod(inputString: String) -> String {
                    let c_inputString = inputString
                    return {
                        if let handler = HelloWorld_helloWorldMethod(c_inputString) {
                            let ret_value = String(cString:HelloWorld_helloWorldMethod_getData(handler))
                            HelloWorld_helloWorldMethod_release(handler)
                            return ret_value
                        }
                        else {
                            return ""
                        }
                    }()
                }
            }
        '''

        val generated = SwiftFileTemplate.generate(swiftClass)

        assertEqualContent(expected, generated.toString)
    }

}
