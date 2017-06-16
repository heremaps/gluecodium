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
import static com.here.ivi.api.generator.common.jni.JavaNativeInterfacesNameRules.getNativeParameterName
import static com.here.ivi.api.generator.common.jni.JavaNativeInterfacesNameRules.getJniParameterName

class JavaStringConversionTemplate {
    def static generate(String baseName)'''
        std::string «getNativeParameterName(baseName)» = std::string(env->GetStringUTFChars(«getJniParameterName(baseName)», 0));
    '''
}
