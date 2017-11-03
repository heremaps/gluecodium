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

package com.here.ivi.api.generator.cbridge.templates;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.test.TemplateComparison;
import java.util.Arrays;
import java.util.Collections;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CBridgeHeaderTemplateTest {

  private String generate(final CInterface iface) {
    return CBridgeGenerator.generateHeaderContent(iface);
  }

  @Test
  public void systemInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.headerIncludes = Collections.singleton(Include.createSystemInclude("header.h"));
    final String expected = "#include <header.h>\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void projectInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.headerIncludes = Collections.singleton(Include.createInternalInclude("header.h"));
    final String expected = "#include \"header.h\"\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void function() {
    CInterface cInterface = new CInterface("");
    cInterface.functions = Collections.singletonList(CFunction.builder("functionName").build());
    final String expected = "void functionName();\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            CFunction.builder("parameterFunctionName")
                .parameters(
                    Collections.singletonList(new CParameter("one", new CppTypeInfo(CType.INT32))))
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
    cInterface.functions =
        Collections.singletonList(
            CFunction.builder("doubleFunction").parameters(Arrays.asList(first, second)).build());
    final String expected = "void doubleFunction(int16_t first, double second);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithReturnValue() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            CFunction.builder("returner").returnType(new CppTypeInfo(CType.FLOAT)).build());
    final String expected = "float returner();\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void helloWorldTest() {
    CInterface cInterface = new CInterface("");
    CParameter cParameter = new CParameter("inputString", CppTypeInfo.STRING);
    cInterface.functions =
        Collections.singletonList(
            CFunction.builder("HelloWorld_HelloWorldMethod")
                .returnType(CppTypeInfo.STRING)
                .parameters(Collections.singletonList(cParameter))
                .build());
    final String expected = "std_stringRef HelloWorld_HelloWorldMethod(const char* inputString);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void instanceStructAndReleaseFunctionAreCreated() {
    IncludeResolver resolver = mock(IncludeResolver.class);
    FModelElement francaInterface = mock(FInterface.class);
    FModel francaParent = mock(FModel.class);
    when(francaInterface.getName()).thenReturn("SomeClass");
    when(francaInterface.eContainer()).thenReturn(francaParent);
    when(francaParent.getName()).thenReturn("some.package");
    CClassType classType =
        new CClassType(
            CppTypeInfo.createCustomTypeInfo(
                resolver, francaInterface, CppTypeInfo.TypeCategory.CLASS));
    CInterface cInterface = new CInterface("InstantiableInterface", classType);
    CFunction instanceFunction =
        CFunction.builder("instanceMethod")
            .selfParameter(new CInParameter("_instance", cInterface.selfType))
            .build();
    cInterface.functions = Collections.singletonList(instanceFunction);

    final String expected =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} some_package_SomeClassRef;\n"
            + "void InstantiableInterface_release(some_package_SomeClassRef handle);\n"
            + "\n"
            + "void instanceMethod(some_package_SomeClassRef _instance);\n";
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
    cInterface.structs = Arrays.asList(cStruct1, cStruct2);
    final String expected =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} Struct1TypeRef;\n"
            + "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} Struct2TypeRef;\n"
            + "Struct1TypeRef Struct1Name_create();\n"
            + "void Struct1Name_release(Struct1TypeRef handle);\n"
            + "Struct2TypeRef Struct2Name_create();\n"
            + "void Struct2Name_release(Struct2TypeRef handle);\n";
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
    final CClassType cClassType = new CClassType(cppTypeInfo);
    final CInterface cOuterInterface = new CInterface("OuterCInterfaceName", cClassType);

    final CField innerStructField =
        new CField("swiftLayerFieldName", "BaseLayerFieldName", cppTypeInfo);
    cInnerStruct.fields.add(innerStructField);

    cOuterInterface.structs.add(cInnerStruct);

    final String expected =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} InnerStructCTypeName;\n"
            + "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} OuterInterfaceCTypeName;\n"
            + "InnerStructCTypeName InnerStructName_create();\n"
            + "void InnerStructName_release(InnerStructCTypeName handle);\n"
            + "OuterInterfaceCTypeName InnerStructName_swiftLayerFieldName_get(InnerStructCTypeName handle);\n"
            + "void InnerStructName_swiftLayerFieldName_set(InnerStructCTypeName handle, OuterInterfaceCTypeName swiftLayerFieldName);\n"
            + "void OuterCInterfaceName_release(OuterInterfaceCTypeName handle);\n";

    final String generated = this.generate(cOuterInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }
}
