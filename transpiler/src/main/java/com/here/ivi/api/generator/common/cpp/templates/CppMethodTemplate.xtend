/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.common.cpp.templates

import com.here.ivi.api.generator.common.cpp.templates.CppDocCommentTemplate
import com.here.ivi.api.model.cppmodel.CppParameter
import com.here.ivi.api.model.cppmodel.CppElements
import com.here.ivi.api.model.cppmodel.CppMethod
import com.here.ivi.api.model.cppmodel.CppType
import java.util.List;

public class CppMethodTemplate {

    def static generateInputType(CppType type)'''
        «CppElements.CONST_QUALIFIER» «type.name»«IF !type.isValueType»«CppElements.REF_QUALIFIER»«ENDIF»'''

    def static generate(CppParameter p) {
        if( p.mode == CppParameter.Mode.Input ) {
            '''«generateInputType(p.type)» «p.name»'''
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
      «CppDocCommentTemplate.generate(it)»
      «IF deprecatedComment !== null && !deprecatedComment.isEmpty»
      CARLO_DEPRECATED_TEXT( "«deprecatedComment»" )
      «ENDIF»
      «whitespaceFormatter(specifiers.join(' '))»«whitespaceFormatter(returnType.name)»«name»( «parameterFormatter(inParameters, outParameters)» ) «qualifiers.join(' ')»'''

    def static signature(CppMethod it, String className)'''
      «whitespaceFormatter(returnType.name)»«className»::«name»( «parameterFormatter(inParameters, outParameters)» ) «qualifiers.join(' ')»'''
}
