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

package com.here.ivi.api.generator.common.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaMethodTemplateTest {
  @Test
  public void generate_simpleMethod() {
    // Arrange
    JavaMethod javaMethod =
        new JavaMethod("simpleMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID));
    javaMethod.comment = "Simple method comment";
    String expected = "/**\n" + " * Simple method comment\n" + " */\n" + "void simpleMethod();";

    // Act
    CharSequence generated = JavaMethodTemplate.generate(javaMethod);

    // Assert
    assertEquals(expected, generated.toString());
  }

  @Test
  public void generate_nativeMethod() {
    // Arrange
    JavaMethod javaMethod =
        new JavaMethod("nativeMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID));
    javaMethod.comment = "Native method comment";
    javaMethod.qualifiers.add(JavaMethod.MethodQualifier.NATIVE);
    String expected =
        "/**\n" + " * Native method comment\n" + " */\n" + "native void nativeMethod();";

    // Act
    CharSequence generated = JavaMethodTemplate.generate(javaMethod);

    // Assert
    assertEquals(expected, generated.toString());
  }

  @Test
  public void generate_complexMethod() {
    // Arrange
    JavaMethod javaMethod = new JavaMethod("complexMethod", new JavaCustomType("ComplexType"));
    javaMethod.comment = "Method comment";
    javaMethod.visibility = JavaVisibility.PUBLIC;
    javaMethod.qualifiers.add(JavaMethod.MethodQualifier.STATIC);
    javaMethod.parameters.add(
        new JavaParameter(new JavaReferenceType(JavaReferenceType.Type.STRING), "firstParam"));
    javaMethod.parameters.add(new JavaParameter(new JavaCustomType("InParamType2"), "secondParam"));
    javaMethod.deprecatedComment = "Method is deprecated";
    String expected =
        "/**\n"
            + " * Method comment\n"
            + " */\n"
            + "@Deprecated\n"
            + "public static ComplexType complexMethod(final String firstParam, final InParamType2 secondParam);";

    // Act
    CharSequence generated = JavaMethodTemplate.generate(javaMethod);

    // Assert
    assertEquals(expected, generated.toString());
  }

  @Ignore // TODO: Either support deprecation in common/DocComment or add java/DocComment
  public void generate_deprecatedMethod() {
    // Arrange
    JavaMethod javaMethod =
        new JavaMethod("deprecatedMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID));
    javaMethod.comment = "Some random comment";
    javaMethod.deprecatedComment = "Removed soon";
    String expected =
        "/**\n"
            + " * Native method comment\n"
            + " @deprecated Removed soon\n"
            + " */\n"
            + "@Deprecated\n"
            + "native void nativeMethod();";

    // Act
    CharSequence generated = JavaMethodTemplate.generate(javaMethod);

    // Assert
    assertEquals(expected, generated.toString());
  }
}
