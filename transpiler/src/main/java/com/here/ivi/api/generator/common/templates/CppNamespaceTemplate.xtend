package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppNamespaceTemplate {
  static def generate(CppElements.CppNamespace ns) '''
      namespace «ns.name» {

      «FOR member : ns.members»
      «
      switch (member) {
        CppElements.CppConstant: CppConstantTemplate.generate(member)
        CppElements.CppEnum : CppEnumTemplate.generate(member)
        CppElements.CppEnumClass : CppEnumClassTemplate.generate(member)
        CppElements.CppNamespace: CppNamespaceTemplate.generate(member)
        CppElements.CppStruct: CppPureStructTemplate.generate(member)
        CppElements.CppTypeDef: CppTypeDefTemplate.generate(member)
        default: '''// Missing mapping «member.class»'''
      }»

      «ENDFOR»

      } // namespace «ns.name»
  '''
}