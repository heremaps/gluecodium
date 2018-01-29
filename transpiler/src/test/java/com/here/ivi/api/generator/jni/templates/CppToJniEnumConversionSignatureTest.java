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
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniEnum;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CppToJniEnumConversionSignatureTest {
  private static final String CPP_NAME = "CppName";
  private static final String JAVA_NAME = "JavaName";
  private static final List<String> JAVA_PACKAGES = Arrays.asList("java", "b", "c");
  private static final List<String> CPP_NAMESPACES = Arrays.asList("cpp", "b", "c");

  private static JniEnum createJniContainer(boolean definedInInterface) {

    JniContainer jniContainer =
        definedInInterface
            ? JniContainer.builder(JAVA_PACKAGES, CPP_NAMESPACES)
                .javaName(JAVA_NAME)
                .javaInterfaceName(JAVA_NAME)
                .cppName(CPP_NAME)
                .isFrancaInterface(true)
                .build()
            : JniContainer.builder(JAVA_PACKAGES, CPP_NAMESPACES).build();

    return new JniEnum.Builder("MyJavaEnum", "MyCppEnumName").owningContainer(jniContainer).build();
  }

  @Test
  public void generateFromTypeCollection() {

    String expected =
        "jobject convert_to_jni( JNIEnv* _jenv, const ::cpp::b::c::MyCppEnumName _ninput )";

    String generated =
        TemplateEngine.render(
            "jni/CppToJniEnumerationConversionSignature", createJniContainer(false));

    assertEquals(expected, generated);
  }

  @Test
  public void generateFromInterface() {

    String expected =
        "jobject convert_to_jni( JNIEnv* _jenv, const ::cpp::b::c::CppName::MyCppEnumName _ninput )";

    String generated =
        TemplateEngine.render(
            "jni/CppToJniEnumerationConversionSignature", createJniContainer(true));

    assertEquals(expected, generated);
  }
}
