package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.*

class CppNamespaceTemplate {
  static def generate(CppNamespace ns) '''
      namespace «ns.name» {

      «FOR member : ns.members»
      «
      switch (member) {
        CppConstant: CppConstantTemplate.generate(member)
        CppEnum : CppEnumTemplate.generate(member)
        CppEnumClass : CppEnumClassTemplate.generate(member)
        CppNamespace: CppNamespaceTemplate.generate(member)
        CppStruct: CppPureStructTemplate.generate(member)
        CppTypeDef: CppTypeDefTemplate.generate(member)
        CppClass : CppClassTemplate.generate(member)
        default: '''// Missing mapping «member.class»'''
      }»

      «ENDFOR»

      } // namespace «ns.name»
  '''
}