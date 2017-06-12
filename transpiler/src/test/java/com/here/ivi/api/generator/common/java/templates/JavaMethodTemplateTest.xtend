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

package com.here.ivi.api.generator.common.java.templates

import com.here.ivi.api.model.javamodel.JavaReferenceType
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.model.javamodel.JavaParameter
import com.here.ivi.api.model.javamodel.JavaPrimitiveType
import com.here.ivi.api.model.javamodel.JavaVisibility
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*
import com.here.ivi.api.model.javamodel.JavaCustomType

@RunWith(typeof(XtextRunner))
public class JavaMethodTemplateTest {

  @Test
  def simpleMethodGeneration() {
    val javaMethod = new JavaMethod("simpleMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID)) => [
      comment = "Simple method comment"
    ]
    val expected = '''
      /**
       * Simple method comment
       */
      void simpleMethod()'''

    val generated = JavaMethodTemplate.signature(javaMethod)

    assertEquals(expected, generated.toString)
  }

  @Test
  def nativeMethodGeneration() {
    val javaMethod = new JavaMethod("nativeMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID)) => [
      comment = "Native method comment"
      qualifiers = #{ JavaMethod.Qualifier.NATIVE }
    ]
    val expected = '''
      /**
       * Native method comment
       */
      native void nativeMethod()'''

    val generated = JavaMethodTemplate.signature(javaMethod)

    assertEquals(expected, generated.toString)
  }

  @Test
  def complexMethodGeneration() {
    val parameter1 = new JavaParameter(new JavaReferenceType(JavaReferenceType.Type.STRING), "firstParam")
    val parameter2 = new JavaParameter(new JavaCustomType("InParamType2"), "secondParam")

    val javaMethod = new JavaMethod("complexMethod", new JavaCustomType("ComplexType")) => [
      comment = "Method comment"
      visibility = JavaVisibility.PUBLIC
      qualifiers = # { JavaMethod.Qualifier.STATIC }
      parameters = #[ parameter1, parameter2 ]
      deprecatedComment = "Method is deprecated"
    ]
    val expected = '''
      /**
       * Method comment
       * @deprecated Method is deprecated
       */
      @Deprecated
      public static ComplexType complexMethod(final String firstParam, final InParamType2 secondParam)'''

    val generated = JavaMethodTemplate.signature(javaMethod)

    assertEquals(expected, generated.toString)
  }

  @Test
  def pureSignatureMethodGeneration() {
    val parameter = new JavaParameter(new JavaCustomType("InParamType"), "param")
    val javaMethod = new JavaMethod("someMethod", new JavaCustomType("ReturnType")) => [
      parameters = #[ parameter ]
      comment = "Method comment"
    ]
    val expected = "ReturnType someMethod(final InParamType param)"

    val generated = JavaMethodTemplate.pureSignature(javaMethod)

    assertEquals(expected, generated.toString)
  }
}
