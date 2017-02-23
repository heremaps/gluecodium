package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppStruct

class CppPureStructTemplate {
  static def generate(CppStruct struct) '''
    /**
     */
    struct «struct.name» {
        «FOR field : struct.fields»
          ///
          «field.type.name» «field.name»«IF field.initializer !== null && field.initializer.isValid()» = «field.initializer.name»«ENDIF»;

        «ENDFOR»
    };
  '''
}