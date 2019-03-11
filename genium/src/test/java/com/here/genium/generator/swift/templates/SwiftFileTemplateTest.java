/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.swift.templates;

import static java.util.Collections.singletonList;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.swift.*;
import com.here.genium.model.swift.SwiftType.TypeCategory;
import com.here.genium.model.swift.SwiftValue;
import com.here.genium.test.TemplateComparator;
import com.here.genium.test.TemplateComparison;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@SuppressWarnings("all")
public class SwiftFileTemplateTest {

  private static String generateFromClass(SwiftClass swiftClass) {
    SwiftFile file = new SwiftFile();
    file.classes.add(swiftClass);
    return generate(file);
  }

  private static String generate(SwiftFile file) {
    return TemplateEngine.render("swift/File", file);
  }

  @Test
  public void simpleInterfaceGeneration() {
    final SwiftClass swiftClass = SwiftClass.builder("ExampleClass").isInterface(true).build();

    TemplateComparator.expect("public protocol ExampleClass : AnyObject {\n" + "}\n")
        .expect("internal class _ExampleClass: ExampleClass {")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void getRefFunctionIsGenerated() {
    final SwiftClass swiftClass =
        SwiftClass.builder("ExampleClass")
            .isInterface(true)
            .cInstance("CInstance")
            .functionTableName("ExampleFunctionTable")
            .build();
    swiftClass.implementsProtocols.add("ExampleClass");

    TemplateComparator.expect(
            "internal func getRef(_ ref: ExampleClass) -> RefHolder {\n"
                + "    if let instanceReference = ref as? NativeBase {\n"
                + "        return RefHolder(instanceReference.c_handle)\n"
                + "    }\n"
                + "    var functions = ExampleFunctionTable()\n"
                + "    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()\n"
                + "    functions.release = {swiftClass_pointer in\n"
                + "        if let swiftClass = swiftClass_pointer {\n"
                + "            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()\n"
                + "        }\n"
                + "    }\n"
                + "    let proxy = CInstance_createProxy(functions)\n"
                + "    return RefHolder(ref: proxy, release: CInstance_release)\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void interfaceWithCommentGeneration() {
    SwiftClass swiftClass = SwiftClass.builder("ExampleClassWithComment").isInterface(true).build();
    swiftClass.comment = "One really classy example";

    TemplateComparator.expect(
            "/**\n"
                + " One really classy example\n"
                + " */\n"
                + "public protocol ExampleClassWithComment : AnyObject {\n"
                + "}\n")
        .expect("internal class _ExampleClassWithComment: ExampleClassWithComment {")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void simpleMethodGeneration() {
    SwiftClass swiftClass =
        SwiftClass.builder("ExampleClass").nameSpace("myPackage").isInterface(true).build();
    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .returnType(new SwiftType("Int"))
            .cNestedSpecifier("myPackage_ExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(new SwiftParameter("parameter", new SwiftType("Int")));
    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public protocol ExampleClass : AnyObject {\n"
                + "    func myMethod(parameter: Int) -> Int\n"
                + "}\n")
        .expect("internal class _ExampleClass: ExampleClass {")
        .expect(
            "    public func myMethod(parameter: Int) -> Int {\n"
                + "        return myPackage_ExampleClass_myMethod(c_instance, parameter)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodParameterDifferentInterfaceAndVariableName() {
    SwiftClass swiftClass = SwiftClass.builder("ExampleClass").isInterface(true).build();
    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .cNestedSpecifier("ExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(
        new SwiftParameter(
            "parameterInterfaceName", new SwiftType("Int"), "parameterVariableName"));
    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public protocol ExampleClass : AnyObject {\n"
                + "    func myMethod(parameterInterfaceName parameterVariableName: Int) -> Void\n"
                + "}\n")
        .expect("internal class _ExampleClass: ExampleClass {")
        .expect(
            "    public func myMethod(parameterInterfaceName parameterVariableName: Int) -> Void {\n"
                + "        return ExampleClass_myMethod(c_instance, parameterVariableName)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithMultipleParameters() {
    SwiftClass swiftClass = SwiftClass.builder("ExampleClass").isInterface(true).build();
    SwiftParameter parameterOne = new SwiftParameter("parameterOne", new SwiftType("Int"));
    SwiftParameter parameterTwo = new SwiftParameter("parameterTwo", new SwiftType("String"));
    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .cNestedSpecifier("ExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(parameterOne);
    method.parameters.add(parameterTwo);
    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public protocol ExampleClass : AnyObject {\n"
                + "    func myMethod(parameterOne: Int, parameterTwo: String) -> Void\n"
                + "}\n")
        .expect("internal class _ExampleClass: ExampleClass {")
        .expect(
            "    public func myMethod(parameterOne: Int, parameterTwo: String) -> Void {\n"
                + "        return ExampleClass_myMethod(c_instance, parameterOne, parameterTwo)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithArrayParameter() {
    SwiftClass swiftClass = SwiftClass.builder("MyClass").isInterface(true).build();
    SwiftMethod method =
        SwiftMethod.builder("myMethod").cNestedSpecifier("MyClass").cShortName("myMethod").build();
    method.parameters.add(new SwiftParameter("array", new SwiftType("[UInt8]")));
    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public protocol MyClass : AnyObject {\n"
                + "    func myMethod(array: [UInt8]) -> Void\n"
                + "}\n")
        .expect("internal class _MyClass: MyClass {")
        .expect(
            "    public func myMethod(array: [UInt8]) -> Void {\n"
                + "        return MyClass_myMethod(c_instance, array)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithComment() {
    SwiftClass swiftClass = SwiftClass.builder("CommentedExampleClass").isInterface(true).build();
    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .returnType(new SwiftType("Int"))
            .cNestedSpecifier("CommentedExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(new SwiftParameter("myParameter", new SwiftType("String")));
    method.comment = "Do something";

    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public protocol CommentedExampleClass : AnyObject {\n"
                + "    /**\n"
                + "     Do something\n"
                + "     */\n"
                + "    func myMethod(myParameter: String) -> Int\n"
                + "}\n")
        .expect("internal class _CommentedExampleClass: CommentedExampleClass {")
        .expect(
            "    /**\n"
                + "     Do something\n"
                + "     */\n"
                + "    public func myMethod(myParameter: String) -> Int {\n"
                + "        return CommentedExampleClass_myMethod(c_instance, myParameter)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void staticMethod() {
    SwiftClass swiftClass = SwiftClass.builder("MyClass").build();
    SwiftMethod method =
        SwiftMethod.builder("myStaticMethod")
            .isStatic(true)
            .cNestedSpecifier("MyClass")
            .cShortName("myStaticMethod")
            .build();
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class MyClass {")
        .expect(
            "    public static func myStaticMethod() -> Void {\n"
                + "        return MyClass_myStaticMethod()\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void helloWorldGeneration() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftMethod method =
        SwiftMethod.builder("helloWorldMethod")
            .returnType(new SwiftType("String", TypeCategory.BUILTIN_STRING).withOptional(true))
            .isStatic(true)
            .cNestedSpecifier("HelloWorld")
            .cShortName("helloWorldMethod")
            .build();
    method.parameters.add(new SwiftParameter("inputString", SwiftType.STRING));
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func helloWorldMethod(inputString: String) -> String? {\n"
                + "        let result_string_handle = HelloWorld_helloWorldMethod(inputString)\n"
                + "        defer {\n"
                + "            std_string_release(result_string_handle)\n"
                + "        }\n"
                + "        return String(data: Data(bytes: std_string_data_get(result_string_handle),\n"
                + "                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithByteBufferInput() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftParameter swiftParameter = new SwiftParameter("byteBuffer", SwiftType.DATA);
    SwiftMethod method =
        SwiftMethod.builder("testBuffer")
            .isStatic(true)
            .cNestedSpecifier("HelloWorld")
            .cShortName("testBuffer")
            .build();
    method.parameters.add(swiftParameter);
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func testBuffer(byteBuffer: Data) -> Void {\n"
                + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Void in\n"
                + "            return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count))\n"
                + "        }\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithByteBufferInputAndDifferentVariableName() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftParameter swiftParameter = new SwiftParameter("data", SwiftType.DATA, "byteBuffer");
    SwiftMethod method =
        SwiftMethod.builder("testBuffer")
            .isStatic(true)
            .cNestedSpecifier("HelloWorld")
            .cShortName("testBuffer")
            .build();
    method.parameters.add(swiftParameter);
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func testBuffer(data byteBuffer: Data) -> Void {\n"
                + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Void in\n"
                + "            return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count))\n"
                + "        }\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithMultipleByteBufferInputStringAndInteger() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftParameter param1 = new SwiftParameter("byteBuffer", SwiftType.DATA);
    SwiftParameter param2 = new SwiftParameter("text", SwiftType.STRING);
    SwiftParameter param3 = new SwiftParameter("number", new SwiftType("Int"));
    SwiftParameter param4 = new SwiftParameter("data2", SwiftType.DATA);
    SwiftMethod method =
        SwiftMethod.builder("testBuffer")
            .isStatic(true)
            .cNestedSpecifier("HelloWorld")
            .cShortName("testBuffer")
            .build();
    method.parameters.addAll(Arrays.asList(param1, param2, param3, param4));
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func testBuffer(byteBuffer: Data, text: String, number: Int, data2: Data) -> Void {\n"
                + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Void in\n"
                + "            return data2.withUnsafeBytes { (data2_ptr: UnsafePointer<UInt8>) -> Void in\n"
                + "                return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count), text, number, data2_ptr, Int64(data2.count))\n"
                + "            }\n"
                + "        }\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithMultipleByteBufferInputStringAndIntegerReturningData() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftParameter param1 = new SwiftParameter("byteBuffer", SwiftType.DATA);
    SwiftParameter param2 = new SwiftParameter("text", SwiftType.STRING);
    SwiftParameter param3 = new SwiftParameter("number", new SwiftType("Int"));
    SwiftParameter param4 = new SwiftParameter("data2", SwiftType.DATA);
    SwiftMethod method =
        SwiftMethod.builder("testBuffer")
            .isStatic(true)
            .returnType(
                new SwiftType("Data", SwiftType.TypeCategory.BUILTIN_BYTEBUFFER).withOptional(true))
            .cNestedSpecifier("HelloWorld")
            .cShortName("testBuffer")
            .build();
    method.parameters.addAll(Arrays.asList(param1, param2, param3, param4));
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func testBuffer(byteBuffer: Data, text: String, number: Int, data2: Data) -> Data? {\n"
                + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Data? in\n"
                + "            return data2.withUnsafeBytes { (data2_ptr: UnsafePointer<UInt8>) -> Data? in\n"
                + "                let result_data_handle = HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count), text, number, data2_ptr, Int64(data2.count))\n"
                + "                defer {\n"
                + "                    byteArray_release(result_data_handle)\n"
                + "                }\n"
                + "                return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))\n"
                + "            }\n"
                + "        }\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void methodWithMultipleByteBufferInputStringAndIntegerReturningInt() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftParameter param1 = new SwiftParameter("byteBuffer", SwiftType.DATA);
    SwiftParameter param2 = new SwiftParameter("text", SwiftType.STRING);
    SwiftParameter param3 = new SwiftParameter("number", new SwiftType("Int"));
    SwiftParameter param4 = new SwiftParameter("data2", SwiftType.DATA);
    SwiftMethod method =
        SwiftMethod.builder("testBuffer")
            .isStatic(true)
            .returnType(new SwiftType("Int"))
            .cNestedSpecifier("HelloWorld")
            .cShortName("testBuffer")
            .build();
    method.parameters.addAll(Arrays.asList(param1, param2, param3, param4));
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func testBuffer(byteBuffer: Data, text: String, number: Int, data2: Data) -> Int {\n"
                + "        return byteBuffer.withUnsafeBytes { (byteBuffer_ptr: UnsafePointer<UInt8>) -> Int in\n"
                + "            return data2.withUnsafeBytes { (data2_ptr: UnsafePointer<UInt8>) -> Int in\n"
                + "                return HelloWorld_testBuffer(byteBuffer_ptr, Int64(byteBuffer.count), text, number, data2_ptr, Int64(data2.count))\n"
                + "            }\n"
                + "        }\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void staticMethodTakingStruct() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftContainerType swiftStruct =
        SwiftContainerType.builder("SomeStruct")
            .cPrefix(swiftClass.name + "_" + "SomeStruct")
            .build();
    SwiftMethod method =
        SwiftMethod.builder("methodTakingStruct")
            .isStatic(true)
            .cNestedSpecifier("HelloWorld")
            .cShortName("methodTakingStruct")
            .build();
    method.parameters.add(new SwiftParameter("inputParam", swiftStruct));
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func methodTakingStruct(inputParam: SomeStruct) -> Void {\n"
                + "        let inputParamHandle = inputParam.convertToCType()\n"
                + "        defer {\n"
                + "            HelloWorld_SomeStruct_release(inputParamHandle)\n"
                + "        }\n"
                + "        return HelloWorld_methodTakingStruct(inputParamHandle)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void staticMethodReturningStruct() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftContainerType swiftStruct =
        SwiftContainerType.builder("SomeStruct")
            .cPrefix(swiftClass.name + "_" + "SomeStruct")
            .build();
    SwiftMethod method =
        SwiftMethod.builder("methodReturningStruct")
            .isStatic(true)
            .returnType(swiftStruct.withOptional(true))
            .cNestedSpecifier("HelloWorld")
            .cShortName("methodReturningStruct")
            .build();
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func methodReturningStruct() -> SomeStruct? {\n"
                + "        let cResult = HelloWorld_methodReturningStruct()\n"
                + "        defer {\n"
                + "            HelloWorld_SomeStruct_release(cResult)\n"
                + "        }\n"
                + "        return SomeStruct(cSomeStruct: cResult)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void staticMethodTakingMultipleParamsAndReturningStruct() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorld").build();
    SwiftContainerType inputStruct =
        SwiftContainerType.builder("GeoLocation")
            .cPrefix(swiftClass.name + "_" + "GeoLocation")
            .build();
    SwiftContainerType outputStruct =
        SwiftContainerType.builder("SomeStruct")
            .cPrefix(swiftClass.name + "_" + "SomeStruct")
            .build();
    SwiftMethod method =
        SwiftMethod.builder("fancyMethod")
            .isStatic(true)
            .returnType(outputStruct.withOptional(true))
            .cNestedSpecifier("HelloWorld")
            .cShortName("fancyMethod")
            .build();
    method.parameters.add(new SwiftParameter("icon", SwiftType.DATA));
    method.parameters.add(new SwiftParameter("name", SwiftType.STRING));
    method.parameters.add(new SwiftParameter("location", inputStruct));
    swiftClass.methods.add(method);

    TemplateComparator.expect("public class HelloWorld {")
        .expect(
            "    public static func fancyMethod(icon: Data, name: String, location: GeoLocation) -> SomeStruct? {\n"
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
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void interfaceWithTwoStructsAndMethod() {
    SwiftFile file = new SwiftFile();
    SwiftClass swiftClass = SwiftClass.builder("SomeClass").isInterface(true).build();
    SwiftContainerType firstStruct =
        SwiftContainerType.builder("FirstStruct").cPrefix("CPrefix").build();
    SwiftContainerType secondStruct =
        SwiftContainerType.builder("SecondStruct").cPrefix("CPrefix").build();
    swiftClass.methods.add(SwiftMethod.builder("SomeMethod").build());
    file.structs.add(firstStruct);
    file.structs.add(secondStruct);
    file.classes.add(swiftClass);

    TemplateComparator expected =
        TemplateComparator.expect(
                "public protocol SomeClass : AnyObject {\n"
                    + "    func SomeMethod() -> Void\n"
                    + "}\n")
            .expect("internal class _SomeClass: SomeClass {")
            .expect(
                "    public func SomeMethod() -> Void {\n"
                    + "        return (c_instance)\n"
                    + "    }\n"
                    + "}\n")
            .expect(
                "public struct FirstStruct {\n"
                    + "    public init() {\n"
                    + "    }\n"
                    + "    internal init?(cFirstStruct: _baseRef) {\n"
                    + "    }\n"
                    + "    internal func convertToCType() -> _baseRef {\n"
                    + "        let result = CPrefix_create()\n"
                    + "        fillFunction(result)\n"
                    + "        return result\n"
                    + "    }\n"
                    + "    internal func fillFunction(_ cFirstStruct: _baseRef) -> Void {\n"
                    + "    }\n"
                    + "}\n")
            .expect(
                "public struct SecondStruct {\n"
                    + "    public init() {\n"
                    + "    }\n"
                    + "    internal init?(cSecondStruct: _baseRef) {\n"
                    + "    }\n"
                    + "    internal func convertToCType() -> _baseRef {\n"
                    + "        let result = CPrefix_create()\n"
                    + "        fillFunction(result)\n"
                    + "        return result\n"
                    + "    }\n"
                    + "    internal func fillFunction(_ cSecondStruct: _baseRef) -> Void {\n"
                    + "    }\n"
                    + "}\n")
            .build();

    final String generated = generate(file);

    expected.assertMatches(generated);
  }

  @Test
  public void typeCollectionWithStruct() {
    SwiftContainerType firstSturct =
        SwiftContainerType.builder("FirstStruct").cPrefix("CPrefix").build();
    SwiftFile file = new SwiftFile();
    file.structs.add(firstSturct);

    final String expected =
        "import Foundation\n"
            + "public struct FirstStruct {\n"
            + "    public init() {\n"
            + "    }\n"
            + "    internal init?(cFirstStruct: _baseRef) {\n"
            + "    }\n"
            + "    internal func convertToCType() -> _baseRef {\n"
            + "        let result = CPrefix_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "    internal func fillFunction(_ cFirstStruct: _baseRef) -> Void {\n"
            + "    }\n"
            + "}\n";
    final String generated = generate(file);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void typeCollectionWithEnum() {
    SwiftEnum swiftEnum =
        SwiftEnum.builder("EnumSwiftName").comment("Some comment on enum type").build();
    SwiftFile file = new SwiftFile();
    file.enums.add(swiftEnum);
    final String expected =
        "import Foundation\n"
            + "/**\n"
            + " Some comment on enum type\n"
            + " */\n"
            + "public enum EnumSwiftName : UInt32 {\n"
            + "}\n";

    final String generated = generate(file);

    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void renderEnumWithItemWithCommentAndValue() {
    SwiftEnumItem enumItem =
        SwiftEnumItem.builder("ItemName")
            .comment("Some comment on enumerator")
            .value(new SwiftValue("VALUE"))
            .build();
    SwiftEnum swiftEnum =
        SwiftEnum.builder("EnumSwiftName")
            .comment("Some comment on enum type")
            .items(singletonList(enumItem))
            .build();
    SwiftFile file = new SwiftFile();
    file.enums.add(swiftEnum);
    final String expected =
        "import Foundation\n"
            + "/**\n"
            + " Some comment on enum type\n"
            + " */\n"
            + "public enum EnumSwiftName : UInt32 {\n"
            + "    /**\n"
            + "     Some comment on enumerator\n"
            + "     */\n"
            + "    case ItemName = VALUE\n"
            + "}\n";

    final String generated = generate(file);

    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void interfaceWithEnum() {
    SwiftFile swiftFile = new SwiftFile();
    swiftFile.enums.add(
        SwiftEnum.builder("EnumSwiftName").comment("Some comment on enum type").build());
    SwiftClass swiftClass = SwiftClass.builder("TestInterface").isInterface(true).build();
    swiftFile.classes.add(swiftClass);

    TemplateComparator expected =
        TemplateComparator.expect("public protocol TestInterface : AnyObject {\n" + "}\n")
            .expect("internal class _TestInterface: TestInterface {")
            .expect(
                "/**\n"
                    + " Some comment on enum type\n"
                    + " */\n"
                    + "public enum EnumSwiftName : UInt32 {\n"
                    + "}\n")
            .build();

    final String generated = generate(swiftFile);

    expected.assertMatches(generated);
  }

  @Test
  public void classWithInternalConstructor() {
    SwiftClass swiftClass =
        SwiftClass.builder("HelloWorld").cInstance("HellowWorld").isInterface(true).build();
    SwiftMethod method =
        SwiftMethod.builder("instanceMethod")
            .returnType(new SwiftType("Int"))
            .cNestedSpecifier("HelloWorld")
            .cShortName("instanceMethod")
            .build();
    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect(
                "public protocol HelloWorld : AnyObject {\n"
                    + "    func instanceMethod() -> Int\n"
                    + "}\n")
            .expect(
                "internal class _HelloWorld: HelloWorld {\n"
                    + "    let c_instance : _baseRef\n"
                    + "    init?(cHelloWorld: _baseRef) {\n"
                    + "        guard cHelloWorld != 0 else {\n"
                    + "            return nil\n"
                    + "        }\n"
                    + "        c_instance = cHelloWorld\n"
                    + "    }\n"
                    + "    deinit {\n"
                    + "        HellowWorld_release(c_instance)\n"
                    + "    }\n"
                    + "    public func instanceMethod() -> Int {\n"
                    + "        return HelloWorld_instanceMethod(c_instance)\n"
                    + "    }\n"
                    + "}\n")
            .build();

    final String generated = generateFromClass(swiftClass);

    expected.assertMatches(generated);
  }

  @Test
  public void factoryClassCallingPrivateConstructor() {
    SwiftClass swiftClass =
        SwiftClass.builder("HelloWorldFactory").cInstance("HelloWorldFactory").build();

    SwiftContainerType mappedType =
        SwiftContainerType.builder("HelloWorld")
            .category(TypeCategory.CLASS)
            .implementingClass("_HelloWorld")
            .build();
    SwiftMethod method =
        SwiftMethod.builder("createInstanceMethod")
            .returnType(mappedType)
            .cNestedSpecifier("HelloWorld")
            .cShortName("createInstanceMethod")
            .isStatic(true)
            .build();
    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect(
                "public class HelloWorldFactory {\n"
                    + "    let c_instance : _baseRef\n"
                    + "    public init?(cHelloWorldFactory: _baseRef) {\n"
                    + "        guard cHelloWorldFactory != 0 else {\n"
                    + "            return nil\n"
                    + "        }\n"
                    + "        c_instance = cHelloWorldFactory\n"
                    + "    }\n"
                    + "    deinit {\n"
                    + "        HelloWorldFactory_release(c_instance)\n"
                    + "    }\n"
                    + "    public static func createInstanceMethod() -> HelloWorld {\n"
                    + "        let cResult = HelloWorld_createInstanceMethod()\n"
                    + "        if let swift_pointer = _get_swift_object_from_cache(cResult),\n"
                    + "                let reconstructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? HelloWorld {\n"
                    + "            return reconstructed\n"
                    + "        }\n"
                    + "        return _HelloWorld(cHelloWorld: cResult)\n"
                    + "    }\n"
                    + "}")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  @Test
  public void typedefGenerationInProtocol() {
    SwiftClass swiftClass = SwiftClass.builder("HelloWorldFactory").isInterface(true).build();
    SwiftTypeDef typedef = new SwiftTypeDef("MyTypeDef", null, new SwiftType("Int"));
    swiftClass.typedefs.add(typedef);

    TemplateComparator.expect(
            "public protocol HelloWorldFactory : AnyObject {\n"
                + "    typealias MyTypeDef = Int\n"
                + "}\n")
        .expect("internal class _HelloWorldFactory: HelloWorldFactory {")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void typedeGenerationInClass() {
    SwiftClass swiftClass = SwiftClass.builder("HellowWorldFactory").build();
    SwiftTypeDef typedef = new SwiftTypeDef("MyTypeDef", null, new SwiftType("Int"));
    swiftClass.typedefs.add(typedef);
    SwiftContainerType mappedType =
        SwiftContainerType.builder("HelloWorld")
            .category(TypeCategory.CLASS)
            .implementingClass("_HelloWorld")
            .build();
    SwiftMethod method =
        SwiftMethod.builder("createInstanceMethod")
            .returnType(mappedType)
            .cNestedSpecifier("HelloWorld")
            .cShortName("createInstanceMethod")
            .isStatic(true)
            .build();
    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public class HellowWorldFactory {\n" + "    public typealias MyTypeDef = Int")
        .expect(
            "    public static func createInstanceMethod() -> HelloWorld {\n"
                + "        let cResult = HelloWorld_createInstanceMethod()\n"
                + "        if let swift_pointer = _get_swift_object_from_cache(cResult),\n"
                + "                let reconstructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? HelloWorld {\n"
                + "            return reconstructed\n"
                + "        }\n"
                + "        return _HelloWorld(cHelloWorld: cResult)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void nestedTypedeGenerationInClass() {
    SwiftClass swiftClass = SwiftClass.builder("HellowWorldFactory").build();
    SwiftTypeDef typedef =
        new SwiftTypeDef(
            "HellowWorldFactory.MyNestedTypeDef",
            null,
            new SwiftType("HellowWorldFactory.MyTypeDef"));
    SwiftTypeDef typedef2 =
        new SwiftTypeDef("HellowWorldFactory.MyTypeDef", null, new SwiftType("Int"));
    swiftClass.typedefs.add(typedef);
    swiftClass.typedefs.add(typedef2);

    SwiftMethod method =
        SwiftMethod.builder("createInstanceMethod")
            .returnType(typedef.type)
            .cNestedSpecifier("HelloWorld")
            .cShortName("createInstanceMethod")
            .isStatic(true)
            .build();
    swiftClass.methods.add(method);

    TemplateComparator.expect(
            "public class HellowWorldFactory {\n"
                + "    public typealias MyNestedTypeDef = HellowWorldFactory.MyTypeDef\n"
                + "    public typealias MyTypeDef = Int")
        .expect(
            "    public static func createInstanceMethod() -> HellowWorldFactory.MyTypeDef {\n"
                + "        return HelloWorld_createInstanceMethod()\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void protocolWithPropertyOfDataType() {
    SwiftClass swiftClass = SwiftClass.builder("SomeClassWithProperty").isInterface(true).build();
    SwiftProperty someProperty = new SwiftProperty("someAttributeName", null, SwiftType.DATA);
    someProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName("CBRIDGE_DELEGATE").build());
    someProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName("CBRIDGE_DELEGATE").build());
    swiftClass.properties.add(someProperty);
    TemplateComparator expected =
        TemplateComparator.expect(
                "public protocol SomeClassWithProperty : AnyObject {\n"
                    + "    var someAttributeName: Data { get set }\n"
                    + "}\n")
            .expect(
                "internal class _SomeClassWithProperty: SomeClassWithProperty {\n"
                    + "    var someAttributeName: Data {\n"
                    + "        get {\n"
                    + "            return CBRIDGE_DELEGATE(c_instance)\n"
                    + "        }\n"
                    + "        set {\n"
                    + "            return CBRIDGE_DELEGATE(c_instance)\n"
                    + "        }\n"
                    + "    }\n"
                    + "    let c_instance : _baseRef\n"
                    + "    init?(cSomeClassWithProperty: _baseRef) {\n"
                    + "        guard cSomeClassWithProperty != 0 else {\n"
                    + "            return nil\n"
                    + "        }\n"
                    + "        c_instance = cSomeClassWithProperty\n"
                    + "    }\n"
                    + "    deinit {\n"
                    + "        _release(c_instance)\n"
                    + "    }\n"
                    + "}\n")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  @Test
  public void classWithPropertyOfDataType() {
    SwiftClass swiftClass = SwiftClass.builder("SomeClassWithProperty").build();
    SwiftProperty someProperty = new SwiftProperty("someAttributeName", null, SwiftType.DATA);
    someProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName("CBRIDGE_DELEGATE").build());
    someProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName("CBRIDGE_DELEGATE").build());
    swiftClass.properties.add(someProperty);
    final String expected =
        "import Foundation\n"
            + "internal func getRef(_ ref: SomeClassWithProperty?) -> "
            + "RefHolder {\n"
            + "    return RefHolder(ref?.c_instance ?? 0)\n"
            + "}\n"
            + "public class SomeClassWithProperty {\n"
            + "    public var someAttributeName: Data {\n"
            + "        get {\n"
            + "            return CBRIDGE_DELEGATE(c_instance)\n"
            + "        }\n"
            + "        set {\n"
            + "            return CBRIDGE_DELEGATE(c_instance)\n"
            + "        }\n"
            + "    }\n"
            + "    let c_instance : _baseRef\n"
            + "    public init?(cSomeClassWithProperty: _baseRef) {\n"
            + "        guard cSomeClassWithProperty != 0 else {\n"
            + "            return nil\n"
            + "        }\n"
            + "        c_instance = cSomeClassWithProperty\n"
            + "    }\n"
            + "    deinit {\n"
            + "        _release(c_instance)\n"
            + "    }\n"
            + "}\n"
            + "extension SomeClassWithProperty: NativeBase {\n"
            + "    var c_handle: _baseRef { return c_instance }\n"
            + "}\n";

    final String generated = generateFromClass(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void classWithReadonlyProperty() {
    SwiftClass swiftClass = SwiftClass.builder("SomeClassWithProperty").isInterface(true).build();
    SwiftProperty someProperty = new SwiftProperty("someStringAttribute", null, SwiftType.STRING);
    someProperty.propertyAccessors.add(
        SwiftMethod.builder("").cShortName("CBRIDGE_DELEGATE").build());
    swiftClass.properties.add(someProperty);
    TemplateComparator expected =
        TemplateComparator.expect(
                "public protocol SomeClassWithProperty : AnyObject {\n"
                    + "    var someStringAttribute: String { get }\n"
                    + "}\n")
            .expect(
                "internal class _SomeClassWithProperty: SomeClassWithProperty {\n"
                    + "    var someStringAttribute: String {\n"
                    + "        get {\n"
                    + "            return CBRIDGE_DELEGATE(c_instance)\n"
                    + "        }\n"
                    + "    }\n"
                    + "    let c_instance : _baseRef\n"
                    + "    init?(cSomeClassWithProperty: _baseRef) {\n"
                    + "        guard cSomeClassWithProperty != 0 else {\n"
                    + "            return nil\n"
                    + "        }\n"
                    + "        c_instance = cSomeClassWithProperty\n"
                    + "    }\n"
                    + "    deinit {\n"
                    + "        _release(c_instance)\n"
                    + "    }\n"
                    + "}\n")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  @Test
  public void classWithBase() {
    SwiftClass swiftClass = SwiftClass.builder("TestClass").parentClass("SuperClass").build();

    TemplateComparator expected =
        TemplateComparator.expect("public class TestClass: SuperClass {").build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  @Test
  public void classWithProtocol() {
    SwiftClass swiftClass =
        SwiftClass.builder("TestClass")
            .isInterface(true)
            .cInstance("CTest")
            .functionTableName("TestClassFunctionTable")
            .build();
    swiftClass.implementsProtocols.add("FirstProtocol");

    TemplateComparator expected =
        TemplateComparator.expect(
                "internal func getRef(_ ref: TestClass) -> RefHolder {\n"
                    + "    if let instanceReference = ref as? NativeBase {\n"
                    + "        return RefHolder(instanceReference.c_handle)\n"
                    + "    }\n"
                    + "    var functions = TestClassFunctionTable()\n"
                    + "    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()\n"
                    + "    functions.release = {swiftClass_pointer in\n"
                    + "        if let swiftClass = swiftClass_pointer {\n"
                    + "            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()\n"
                    + "        }\n"
                    + "    }\n"
                    + "    let proxy = CTest_createProxy(functions)\n"
                    + "    return RefHolder(ref: proxy, release: CTest_release)\n"
                    + "}")
            .expect("public protocol TestClass : FirstProtocol {\n" + "}\n")
            .expect(
                "internal class _TestClass: TestClass {\n"
                    + "    let c_instance : _baseRef\n"
                    + "    init?(cTestClass: _baseRef) {\n"
                    + "        guard cTestClass != 0 else {\n"
                    + "            return nil\n"
                    + "        }\n"
                    + "        c_instance = cTestClass\n"
                    + "    }\n"
                    + "    deinit {\n"
                    + "        CTest_release(c_instance)\n"
                    + "    }\n"
                    + "}")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  public void classWithBaseAndProtocols() {
    SwiftClass swiftClass = SwiftClass.builder("TestClass").parentClass("SuperClass").build();
    swiftClass.implementsProtocols.add("FirstProtocol");
    swiftClass.implementsProtocols.add("SecondProtocol");
    final String expected =
        "import Foundation\n"
            + "internal func getRef(_ ref: TestClass) -> RefHolder {\n"
            + "    guard let instanceReference = ref as? _TestClass else {\n"
            + "        fatalError(\"Not implemented yet\")\n"
            + "    }\n"
            + "    return RefHolder(instanceReference.c_instance)\n"
            + "}\n"
            + "public protocol TestClass {\n"
            + "}\n"
            + "internal class _TestClass: SuperClass, FirstProtocol, SecondProtocol {\n"
            + "}\n";
    final String generated = generateFromClass(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void classWithoutProtocolWithStructTypedefAndMethod() {
    SwiftClass swiftClass = SwiftClass.builder("SomeClass").build();
    SwiftContainerType firstStruct =
        SwiftContainerType.builder("SomeClass.FirstStruct").cPrefix("CPrefix").build();
    SwiftContainerType secondStruct =
        SwiftContainerType.builder("SomeClass.SecondStruct").cPrefix("CPrefix").build();
    swiftClass.typedefs.add(new SwiftTypeDef("SomeClass.RenamedStruct", null, secondStruct));
    SwiftMethod method =
        SwiftMethod.builder("SomeMethod")
            .returnType(secondStruct.withAlias("SomeClass.RenamedStruct"))
            .cNestedSpecifier("HelloWorld")
            .cShortName("someMethod")
            .isStatic(true)
            .build();
    method.parameters.add(new SwiftParameter("input", firstStruct));
    swiftClass.methods.add(method);
    swiftClass.structs.add(firstStruct);
    swiftClass.structs.add(secondStruct);

    TemplateComparator.expect(
            "public class SomeClass {\n"
                + "    public typealias RenamedStruct = SomeClass.SecondStruct")
        .expect(
            "    public struct FirstStruct {\n"
                + "        public init() {\n"
                + "        }\n"
                + "        internal init?(cFirstStruct: _baseRef) {\n"
                + "        }\n"
                + "        internal func convertToCType() -> _baseRef {\n"
                + "            let result = CPrefix_create()\n"
                + "            fillFunction(result)\n"
                + "            return result\n"
                + "        }\n"
                + "        internal func fillFunction(_ cFirstStruct: _baseRef) -> Void {\n"
                + "        }\n"
                + "    }\n"
                + "    public struct SecondStruct {\n"
                + "        public init() {\n"
                + "        }\n"
                + "        internal init?(cSecondStruct: _baseRef) {\n"
                + "        }\n"
                + "        internal func convertToCType() -> _baseRef {\n"
                + "            let result = CPrefix_create()\n"
                + "            fillFunction(result)\n"
                + "            return result\n"
                + "        }\n"
                + "        internal func fillFunction(_ cSecondStruct: _baseRef) -> Void {\n"
                + "        }\n"
                + "    }\n"
                + "    public static func SomeMethod(input: SomeClass.FirstStruct) -> SomeClass.RenamedStruct {\n"
                + "        let inputHandle = input.convertToCType()\n"
                + "        defer {\n"
                + "            CPrefix_release(inputHandle)\n"
                + "        }\n"
                + "        let cResult = HelloWorld_someMethod(inputHandle)\n"
                + "        defer {\n"
                + "            CPrefix_release(cResult)\n"
                + "        }\n"
                + "        return SomeClass.SecondStruct(cSecondStruct: cResult)\n"
                + "    }\n"
                + "}\n")
        .build()
        .assertMatches(generateFromClass(swiftClass));
  }

  @Test
  public void classWithTrowingMethodReturningVoid() {

    SwiftClass swiftClass = SwiftClass.builder("SomeClass").build();

    SwiftMethod method =
        SwiftMethod.builder("SomeMethod")
            .returnType(SwiftType.VOID)
            .cNestedSpecifier("HelloWorld")
            .cShortName("someMethod")
            .isStatic(true)
            .error(
                SwiftEnum.builder("SomeClass.Errors")
                    .item(SwiftEnumItem.builder("none").build())
                    .build())
            .build();
    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect("public class SomeClass {")
            .expect(
                "    public static func SomeMethod() throws -> Void {\n"
                    + "        let ERROR_CODE = HelloWorld_someMethod()\n"
                    + "        if (ERROR_CODE != 0) {\n"
                    + "            throw SomeClass.Errors(rawValue: ERROR_CODE)!\n"
                    + "        }\n"
                    + "    }\n"
                    + "}\n")
            .build();

    final String generated = generateFromClass(swiftClass);

    expected.assertMatches(generated);
  }

  @Test
  public void classWithTrowingMethodWithArgumentAndReturnValue() {

    SwiftClass swiftClass = SwiftClass.builder("SomeClass").build();

    SwiftMethod method =
        SwiftMethod.builder("SomeMethod")
            .returnType(new SwiftType("String", TypeCategory.BUILTIN_STRING).withOptional(true))
            .cNestedSpecifier("HelloWorld")
            .cShortName("someMethod")
            .isStatic(true)
            .error(
                SwiftEnum.builder("SomeClass.Errors")
                    .item(SwiftEnumItem.builder("none").build())
                    .build())
            .build();
    method.parameters.add(new SwiftParameter("inputData", SwiftType.DATA));
    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect("public class SomeClass {")
            .expect(
                "    public static func SomeMethod(inputData: Data) throws -> String? {\n"
                    + "        return inputData.withUnsafeBytes { (inputData_ptr: UnsafePointer<UInt8>) -> String? in\n"
                    + "            let RESULT = HelloWorld_someMethod(inputData_ptr, Int64(inputData.count))\n"
                    + "            if (RESULT.has_value) {\n"
                    + "                let result_string_handle = RESULT.returned_value\n"
                    + "                defer {\n"
                    + "                    std_string_release(result_string_handle)\n"
                    + "                }\n"
                    + "                return String(data: Data(bytes: std_string_data_get(result_string_handle),\n"
                    + "                                         count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)\n"
                    + "            } else {\n"
                    + "                throw SomeClass.Errors(rawValue: RESULT.error_code)!\n"
                    + "            }\n"
                    + "        }\n"
                    + "    }\n"
                    + "}\n")
            .build();

    final String generated = generateFromClass(swiftClass);

    expected.assertMatches(generated);
  }

  @Test
  public void classWithProtocolAndFunctionTakingArray() {
    SwiftClass swiftClass = SwiftClass.builder("TestClass").isInterface(true).build();

    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .cNestedSpecifier("myPackage_ExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(
        new SwiftParameter(
            "parameter", new SwiftArray(SwiftType.STRING, "IMPLEMENTING_CLASS", "")));
    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect(
                "    functions.myPackage_ExampleClass_myMethod = {(swiftClass_pointer, parameter) in\n"
                    + "        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! TestClass\n"
                    + "        return swiftClass.myMethod(parameter: IMPLEMENTING_CLASS(parameter))\n"
                    + "    }")
            .expect(
                "public protocol TestClass : AnyObject {\n"
                    + "    func myMethod(parameter: Tparameter) -> Void\n"
                    + "}")
            .expect(
                "    public func myMethod(parameter: Tparameter) -> Void {\n"
                    + "        let parameterHandle = parameter.c_conversion()\n"
                    + "        defer {\n"
                    + "            parameterHandle.cleanup()\n"
                    + "        }\n"
                    + "        return myPackage_ExampleClass_myMethod(c_instance, parameterHandle.c_type)\n"
                    + "    }")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  @Test
  public void classWithProtocolAndFunctionTakingEnum() {
    SwiftClass swiftClass = SwiftClass.builder("TestClass").isInterface(true).build();

    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .cNestedSpecifier("myPackage_ExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(
        new SwiftParameter("parameter", new SwiftType("Enum", TypeCategory.ENUM)));

    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect(
                "    functions.myPackage_ExampleClass_myMethod = {(swiftClass_pointer, parameter) in\n"
                    + "        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!)"
                    + ".takeUnretainedValue() as! TestClass\n"
                    + "        return swiftClass.myMethod(parameter: Enum(rawValue: parameter)!)\n"
                    + "    }")
            .expect(
                "public protocol TestClass : AnyObject {\n"
                    + "    func myMethod(parameter: Enum) -> Void\n"
                    + "}")
            .expect(
                "    public func myMethod(parameter: Enum) -> Void {\n"
                    + "        return myPackage_ExampleClass_myMethod(c_instance, parameter"
                    + ".rawValue)\n"
                    + "    }")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }

  @Test
  public void classWithProtocolAndFunctionTakingByteBuffer() {
    SwiftClass swiftClass = SwiftClass.builder("TestClass").isInterface(true).build();

    SwiftMethod method =
        SwiftMethod.builder("myMethod")
            .cNestedSpecifier("myPackage_ExampleClass")
            .cShortName("myMethod")
            .build();
    method.parameters.add(new SwiftParameter("parameter", SwiftType.DATA));
    swiftClass.methods.add(method);

    TemplateComparator expected =
        TemplateComparator.expect(
                "    functions.myPackage_ExampleClass_myMethod = {(swiftClass_pointer, parameter_ptr, parameter_size) in\n"
                    + "        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! TestClass\n"
                    + "        return swiftClass.myMethod(parameter: Data(bytes: parameter_ptr!, count: Int(parameter_size)))\n"
                    + "    }")
            .expect(
                "public protocol TestClass : AnyObject {\n"
                    + "    func myMethod(parameter: Data) -> Void\n"
                    + "}")
            .expect(
                "    public func myMethod(parameter: Data) -> Void {\n"
                    + "        return parameter.withUnsafeBytes { (parameter_ptr: UnsafePointer<UInt8>) -> Void in\n"
                    + "            return myPackage_ExampleClass_myMethod(c_instance, parameter_ptr, Int64(parameter.count))\n"
                    + "        }\n"
                    + "    }")
            .build();

    final String generated = generateFromClass(swiftClass);
    expected.assertMatches(generated);
  }
}
