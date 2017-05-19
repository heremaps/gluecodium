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
