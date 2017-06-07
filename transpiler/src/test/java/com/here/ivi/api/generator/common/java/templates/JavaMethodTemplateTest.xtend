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

import com.here.ivi.api.model.javamodel.JavaComplexType
import com.here.ivi.api.model.javamodel.JavaElements
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.model.javamodel.JavaParameter
import com.here.ivi.api.model.javamodel.JavaPrimitiveType
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*

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
      private void simpleMethod()'''

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
      private native void nativeMethod()'''

    val generated = JavaMethodTemplate.signature(javaMethod)

    assertEquals(expected, generated.toString)
  }

  @Test
  def complexMethodGeneration() {
    val inParamter1 = new JavaParameter(new JavaComplexType("InParamType1"), "firstParam")
    val inParamter2 = new JavaParameter(new JavaComplexType("InParamType2"), "secondParam")
    val outParamter = new JavaParameter(new JavaComplexType("OutParamType"), "thirdParam")

    val javaMethod = new JavaMethod("complexMethod", new JavaComplexType("ComplexType")) => [
      comment = "Method comment"
      visibility = JavaElements.Visibility.PUBLIC
      qualifiers = # { JavaMethod.Qualifier.STATIC }
      inParameters = #[ inParamter1, inParamter2 ]
      outParameters = #[ outParamter ]
      deprecatedComment = "Method is deprecated"
    ]
    val expected = '''
      /**
       * Method comment
       * @deprecated Method is deprecated
       */
      @Deprecated
      public static ComplexType complexMethod(InParamType1 firstParam, InParamType2 secondParam, OutParamType thirdParam)'''

    val generated = JavaMethodTemplate.signature(javaMethod)

    assertEquals(expected, generated.toString)
  }

  @Test
  def pureSignatureMethodGeneration() {
    val parameter = new JavaParameter(new JavaComplexType("InParamType"), "param")
    val javaMethod = new JavaMethod("someMethod", new JavaComplexType("ReturnType")) => [
      inParameters = #[ parameter ]
      comment = "Method comment"
    ]
    val expected = "ReturnType someMethod(InParamType param)"

    val generated = JavaMethodTemplate.pureSignature(javaMethod)

    assertEquals(expected, generated.toString)
  }
}
