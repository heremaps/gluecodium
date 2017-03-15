package com.here.ivi.api.generator.common.templates

import com.here.ivi.api.model.cppmodel.CppClass

class CppInheritanceTemplate {
    static def generate(CppClass clazz) '''
        «FOR i : clazz.inheritances BEFORE ': ' SEPARATOR ', ' AFTER ' '»
        «i.visibility.name().toLowerCase()» «i.parent.name»
        «ENDFOR»'''
}