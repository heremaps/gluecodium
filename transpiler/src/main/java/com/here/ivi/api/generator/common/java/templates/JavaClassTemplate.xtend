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
import com.here.ivi.api.generator.common.java.JavaCommentFormatter
import com.here.ivi.api.generator.common.TemplateEngine
import com.here.ivi.api.model.javamodel.JavaElements

public class JavaClassTemplate {
  def static whitespaceFormatter(String field) '''«field»«IF !field.isEmpty» «ENDIF»'''

  def static generate(JavaClass it) {
    val classVisibility = whitespaceFormatter(visibility.toString)
    val qualifierString = '''«FOR qualifier : qualifiers»«whitespaceFormatter(qualifier.toString)»«ENDFOR»'''

    '''
    «JavaCopyrightHeaderTemplate.generate()»

    «TemplateEngine.render("java/Package", javaPackage)»
    «TemplateEngine.render("java/Import", JavaElements.collectImports(it))»

    «IF comment !== null && !comment.isEmpty»
    /**
     * «JavaCommentFormatter.format(comment)»
     */
    «ENDIF»
    «classVisibility»«qualifierString»class «name» «JavaInheritanceTemplate.generate(inheritance)»{
      «FOR constant : constants»
      «JavaConstantTemplate.generate(constant)»
      «ENDFOR»
      «FOR field : fields»
      «JavaFieldTemplate.generate(field)»
      «ENDFOR»
      «FOR enumerator : enums»
      «JavaEnumTemplate.generate(enumerator)»
      «ENDFOR»
      «FOR method : methods»
      «JavaMethodTemplate.generate(method)»
      «ENDFOR»
      «FOR innerClass : innerClasses»
      «generateInnerClass(innerClass)»
      «ENDFOR»
    }'''
  }

  def private static generateInnerClass(JavaClass it) {
    val classVisibility = whitespaceFormatter(visibility.toString)
    val qualifierString = '''«FOR qualifier : qualifiers»«whitespaceFormatter(qualifier.toString)»«ENDFOR»'''


    '''
    «IF comment !== null && !comment.isEmpty»
    /**
     * «JavaCommentFormatter.format(comment)»
     */
    «ENDIF»
    «classVisibility»«qualifierString»class «name» «JavaInheritanceTemplate.generate(inheritance)»{
      «FOR constant : constants»
      «JavaConstantTemplate.generate(constant)»
      «ENDFOR»
      «FOR field : fields»
      «JavaFieldTemplate.generate(field)»
      «ENDFOR»
      «FOR enumerator : enums»
      «JavaEnumTemplate.generate(enumerator)»
      «ENDFOR»
    }'''
  }
}
