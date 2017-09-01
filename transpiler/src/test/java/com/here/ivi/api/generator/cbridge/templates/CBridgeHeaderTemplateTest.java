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

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CPointerType;
import com.here.ivi.api.model.cmodel.CStruct;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.test.TemplateComparison;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mockito;

@RunWith(JUnit4.class)
public class CBridgeHeaderTemplateTest {

  private String generate(final CInterface iface) {
    return CBridgeGenerator.generateHeaderContent(iface);
  }

  @Test
  public void systemInclude() {
    CInterface cInterface = new CInterface();
    cInterface.headerIncludes = Collections.singleton(Include.createSystemInclude("header.h"));
    final String expected = "#include <header.h>\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void projectInclude() {
    CInterface cInterface = new CInterface();
    cInterface.headerIncludes = Collections.singleton(Include.createInternalInclude("header.h"));
    final String expected = "#include \"header.h\"\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void function() {
    CInterface cInterface = new CInterface();
    cInterface.functions = Collections.singletonList(new CFunction.Builder("functionName").build());
    final String expected = "void functionName();\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("parameterFunctionName")
                .parameters(Collections.singletonList(new CParameter("one", CType.INT32)))
                .build());
    final String expected = "void parameterFunctionName(int32_t one);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithTwoParameters() {
    CInterface cInterface = new CInterface();
    CParameter first = new CParameter("first", CType.INT16);
    CParameter second = new CParameter("second", CType.DOUBLE);
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("doubleFunction")
                .parameters(Arrays.asList(first, second))
                .build());
    final String expected = "void doubleFunction(int16_t first, double second);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void functionWithReturnValue() {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("returner").returnType(CType.FLOAT).build());
    final String expected = "float returner();\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void privateFunctionNotGeneratedInHeader() {
    CInterface cInterface = new CInterface();
    CFunction privateFunction = new CFunction.Builder("privateFunction").build();
    privateFunction.declareInImplementationOnly = true;
    cInterface.functions = Collections.singletonList(privateFunction);

    final String expected = "";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void helloWorldTest() {
    CInterface cInterface = new CInterface();
    CParameter cParameter = new CParameter("inputString", CPointerType.CONST_CHAR_PTR);
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("HelloWorldStub_HelloWorldMethod")
                .returnType(CPointerType.CONST_CHAR_PTR)
                .parameters(Collections.singletonList(cParameter))
                .build());
    final String expected =
        "const char* HelloWorldStub_HelloWorldMethod(const char* inputString);\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void emptyStructsDefinition() {
    final CType fakeType = Mockito.mock(CType.class);
    fakeType.includes = Collections.emptySet();
    final CppTypeInfo cppTypeInfo = new CppTypeInfo(fakeType);
    CInterface cInterface = new CInterface();
    CStruct cStruct1 =
        new CStruct("Struct1NameRef", "Struct1Name", "BaseAPIStruct1Name", cppTypeInfo);
    CStruct cStruct2 =
        new CStruct("Struct2NameRef", "Struct2Name", "BaseAPIStruct2Name", cppTypeInfo);
    cInterface.structs = Arrays.asList(cStruct1, cStruct2);
    final String expected =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} Struct1NameRef;\n"
            + "\n"
            + "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} Struct2NameRef;\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }
}
