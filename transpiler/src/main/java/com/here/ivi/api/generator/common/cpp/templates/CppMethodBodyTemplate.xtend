package com.here.ivi.api.generator.common.cpp.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import org.eclipse.xtend2.lib.StringConcatenation

interface CppMethodBodyTemplate {
  def abstract StringConcatenation generate(CppMethod m)
}
