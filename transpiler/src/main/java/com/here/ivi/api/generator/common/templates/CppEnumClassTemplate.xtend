package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppEnumClassTemplate {
    static def generate(CppElements.CppEnumClass enumClass) '''
    /**
     */
    enum class «enumClass.name» {
        «FOR item : enumClass.enumeration.items»
            «IF item == enumClass.enumeration.items.get(enumClass.enumeration.items.size() - 1)»
                «item.name.toUpperCase»«IF item.value.isValid()» = «item.value» «ENDIF» ///
            «ELSE»
                «item.name.toUpperCase»«IF item.value.isValid()» = «item.value» «ENDIF», ///
            «ENDIF»
        «ENDFOR»
    };
  '''
}