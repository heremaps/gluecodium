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

package com.here.ivi.api.generator.swift.templates;

import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

import com.here.ivi.api.model.swift.SwiftArrayType;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import com.here.ivi.api.model.swift.SwiftStruct;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.model.swift.SwiftType.TypeCategory;
import com.here.ivi.api.test.TemplateComparison;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Stream;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@SuppressWarnings("all")
public class SwiftFileTemplateTest {

  private static String generate(SwiftClass swiftClass) {
    return SwiftFileTemplate.generate(swiftClass).toString();
  }

  @Test
  public void simpleInterfaceGeneration() {
    final SwiftClass swiftClass = new SwiftClass("ExampleClass", null);
    final String expected = "public class ExampleClass {\n" + "\n" + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void interfaceWithCommentGeneration() {
    SwiftClass swiftClass = new SwiftClass("ExampleClassWithComment", null);
    swiftClass.comment = "One really classy example";
    final String expected =
        "/**\n"
            + " * One really classy example\n"
            + " */\n"
            + "public class ExampleClassWithComment {\n"
            + "\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void simpleMethodGeneration() {
    SwiftClass swiftClass = new SwiftClass("ExampleClass", null);
    swiftClass.nameSpace = "myPackage";
    SwiftMethod method =
        new SwiftMethod(
            "myMethod",
            Collections.singletonList(new SwiftParameter("parameter", new SwiftType("Int"))));
    swiftClass.methods = Collections.singletonList(method);
    method.returnType = new SwiftType("Int");
    final String expected =
        "public class ExampleClass {\n"
            + "\n"
            + "    public func myMethod(parameter: Int) -> Int {\n"
            + "        return myPackage_ExampleClass_myMethod(parameter)\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodParameterDifferentInterfaceAndVariableName() {
    SwiftClass swiftClass = new SwiftClass("ExampleClass", null);
    SwiftMethod method =
        new SwiftMethod(
            "myMethod",
            Collections.singletonList(
                new SwiftParameter(
                    "parameterInterfaceName", new SwiftType("Int"), "parameterVariableName")));
    swiftClass.methods = Collections.singletonList(method);

    final String expected =
        "public class ExampleClass {\n"
            + "\n"
            + "    public func myMethod(parameterInterfaceName parameterVariableName: Int) -> Void {\n"
            + "        return ExampleClass_myMethod(parameterVariableName)\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithMultipleParameters() {
    SwiftClass swiftClass = new SwiftClass("ExampleClass", null);
    SwiftParameter parameterOne = new SwiftParameter("parameterOne", new SwiftType("Int"));
    SwiftParameter parameterTwo = new SwiftParameter("parameterTwo", new SwiftType("String"));
    SwiftMethod method = new SwiftMethod("myMethod", Arrays.asList(parameterOne, parameterTwo));
    swiftClass.methods = Collections.singletonList(method);
    final String expected =
        "public class ExampleClass {\n"
            + "\n"
            + "    public func myMethod(parameterOne: Int, parameterTwo: String) -> Void {\n"
            + "        return ExampleClass_myMethod(parameterOne, parameterTwo)\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithArrayParameter() {
    SwiftClass swiftClass = new SwiftClass("MyClass", null);
    SwiftMethod method =
        new SwiftMethod(
            "myMethod",
            Collections.singletonList(new SwiftParameter("array", new SwiftArrayType("UInt8"))));
    swiftClass.methods = Collections.singletonList(method);
    final String expected =
        "public class MyClass {\n"
            + "    public func myMethod(array: [UInt8]) -> Void {\n"
            + "        return MyClass_myMethod(array)\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithComment() {
    SwiftClass swiftClass = new SwiftClass("CommentedExampleClass", null);
    SwiftMethod method =
        new SwiftMethod(
            "myMethod",
            Collections.singletonList(new SwiftParameter("myParameter", new SwiftType("String"))));

    method.returnType = new SwiftType("Int");
    method.comment = "Do something";
    swiftClass.methods = Collections.singletonList(method);
    final String expected =
        "public class CommentedExampleClass {\n"
            + "    /**\n"
            + "     * Do something\n"
            + "     */\n"
            + "    public func myMethod(myParameter: String) -> Int {\n"
            + "        return CommentedExampleClass_myMethod(myParameter)\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void staticMethod() {
    SwiftClass swiftClass = new SwiftClass("MyClass", null);
    SwiftMethod method = new SwiftMethod("myStaticMethod");
    method.isStatic = true;
    swiftClass.methods = Collections.singletonList(method);

    final String expected =
        "public class MyClass {\n"
            + "    public static func myStaticMethod() -> Void {\n"
            + "        return MyClass_myStaticMethod()\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void systemImport() {
    SwiftClass swiftClass = new SwiftClass("SomeClass", null);
    swiftClass.imports = Collections.singletonList("Foundation");
    final String expected = "import Foundation\n" + "\n" + "public class SomeClass {\n" + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void helloWorldGeneration() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld", null);
    swiftClass.imports = Collections.singletonList("Foundation");
    SwiftMethod method =
        new SwiftMethod(
            "helloWorldMethod",
            Collections.singletonList(new SwiftParameter("inputString", SwiftType.String)));
    method.returnType = new SwiftType("String", TypeCategory.BUILTIN_STRING, true);
    method.isStatic = true;
    swiftClass.methods = Collections.singletonList(method);
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func helloWorldMethod(inputString: String) -> String? {\n"
            + "        let result_string_handle = HelloWorld_helloWorldMethod(inputString)\n"
            + "        defer {\n"
            + "            std_string_release(result_string_handle)\n"
            + "        }\n"
            + "        if let ret_value = String(data: Data(bytes: std_string_data_get(result_string_handle),\n"
            + "                                             count: Int(std_string_size_get(result_string_handle))), encoding: .utf8) {\n"
            + "            return ret_value\n"
            + "        }\n"
            + "        return nil\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithByteBufferInput() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld");
    SwiftParameter swiftParameter = new SwiftParameter("byteBuffer", SwiftType.Data);
    SwiftMethod method =
        new SwiftMethod("testBuffer", new ArrayList<>(Arrays.asList(swiftParameter)));
    method.isStatic = true;
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func testBuffer(byteBuffer: Data) -> Void {\n"
            + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Void in\n"
            + "            return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count))\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    swiftClass.methods = new ArrayList<>(Arrays.asList(method));
    swiftClass.imports = new ArrayList<>(Arrays.asList("Foundation"));
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithByteBufferInputAndDifferentVariableName() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld");
    SwiftParameter swiftParameter = new SwiftParameter("data", SwiftType.Data, "byteBuffer");
    SwiftMethod method =
        new SwiftMethod("testBuffer", new ArrayList<>(Arrays.asList(swiftParameter)));
    method.isStatic = true;
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func testBuffer(data byteBuffer: Data) -> Void {\n"
            + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Void in\n"
            + "            return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count))\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    swiftClass.methods = new ArrayList<>(Arrays.asList(method));
    swiftClass.imports = new ArrayList<>(Arrays.asList("Foundation"));
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithMultipleByteBufferInputStringAndInteger() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld");
    SwiftParameter param1 = new SwiftParameter("byteBuffer", SwiftType.Data);
    SwiftParameter param2 = new SwiftParameter("text", SwiftType.String);
    SwiftParameter param3 = new SwiftParameter("number", new SwiftType("Int"));
    SwiftParameter param4 = new SwiftParameter("data2", SwiftType.Data);
    SwiftMethod method =
        new SwiftMethod(
            "testBuffer", new ArrayList<>(Arrays.asList(param1, param2, param3, param4)));
    method.isStatic = true;
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func testBuffer(byteBuffer: Data, text: String, number: Int, data2: Data) -> Void {\n"
            + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Void in\n"
            + "            return data2.withUnsafeBytes { (data2_ptr: UnsafePointer<UInt8>) -> Void in\n"
            + "                return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count), text, number, data2_ptr, Int64(data2.count))\n"
            + "            }\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    swiftClass.methods = new ArrayList<>(Arrays.asList(method));
    swiftClass.imports = new ArrayList<>(Arrays.asList("Foundation"));
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithMultipleByteBufferInputStringAndIntegerReturningData() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld");
    SwiftParameter param1 = new SwiftParameter("byteBuffer", SwiftType.Data);
    SwiftParameter param2 = new SwiftParameter("text", SwiftType.String);
    SwiftParameter param3 = new SwiftParameter("number", new SwiftType("Int"));
    SwiftParameter param4 = new SwiftParameter("data2", SwiftType.Data);
    SwiftMethod method =
        new SwiftMethod(
            "testBuffer", new ArrayList<>(Arrays.asList(param1, param2, param3, param4)));
    method.isStatic = true;
    method.returnType = new SwiftType("Data", SwiftType.TypeCategory.BUILTIN_BYTEBUFFER, true);
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func testBuffer(byteBuffer: Data, text: String, number: Int, data2: Data) -> Data? {\n"
            + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Data? in\n"
            + "            return data2.withUnsafeBytes { (data2_ptr: UnsafePointer<UInt8>) -> Data? in\n"
            + "                let result_data_handle = HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count), text, number, data2_ptr, Int64(data2.count))\n"
            + "                defer {\n"
            + "                    byteArray_release(result_data_handle)\n"
            + "                }\n"
            + "                let size = byteArray_size_get(result_data_handle)\n"
            + "                if size > 0 {\n"
            + "                    let data_handle = byteArray_data_get(result_data_handle)\n"
            + "                    if let data_handle = data_handle {\n"
            + "                        let return_data = Data(bytes: data_handle, count: Int(size))\n"
            + "                        return return_data\n"
            + "                    }\n"
            + "                }\n"
            + "                return nil\n"
            + "            }\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    swiftClass.methods = new ArrayList<>(Arrays.asList(method));
    swiftClass.imports = new ArrayList<>(Arrays.asList("Foundation"));
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void methodWithMultipleByteBufferInputStringAndIntegerReturningInt() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld");
    SwiftParameter param1 = new SwiftParameter("byteBuffer", SwiftType.Data);
    SwiftParameter param2 = new SwiftParameter("text", SwiftType.String);
    SwiftParameter param3 = new SwiftParameter("number", new SwiftType("Int"));
    SwiftParameter param4 = new SwiftParameter("data2", SwiftType.Data);
    SwiftMethod method =
        new SwiftMethod(
            "testBuffer", new ArrayList<>(Arrays.asList(param1, param2, param3, param4)));
    method.isStatic = true;
    method.returnType = new SwiftType("Int");
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func testBuffer(byteBuffer: Data, text: String, number: Int, data2: Data) -> Int {\n"
            + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Int in\n"
            + "            return data2.withUnsafeBytes { (data2_ptr: UnsafePointer<UInt8>) -> Int in\n"
            + "                return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count), text, number, data2_ptr, Int64(data2.count))\n"
            + "            }\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    swiftClass.methods = new ArrayList<>(Arrays.asList(method));
    swiftClass.imports = new ArrayList<>(Arrays.asList("Foundation"));
    final String generated = generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void staticMethodTakingStruct() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld", null);
    SwiftStruct swiftStruct = new SwiftStruct("SomeStruct");
    swiftStruct.cPrefix = swiftClass.name + "_" + swiftStruct.name;
    SwiftMethod method =
        new SwiftMethod(
            "methodTakingStruct", singletonList(new SwiftParameter("inputParam", swiftStruct)));
    method.isStatic = true;
    swiftClass.methods = singletonList(method);
    final String expected =
        "public class HelloWorld {\n"
            + "    public static func methodTakingStruct(inputParam: SomeStruct) -> Void {\n"
            + "        let inputParamHandle = inputParam.convertToCType()\n"
            + "        defer {\n"
            + "            HelloWorld_SomeStruct_release(inputParamHandle)\n"
            + "        }\n"
            + "        return HelloWorld_methodTakingStruct(inputParamHandle)\n"
            + "    }\n"
            + "}\n";
    String generated = SwiftFileTemplate.generate(swiftClass).toString();
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void staticMethodReturningStruct() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld", null);
    SwiftStruct swiftStruct = new SwiftStruct("SomeStruct");
    swiftStruct.optional = true;
    swiftStruct.cPrefix = swiftClass.name + "_" + swiftStruct.name;
    SwiftMethod method = new SwiftMethod("methodReturningStruct");
    method.isStatic = true;
    method.returnType = swiftStruct;
    swiftClass.methods = singletonList(method);
    final String expected =
        "public class HelloWorld {\n"
            + "    public static func methodReturningStruct() -> SomeStruct? {\n"
            + "        let cResult = HelloWorld_methodReturningStruct()\n"
            + "        defer {\n"
            + "            HelloWorld_SomeStruct_release(cResult)\n"
            + "        }\n"
            + "        return SomeStruct(cSomeStruct: cResult)\n"
            + "    }\n"
            + "}\n";
    String generated = SwiftFileTemplate.generate(swiftClass).toString();
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void staticMethodTakingMultipleParamsAndReturningStruct() {
    SwiftClass swiftClass = new SwiftClass("HelloWorld", null);
    SwiftStruct inputStruct = new SwiftStruct("GeoLocation");
    inputStruct.cPrefix = swiftClass.name + "_" + inputStruct.name;
    SwiftMethod method =
        new SwiftMethod(
            "fancyMethod",
            Stream.of(
                    new SwiftParameter("icon", SwiftType.Data),
                    new SwiftParameter("name", SwiftType.String),
                    new SwiftParameter("location", inputStruct))
                .collect(toList()));
    method.isStatic = true;
    SwiftStruct outputStruct = new SwiftStruct("SomeStruct");
    outputStruct.cPrefix = swiftClass.name + "_" + outputStruct.name;
    outputStruct.optional = true;
    method.returnType = outputStruct;
    swiftClass.methods = singletonList(method);

    final String expected =
        "public class HelloWorld {\n"
            + "    public static func fancyMethod(icon: Data, name: String, location: GeoLocation) -> SomeStruct? {\n"
            + "        return icon.withUnsafeBytes { (icon_ptr: UnsafePointer<UInt8>) -> SomeStruct? in\n"
            + "            let locationHandle = location.convertToCType()\n"
            + "            defer {\n"
            + "                HelloWorld_GeoLocation_release(locationHandle)\n"
            + "            }\n"
            + "            let cResult = HelloWorld_fancyMethod(icon_ptr, Int64(icon.count), name, locationHandle)\n"
            + "            defer {\n"
            + "                HelloWorld_SomeStruct_release(cResult)\n"
            + "            }\n"
            + "            return SomeStruct(cSomeStruct: cResult)\n"
            + "        }\n"
            + "    }\n"
            + "}\n";

    String generated = SwiftFileTemplate.generate(swiftClass).toString();
    TemplateComparison.assertEqualContent(expected, generated);
  }
}
