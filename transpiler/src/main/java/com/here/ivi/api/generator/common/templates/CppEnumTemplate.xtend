package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppEnum

class CppEnumTemplate {
    static def generate(CppEnum enumeration) '''
    «IF enumeration.comment !== null && !enumeration.comment.isEmpty»
    /**
     * «enumeration.comment»
     */
    «ENDIF»
    enum «enumeration.name» {
        «FOR item : enumeration.items SEPARATOR ','»
            «IF item.comment !== null && !item.comment.isEmpty»
            /**
             * «item.comment»
             */
            «ENDIF»
            «item.name»«IF item.value.isValid()» = «item.value.name»«ENDIF»
        «ENDFOR»
    };
    '''
}
