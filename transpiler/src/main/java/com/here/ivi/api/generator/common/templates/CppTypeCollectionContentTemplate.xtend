package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppNamespace
import com.here.ivi.api.model.cppmodel.CppElements

class CppTypeCollectionContentTemplate {
  static def generate(CppNamespace ns) '''
    #pragma once

    «FOR include : CppElements.collectIncludes(ns)»
      «CppIncludeTemplate.generate(include)»
    «ENDFOR»

    «CppNamespaceTemplate.generate(ns)»
  '''
}