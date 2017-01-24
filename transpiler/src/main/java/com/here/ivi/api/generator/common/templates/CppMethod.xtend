package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.generator.common.CppElements

public class CppMethod {
    def static generate(CppElements.CppParameter p) '''«p.type.typeName» «p.name»'''
    def static signature(CppElements.CppMethod it) '''
      /**
       * «comment»
       */
      «specifiers.join(' ')» «returnType» «name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )«qualifiers.join(' ')»;
    '''

    def static signature(CppElements.CppMethod it, String className)'''
      «returnType» «className»::«name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )«qualifiers.join(' ')»
    '''
}
