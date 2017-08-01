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

package com.here.ivi.api.generator.common.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.jni.JniField;
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniStruct;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
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
    JniModel jniModel = new JniModel();
    jniModel.javaPackages = PACKAGES;
    jniModel.cppNameSpaces = PACKAGES;
    jniModel.cppClassName = OUTER_CLASS_NAME;
    jniModel.javaClass = new JavaClass(OUTER_CLASS_NAME);

    jniStruct =
        new JniStruct(
            jniModel,
            new JavaClass(INNER_CLASS_NAME),
            new CppStruct(INNER_CLASS_NAME),
            new LinkedList<>());
  }

  private static JniField createIntField() {
    JavaField javaField =
        new JavaField(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intfield");
    CppField cppField = new CppField(new CppPrimitiveType(CppPrimitiveType.Type.INT8), "cppInt");
    return new JniField(javaField, cppField);
  }

  private static JniField createCustom() {
    JavaField javaField = new JavaField(new JavaCustomType("JavaStructType"), "nestedStruct");
    CppField cppField = new CppField(new CppCustomType("CppStructType"), "nestedCplusCplus");
    return new JniField(javaField, cppField);
  }

  @Test
  public void generateInt() {
    jniStruct.fields.add(createIntField());
    String expected =
        "{\n"
            + "  auto javaClass = env->FindClass("
            + "\""
            + String.join("/", PACKAGES)
            + "/"
            + OUTER_CLASS_NAME
            + "$"
            + INNER_CLASS_NAME
            + "\");\n"
            + "  auto result = create_object(env, javaClass);\n"
            + "  auto jcppInt = ninput.cppInt;\n"
            + "  set_int_field(env, javaClass, result, \"intfield\", jcppInt);\n"
            + "  return result;\n"
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
            + "  auto javaClass = env->FindClass("
            + "\""
            + innerSignature
            + "\");\n"
            + "  auto result = create_object(env, javaClass);\n"
            + "  auto jnestedCplusCplus = convert_to_jni(env, ninput.nestedCplusCplus);\n"
            + "  set_object_field(env, javaClass, result, \"nestedStruct\",\n"
            + "  \""
            + "L"
            + fieldSignature
            + ";\", jnestedCplusCplus);\n"
            + "  return result;\n"
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
            + "  auto javaClass = env->FindClass("
            + "\""
            + innerSignature
            + "\");\n"
            + "  auto result = create_object(env, javaClass);\n"
            + "  auto jcppInt = ninput.cppInt;\n"
            + "  auto jnestedCplusCplus = convert_to_jni(env, ninput.nestedCplusCplus);\n"
            + "  set_int_field(env, javaClass, result, \"intfield\", jcppInt);\n"
            + "  set_object_field(env, javaClass, result, \"nestedStruct\",\n"
            + "  \""
            + "L"
            + fieldSignature
            + ";\", jnestedCplusCplus);\n"
            + "  return result;\n"
            + "}";
    String generated = TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);

    assertEquals(expected, generated);
  }
}
