package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.generator.common.cpp.templates.CppMethodBodyTemplate

class StructCtor implements CppMethodBodyTemplate {

  override generate(CppMethod m)
  {
      '''
    «FOR param : m.inParameters BEFORE ':' SEPARATOR ','»
        «param.name» («param.name»)
    «ENDFOR»
  {}
  '''
  }
}
