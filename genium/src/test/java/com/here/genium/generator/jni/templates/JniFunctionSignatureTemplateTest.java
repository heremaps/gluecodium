/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.cpp.CppComplexTypeRef;
import com.here.genium.model.cpp.CppPrimitiveTypeRef;
import com.here.genium.model.java.JavaCustomType;
import com.here.genium.model.java.JavaPackage;
import com.here.genium.model.java.JavaPrimitiveType;
import com.here.genium.model.java.JavaReferenceType;
import com.here.genium.model.jni.JniContainer;
import com.here.genium.model.jni.JniMethod;
import com.here.genium.model.jni.JniParameter;
import com.here.genium.model.jni.JniType;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniFunctionSignatureTemplateTest {

  private static final String TEMPLATE_NAME = "jni/FunctionSignature";

  private final JniContainer jniContainer =
      JniContainer.builder(Arrays.asList("com", "example", "jni", "test"), Collections.emptyList())
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
        "Java_com_example_jni_test_ClassName_methodName(JNIEnv* _jenv, jobject _jinstance)";

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
    String expected = "Java_com_example_jni_test_ClassName_methodName(" + expectedParams + ")";

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
        "Java_com_example_jni_test_ClassName_methodName"
            + "__Ljava_lang_String_2ILcom_example_CustomParamType_2("
            + expectedParams
            + ")";
    assertEquals(expected, generated);
  }
}
