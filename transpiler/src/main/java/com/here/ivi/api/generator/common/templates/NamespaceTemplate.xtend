package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppNamespaceTemplate {
  static def generate(CppElements.CppNamespace ns) '''
      namespace «ns.name» {

      «FOR sns : ns.subNs»
        «CppNamespaceTemplate.generate(sns)»
      «ENDFOR»

      } // namespace «ns.name»
  '''
}