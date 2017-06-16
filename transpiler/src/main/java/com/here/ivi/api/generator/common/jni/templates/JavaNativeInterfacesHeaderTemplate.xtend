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

import com.here.ivi.api.generator.common.java.templates.JavaCopyrightHeaderTemplate
import com.here.ivi.api.model.javamodel.JavaClass
import com.here.ivi.api.generator.converter.java.JavaJniTypeConverter

public class JavaNativeInterfacesHeaderTemplate {
  def static generate(JavaClass javaClass) '''
    «JavaCopyrightHeaderTemplate.generate()»


    /**
     * JNI header for class «javaClass.name»
     */
    #pragma once

    #include <jni.h>

    #ifdef __cplusplus
    extern "C" {
    #endif

    «FOR method : javaClass.methods»
    /**
     * Function for «javaClass.name».«method.name»()
     */
    JNIEXPORT «JavaJniTypeConverter.map(method.returnType).name» JNICALL
    «JavaNativeFunctionSignatureTemplate.generate(javaClass, method)»;
    «ENDFOR»

    #ifdef __cplusplus
    }
    #endif
  '''
}
