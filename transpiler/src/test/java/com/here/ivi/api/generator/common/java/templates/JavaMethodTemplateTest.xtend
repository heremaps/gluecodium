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

import com.here.ivi.api.model.javamodel.JavaElements
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.model.javamodel.JavaParameter
import com.here.ivi.api.model.javamodel.JavaType
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*
import com.here.ivi.api.model.javamodel.JavaElement

@RunWith(typeof(XtextRunner))
public class JavaMethodTemplateTest {

  @Test
  def simpleMethodGeneration() {
    val javaMethod = new JavaMethod => [
      name = "simpleMethod"
      comment = "Simple method comment"
      returnType = new JavaType("void")
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
    val javaMethod = new JavaMethod => [
      name = "nativeMethod"
      comment = "Native method comment"
      specifiers = #{ JavaMethod.Specifier.NATIVE }
      returnType = new JavaType("void")
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
    val inParamter1 = new JavaParameter => [
      name = "firstParam"
      type = new JavaType("InParamType1")
    ]
    val inParamter2 = new JavaParameter => [
      name = "secondParam"
      type = new JavaType("InParamType2")
    ]
    val outParamter = new JavaParameter => [
      name = "thirdParam"
      type = new JavaType("OutParamType")
    ]

    val javaMethod = new JavaMethod => [
      name = "complexMethod"
      comment = "Method comment"
      visibility = JavaElements.Visibility.Public
      specifiers = # { JavaMethod.Specifier.STATIC }
      returnType = new JavaType("ComplexType")
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
    val parameter = new JavaParameter => [
      name = "param"
      type = new JavaType("InParamType")
    ]
    val javaMethod = new JavaMethod => [
      name = "someMethod"
      returnType = new JavaType("ReturnType")
      inParameters = #[ parameter ]
      comment = "Method comment"
    ]
    val expected = "ReturnType someMethod(InParamType param)"

    val generated = JavaMethodTemplate.pureSignature(javaMethod)

    assertEquals(expected, generated.toString)
  }
}
