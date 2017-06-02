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

package com.here.ivi.api.generator.objc.templates

import com.here.ivi.api.generator.objc.model.ObjCClass
import com.here.ivi.api.generator.objc.model.ObjCIncludes
import com.here.ivi.api.generator.objc.model.ObjCProperty
import com.here.ivi.api.generator.objc.model.ObjCType
import com.here.ivi.api.generator.objc.model.ObjCMethod
import com.here.ivi.api.generator.objc.model.ObjCMethodParameter

class ObjCHeaderFileTemplate {

    public static def generate(ObjCClass objCClass) '''
    //
    //  Copyright (C) 2015 - 2016 HERE Global B.V. and its affiliate(s).
    //
    //  All rights reserved. This software and other materials contain
    //  proprietary information of HERE and are protected by applicable
    //  copyright legislation. Any use and utilization of this software
    //  and other materials and disclosure to any third parties is
    //  conditional upon having a separate agreement with HERE for the
    //  use, utilization or disclosure of this software. In the absence
    //  of such agreement, the use of the software is not allowed.
    //
    //  Automatically generated. Do not modify. Your changes will be lost.
    «FOR importFile : objCClass.includes»
        «generateInclude(importFile)»
    «ENDFOR»

    @interface «objCClass.name»«generateClassTypeDefinition(objCClass.parentClass, objCClass.implementsProtocols)»

    «FOR property : objCClass.properties»
            @property «generatePropertyDeclaration(property)»
    «ENDFOR»
    «FOR method : objCClass.methods»
            «generateMethodHeader(method)»
    «ENDFOR»

    @end
    '''

    def static generateInclude(ObjCIncludes include) {
        switch include.type {
            case ObjCIncludes.Type.MODULE: '''@import «include.path»'''
            case ObjCIncludes.Type.SYSTEM: '''#import <«include.path»>'''
            default: '''#import "«include.path»"'''
        }
    }

    def static generateClassTypeDefinition(String parentClass, String[] implementProtocols)
    {
        if (parentClass === null) {
            return ""
        }
        ''' : «parentClass»«FOR proto : implementProtocols BEFORE '< ' SEPARATOR ', ' AFTER ' >'»«proto»«ENDFOR»'''
    }

    def static generatePropertyDeclaration(ObjCProperty property) {
        var String[] attributes
        if (property.atomicity == ObjCProperty.Atomicity.NONATOMIC) attributes.add("nonatomic")
        if (property.accessibility == ObjCProperty.Accessibility.READONLY) attributes.add("readonly")
        switch (property.memoryBehaviour) {
            case ObjCProperty.MemoryBehaviour.STRONG: attributes.add("strong")
            case ObjCProperty.MemoryBehaviour.WEAK: attributes.add("weak")
            default: {}
        }
        if (property.nullability == ObjCProperty.Nullability.NONNULL) attributes.add("nonnull")
        var typeName = generateTypeDefinition(property.type)
        '''«FOR attrib : attributes BEFORE '(' SEPARATOR ', ' AFTER ')'»«attrib»«ENDFOR» «typeName» «property.name»;'''
    }

    def static generateTypeDefinition(ObjCType type) {
        val typeName = if (type.templatedTypeName !== null) '''«type.name»<«type.templatedTypeName»>''' else type.name
        switch (type.subtype) {
            case ObjCType.Subtype.POINTER: '''«typeName» *'''
            case ObjCType.Subtype.REFERENCE: '''«typeName» &'''
            default: typeName
        }
    }

    def static generateMethodParam(ObjCMethodParameter methodParameter) '''
    «methodParameter.interfaceName»:(«generateTypeDefinition(methodParameter.type)») «methodParameter.variableName»'''

    def static generateMethodHeader(ObjCMethod method) {
        val methodType = if (method.isStatic) "+" else "-"
        val methodReturnType = '''«methodType»(«generateTypeDefinition(method.returnType)»)'''
        if (method.parameters !== null && method.parameters.size > 0) {
            '''«methodReturnType»«FOR param: method.parameters»«generateMethodParam(param)»«ENDFOR»;'''
        }
        else {
            '''«methodReturnType»«method.name»;'''
        }
    }
}
