package com.here.ivi.api.generator.common.cpp.templates

import com.here.ivi.api.model.cppmodel.CppTypeDef

class CppTypeDefTemplate {
  static def generate(CppTypeDef td) '''
    «IF td.comment !== null && !td.comment.isEmpty»
    /**
     * «td.comment»
     */
    «ENDIF»
    typedef «td.targetType.name» «td.name»;'''
}
