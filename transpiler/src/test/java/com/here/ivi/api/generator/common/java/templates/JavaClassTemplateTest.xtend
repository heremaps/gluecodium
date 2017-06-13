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

import com.here.ivi.api.model.javamodel.JavaClass
import com.here.ivi.api.model.javamodel.JavaComplexType
import com.here.ivi.api.model.javamodel.JavaEnum
import com.here.ivi.api.model.javamodel.JavaEnumItem
import com.here.ivi.api.model.javamodel.JavaInheritance
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.model.javamodel.JavaParameter
import com.here.ivi.api.model.javamodel.JavaPrimitiveType
import com.here.ivi.api.model.javamodel.JavaValue
import com.here.ivi.api.model.javamodel.JavaVisibility
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*
import com.here.ivi.api.model.javamodel.JavaPackage

@RunWith(typeof(XtextRunner))
class JavaClassTemplateTest {
  @Test
  def minimumClassGeneration() {
    val javaClass = new JavaClass("ExampleClass") => [
      comment = "Example class comment"
    ]
    val expected = '''package com.here.android;

/**
 * Example class comment
 */
class ExampleClass {
}'''

    val generated = JavaClassTemplate.generate(javaClass)

    assertEquals(expected, generated.toString)
  }

  @Test
  def classWithMethodGeneration() {
    val exampleType =new JavaComplexType("ExampleType")
    val parameter = new JavaParameter(new JavaComplexType("InParamType"), "param")
    val classMethod = new JavaMethod("someMethod", exampleType) => [
      qualifiers = #{ JavaMethod.Qualifier.NATIVE }
      visibility = JavaVisibility.PRIVATE
      parameters = #[ parameter ]
      comment = "Method comment"
    ]
    val javaClass = new JavaClass("ExampleClass") => [
      javaPackage = new JavaPackage("com.here.generator.example")
      comment = "Example class comment"
      methods = #{ classMethod }
    ]
    val inheritance = new JavaInheritance(exampleType) => [

    ]
    val expected = '''package com.here.generator.example;

/**
 * Example class comment
 */
class ExampleClass {
  /**
   * Method comment
   */
  private native ExampleType someMethod(final InParamType param);
}'''

    val generated = JavaClassTemplate.generate(javaClass)

    assertEquals(expected, generated.toString)
  }

  @Test
  def classWithEnumGeneration() {
    val enumItem = new JavaEnumItem("ITEM", new JavaValue("1"))
    val classEnum = new JavaEnum("ExampleEnum") => [
      items = #[ enumItem ]
      comment = "Enum comment"
    ]
    val javaClass = new JavaClass("ExampleClass") => [
      javaPackage = new JavaPackage("com.here.enums")
      comment = "Example class comment"
      enums = # { classEnum }
    ]

    val expected = '''package com.here.enums;

/**
 * Example class comment
 */
class ExampleClass {
  /**
   * Enum comment
   */
  enum ExampleEnum {
      ITEM = 1
  };
}'''

    val generated = JavaClassTemplate.generate(javaClass)

    assertEquals(expected, generated.toString)
  }

  @Test
  def classWithEnumAndMethodsGeneration() {
    val classMethod = new JavaMethod("someMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID)) => [
      qualifiers = #{ JavaMethod.Qualifier.NATIVE }
      comment = "Method comment"
    ]
    val enumItem = new JavaEnumItem("ITEM", new JavaValue("1"))
    val classEnum = new JavaEnum("ExampleEnum") => [
      items = #[ enumItem ]
      comment = "Enum comment"
    ]
    val javaClass = new JavaClass("ExampleClass") => [
      comment = "Example class comment"
      methods = #{ classMethod }
      enums = #{ classEnum }
    ]

    val expected = '''package com.here.android;

/**
 * Example class comment
 */
class ExampleClass {
  /**
   * Enum comment
   */
  enum ExampleEnum {
      ITEM = 1
  };
  /**
   * Method comment
   */
  native void someMethod();
}'''

    val generated = JavaClassTemplate.generate(javaClass)

    assertEquals(expected, generated.toString)
  }

  @Test
  def classWithInheritanceGeneration() {
    val javaClass = new JavaClass("ChildClass") => [
      comment = "Child class comment"
      inheritance = new JavaInheritance(new JavaComplexType("ParentClass"))
    ]

    val expected = '''
    package com.here.android;

    /**
     * Child class comment
     */
    class ChildClass extends ParentClass {
    }'''

    val generated = JavaClassTemplate.generate(javaClass)

    assertEquals(expected, generated.toString)
  }
}
