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
import com.here.ivi.api.generator.common.jni.JniContainer;
import com.here.ivi.api.generator.common.jni.JniStruct;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppStructConversionSignatureTest {

  private static final String JAVA_OUTER_CLASS_NAME = "MyOuterJavaClass";
  private static final String CPP_OUTER_CLASS_NAME = "CppOuter";
  private static final List<String> CPP_NAMESPACES =
      Arrays.asList("a", "superfancy", "cppnamespace");

  private final JavaClass javaClassInner = new JavaClass("jInner");
  private final CppStruct cppStruct = new CppStruct("CppStruct");
  private final JniContainer jniContainer =
      JniContainer.createInterfaceContainer(
          Collections.emptyList(), CPP_NAMESPACES, JAVA_OUTER_CLASS_NAME, CPP_OUTER_CLASS_NAME);
  private final JniStruct jniStruct =
      new JniStruct(jniContainer, javaClassInner, cppStruct, Collections.emptyList());

  @Test
  public void generate() {
    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionSignature", jniStruct);

    //assert
    String expected =
        "void convert_from_jni( JNIEnv* env, const jobject jinput, "
            + String.join("::", CPP_NAMESPACES)
            + "::"
            + CPP_OUTER_CLASS_NAME
            + "::"
            + cppStruct.name
            + "& out )";

    assertEquals(expected, generated);
  }
}
