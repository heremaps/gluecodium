package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppTypeCollectionContentTemplate {
  static def generate(CppElements.CppNamespace ns) '''
    #pragma once

    «FOR include : CppElements.collectIncludes(ns)»
      «CppIncludeTemplate.generate(include)»
    «ENDFOR»

    «CppNamespaceTemplate.generate(ns)»
  '''
}