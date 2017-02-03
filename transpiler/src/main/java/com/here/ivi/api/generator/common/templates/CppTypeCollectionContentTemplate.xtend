package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.*

class CppTypeCollectionContentTemplate {
  static def generate(CppNamespace ns) '''
    #pragma once

    «FOR include : CppElements.collectIncludes(ns)»
      «CppIncludeTemplate.generate(include)»
    «ENDFOR»

    «CppNamespaceTemplate.generate(ns)»
  '''
}