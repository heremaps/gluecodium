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
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniStruct;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppToJniStructConversionSignatureTest {
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
    jniModel.javaClassName = OUTER_CLASS_NAME;

    jniStruct =
        new JniStruct(
            jniModel, new JavaClass("Inner"), new CppStruct("Inner"), Collections.emptyList());
  }

  @Test
  public void generate() {
    // Act
    String generated = TemplateEngine.render("jni/CppToJniStructConversionSignature", jniStruct);

    String expected =
        "jobject convert_to_jni(JNIEnv* env, const "
            + String.join("::", PACKAGES)
            + "::"
            + OUTER_CLASS_NAME
            + "::"
            + INNER_CLASS_NAME
            + "& ninput)";

    // Assert
    assertEquals(expected, generated);
  }
}
