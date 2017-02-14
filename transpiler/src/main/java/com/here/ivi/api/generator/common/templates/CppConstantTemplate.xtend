package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppConstant
import com.here.ivi.api.model.cppmodel.CppType
import com.here.ivi.api.generator.common.CppValueMapper;

import org.franca.core.franca.FCompoundInitializer


class CppConstantTemplate {
  static def generate(CppConstant constant) '''
    static const «constant.type.typeName» «constant.name» = «constant.value.value»;
  '''

  static def generate(CppType type, FCompoundInitializer fci) '''
    []() {
      «type.typeName» tmp;
      «FOR elem : fci.getElements()»
      «IF CppValueMapper.map(elem.getValue()).isValid()»
          tmp.«elem.getElement().getName()» = «CppValueMapper.map(elem.getValue()).value»;
      «ENDIF»
      «ENDFOR»
      return tmp;
    }()'''
}