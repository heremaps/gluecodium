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

package com.here.ivi.api.generator.common.java.templates

import java.util.List;
import com.here.ivi.api.model.javamodel.JavaParameter
import com.here.ivi.api.model.javamodel.JavaMethod
import com.here.ivi.api.generator.common.java.JavaCommentFormatter

public class JavaMethodTemplate {
    def static generate(JavaParameter p)
        '''final «p.type.name» «p.name»'''

    def static whitespaceFormatter(String field) '''
        «field»«IF !field.isEmpty» «ENDIF»'''

    def static parameterFormatter(List<JavaParameter> parameters) '''
        «(parameters).map[ p | p.generate].join(', ')»'''

    // as used in std::function declaration
    def static pureSignature(JavaMethod it) '''
        «returnType.name» «name»(«(parameters).map[ p | p.generate].join(', ')»)'''

    def static signature(JavaMethod it) {
      val accessModifier = whitespaceFormatter(visibility.toAccessModifier)
      val specifiersJoined = whitespaceFormatter(qualifiers.join(' '))
      val parameters = parameterFormatter(parameters)
      '''
      «IF comment !== null && !comment.isEmpty»
      /**
       * «JavaCommentFormatter.format(comment)»
      «IF deprecatedComment !== null && !deprecatedComment.isEmpty»
      «' '»* @deprecated «deprecatedComment»
      «ENDIF»
       */
      «ENDIF»
      «IF deprecatedComment !== null && !deprecatedComment.isEmpty»
      @Deprecated
      «ENDIF»
      «accessModifier»«specifiersJoined»«returnType.name» «name»(«parameters»)'''
    }

    def static signature(JavaMethod it, String className)'''
      «whitespaceFormatter(returnType.name)»«className»::«name»( «parameterFormatter(parameters)» )'''
}
