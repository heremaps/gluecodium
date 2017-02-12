package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.*

class CppClassTemplate {
  static def generate(CppClass clazz) '''
    /**
     */
    class «clazz.name» {
    public:

        «FOR m : clazz.methods»
          «CppMethodTemplate.signature(m)»

        «ENDFOR»
    };
  '''
}