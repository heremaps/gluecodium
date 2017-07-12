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

package com.here.ivi.api.generator.common.jni.templates

import com.here.ivi.api.generator.common.jni.JniNameRules
import com.here.ivi.api.generator.common.jni.JniTypeNameMapper
import com.here.ivi.api.model.javamodel.JavaClass
import com.here.ivi.api.model.javamodel.JavaMethod

/**
 * Template of a java native function's signature without the return type.
 */
class JniFunctionSignatureTemplate {
  def static generate(JavaClass javaClass, JavaMethod method) {
    val prefix = '''Java_«JniNameRules.getPackageName(javaClass.javaPackage.packageNames)»_«javaClass.name»_«method.name»'''
    val parameters = '''«FOR param : method.parameters», «JniTypeNameMapper.map(param.type)» «JniNameRules.getParameterName(param.name)»«ENDFOR»'''
    '''«prefix»(JNIEnv* env, jobject jinstance«parameters»)'''
  }
}
