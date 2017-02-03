package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.*

class CppTypeDefTemplate {
  static def generate(CppTypeDef td) '''
  typedef «td.targetType.typeName» «td.name»;'''
}