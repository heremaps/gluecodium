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
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppStructConversionSignatureTest {

  private static final String JAVA_OUTERCLASS_NAME = "MyOuterJavaClass";
  private static final JavaClass JAVA_CLASS_INNER = new JavaClass("jInner");

  private static final String CPP_OUTERCLASS_NAME = "CppOuter";
  private static final CppStruct CPP_STRUCT = new CppStruct("CppStruct");

  private static final JniModel JNI_MODEL = new JniModel();
  private static final JniStruct JNI_STRUCT =
      new JniStruct(JNI_MODEL, JAVA_CLASS_INNER, CPP_STRUCT, Collections.emptyList());

  private static final List<String> CPPNAMESPACES =
      Arrays.asList("a", "superfancy", "cppnamespace");

  @BeforeClass
  public static void setupClass() {
    JNI_MODEL.cppNameSpaces = CPPNAMESPACES;
    JNI_MODEL.cppClassName = CPP_OUTERCLASS_NAME;
    JNI_MODEL.javaClassName = JAVA_OUTERCLASS_NAME;
  }

  @Test
  public void generate() {

    //act
    String generated = TemplateEngine.render("jni/JniToCppStructConversionSignature", JNI_STRUCT);

    //assert
    String expected =
        String.join("::", CPPNAMESPACES)
            + "::"
            + CPP_OUTERCLASS_NAME
            + "::"
            + CPP_STRUCT.name
            + " convert_jobject_to_CppStruct(JNIEnv* env, const jobject jinput)";

    assertEquals(expected, generated);
  }
}
