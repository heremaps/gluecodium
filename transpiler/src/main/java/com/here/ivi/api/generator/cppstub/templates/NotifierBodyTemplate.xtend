package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import org.eclipse.xtend2.lib.StringConcatenation

class NotifierBodyTemplate implements MethodBodyTemplate {
  private String fieldName

  public new (String fieldName) {
    this.fieldName = fieldName;
  }

  override StringConcatenation generate(CppMethod m) '''
  {
      if ( «fieldName» != nullptr )
      {
          «fieldName»( «(m.inParameters + m.outParameters).map[ p | p.name].join(', ')» );
      }
  }
  '''
}