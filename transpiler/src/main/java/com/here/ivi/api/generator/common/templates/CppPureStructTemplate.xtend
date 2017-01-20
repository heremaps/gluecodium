package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

class CppPureStructTemplate {
  static def generate(CppElements.CppStruct struct) '''
    /**
     */
    struct «struct.name» {
        «FOR field : struct.fields»
          «field.type.typeName» «field.name»; ///
        «ENDFOR»
    };
  '''
}