package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.generator.cppstub.templates.MethodBodyTemplate

import com.here.ivi.api.model.cppmodel.CppField

import java.util.Set;
import com.here.ivi.api.model.cppmodel.CppParameter
import java.util.stream.Collectors

class StructCtor implements MethodBodyTemplate {

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
