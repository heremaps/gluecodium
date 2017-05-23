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

import com.here.ivi.api.model.cppmodel.CppEnumClass

class CppEnumClassTemplate {
    static def generate(CppEnumClass enumClass) '''
    «IF enumClass.enumeration.comment !== null && !enumClass.enumeration.comment.isEmpty»
    /**
     * «enumClass.enumeration.comment»
     */
    «ENDIF»
    enum class «enumClass.enumeration.name» {
        «FOR item : enumClass.enumeration.items SEPARATOR ','»
            «IF item.comment !== null && !item.comment.isEmpty»
            /**
             * «item.comment»
             */
            «ENDIF»
            «item.name»«IF item.value.isValid()» = «item.value.name»«ENDIF»
        «ENDFOR»
    };
    '''
}
