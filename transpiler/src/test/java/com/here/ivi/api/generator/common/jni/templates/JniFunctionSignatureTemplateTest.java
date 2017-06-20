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

import static org.junit.Assert.*;

import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniFunctionSignatureTemplateTest {
  @Test
  public void simpleJniMethodGenerationGeneration() {
    // Arrange
    JavaClass javaClass = new JavaClass("ClassName");
    javaClass.javaPackage = new JavaPackage(Arrays.asList("com", "here", "jni", "test"));
    JavaMethod javaMethod = new JavaMethod("methodName");
    String expected = "Java_com_here_jni_test_ClassName_methodName(JNIEnv* env, jobject jinstance)";

    // Act
    String generated = JniFunctionSignatureTemplate.generate(javaClass, javaMethod).toString();

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void complexJniMethodGenerationGeneration() {
    // Arrange
    JavaClass javaClass = new JavaClass("ClassName");
    javaClass.javaPackage = new JavaPackage(Arrays.asList("com", "here", "jni", "test"));
    JavaMethod javaMethod = new JavaMethod("methodName");
    javaMethod.parameters =
        Arrays.asList(
            new JavaParameter(new JavaReferenceType(JavaReferenceType.Type.STRING), "stringParam"),
            new JavaParameter(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intParam"),
            new JavaParameter(new JavaCustomType("CustomParamType"), "customParam"));

    String expectedParams =
        "JNIEnv* env, jobject jinstance, jstring jstringParam, jint jintParam, jobject jcustomParam";
    String expected = "Java_com_here_jni_test_ClassName_methodName(" + expectedParams + ")";

    // Act
    String generated = JniFunctionSignatureTemplate.generate(javaClass, javaMethod).toString();

    // Assert
    assertEquals(expected, generated);
  }
}
