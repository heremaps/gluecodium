package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppEnumClass

class CppEnumClassTemplate {
    static def generate(CppEnumClass enumClass) '''
    «IF enumClass.enumeration.comment !== null && !enumClass.enumeration.comment.isEmpty»
    /**
     * «enumClass.enumeration.comment»
     */
    «ENDIF»
    enum class «enumClass.enumeration.name» {
        «FOR item : enumClass.enumeration.items SEPARATOR ','»
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