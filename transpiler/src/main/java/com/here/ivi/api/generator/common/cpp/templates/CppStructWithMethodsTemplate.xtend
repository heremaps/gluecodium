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

package com.here.ivi.api.generator.common.cpp.templates

import com.here.ivi.api.generator.common.cpp.templates.CppMethodTemplate
import com.here.ivi.api.model.cppmodel.CppClass
import com.here.ivi.api.generator.common.cpp.CppTemplateDelegator

public class CppStructWithMethodsTemplate {
    def static generate(CppTemplateDelegator templates, CppClass cppClass) '''
    «IF cppClass.comment !== null && !cppClass.comment.isEmpty()»
    /**
     * «cppClass.comment»
     */
    «ENDIF»
    struct «cppClass.name» {

        «FOR e : cppClass.enums»
        «templates.generate(e)»
        «ENDFOR»

        «FOR f : cppClass.constants»
        «templates.generate(f)»
        «ENDFOR»

        /** Default constructor */
        «cppClass.name»( ) = default;

        «FOR m : cppClass.methods»
        «CppMethodTemplate.signature(m)»
        «m.generateBody()»
        «ENDFOR»

        «FOR f : cppClass.fields»
        «IF f.comment !== null && !f.comment.isEmpty()»
        /**
         * «f.comment»
         */
        «ENDIF»
        «IF f.initializer !== null && f.initializer.isValid()»
            «f.type.name» «f.name» = «f.initializer.name»;
        «ELSE»
            «f.type.name» «f.name»;
        «ENDIF»
        «ENDFOR»
    };
    '''
}
