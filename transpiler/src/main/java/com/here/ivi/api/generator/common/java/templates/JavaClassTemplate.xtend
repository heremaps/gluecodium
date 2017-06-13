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

public class JavaClassTemplate {
  def static generate(JavaClass it) '''«JavaPackageTemplate.generate(javaPackage)»
  «JavaImportsTemplate.generate(it)»

/**
 * «comment»
 */
class «name» «JavaInheritanceTemplate.generate(inheritance)»{
  «FOR constant : constants»
  «JavaConstantTemplate.generate(constant)»
  «ENDFOR»
  «FOR enumerator : enums»
  «JavaEnumTemplate.generate(enumerator)»
  «ENDFOR»
  «FOR method : methods»
  «JavaMethodTemplate.signature(method)»«IF method.isNative»;«ELSE»«JavaMethodBodyTemplate.generate(method)»«ENDIF»
  «ENDFOR»
}'''
}
