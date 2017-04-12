package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppEnum

class CppEnumTemplate {
    static def generate(CppEnum enumeration) '''
    /**
     */
    enum «enumeration.name» {
        «FOR item : enumeration.items»
            «IF item == enumeration.items.get(enumeration.items.size() - 1)»
                «item.name»«IF item.value.isValid()» = «item.value» «ENDIF» ///
            «ELSE»
                «item.name»«IF item.value.isValid()» = «item.value» «ENDIF», ///
            «ENDIF»
        «ENDFOR»
    };
  '''
}