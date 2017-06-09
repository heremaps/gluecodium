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

import com.here.ivi.api.model.javamodel.JavaConstant

class JavaConstantTemplate {
  static def generate(JavaConstant it) {
    val accessModifier = visibility.toAccessModifier
    val String accessModifierFormatted = '''«IF !accessModifier.isEmpty»«accessModifier» «ENDIF»'''
    '''«IF comment !== null && !comment.isEmpty»
          /**
           * «comment»
           */
        «ENDIF»
«accessModifierFormatted»static final «type.name» «name» = «value.name»;'''
  }
}
