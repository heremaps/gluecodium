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

import com.here.ivi.api.generator.common.cpp.templates.CppDocCommentTemplate
import com.here.ivi.api.model.cppmodel.CppClass

class CppClassTemplate {
    static def generate(CppClass clazz) '''

        «CppDocCommentTemplate.generate(clazz)»
        class «clazz.name» «CppInheritanceTemplate.generate(clazz)» {
        «IF !clazz.structs.isEmpty()»
        public:
            «FOR s : clazz.structs»
              «CppPureStructTemplate.generate(s)»
            «ENDFOR»
        «ENDIF»

        «IF !clazz.usings.isEmpty()»
        public:
            «FOR u : clazz.usings»
            «CppDocCommentTemplate.generate(u)»
            using «u.name» = «u.definition.name»;
            «ENDFOR»
        «ENDIF»

        «IF !clazz.methods.isEmpty()»
        public:
            «FOR m : clazz.methods»
              «CppMethodTemplate.signature(m)»;
            «ENDFOR»
        «ENDIF»

        «IF !clazz.fields.isEmpty()»
        private:
            «FOR f : clazz.fields»
            «IF f.initializer?.name.isNullOrEmpty»
            «f.type.name» «f.name»;
            «ELSE»
            «f.type.name» «f.name» = «f.initializer.name»;
            «ENDIF»
            «ENDFOR»
        «ENDIF»
        };
    '''
}
