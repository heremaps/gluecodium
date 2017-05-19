package com.here.ivi.api.generator.common.cpp.templates

import com.here.ivi.api.model.cppmodel.CppClass

class CppClassTemplate {
    static def generate(CppClass clazz) '''

        «IF clazz.comment !== null && !clazz.comment.isEmpty()»
        /**
         * «clazz.comment»
         */
        «ENDIF»
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
            «IF u.comment !== null && !u.comment.isEmpty()»
            /**
             * «u.comment»
             */
            «ENDIF»
            using «u.name» = «u.definition.name»;
            «ENDFOR»
        «ENDIF»

        «IF !clazz.methods.isEmpty()»
        public:
            «FOR m : clazz.methods»
            «IF m.hasBody»
              «CppMethodTemplate.signature(m)»
              «m.generateBody()»
            «ELSE»
              «CppMethodTemplate.signature(m)»;
            «ENDIF»
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
