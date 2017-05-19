package com.here.ivi.api.generator.common.cpp.templates

import com.here.ivi.api.generator.common.cpp.CppNameRules
import com.here.ivi.api.generator.common.cpp.CppValueMapper
import com.here.ivi.api.model.cppmodel.CppConstant
import com.here.ivi.api.model.cppmodel.CppType
import org.franca.core.franca.FCompoundInitializer

class CppConstantTemplate {
    static def generate(CppConstant constant) '''
        «IF constant.comment !== null && !constant.comment.isEmpty»
        /**
         * «constant.comment»
         */
        «ENDIF»
        static const «constant.type.name» «constant.name» = «constant.value.name»;
    '''

    static def generate(CppType type, FCompoundInitializer fci, CppNameRules nameRules) '''
      []() {
        «type.name» tmp;
        «FOR elem : fci.getElements()»
        «IF CppValueMapper.map(type,elem.getValue(),nameRules).isValid()»
            tmp.«elem.getElement().getName()» = «CppValueMapper.map(type,elem.getValue(),nameRules).name»;
        «ENDIF»
        «ENDFOR»
        return tmp;
      }()'''
}

