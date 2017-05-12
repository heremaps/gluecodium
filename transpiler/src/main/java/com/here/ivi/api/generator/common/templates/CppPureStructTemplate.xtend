package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppStruct

class CppPureStructTemplate {
    static def generate(CppStruct struct) '''
        «IF struct.comment !== null && !struct.comment.isEmpty()»
        /**
         * «struct.comment»
         */
        «ENDIF»
        struct «struct.name» {
            «FOR field : struct.fields»
            «IF field.comment !== null && !field.comment.isEmpty()»
            /**
             * «field.comment»
             */
            «ENDIF»
            «field.type.name» «field.name»«IF field.initializer !== null && field.initializer.isValid()» = «field.initializer.name»«ENDIF»;
            «ENDFOR»
        };
    '''
}
