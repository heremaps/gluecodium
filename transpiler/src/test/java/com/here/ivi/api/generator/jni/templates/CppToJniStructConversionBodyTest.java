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

package com.here.ivi.api.generator.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniField;
import com.here.ivi.api.model.jni.JniStruct;
import com.here.ivi.api.model.jni.JniType;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CppToJniStructConversionBodyTest {
  private static final String OUTER_CLASS_NAME = "Outer";
  private static final String INNER_CLASS_NAME = "Inner";
  private static final List<String> PACKAGES = Arrays.asList("a", "b", "c");

  private JniStruct jniStruct;

  @Before
  public void setUp() {
    JniContainer jniContainer =
        JniContainer.createInterfaceContainer(
            PACKAGES, PACKAGES, OUTER_CLASS_NAME, OUTER_CLASS_NAME);

    jniStruct =
        new JniStruct(
            jniContainer,
            new JavaClass(INNER_CLASS_NAME),
            new CppStruct(INNER_CLASS_NAME),
            new LinkedList<>());
  }

  private static JniField createIntField() {
    JavaField javaField = new JavaField(JavaPrimitiveType.INT, "intfield");
    CppField cppField = new CppField(CppPrimitiveTypeRef.INT8, "cppInt");
    return new JniField(javaField, cppField, null);
  }

  private static JniField createCustom() {
    JavaField javaField = new JavaField(new JavaCustomType("JavaStructType"), "nestedStruct");
    CppField cppField =
        new CppField(new CppComplexTypeRef.Builder("CppStructType").build(), "nestedCplusCplus");
    return new JniField(javaField, cppField, null);
  }

  private static JniField createTemplateType() {
    JavaField javaField =
        new JavaField(
            JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST), "javaTemplateType");
    CppField cppField =
        new CppField(new CppComplexTypeRef.Builder("CppStructType").build(), "nestedCplusCplus");
    return new JniField(javaField, cppField, null);
  }

  @Test
  public void generateInt() {
    jniStruct.fields.add(createIntField());
    String expected =
        "{\n"
            + "  auto javaClass = _jenv->FindClass("
            + "\""
            + String.join("/", PACKAGES)
            + "/"
            + OUTER_CLASS_NAME
            + "$"
            + INNER_CLASS_NAME
            + "\");\n"
            + "  auto _jresult = create_object(_jenv, javaClass);\n"
            + "  auto jcppInt = _ninput.cppInt;\n"
            + "  set_int_field(_jenv, javaClass, _jresult, \"intfield\", jcppInt);\n"
            + "  return _jresult;\n"
            + "}";

    String generated = TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);

    assertEquals(expected, generated);
  }

  @Test
  public void generateCustom() {
    JniField jniField = createCustom();
    jniStruct.fields.add(jniField);
    String innerSignature =
        String.join("/", PACKAGES) + "/" + OUTER_CLASS_NAME + "$" + INNER_CLASS_NAME;
    String fieldSignature =
        String.join("/", PACKAGES) + "/" + OUTER_CLASS_NAME + "$" + jniField.javaField.type.name;
    String expected =
        "{\n"
            + "  auto javaClass = _jenv->FindClass("
            + "\""
            + innerSignature
            + "\");\n"
            + "  auto _jresult = create_object(_jenv, javaClass);\n"
            + "  auto jnestedCplusCplus = convert_to_jni(_jenv, _ninput.nestedCplusCplus);\n"
            + "  set_object_field(_jenv, javaClass, _jresult, \"nestedStruct\",\n"
            + "  \""
            + "L"
            + fieldSignature
            + ";\", jnestedCplusCplus);\n"
            + "  return _jresult;\n"
            + "}";

    String generated = TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);

    assertEquals(expected, generated);
  }

  @Test
  public void generateTemplateType() {
    JniField jniField = createTemplateType();
    jniStruct.fields.add(jniField);
    String innerSignature =
        String.join("/", PACKAGES) + "/" + OUTER_CLASS_NAME + "$" + INNER_CLASS_NAME;

    String expected =
        "{\n"
            + "  auto javaClass = _jenv->FindClass("
            + "\""
            + innerSignature
            + "\");\n"
            + "  auto _jresult = create_object(_jenv, javaClass);\n"
            + "  auto jnestedCplusCplus = convert_to_jni(_jenv, _ninput.nestedCplusCplus);\n"
            + "  set_object_field(_jenv, javaClass, _jresult, \"javaTemplateType\",\n"
            + "  \"Ljava/util/List;\""
            + ", jnestedCplusCplus);\n"
            + "  return _jresult;\n"
            + "}";

    String generated = TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);

    assertEquals(expected, generated);
  }

  @Test
  public void generateMultipleFields() {
    jniStruct.fields.add(createIntField());
    JniField customField = createCustom();
    jniStruct.fields.add(customField);
    String innerSignature =
        String.join("/", PACKAGES) + "/" + OUTER_CLASS_NAME + "$" + INNER_CLASS_NAME;
    String fieldSignature =
        String.join("/", PACKAGES) + "/" + OUTER_CLASS_NAME + "$" + customField.javaField.type.name;
    String expected =
        "{\n"
            + "  auto javaClass = _jenv->FindClass("
            + "\""
            + innerSignature
            + "\");\n"
            + "  auto _jresult = create_object(_jenv, javaClass);\n"
            + "  auto jcppInt = _ninput.cppInt;\n"
            + "  auto jnestedCplusCplus = convert_to_jni(_jenv, _ninput.nestedCplusCplus);\n"
            + "  set_int_field(_jenv, javaClass, _jresult, \"intfield\", jcppInt);\n"
            + "  set_object_field(_jenv, javaClass, _jresult, \"nestedStruct\",\n"
            + "  \""
            + "L"
            + fieldSignature
            + ";\", jnestedCplusCplus);\n"
            + "  return _jresult;\n"
            + "}";
    String generated = TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);

    assertEquals(expected, generated);
  }

  @Test
  public void generateWithByteBufferField() {
    JavaField javaField = new JavaField(JavaArrayType.BYTE_ARRAY, "image");
    CppTypeRef cppTypeRef =
        CppTemplateTypeRef.create(
            CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8);
    CppField cppField = new CppField(cppTypeRef, "image");
    JniType jniType = JniType.createType(javaField.type, cppField.type);
    jniStruct.fields.add(new JniField(javaField, cppField, jniType));

    String generated = TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);

    String expected =
        "{\n"
            + "  auto javaClass = _jenv->FindClass("
            + "\""
            + String.join("/", PACKAGES)
            + "/"
            + OUTER_CLASS_NAME
            + "$"
            + INNER_CLASS_NAME
            + "\");\n"
            + "  auto _jresult = create_object(_jenv, javaClass);\n"
            + "  auto jimage = convert_to_jni_array(_jenv, _ninput.image);\n"
            + "  set_byte_array_field(_jenv, javaClass, _jresult, \"image\", jimage);\n"
            + "  return _jresult;\n"
            + "}";
    assertEquals(expected, generated);
  }
}
