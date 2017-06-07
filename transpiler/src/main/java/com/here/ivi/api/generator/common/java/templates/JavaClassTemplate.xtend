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
import com.here.ivi.api.model.javamodel.JavaElements

public class JavaClassTemplate {
  def static generate(JavaClass javaClass) '''package com.here.android;
  «FOR include : JavaElements.collectIncludes(javaClass)»
    «JavaImportTemplate.generate(include)»
  «ENDFOR»

/**
 * «javaClass.comment»
 */
class «javaClass.name» «JavaInheritanceTemplate.generate(javaClass.inheritances)»{
  «FOR constant : javaClass.constants»
    «JavaConstantTemplate.generate(constant)»
  «ENDFOR»
  «FOR enumerator : javaClass.enums»
    «JavaEnumTemplate.generate(enumerator)»
  «ENDFOR»
  «FOR method : javaClass.methods»
    «JavaMethodTemplate.signature(method)»«IF method.isNative»;«ELSE»«method.generateBody»«ENDIF»
  «ENDFOR»
}'''
}
