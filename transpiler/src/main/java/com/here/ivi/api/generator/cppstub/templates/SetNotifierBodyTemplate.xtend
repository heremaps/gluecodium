package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate
import org.eclipse.xtend2.lib.StringConcatenation

class SetNotifierBodyTemplate implements CppMethodBodyTemplate {
  private String fieldName
  private String parameterName

  public new (String fieldName, String parameterName) {
    this.fieldName = fieldName;
    this.parameterName = parameterName;
  }

  override StringConcatenation generate(CppMethod m) '''
  {
      «fieldName» = «parameterName»;
  }
  '''
}
