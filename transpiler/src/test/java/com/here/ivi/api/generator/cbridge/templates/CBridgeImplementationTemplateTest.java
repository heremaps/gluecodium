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
            CFunction.builder("functionName").delegateCall("functionDelegate").build());
    final String expected = "void functionName() {\n" + "    return functionDelegate();\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            CFunction.builder("parameterFunctionName")
                .parameters(
                    Collections.singletonList(new CParameter("one", new CppTypeInfo(CType.INT32))))
                .delegateCall("delegator")
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
        CFunction.builder("doubleFunction")
            .parameters(Arrays.asList(first, second))
            .delegateCall("namespacy::classy::doubleFunction")
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
            CFunction.builder("returner")
                .returnType(new CppTypeInfo(CType.FLOAT))
                .delegateCall("delegate")
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
        new CField(
            "structField",
            "baseApiFieldName",
            new CppTypeInfo(new CType("NestedRef"), TypeCategory.STRUCT));
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
            + "    return {&get_pointer(handle)->baseApiFieldName};\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void stringFieldCreatesGetterAndSetter() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field = new CField("stringField", "baseApiFieldName", CppTypeInfo.STRING);
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
            + "    return {&get_pointer(handle)->baseApiFieldName};\n"
            + "}\n"
            + "void name_stringField_set(nameRef handle, const char* stringField) {\n"
            + "    get_pointer(handle)->baseApiFieldName.assign(stringField);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void primitiveFieldCreatesGetterAndSetter() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field = new CField("floatField", "baseApiFieldName", new CppTypeInfo(CType.FLOAT));
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
            + "    return get_pointer(handle)->baseApiFieldName;\n"
            + "}\n"
            + "void name_floatField_set(nameRef handle, float floatField) {\n"
            + "    get_pointer(handle)->baseApiFieldName = floatField;\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithEnumParameterInAndOut() {
    CInterface cInterface = new CInterface("");
    cInterface.functions =
        Collections.singletonList(
            CFunction.builder("parameterFunctionName")
                .parameters(
                    Collections.singletonList(
                        new CParameter(
                            "one", new CppTypeInfo(new CType("ENUM"), TypeCategory.ENUM))))
                .delegateCall("delegator")
                .returnType(new CppTypeInfo(new CType("RET_ENUM"), TypeCategory.ENUM))
                .build());
    final String expected =
        "RET_ENUM parameterFunctionName(ENUM one) {\n"
            + "    return static_cast<RET_ENUM>(delegator(static_cast<ENUM>(one)));\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateInstanceWithinStruct() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("SomeStructRef");
    CStruct struct = new CStruct("memberStruct", "baseName", new CppTypeInfo(type));
    CField field =
        new CField(
            "instanceField",
            "baseApiFieldName",
            new CppTypeInfo(new CType("SomeClassRef"), TypeCategory.INSTANCE));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "SomeStructRef memberStruct_create() {\n"
            + "    return {new baseName()};\n"
            + "}\n"
            + "void memberStruct_release(SomeStructRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n"
            + "SomeClassRef memberStruct_instanceField_get(SomeStructRef handle) {\n"
            + "    return {&get_pointer(handle)->baseApiFieldName};\n"
            + "}\n"
            + "void memberStruct_instanceField_set(SomeStructRef handle, SomeClassRef instanceField) {\n"
            + "    get_pointer(handle)->baseApiFieldName = *get_pointer(instanceField);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }
}
