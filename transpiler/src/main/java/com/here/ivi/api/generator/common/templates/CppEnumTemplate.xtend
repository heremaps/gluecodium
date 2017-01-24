package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppEnumTemplate {
    static def generate(CppElements.CppEnum enumeration) '''
    /**
     */
    enum «enumeration.name» {
        «FOR item : enumeration.items»
            «IF item == enumeration.items.get(enumeration.items.size() - 1)»
                «item.name.toUpperCase»«IF item.value.isValid()» = «item.value» «ENDIF» ///
            «ELSE»
                «item.name.toUpperCase»«IF item.value.isValid()» = «item.value» «ENDIF», ///
            «ENDIF»
        «ENDFOR»
    };
  '''
}