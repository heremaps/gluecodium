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

import com.here.ivi.api.model.javamodel.JavaElementWithImports
import com.here.ivi.api.model.javamodel.JavaImport
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
class JavaImportTemplateTest {
  @Test
  def singleImportGeneration() {
    val javaImport = new JavaImport("com.here.SomeImport", JavaImport.ImportType.INTERNAL)
    val expected = '''import com.here.SomeImport;'''

    val generated = JavaImportsTemplate.generateSingle(javaImport)

    assertEquals(expected, generated.toString)
  }

  @Test
  def staticImportGeneration() {
    val javaImport = new JavaImport("com.here.StaticImport", JavaImport.ImportType.STATIC)
    val expected = '''import static com.here.StaticImport;'''

    val generated = JavaImportsTemplate.generateSingle(javaImport)

    assertEquals(expected, generated.toString)
  }

  @Test
  def multipleImportsGeneration() {
    val staticImport = new JavaImport("com.here.StaticImport", JavaImport.ImportType.STATIC)
    val systemImport = new JavaImport("com.here.SystemImport", JavaImport.ImportType.SYSTEM)
    val internalImport1 = new JavaImport("com.here.InternalImport1", JavaImport.ImportType.INTERNAL)
    val internalImport2 = new JavaImport("com.here.InternalImport2", JavaImport.ImportType.INTERNAL)
    val externalImport = new JavaImport("com.here.ExternalImport", JavaImport.ImportType.EXTERNAL)
    val javaElement = new JavaElementWithImports("ElementWithImports") => [
      imports = #{ staticImport, systemImport, internalImport2, internalImport1, externalImport }
    ]

    val expected = '''import com.here.SystemImport;
import com.here.ExternalImport;
import com.here.InternalImport1;
import com.here.InternalImport2;
import static com.here.StaticImport;
'''

    val generated = JavaImportsTemplate.generate(javaElement)

    assertEquals(expected, generated.toString)
  }
}
