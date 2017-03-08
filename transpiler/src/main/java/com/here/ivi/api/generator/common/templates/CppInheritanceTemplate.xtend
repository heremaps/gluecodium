package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppClass

class CppInheritanceTemplate {
    static def generate(CppClass clazz) {
        if(clazz.inheritance !== null) {
            ''': «clazz.inheritance.type.name().toLowerCase()» «clazz.inheritance.parent.name» '''
        }
    }
}