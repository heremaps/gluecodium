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
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniField;
import com.here.ivi.api.model.jni.JniStruct;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppStructConversionBodyTest {

  private static final String JAVA_OUTER_CLASS_NAME = "MyOuterJavaClass";
  private static final JavaClass JAVA_CLASS_INNER = new JavaClass("jInner");

  private static final String CPP_OUTER_CLASS_NAME = "CppOuter";
  private static final CppStruct CPP_STRUCT = new CppStruct("CppStruct");

  private static final List<String> JAVA_PACKAGE = Arrays.asList("java", "package");
  private static final List<String> CPP_NAMESPACES = Arrays.asList("a", "superfancy", "namespace");

  private final JniContainer jniContainer =
      JniContainer.createInterfaceContainer(
          JAVA_PACKAGE, CPP_NAMESPACES, JAVA_OUTER_CLASS_NAME, CPP_OUTER_CLASS_NAME);

  private final JniStruct jniStruct =
      new JniStruct(jniContainer, JAVA_CLASS_INNER, CPP_STRUCT, new LinkedList<>());

  private static JniField createIntField() {
    JavaField javaField = new JavaField(JavaPrimitiveType.INT, "intfield");
    CppField cppField = new CppField(CppPrimitiveTypeRef.INT8, "cppInt");
    return new JniField(javaField, cppField, null);
  }

  private static JniField createCustom() {
    JavaCustomType javaCustomType = new JavaCustomType("JavaStructType");
    JavaField javaField =
        new JavaField(javaCustomType, "nestedStruct", new JavaValue(javaCustomType));
    CppField cppField =
        new CppField(new CppComplexTypeRef.Builder("CppStructType").build(), "nestedCplusCplus");
    return new JniField(javaField, cppField, null);
  }

  private static JniField createTemplateType() {
    JavaTemplateType javaTemplateType =
        JavaTemplateType.create(JavaTemplateType.TemplateClass.LIST);
    JavaField javaField =
        new JavaField(javaTemplateType, "javaTemplateType", new JavaValue(javaTemplateType));
    CppField cppField =
        new CppField(new CppComplexTypeRef.Builder("CppStructType").build(), "nestedCplusCplus");
    return new JniField(javaField, cppField, null);
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
            + "  jclass javaClass = _jenv->GetObjectClass(_jinput);\n\n"
            + "  _nout."
            + field.cppField.name
            + " = get_int_field(_jenv, javaClass, "
            + "_jinput, \""
            + field.javaField.name
            + "\");\n}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateString() {

    JavaField javaField =
        new JavaField(new JavaReferenceType(JavaReferenceType.Type.STRING), "StrStructMember");
    CppField cppField =
        new CppField(new CppComplexTypeRef.Builder("::std::string").build(), "cppString");
    JniField jniField = new JniField(javaField, cppField, null);
    jniStruct.fields.add(jniField);

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);

    //assert
    String expected =
        "{\n\n"
            + "  jclass javaClass = _jenv->GetObjectClass(_jinput);\n\n"
            + "  _nout."
            + jniField.cppField.name
            + " = get_string_field(_jenv, javaClass, "
            + "_jinput, \""
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
            + "  jclass javaClass = _jenv->GetObjectClass(_jinput);\n\n"
            + "  convert_from_jni"
            + "(\n"
            + "    _jenv,\n"
            + "    get_object_field(\n"
            + "    _jenv,\n"
            + "    javaClass,\n"
            + "    _jinput,\n"
            + "    \""
            + field.javaField.name
            + "\",\n"
            + "    \"L"
            + String.join("/", jniContainer.javaPackages)
            + "/"
            + jniContainer.javaName
            + "$"
            + field.javaField.type.name
            + ";\"),\n"
            + "    _nout."
            + field.cppField.name
            + " );\n}\n";

    assertEquals(expected, generated);
  }

  @Test
  public void generateTemplateType() {

    JniField field = createTemplateType();
    jniStruct.fields.add(field);

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);

    //assert
    String expected =
        "{\n\n"
            + "  jclass javaClass = _jenv->GetObjectClass(_jinput);\n\n"
            + "  convert_from_jni"
            + "(\n"
            + "    _jenv,\n"
            + "    get_object_field(\n"
            + "    _jenv,\n"
            + "    javaClass,\n"
            + "    _jinput,\n"
            + "    \""
            + field.javaField.name
            + "\",\n"
            + "    \"Ljava/util/List;\"),\n"
            + "    _nout."
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
            + "  jclass javaClass = _jenv->GetObjectClass(_jinput);\n\n"
            + "  _nout."
            + intField.cppField.name
            + " = get_int_field(_jenv, javaClass, "
            + "_jinput, \""
            + intField.javaField.name
            + "\");\n\n"
            + "  convert_from_jni(\n"
            + "    _jenv,\n"
            + "    get_object_field(\n"
            + "    _jenv,\n"
            + "    javaClass,\n"
            + "    _jinput,\n"
            + "    \""
            + customField.javaField.name
            + "\",\n"
            + "    \"L"
            + String.join("/", jniContainer.javaPackages)
            + "/"
            + jniContainer.javaName
            + "$"
            + customField.javaField.type.name
            + ";\"),\n"
            + "    _nout."
            + customField.cppField.name
            + " );\n}\n";

    assertEquals(expected, generated);
  }
}
