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

import com.here.ivi.api.generator.converter.java.JavaJniTypeConverter
import com.here.ivi.api.model.javamodel.JavaMethod

/**
 * Template of a java native function's signature without the return type.
 */
class JavaNativeFunctionSignatureTemplate {
    def static generate(String javaClassName, JavaMethod method) '''
    Java_com_here_ivi_«javaClassName»_«method.name»(JNIEnv* env, jobject jinstance«FOR param : method.parameters», «JavaJniTypeConverter.map(param.type).name» j«param.name»«ENDFOR»)'''
}
