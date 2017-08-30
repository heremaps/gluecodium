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

package com.here.ivi.api.generator.common.swift.templates;

import com.here.ivi.api.generator.swift.templates.SwiftFileTemplate;
import com.here.ivi.api.model.swift.SwiftArrayType;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.test.TemplateComparison;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@SuppressWarnings("all")
public class SwiftFileTemplateTest {
  @Test
  public void simpleInterfaceGeneration() {
    final SwiftClass swiftClass = new SwiftClass("ExampleClass", null);
    final String expected = "public class ExampleClass {\n" + "\n" + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void interfaceWithCommentGeneration() {
    SwiftClass _swiftClass = new SwiftClass("ExampleClassWithComment", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          it.comment = "One really classy example";
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "/**\n"
            + " * One really classy example\n"
            + " */\n"
            + "public class ExampleClassWithComment {\n"
            + "\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void simpleMethodGeneration() {
    SwiftClass _swiftClass = new SwiftClass("ExampleClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          SwiftType _swiftType = new SwiftType("Int");
          SwiftParameter _swiftParameter = new SwiftParameter("parameter", _swiftType);
          SwiftMethod _swiftMethod =
              new SwiftMethod(
                  "myMethod",
                  Collections.<SwiftParameter>unmodifiableList(
                      CollectionLiterals.<SwiftParameter>newArrayList(_swiftParameter)));
          final Procedure1<SwiftMethod> _function_1 =
              (SwiftMethod it_1) -> {
                SwiftType _swiftType_1 = new SwiftType("Int");
                it_1.returnType = _swiftType_1;
              };
          SwiftMethod _doubleArrow =
              ObjectExtensions.<SwiftMethod>operator_doubleArrow(_swiftMethod, _function_1);
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_doubleArrow));
          it.nameSpace = "myPackage";
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "public class ExampleClass {\n"
            + "\n"
            + "    public func myMethod(parameter: Int) -> Int {\n"
            + "        return myPackage_ExampleClass_myMethod(parameter)\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void methodParameterDifferentInterfaceAndVariableName() {
    SwiftClass _swiftClass = new SwiftClass("ExampleClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          SwiftType _swiftType = new SwiftType("Int");
          SwiftParameter _swiftParameter =
              new SwiftParameter("parameterInterfaceName", _swiftType, "parameterVariableName");
          SwiftMethod _swiftMethod =
              new SwiftMethod(
                  "myMethod",
                  Collections.<SwiftParameter>unmodifiableList(
                      CollectionLiterals.<SwiftParameter>newArrayList(_swiftParameter)));
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_swiftMethod));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "public class ExampleClass {\n"
            + "\n"
            + "    public func myMethod(parameterInterfaceName parameterVariableName: Int) -> Void {\n"
            + "        return ExampleClass_myMethod(parameterVariableName)\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void methodWithMultipleParameters() {
    SwiftClass _swiftClass = new SwiftClass("ExampleClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          SwiftType _swiftType = new SwiftType("Int");
          SwiftParameter _swiftParameter = new SwiftParameter("parameterOne", _swiftType);
          SwiftType _swiftType_1 = new SwiftType("String");
          SwiftParameter _swiftParameter_1 = new SwiftParameter("parameterTwo", _swiftType_1);
          SwiftMethod _swiftMethod =
              new SwiftMethod(
                  "myMethod",
                  Collections.<SwiftParameter>unmodifiableList(
                      CollectionLiterals.<SwiftParameter>newArrayList(
                          _swiftParameter, _swiftParameter_1)));
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_swiftMethod));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "public class ExampleClass {\n"
            + "\n"
            + "    public func myMethod(parameterOne: Int, parameterTwo: String) -> Void {\n"
            + "        return ExampleClass_myMethod(parameterOne, parameterTwo)\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void methodWithArrayParameter() {
    SwiftClass _swiftClass = new SwiftClass("MyClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          SwiftArrayType _swiftArrayType = new SwiftArrayType("UInt8");
          SwiftParameter _swiftParameter = new SwiftParameter("array", _swiftArrayType);
          SwiftMethod _swiftMethod =
              new SwiftMethod(
                  "myMethod",
                  Collections.<SwiftParameter>unmodifiableList(
                      CollectionLiterals.<SwiftParameter>newArrayList(_swiftParameter)));
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_swiftMethod));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "public class MyClass {\n"
            + "    public func myMethod(array: [UInt8]) -> Void {\n"
            + "        return MyClass_myMethod(array)\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void methodWithComment() {
    SwiftClass _swiftClass = new SwiftClass("CommentedExampleClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          SwiftType _swiftType = new SwiftType("String");
          SwiftParameter _swiftParameter = new SwiftParameter("myParameter", _swiftType);
          SwiftMethod _swiftMethod =
              new SwiftMethod(
                  "myMethod",
                  Collections.<SwiftParameter>unmodifiableList(
                      CollectionLiterals.<SwiftParameter>newArrayList(_swiftParameter)));
          final Procedure1<SwiftMethod> _function_1 =
              (SwiftMethod it_1) -> {
                SwiftType _swiftType_1 = new SwiftType("Int");
                it_1.returnType = _swiftType_1;
                it_1.comment = "Do something";
              };
          SwiftMethod _doubleArrow =
              ObjectExtensions.<SwiftMethod>operator_doubleArrow(_swiftMethod, _function_1);
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_doubleArrow));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "public class CommentedExampleClass {\n"
            + "    /**\n"
            + "     * Do something\n"
            + "     */\n"
            + "    public func myMethod(myParameter: String) -> Int {\n"
            + "        return CommentedExampleClass_myMethod(myParameter)\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void staticMethod() {
    SwiftClass _swiftClass = new SwiftClass("MyClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          SwiftMethod _swiftMethod = new SwiftMethod("myStaticMethod");
          final Procedure1<SwiftMethod> _function_1 =
              (SwiftMethod it_1) -> {
                it_1.isStatic = true;
              };
          SwiftMethod _doubleArrow =
              ObjectExtensions.<SwiftMethod>operator_doubleArrow(_swiftMethod, _function_1);
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_doubleArrow));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "public class MyClass {\n"
            + "    public static func myStaticMethod() -> Void {\n"
            + "        return MyClass_myStaticMethod()\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void systemImport() {
    SwiftClass _swiftClass = new SwiftClass("SomeClass", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          it.imports =
              Collections.<String>unmodifiableList(
                  CollectionLiterals.<String>newArrayList("Foundation"));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected = "import Foundation\n" + "\n" + "public class SomeClass {\n" + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
  }

  @Test
  public void helloWorldGeneration() {
    SwiftClass _swiftClass = new SwiftClass("HelloWorld", null);
    final Procedure1<SwiftClass> _function =
        (SwiftClass it) -> {
          it.imports =
              Collections.<String>unmodifiableList(
                  CollectionLiterals.<String>newArrayList("Foundation"));
          SwiftParameter _swiftParameter = new SwiftParameter("inputString", SwiftType.String);
          SwiftMethod _swiftMethod =
              new SwiftMethod(
                  "helloWorldMethod",
                  Collections.<SwiftParameter>unmodifiableList(
                      CollectionLiterals.<SwiftParameter>newArrayList(_swiftParameter)));
          final Procedure1<SwiftMethod> _function_1 =
              (SwiftMethod it_1) -> {
                SwiftType _swiftType_1 = SwiftType.String;
                it_1.returnType = _swiftType_1;
                it_1.isStatic = true;
              };
          SwiftMethod _doubleArrow =
              ObjectExtensions.<SwiftMethod>operator_doubleArrow(_swiftMethod, _function_1);
          it.methods =
              Collections.<SwiftMethod>unmodifiableList(
                  CollectionLiterals.<SwiftMethod>newArrayList(_doubleArrow));
        };
    final SwiftClass swiftClass =
        ObjectExtensions.<SwiftClass>operator_doubleArrow(_swiftClass, _function);
    final String expected =
        "import Foundation\n"
            + "public class HelloWorld {\n"
            + "    public static func helloWorldMethod(inputString: String) -> String {\n"
            + "        let result_string_handle = HelloWorld_helloWorldMethod(inputString)\n"
            + "        if let ret_value = String(data: Data(bytes: std_string_data_get(result_string_handle),\n"
            + "                                             count: Int(std_string_size_get(result_string_handle))), encoding: .utf8) {\n"
            + "            std_string_release(result_string_handle)\n"
            + "            return ret_value\n"
            + "        }\n"
            + "        return \"\" //TODO: We should return nil in case of error\n"
            + "    }\n"
            + "}\n";
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    String _string = generated.toString();
    TemplateComparison.assertEqualContent(expected, _string);
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
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated.toString());
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
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated.toString());
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
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated.toString());
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
            + "                let size = byteArray_size_get(result_data_handle)\n"
            + "                if size > 0 {\n"
            + "                    let data_handle = byteArray_data_get(result_data_handle)\n"
            + "                    if let data_handle = data_handle {\n"
            + "                        let return_data = Data(bytes: data_handle, count: Int(size))\n"
            + "                        byteArray_release(result_data_handle)\n"
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
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated.toString());
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
    final CharSequence generated = SwiftFileTemplate.generate(swiftClass);
    TemplateComparison.assertEqualContent(expected, generated.toString());
  }
}
