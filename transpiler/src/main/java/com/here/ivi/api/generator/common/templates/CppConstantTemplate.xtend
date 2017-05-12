package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppConstant
import com.here.ivi.api.model.cppmodel.CppType
import com.here.ivi.api.generator.common.cpp.CppValueMapper;

import org.franca.core.franca.FCompoundInitializer
import com.here.ivi.api.generator.common.cpp.CppNameRules

class CppConstantTemplate {
  static def generate(CppConstant constant) '''
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
