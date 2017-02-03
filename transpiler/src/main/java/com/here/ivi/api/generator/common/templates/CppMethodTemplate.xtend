package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.*

public class CppMethodTemplate {
    def static generate(CppParameter p) '''«p.type.typeName» «p.name»'''
    def static signature(CppMethod it) '''
      /**
       * «comment»
       */
      «specifiers.join(' ')» «returnType» «name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )«qualifiers.join(' ')»;
    '''

    def static signature(CppMethod it, String className)'''
      «returnType» «className»::«name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )«qualifiers.join(' ')»
    '''
}
