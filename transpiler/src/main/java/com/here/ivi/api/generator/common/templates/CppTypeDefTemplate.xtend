package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppTypeDef

class CppTypeDefTemplate {
  static def generate(CppTypeDef td) '''
  typedef «td.targetType.name» «td.name»;'''
}
