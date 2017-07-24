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
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppStructConversionBodyTest {

  private static final String JAVA_OUTER_CLASS_NAME = "MyOuterJavaClass";
  private static final JavaClass JAVA_CLASS_INNER = new JavaClass("jInner");

  private static final String CPP_OUTER_CLASS_NAME = "CppOuter";
  private static final CppStruct CPP_STRUCT = new CppStruct("CppStruct");

  private static final List<String> CPP_NAMESPACES = Arrays.asList("a", "superfancy", "namespace");

  private JniModel jniModel;
  private JniStruct jniStruct;

  private static final List<String> JAVA_PACKAGE = Arrays.asList("java", "package");

  @Before
  public void setup() {
    jniModel = new JniModel();
    jniModel.cppNameSpaces = CPP_NAMESPACES;
    jniModel.cppClassName = CPP_OUTER_CLASS_NAME;
    jniModel.javaClass = new JavaClass(JAVA_OUTER_CLASS_NAME);
    jniModel.javaPackages = JAVA_PACKAGE;
    jniStruct = new JniStruct(jniModel, JAVA_CLASS_INNER, CPP_STRUCT, new LinkedList<>());
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

    JniField field = createIntField();
    jniStruct.fields.add(field);

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);

    //assert
    String expected =
        "{\n\n"
            + "  jclass javaClass = env->GetObjectClass(jinput);\n\n"
            + "  out."
            + field.cppField.name
            + " = get_int_field(env, javaClass, "
            + "jinput, \""
            + field.javaField.name
            + "\");\n}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateString() {

    JavaField javaField =
        new JavaField(new JavaReferenceType(JavaReferenceType.Type.STRING), "StrStructMember");
    CppField cppField =
        new CppField(new CppCustomType(CppCustomType.STRING_TYPE_NAME), "cppString");
    JniField jniField = new JniField(javaField, cppField);
    jniStruct.fields.add(jniField);

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);

    //assert
    String expected =
        "{\n\n"
            + "  jclass javaClass = env->GetObjectClass(jinput);\n\n"
            + "  out."
            + jniField.cppField.name
            + " = get_String_field(env, javaClass, "
            + "jinput, \""
            + jniField.javaField.name
            + "\");\n}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateCustom() {

    JniField field = createCustom();
    jniStruct.fields.add(field);

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);

    //assert
    String expected =
        "{\n\n"
            + "  jclass javaClass = env->GetObjectClass(jinput);\n\n"
            + "  convert_from_jni"
            + "(\n"
            + "    env,\n"
            + "    here::internal::get_object_field(\n"
            + "    env,\n"
            + "    javaClass,\n"
            + "    jinput,\n"
            + "    \""
            + field.javaField.name
            + "\",\n"
            + "    \"L"
            + String.join("/", jniModel.javaPackages)
            + "/"
            + jniModel.javaClass.name
            + "$"
            + jniStruct.javaClass.name
            + ";\"),\n"
            + "    out."
            + field.cppField.name
            + " );\n}\n";

    assertEquals(expected, generated);
  }

  @Test
  public void generateMultipleFields() {

    JniField intField = createIntField();
    JniField customField = createCustom();
    jniStruct.fields.add(intField);
    jniStruct.fields.add(customField);

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);

    //assert
    String expected =
        "{\n\n"
            + "  jclass javaClass = env->GetObjectClass(jinput);\n\n"
            + "  out."
            + intField.cppField.name
            + " = get_int_field(env, javaClass, "
            + "jinput, \""
            + intField.javaField.name
            + "\");\n\n"
            + "  convert_from_jni(\n"
            + "    env,\n"
            + "    here::internal::get_object_field(\n"
            + "    env,\n"
            + "    javaClass,\n"
            + "    jinput,\n"
            + "    \""
            + customField.javaField.name
            + "\",\n"
            + "    \"L"
            + String.join("/", jniModel.javaPackages)
            + "/"
            + jniModel.javaClass.name
            + "$"
            + jniStruct.javaClass.name
            + ";\"),\n"
            + "    out."
            + customField.cppField.name
            + " );\n}\n";

    assertEquals(expected, generated);
  }
}
