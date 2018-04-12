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

package com.here.genium.generator.cbridge.templates;

import static java.util.Collections.singletonList;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.genium.generator.cbridge.CBridgeGenerator;
import com.here.genium.generator.cbridge.CTypeMapper;
import com.here.genium.generator.cbridge.CppTypeInfo;
import com.here.genium.model.cbridge.*;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppIncludeResolver;
import com.here.genium.test.TemplateComparator;
import com.here.genium.test.TemplateComparison;
import java.util.Arrays;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CBridgeHeaderTemplateTest {

  private final CTypeMapper typeMapper =
      new CTypeMapper(mock(CppIncludeResolver.class), mock(CBridgeIncludeResolver.class), null);

  private String generate(final CInterface iface) {
    return CBridgeGenerator.generateHeaderContent(iface);
  }

  @Test
  public void systemInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.headerIncludes.add(Include.createSystemInclude("header.h"));
    final String expected = "#include <header.h>\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void projectInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.headerIncludes.add(Include.createInternalInclude("header.h"));
    final String expected = "#include \"header.h\"\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void function() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(CFunction.builder("functionName").build());
    final String expected = "void functionName();\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(
        CFunction.builder("parameterFunctionName")
            .parameters(singletonList(new CParameter("one", new CppTypeInfo(CType.INT32))))
            .build());
    final String expected = "void parameterFunctionName(int32_t one);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithTwoParameters() {
    CInterface cInterface = new CInterface("");
    CParameter first = new CParameter("first", new CppTypeInfo(CType.INT16));
    CParameter second = new CParameter("second", new CppTypeInfo(CType.DOUBLE));
    cInterface.functions.add(
        CFunction.builder("doubleFunction").parameters(Arrays.asList(first, second)).build());
    final String expected = "void doubleFunction(int16_t first, double second);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithReturnValue() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(
        CFunction.builder("returner").returnType(new CppTypeInfo(CType.FLOAT)).build());
    final String expected = "float returner();\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void helloWorldTest() {
    CInterface cInterface = new CInterface("");
    CParameter cParameter = new CParameter("inputString", CppTypeInfo.STRING);
    cInterface.functions.add(
        CFunction.builder("HelloWorld_HelloWorldMethod")
            .returnType(CppTypeInfo.STRING)
            .parameters(singletonList(cParameter))
            .build());
    final String expected = "_baseRef HelloWorld_HelloWorldMethod(const char* inputString);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void instanceStructAndReleaseFunctionAreCreated() {
    FModelElement francaInterface = mock(FInterface.class);
    FModel francaParent = mock(FModel.class);
    when(francaInterface.getName()).thenReturn("SomeClass");
    when(francaInterface.eContainer()).thenReturn(francaParent);
    when(francaParent.getName()).thenReturn("some.package");
    CppTypeInfo classType =
        typeMapper.createCustomTypeInfo(francaInterface, CppTypeInfo.TypeCategory.CLASS);
    CInterface cInterface = new CInterface("InstantiableInterface", classType);
    CFunction instanceFunction =
        CFunction.builder("instanceMethod")
            .selfParameter(new CInParameter("_instance", cInterface.selfType))
            .build();
    cInterface.functions.add(instanceFunction);

    final String expected =
        "void InstantiableInterface_release(_baseRef handle);\n"
            + "void instanceMethod(_baseRef _instance);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void emptyStructsDefinition() {

    final CType type1 = new CType("Struct1TypeRef");
    final CStruct cStruct1 =
        new CStruct("Struct1Name", "BaseAPIStruct1Name", new CppTypeInfo(type1));

    final CType type2 = new CType("Struct2TypeRef");
    final CStruct cStruct2 =
        new CStruct("Struct2Name", "BaseAPIStruct2Name", new CppTypeInfo(type2));

    CInterface cInterface = new CInterface("");
    cInterface.structs.add(cStruct1);
    cInterface.structs.add(cStruct2);
    final String expected =
        "Struct1TypeRef Struct1Name_create();\n"
            + "void Struct1Name_release(_baseRef handle);\n"
            + "Struct2TypeRef Struct2Name_create();\n"
            + "void Struct2Name_release(_baseRef handle);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void nestedStructsInInstance() {

    final CType innerCType = new CType("InnerStructCTypeName");
    final CStruct cInnerStruct =
        new CStruct("InnerStructName", "BaseAPIInnerStructName", new CppTypeInfo(innerCType));

    final CType cType = new CType("OuterInterfaceCTypeName");
    final CppTypeInfo cppTypeInfo = new CppTypeInfo(cType);
    final CInterface cOuterInterface = new CInterface("OuterCInterfaceName", cppTypeInfo);

    final CField innerStructField =
        CField.builder()
            .swiftLayerName("swiftLayerFieldName")
            .baseLayerName("BaseLayerFieldName")
            .cppTypeInfo(cppTypeInfo)
            .build();
    cInnerStruct.fields.add(innerStructField);

    cOuterInterface.structs.add(cInnerStruct);

    final String expected =
        "InnerStructCTypeName InnerStructName_create();\n"
            + "void InnerStructName_release(_baseRef handle);\n"
            + "OuterInterfaceCTypeName InnerStructName_swiftLayerFieldName_get(_baseRef handle);\n"
            + "void InnerStructName_swiftLayerFieldName_set(_baseRef handle, OuterInterfaceCTypeName swiftLayerFieldName);\n"
            + "void OuterCInterfaceName_release(_baseRef handle);\n";

    final String generated = this.generate(cOuterInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionReturningOnlyError() {
    CppTypeInfo error = new CppTypeInfo(new CType("ERROR"), CppTypeInfo.TypeCategory.ENUM);
    CFunction function = CFunction.builder("functionName").error(error).build();
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(function);

    TemplateComparator expected = TemplateComparator.expect("ERROR functionName();\n").build();
    final String generated = this.generate(cInterface);

    expected.assertMatches(generated);
  }

  @Test
  public void functionReturningValueAndError() {
    CppTypeInfo error = new CppTypeInfo(new CType("ERROR"), CppTypeInfo.TypeCategory.ENUM);
    CFunction function =
        CFunction.builder("functionName")
            .error(error)
            .returnType(new CppTypeInfo(CType.FLOAT))
            .build();
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(function);

    final String generated = this.generate(cInterface);

    TemplateComparator expected =
        TemplateComparator.expect(
                "typedef struct {\n"
                    + "    bool has_value;\n"
                    + "    union {\n"
                    + "        ERROR error_code;\n"
                    + "        float returned_value;\n"
                    + "    };\n"
                    + "} functionName_result;\n")
            .expect("functionName_result functionName();\n")
            .build();

    expected.assertMatches(generated);
  }

  @Test
  public void functionTableWithInheritance() {
    CFunction baseFunction = CFunction.builder("functionBase").build();
    CFunction function = CFunction.builder("functionName").build();
    CInterface cInterface = new CInterface("", new CppTypeInfo(CType.BOOL));
    cInterface.functionTableName = "functionTable";
    cInterface.functions.add(function);
    cInterface.inheritedFunctions.add(baseFunction);

    final String generated = this.generate(cInterface);

    TemplateComparator expected =
        TemplateComparator.expect(
                "typedef struct {\n"
                    + "    void* swift_pointer;\n"
                    + "    void(*release)(void* swift_pointer);\n"
                    + "    void(*functionBase)(void* swift_pointer);\n"
                    + "    void(*functionName)(void* swift_pointer);\n"
                    + "} functionTable;\n")
            .build();

    expected.assertMatches(generated);
  }

  @Test
  public void functionTableForFunctionTakingByteBuffer() {
    CFunction function =
        CFunction.builder("functionTakingByteBuffer")
            .parameters(singletonList(new CParameter("buffer", CppTypeInfo.BYTE_VECTOR)))
            .build();
    CInterface cInterface = new CInterface("", new CppTypeInfo(CType.BOOL));
    cInterface.functionTableName = "functionTable";
    cInterface.functions.add(function);

    final String generated = this.generate(cInterface);

    TemplateComparator expected =
        TemplateComparator.expect(
                "typedef struct {\n"
                    + "    void* swift_pointer;\n"
                    + "    void(*release)(void* swift_pointer);\n"
                    + "    void(*functionTakingByteBuffer)(void* swift_pointer, const uint8_t* buffer_ptr, int64_t buffer_size);\n"
                    + "} functionTable;\n")
            .build();

    expected.assertMatches(generated);
  }
}
