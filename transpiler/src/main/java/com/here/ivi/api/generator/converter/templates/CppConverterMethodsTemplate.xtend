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

package com.here.ivi.api.generator.converter.templates

import com.here.ivi.api.generator.common.cpp.CppTemplateDelegator
import com.here.ivi.api.generator.common.cpp.templates.CppMethodTemplate
import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.model.cppmodel.CppNamespace

public class CppConverterMethodsTemplate {
    def static generate(CppTemplateDelegator templates, CppNamespace cppNamespace) '''
    «IF cppNamespace.comment !== null && !cppNamespace.comment.isEmpty()»
    /**
     * «cppNamespace.comment»
     */
    «ENDIF»
    namespace «cppNamespace.name» {

    «FOR m : cppNamespace.members»
        «IF m instanceof CppMethod && (m as CppMethod).hasBody»
            «CppMethodTemplate.signature(m as CppMethod)»
            «(m as CppMethod).generateBody()»
        «ENDIF»
    «ENDFOR»

    } // namespace «cppNamespace.name»
    '''
}
