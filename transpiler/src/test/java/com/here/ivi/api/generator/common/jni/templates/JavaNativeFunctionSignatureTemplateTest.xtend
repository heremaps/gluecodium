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

package com.here.ivi.api.generator.common.jni.templates

import com.here.ivi.api.model.javamodel.JavaClass
import com.here.ivi.api.model.javamodel.JavaCustomType
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.model.javamodel.JavaPackage
import com.here.ivi.api.model.javamodel.JavaParameter
import com.here.ivi.api.model.javamodel.JavaPrimitiveType
import com.here.ivi.api.model.javamodel.JavaReferenceType
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
class JavaNativeFunctionSignatureTemplateTest {

  @Test
  def simpleJniMethodGenerationGeneration() {
    val javaClass = new JavaClass("ClassName") => [
      javaPackage = new JavaPackage("com.here.jni.test")
    ]
    val javaMethod = new JavaMethod("methodName")
    val expected = '''Java_com_here_jni_test_ClassName_methodName(JNIEnv* env, jobject jinstance)'''

    val generated = JavaNativeFunctionSignatureTemplate.generate(javaClass, javaMethod)

    assertEquals(expected, generated.toString)
  }


  @Test
  def complexJniMethodGenerationGeneration() {
    val javaClass = new JavaClass("ClassName") => [
      javaPackage = new JavaPackage("com.here.jni.test")
    ]
    val parameter1 = new JavaParameter(new JavaReferenceType(JavaReferenceType.Type.STRING), "stringParam")
    val parameter2 = new JavaParameter(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intParam")
    val parameter3 = new JavaParameter(new JavaCustomType("CustomParamType"), "customParam")
    val javaMethod = new JavaMethod("methodName") => [
      parameters = #[ parameter1, parameter2, parameter3 ]
    ]
    val expectedParams = '''JNIEnv* env, jobject jinstance, jstring jstringParam, jint jintParam, jobject jcustomParam'''
    val expected = '''Java_com_here_jni_test_ClassName_methodName(«expectedParams»)'''

    val generated = JavaNativeFunctionSignatureTemplate.generate(javaClass, javaMethod)

    assertEquals(expected, generated.toString)
  }
}
