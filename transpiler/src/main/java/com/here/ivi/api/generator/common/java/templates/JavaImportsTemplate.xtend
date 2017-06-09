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

import com.here.ivi.api.model.javamodel.JavaElement
import com.here.ivi.api.model.javamodel.JavaElements
import com.here.ivi.api.model.javamodel.JavaImport

class JavaImportsTemplate {

  def static generate(JavaElement javaElement)
  '''«FOR systemImport : getSortedImportsOfType(javaElement, JavaImport.ImportType.SYSTEM)»
«generateSingle(systemImport)»
  «ENDFOR»
  «FOR externalImport : getSortedImportsOfType(javaElement, JavaImport.ImportType.EXTERNAL)»
«generateSingle(externalImport)»
  «ENDFOR»
  «FOR internalImport : getSortedImportsOfType(javaElement, JavaImport.ImportType.INTERNAL)»
«generateSingle(internalImport)»
  «ENDFOR»
  «FOR staticImport : getSortedImportsOfType(javaElement, JavaImport.ImportType.STATIC)»
«generateSingle(staticImport)»
  «ENDFOR»'''

  def static generateSingle(JavaImport javaImport) {
    val optionalStatic = '''«IF javaImport.type === JavaImport.ImportType.STATIC»static «ENDIF»'''
    '''import «optionalStatic»«javaImport.importStatement»;'''
  }

  def private static getSortedImportsOfType(JavaElement javaElement, JavaImport.ImportType importType) {
    JavaElements.collectIncludes(javaElement).filter[ type === importType ].sortBy[ importStatement ]
  }
}
