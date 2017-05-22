package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate
import org.eclipse.xtend2.lib.StringConcatenation

class EmptyBodyTemplate implements CppMethodBodyTemplate {
  override StringConcatenation generate(CppMethod m) '''
  {
  }
  '''
}
