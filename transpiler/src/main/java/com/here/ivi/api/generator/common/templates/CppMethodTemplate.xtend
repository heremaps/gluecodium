package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppParameter
import com.here.ivi.api.model.cppmodel.CppElements
import com.here.ivi.api.model.cppmodel.CppMethod

public class CppMethodTemplate {
    def static generate(CppParameter p) {
        if( p.mode == CppParameter.Mode.Input ) {
            '''«CppElements.CONST_QUALIFIER» «p.type.typeName»«IF p.type.info == CppElements.TypeInfo.Complex || p.type.info == CppElements.TypeInfo.InterfaceInstance»«CppElements.REF_QUALIFIER»«ENDIF» «p.name»'''
        } else if(p.mode == CppParameter.Mode.Output) {
            '''«p.type.typeName»«CppElements.REF_QUALIFIER» «p.name»'''
        } else {
            '''«p.type.typeName»«CppElements.POINTER» «p.name»'''
        }
    }

    def static signature(CppMethod it) '''
      /**
       * «comment»
       */
      «specifiers.join(' ')» «returnType» «name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» ) «qualifiers.join(' ')»;'''

    def static signature(CppMethod it, String className)'''
      «returnType» «className»::«name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» ) «qualifiers.join(' ')»'''
}
