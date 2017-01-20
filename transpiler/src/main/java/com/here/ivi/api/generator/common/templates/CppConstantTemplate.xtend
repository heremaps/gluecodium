package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppConstantTemplate {
  static def generate(CppElements.CppConstant constant) '''
    static const «constant.type.typeName» «constant.name» = «constant.value.value»;
  '''
}