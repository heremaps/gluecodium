package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppClass

class CppClassTemplate {
  static def generate(CppClass clazz) '''
    /**
     *
     */
    class «clazz.name» {
    public:
        «FOR u : clazz.usings»
        using «u.name» = «u.definition.typeName»;
        «ENDFOR»


    public:
        «FOR m : clazz.methods»
          «CppMethodTemplate.signature(m)»

        «ENDFOR»
    };
  '''
}