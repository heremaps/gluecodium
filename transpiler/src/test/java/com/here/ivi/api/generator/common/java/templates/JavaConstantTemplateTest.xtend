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
import com.here.ivi.api.model.javamodel.JavaConstant
import com.here.ivi.api.model.javamodel.JavaValue
import com.here.ivi.api.model.javamodel.JavaVisibility
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*
import com.here.ivi.api.model.javamodel.JavaCustomType

@RunWith(typeof(XtextRunner))
class JavaConstantTemplateTest {

  @Test
  def stringConstantGeneration() {
    val javaConstant = new JavaConstant(new JavaReferenceType(JavaReferenceType.Type.STRING), "STRING_CONSTANT",
      new JavaValue("\"myString\"")) => [
      comment = "Constant string comment"
    ]
    val expected = '''
      /**
       * Constant string comment
       */
      static final String STRING_CONSTANT = "myString";'''

    val generated = JavaConstantTemplate.generate(javaConstant)

    assertEquals(expected, generated.toString)
  }

  @Test
  def customTypeConstantGeneration() {
    val javaConstant = new JavaConstant(new JavaCustomType("ConstantType"),
      "EXAMPLE_CONSTANT", new JavaValue("new ConstantType()")) => [
      visibility = JavaVisibility.PUBLIC
      comment = "Constant javadoc comment"
    ]
    val expected = '''
      /**
       * Constant javadoc comment
       */
      public static final ConstantType EXAMPLE_CONSTANT = new ConstantType();'''

    val generated = JavaConstantTemplate.generate(javaConstant)

    assertEquals(expected, generated.toString)
  }

}
