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

import com.here.ivi.api.model.javamodel.JavaConstant
import com.here.ivi.api.model.javamodel.JavaType
import com.here.ivi.api.generator.common.java.JavaNameRules
import com.here.ivi.api.generator.common.java.JavaValueMapper
import org.franca.core.franca.FCompoundInitializer;

class JavaConstantTemplate {
    static def generate(JavaConstant constant) '''
        «IF constant.comment !== null && !constant.comment.isEmpty»
        /**
         * «constant.comment»
         */
        «ENDIF»
        static final «constant.type.name» «constant.name» = «constant.value.name»;
    '''

    static def generate(JavaType type, FCompoundInitializer fci, JavaNameRules nameRules) '''
      []() {
        «type.name» tmp;
        «FOR elem : fci.getElements()»
        «IF JavaValueMapper.map(type,elem.getValue(),nameRules).isValid()»
            tmp.«elem.getElement().getName()» = «JavaValueMapper.map(type,elem.getValue(),nameRules).name»;
        «ENDIF»
        «ENDFOR»
        return tmp;
      }()'''
}
