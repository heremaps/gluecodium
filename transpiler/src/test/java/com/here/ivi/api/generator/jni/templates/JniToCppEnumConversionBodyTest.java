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
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniEnum;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppEnumConversionBodyTest {

  private static final String JAVA_OUTER_CLASS_NAME = "MyOuterJavaClass";

  private static final String CPP_OUTER_CLASS_NAME = "CppOuter";

  private static final List<String> JAVA_PACKAGE = Arrays.asList("java", "package");
  private static final List<String> CPP_NAMESPACES = Arrays.asList("a", "superfancy", "namespace");

  @Test
  public void generateFromInterface() {

    // Arrange
    JniContainer jniContainer =
        JniContainer.createInterfaceContainer(
            JAVA_PACKAGE, CPP_NAMESPACES, JAVA_OUTER_CLASS_NAME, CPP_OUTER_CLASS_NAME);

    JniEnum jniEnum = new JniEnum(jniContainer, "MyJavaEnum", "MyCppEnum");

    // Act
    String generated = TemplateEngine.render("jni/JniToCppEnumerationConversionBody", jniEnum);

    // Assert
    String expected =
        "{\n"
            + "    jclass javaClass = _jenv->GetObjectClass(_jinput);\n"
            + "    jmethodID valueMethodID = _jenv->GetMethodID( javaClass, \"value\", \"()I\" );\n"
            + "    valueMethodID = valueMethodID ? valueMethodID : _jenv->GetMethodID( javaClass, \"ordinal\", \"()I\" );\n"
            + "\n"
            + "    jint enumValue = _jenv->CallIntMethod( _jinput, valueMethodID );\n"
            + "    _nout = ::::a::superfancy::namespace::CppOuter::MyCppEnum( enumValue );\n"
            + "}";
    assertEquals(expected, generated);
  }

  @Test
  public void generateFromTypeCollection() {

    // Arrange
    JniContainer jniContainer =
        JniContainer.createTypeCollectionContainer(JAVA_PACKAGE, CPP_NAMESPACES);

    JniEnum jniEnum = new JniEnum(jniContainer, "MyJavaEnum", "MyCppEnum");

    // Act
    String generated = TemplateEngine.render("jni/JniToCppEnumerationConversionBody", jniEnum);

    // Assert
    String expected =
        "{\n"
            + "    jclass javaClass = _jenv->GetObjectClass(_jinput);\n"
            + "    jmethodID valueMethodID = _jenv->GetMethodID( javaClass, \"value\", \"()I\" );\n"
            + "    valueMethodID = valueMethodID ? valueMethodID : _jenv->GetMethodID( javaClass, \"ordinal\", \"()I\" );\n"
            + "\n"
            + "    jint enumValue = _jenv->CallIntMethod( _jinput, valueMethodID );\n"
            + "    _nout = ::::a::superfancy::namespace::MyCppEnum( enumValue );\n"
            + "}";
    assertEquals(expected, generated);
  }
}
