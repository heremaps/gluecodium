package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppNamespace
import com.here.ivi.api.model.cppmodel.CppElements
import com.here.ivi.api.generator.common.CppTemplateDelegator

class CppDelegatorTemplate {
  static def generate(CppTemplateDelegator templates, CppNamespace ns) '''
    #pragma once

    «FOR include : CppElements.collectIncludes(ns)»
      «templates.generate(include)»
    «ENDFOR»

    «templates.generate(ns)»
  '''
}