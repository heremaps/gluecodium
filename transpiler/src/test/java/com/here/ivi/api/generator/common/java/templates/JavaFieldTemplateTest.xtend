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

import com.here.ivi.api.model.javamodel.JavaField
import com.here.ivi.api.model.javamodel.JavaPrimitiveType
import com.here.ivi.api.model.javamodel.JavaValue
import com.here.ivi.api.model.javamodel.JavaVisibility
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*
import com.here.ivi.api.model.javamodel.JavaReferenceType

@RunWith(typeof(XtextRunner))
class JavaFieldTemplateTest {
  @Test
  def simpleFieldGeneration() {
    val javaField = new JavaField(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField")
    val expected = '''int intField;'''

    val generated = JavaFieldTemplate.generate(javaField)

    assertEquals(expected, generated.toString)
  }

  @Test
  def fieldWithInitialValueAndVisbilityGeneration() {
    val javaField = new JavaField(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField",
      new JavaValue("1")) => [
      visibility = JavaVisibility.PRIVATE
    ]
    val expected = '''private int intField = 1;'''

    val generated = JavaFieldTemplate.generate(javaField)

    assertEquals(expected, generated.toString)
  }

  @Test
  def stringFieldWithCommentGeneration() {
    val javaField = new JavaField(new JavaReferenceType(JavaReferenceType.Type.STRING), "stringField") => [
      visibility = JavaVisibility.PUBLIC
      comment = "Field comment"
    ]
    val expected = '''/**
 * Field comment
 */
public String stringField;'''

    val generated = JavaFieldTemplate.generate(javaField)

    assertEquals(expected, generated.toString)
  }
}
