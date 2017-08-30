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

import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniMethod;
import com.here.ivi.api.model.jni.JniParameter;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniFunctionSignatureTemplateTest {

  private final JniContainer jniContainer =
      JniContainer.createTypeCollectionContainer(
          Arrays.asList("com", "here", "jni", "test"), Collections.emptyList(), "ClassName", "");

  @Test
  public void simpleJniMethodGenerationGeneration() {
    // Arrange
    JniMethod jniMethod = new JniMethod();
    jniMethod.javaMethodName = "methodName";
    jniContainer.add(jniMethod);

    String expected = "Java_com_here_jni_test_ClassName_methodName(JNIEnv* env, jobject jinstance)";

    // Act
    String generated = JniFunctionSignatureTemplate.generate(jniMethod).toString();

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void complexJniMethodGenerationGeneration() {
    // Arrange
    JniMethod jniMethod = new JniMethod();
    jniMethod.owningContainer = jniContainer;
    jniMethod.javaMethodName = "methodName";

    jniMethod.parameters.add(
        new JniParameter(
            "stringParam", new JavaReferenceType(JavaReferenceType.Type.STRING), null));
    jniMethod.parameters.add(
        new JniParameter("intParam", new JavaPrimitiveType(JavaPrimitiveType.Type.INT), null));
    jniMethod.parameters.add(
        new JniParameter("customParam", new JavaCustomType("CustomParamType"), null));
    jniContainer.add(jniMethod);

    String expectedParams =
        "JNIEnv* env, jobject jinstance, jstring jstringParam, jint jintParam, jobject jcustomParam";
    String expected = "Java_com_here_jni_test_ClassName_methodName(" + expectedParams + ")";

    // Act
    String generated = JniFunctionSignatureTemplate.generate(jniMethod).toString();

    // Assert
    assertEquals(expected, generated);
  }
}
