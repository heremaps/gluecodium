package com.here.ivi.api.generator.common.templates

import java.util.List;
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

    def static whitespaceFormatter(String field) '''
        «field»«IF !field.isEmpty» «ENDIF»'''

    def static parameterFormatter(List<CppParameter> inParameters, List<CppParameter> outParameters) '''
        «(inParameters + outParameters).map[ p | p.generate].join(', ')»'''

    // as used in std::function declaration
    def static pureSignature(CppMethod it) '''
        «returnType.name»(  «(inParameters + outParameters).map[ p | p.generate].join(', ')» )'''

    def static signature(CppMethod it) '''
      «IF comment !== null && !comment.isEmpty»
      /**
       * «comment»
       */
      «ENDIF»
      «IF deprecatedComment !== null && !deprecatedComment.isEmpty»
      CARLO_DEPRECATED_TEXT( "«deprecatedComment»" )
      «ENDIF»
      «whitespaceFormatter(specifiers.join(' '))»«whitespaceFormatter(returnType.name)»«name»( «parameterFormatter(inParameters, outParameters)» )«qualifiers.join(' ',' ','') [ it ]»'''

    def static signature(CppMethod it, String className)'''
      «whitespaceFormatter(returnType.name)»«className»::«name»( «parameterFormatter(inParameters, outParameters)» )«qualifiers.join(' ',' ','') [ it ]»'''
}
