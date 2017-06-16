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
import com.here.ivi.api.generator.common.java.JavaCommentFormatter

class JavaFieldTemplate {
  def private static whitespaceFormatter(String field) '''
        «field»«IF !field.isEmpty» «ENDIF»'''

  def static generate(JavaField it) {
    val accessModifier = whitespaceFormatter(visibility.toAccessModifier)
    val optionalInitializer = '''«IF initial !== null» = «initial.name»«ENDIF»'''
    '''«IF comment !== null && !comment.isEmpty»
          /**
           * «JavaCommentFormatter.format(comment)»
           */
«ENDIF»«accessModifier»«type.name» «name»«optionalInitializer»;'''
  }
}
