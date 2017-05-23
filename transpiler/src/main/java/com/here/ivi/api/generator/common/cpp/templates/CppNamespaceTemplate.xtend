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

import com.here.ivi.api.model.cppmodel.CppNamespace
import com.here.ivi.api.model.cppmodel.CppConstant
import com.here.ivi.api.model.cppmodel.CppEnum
import com.here.ivi.api.model.cppmodel.CppEnumClass
import com.here.ivi.api.model.cppmodel.CppStruct
import com.here.ivi.api.model.cppmodel.CppTypeDef
import com.here.ivi.api.model.cppmodel.CppClass
import com.here.ivi.api.generator.common.cpp.CppTemplateDelegator

class CppNamespaceTemplate {
    static def generate(CppTemplateDelegator templates, CppNamespace ns) '''
        namespace «ns.name» {

        «FOR member : ns.members»
        «
        switch (member) {
            CppConstant: templates.generate(member)
            CppEnum : templates.generate(member)
            CppEnumClass : templates.generate(member)
            CppNamespace: templates.generate(member)
            CppStruct: templates.generate(member)
            CppTypeDef: templates.generate(member)
            CppClass : templates.generate(member)
            default: '''// Missing mapping «member.class»'''
        }»

        «ENDFOR»

        } // namespace «ns.name»
    '''
}
