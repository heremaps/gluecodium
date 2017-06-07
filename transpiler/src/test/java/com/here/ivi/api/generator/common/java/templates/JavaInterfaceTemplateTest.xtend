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
import com.here.ivi.api.model.javamodel.JavaInheritance
import com.here.ivi.api.model.javamodel.JavaInterface
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.model.javamodel.JavaParameter
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
class JavaInterfaceTemplateTest {
  @Test
  def minimumInterfaceGeneration() {
    val javaInterface = new JavaInterface("ExampleInterface") => [
      comment = "Example interface comment"
    ]
    val expected = '''
    package com.here.android;

    /**
     * Example interface comment
     */
    interface ExampleInterface {
    }'''

    val generated = JavaInterfaceTemplate.generate(javaInterface)

    assertEquals(expected, generated.toString)
  }

  @Test
  def complexInterfaceGeneration() {
    val exampleType = new JavaComplexType("ExampleType")
    val parameter = new JavaParameter(new JavaComplexType("InParamType"), "param")
    val interfaceMethod = new JavaMethod("someMethod", exampleType) => [
      inParameters = #[ parameter ]
      comment = "Method comment"
    ]
    val javaInterface = new JavaInterface("ExampleInterface") => [
      comment = "Example interface comment"
      methods = #{ interfaceMethod }
    ]
    val inheritance = new JavaInheritance(exampleType)

    val expected = '''
    package com.here.android;

    /**
     * Example interface comment
     */
    interface ExampleInterface {
    «"  "»ExampleType someMethod(InParamType param);
    }'''

    val generated = JavaInterfaceTemplate.generate(javaInterface)

    assertEquals(expected, generated.toString)
  }
}
