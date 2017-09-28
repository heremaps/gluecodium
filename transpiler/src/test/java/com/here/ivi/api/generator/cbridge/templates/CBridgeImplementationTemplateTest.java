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
import com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.test.TemplateComparison;
import java.util.*;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CBridgeImplementationTemplateTest {
  @Rule public final TemporaryFolder tempFolder = new TemporaryFolder();

  public String generate(final CInterface iface) {
    return CBridgeGenerator.generateImplementationContent(iface);
  }

  @Test
  public void systemInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.implementationIncludes =
        Collections.singleton(Include.createSystemInclude("header.h"));
    final String expected = "#include <header.h>\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void projectInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.implementationIncludes =
        Collections.singleton(Include.createInternalInclude("header.h"));
    final String expected = "#include \"header.h\"\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void function() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("functionName").delegate("functionDelegate").build());
    final String expected = "void functionName() {\n" + "    return functionDelegate();\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("parameterFunctionName")
                .parameters(
                    Collections.singletonList(new CParameter("one", new CppTypeInfo(CType.INT32))))
                .delegate("delegator")
                .build());
    final String expected =
        "void parameterFunctionName(int32_t one) {\n" + "    return delegator(one);\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithTwoParameters() {
    CInterface cInterface = new CInterface("");
    final CParameter first = new CParameter("first", new CppTypeInfo(CType.INT16));
    final CParameter second = new CParameter("second", new CppTypeInfo(CType.DOUBLE));
    final CFunction doubleFunction =
        new CFunction.Builder("doubleFunction")
            .parameters(Arrays.asList(first, second))
            .delegate("namespacy::classy::doubleFunction")
            .build();
    cInterface.functions = Collections.singletonList(doubleFunction);
    final String expected =
        "void doubleFunction(int16_t first, double second) {\n"
            + "    return namespacy::classy::doubleFunction(first, second);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithReturnValue() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("returner")
                .returnType(new CppTypeInfo(CType.FLOAT))
                .delegate("delegate")
                .build());
    final String expected = "float returner() {\n" + "    return delegate();\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void nestedStructFieldCreatesGetterOnly() {
    CInterface cInterface = new CInterface("");
    final CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field =
        new CField("structField", new CppTypeInfo(new CType("NestedRef"), TypeCategory.STRUCT));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "nameRef name_create() {\n"
            + "    return {new baseName()};\n"
            + "}\n"
            + "void name_release(nameRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n"
            + "NestedRef name_structField_get(nameRef handle) {\n"
            + "    return {&get_pointer(handle)->structField};\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void stringFieldCreatesGetterAndSetter() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field = new CField("stringField", CppTypeInfo.STRING);
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "nameRef name_create() {\n"
            + "    return {new baseName()};\n"
            + "}\n"
            + "void name_release(nameRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n"
            + "std_stringRef name_stringField_get(nameRef handle) {\n"
            + "    return {&get_pointer(handle)->stringField};\n"
            + "}\n"
            + "void name_stringField_set(nameRef handle, const char* stringField) {\n"
            + "    get_pointer(handle)->stringField.assign(stringField);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void primitiveFieldCreatesGetterAndSetter() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field = new CField("floatField", new CppTypeInfo(CType.FLOAT));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "nameRef name_create() {\n"
            + "    return {new baseName()};\n"
            + "}\n"
            + "void name_release(nameRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n"
            + "float name_floatField_get(nameRef handle) {\n"
            + "    return get_pointer(handle)->floatField;\n"
            + "}\n"
            + "void name_floatField_set(nameRef handle, float floatField) {\n"
            + "    get_pointer(handle)->floatField = floatField;\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithEnumParameterInAndOut() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("parameterFunctionName")
                .parameters(
                    Collections.singletonList(
                        new CParameter(
                            "one", new CppTypeInfo(new CType("ENUM"), TypeCategory.ENUM))))
                .delegate("delegator")
                .returnType(new CppTypeInfo(new CType("RET_ENUM"), TypeCategory.ENUM))
                .build());
    final String expected =
        "RET_ENUM parameterFunctionName(ENUM one) {\n"
            + "    return static_cast<RET_ENUM>(delegator(static_cast<ENUM>(one)));\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }
}
