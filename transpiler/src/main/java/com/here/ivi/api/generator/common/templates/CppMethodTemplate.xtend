package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppParameter
import com.here.ivi.api.model.cppmodel.CppElements
import com.here.ivi.api.model.cppmodel.CppMethod

public class CppMethodTemplate {
    def static generate(CppParameter p) {
        if( p.mode == CppParameter.Mode.Input ) {
            '''«CppElements.CONST_QUALIFIER» «p.type.name»«IF p.type.info == CppElements.TypeInfo.Complex || p.type.info == CppElements.TypeInfo.InterfaceInstance»«CppElements.REF_QUALIFIER»«ENDIF» «p.name»'''
        } else if(p.mode == CppParameter.Mode.Output) {
            '''«p.type.name»«CppElements.REF_QUALIFIER» «p.name»'''
        } else {
            '''«p.type.name»«CppElements.POINTER» «p.name»'''
        }
    }

    // as used in std::function declaration
    def static pureSignature(CppMethod it) '''
        «returnType.name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )'''

    def static signature(CppMethod it) '''
      /**
       * «comment»
       */
      «specifiers.join(' ')» «returnType.name» «name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )«qualifiers.join(' ',' ','') [ it ]»'''

    def static signature(CppMethod it, String className)'''
      «returnType.name» «className»::«name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )«qualifiers.join(' ',' ','') [ it ]»'''
}
