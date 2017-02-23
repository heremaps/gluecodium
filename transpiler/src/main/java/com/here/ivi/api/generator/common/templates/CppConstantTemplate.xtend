package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppConstant
import com.here.ivi.api.model.cppmodel.CppType
import com.here.ivi.api.generator.common.CppValueMapper;

import org.franca.core.franca.FCompoundInitializer


class CppConstantTemplate {
  static def generate(CppConstant constant) '''
    static const «constant.type.name» «constant.name» = «constant.value.name»;
  '''

  static def generate(CppType type, FCompoundInitializer fci) '''
    []() {
      «type.name» tmp;
      «FOR elem : fci.getElements()»
      «IF CppValueMapper.map(elem.getValue()).isValid()»
          tmp.«elem.getElement().getName()» = «CppValueMapper.map(elem.getValue()).name»;
      «ENDIF»
      «ENDFOR»
      return tmp;
    }()'''
}