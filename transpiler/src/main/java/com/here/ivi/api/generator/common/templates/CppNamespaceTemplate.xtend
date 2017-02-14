package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppNamespace
import com.here.ivi.api.model.cppmodel.CppConstant
import com.here.ivi.api.model.cppmodel.CppEnum
import com.here.ivi.api.model.cppmodel.CppEnumClass
import com.here.ivi.api.model.cppmodel.CppStruct
import com.here.ivi.api.model.cppmodel.CppTypeDef
import com.here.ivi.api.model.cppmodel.CppClass
import org.eclipse.xtend2.lib.StringConcatenation

class CppNamespaceTemplate {
  static def StringConcatenation generate(CppNamespace ns) '''
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