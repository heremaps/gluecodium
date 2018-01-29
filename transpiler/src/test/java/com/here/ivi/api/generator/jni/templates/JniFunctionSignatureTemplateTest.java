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
import com.here.ivi.api.model.cpp.CppComplexTypeRef;
import com.here.ivi.api.model.cpp.CppPrimitiveTypeRef;
import com.here.ivi.api.model.java.JavaCustomType;
import com.here.ivi.api.model.java.JavaPackage;
import com.here.ivi.api.model.java.JavaPrimitiveType;
import com.here.ivi.api.model.java.JavaReferenceType;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniMethod;
import com.here.ivi.api.model.jni.JniParameter;
import com.here.ivi.api.model.jni.JniType;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniFunctionSignatureTemplateTest {

  private static final String TEMPLATE_NAME = "jni/FunctionSignature";

  private final JniContainer jniContainer =
      JniContainer.builder(Arrays.asList("com", "here", "jni", "test"), Collections.emptyList())
          .javaName("ClassName")
          .javaInterfaceName("ClassName")
          .cppName("ClassName")
          .isFrancaInterface(true)
          .build();

  @Test
  public void simpleJniMethod() {
    // Arrange
    JniMethod jniMethod = new JniMethod.Builder("methodName", null).build();
    jniContainer.add(jniMethod);

    String expected =
        "Java_com_here_jni_test_ClassName_methodName(JNIEnv* _jenv, jobject _jinstance)";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, jniMethod);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void complexJniMethod() {
    // Arrange
    JniMethod jniMethod =
        new JniMethod.Builder("methodName", null).owningContainer(jniContainer).build();

    jniMethod.parameters.add(
        new JniParameter(
            "stringParam",
            JniType.createType(
                new JavaReferenceType(JavaReferenceType.Type.STRING),
                new CppComplexTypeRef.Builder("::std::string").build())));
    jniMethod.parameters.add(
        new JniParameter(
            "intParam", JniType.createType(JavaPrimitiveType.INT, CppPrimitiveTypeRef.INT8)));
    jniMethod.parameters.add(
        new JniParameter(
            "customParam",
            JniType.createType(
                new JavaCustomType("CustomParamType"),
                new CppComplexTypeRef.Builder("customCppType").build())));
    jniContainer.add(jniMethod);

    String expectedParams =
        "JNIEnv* _jenv, jobject _jinstance,"
            + " jstring jstringParam, jint jintParam, jobject jcustomParam";
    String expected = "Java_com_here_jni_test_ClassName_methodName(" + expectedParams + ")";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, jniMethod);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void overloadedJniMethod() {
    // Arrange
    JniMethod jniMethod =
        new JniMethod.Builder("methodName", null)
            .isOverloaded(true)
            .owningContainer(jniContainer)
            .build();

    jniMethod.parameters.add(
        new JniParameter(
            "stringParam",
            JniType.createType(
                new JavaReferenceType(JavaReferenceType.Type.STRING),
                new CppComplexTypeRef.Builder("::std::string").build())));
    jniMethod.parameters.add(
        new JniParameter(
            "intParam", JniType.createType(JavaPrimitiveType.INT, CppPrimitiveTypeRef.INT8)));
    jniMethod.parameters.add(
        new JniParameter(
            "customParam",
            JniType.createType(
                new JavaCustomType("CustomParamType", JavaPackage.DEFAULT),
                new CppComplexTypeRef.Builder("customCppType").build())));
    jniContainer.add(jniMethod);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, jniMethod);

    // Assert
    String expectedParams =
        "JNIEnv* _jenv, jobject _jinstance,"
            + " jstring jstringParam, jint jintParam, jobject jcustomParam";
    String expected =
        "Java_com_here_jni_test_ClassName_methodName"
            + "__Ljava_lang_String_2ILcom_here_android_CustomParamType_2("
            + expectedParams
            + ")";
    assertEquals(expected, generated);
  }
}
