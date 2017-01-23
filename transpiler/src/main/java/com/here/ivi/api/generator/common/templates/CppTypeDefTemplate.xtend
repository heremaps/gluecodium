package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppTypeDefTemplate {
  static def generate(CppElements.CppTypeDef td) '''
  typedef «td.targetType.typeName» «td.name»;'''
}