package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import org.eclipse.xtend2.lib.StringConcatenation

class NotifierBodyTemplate implements MethodBodyTemplate {
  override StringConcatenation generate(CppMethod m) '''
  {
      if ( m_«»_notifier != nullptr ) {

      }
  }
  '''
}