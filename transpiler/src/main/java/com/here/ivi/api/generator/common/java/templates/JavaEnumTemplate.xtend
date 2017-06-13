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

import com.here.ivi.api.model.javamodel.JavaEnum

class JavaEnumTemplate {
  static def generate(JavaEnum it) '''«IF isTopLevel»
    «JavaPackageTemplate.generate(javaPackage)»

    «ENDIF»
    «IF comment !== null && !comment.isEmpty»
  /**
   * «comment»
   */
  «ENDIF»
enum «name» {
  «FOR item : items SEPARATOR ','»
  «IF item.comment !== null && !item.comment.isEmpty»
  /**
    * «item.comment»
    */
  «ENDIF»
    «item.name»«IF item.value.isValid()» = «item.value.name»«ENDIF»
  «ENDFOR»
};
'''
}
