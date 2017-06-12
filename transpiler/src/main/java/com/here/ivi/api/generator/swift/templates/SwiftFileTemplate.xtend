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

package com.here.ivi.api.generator.swift.templates

import com.here.ivi.api.model.swift.SwiftClass
import com.here.ivi.api.model.swift.SwiftIncludes
import com.here.ivi.api.model.swift.SwiftProperty
import com.here.ivi.api.model.swift.SwiftType
import com.here.ivi.api.model.swift.SwiftMethod
import com.here.ivi.api.model.swift.SwiftMethodParameter

class SwiftFileTemplate {

    public static def generate(SwiftClass swiftClass) '''
    //
    //  Copyright (C) 2015 - 2017 HERE Global B.V. and its affiliate(s).
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
    «FOR importFile : swiftClass.includes BEFORE '\n'»
        «generateInclude(importFile)»
    «ENDFOR»

    «generateComment(swiftClass.comment)»
    @interface «swiftClass.name»«generateClassTypeDefinition(swiftClass.parentClass, swiftClass.implementsProtocols)»

    «FOR property : swiftClass.properties»
            @property «generatePropertyDeclaration(property)»
    «ENDFOR»
    «FOR method : swiftClass.methods»
            «generateComment(method.comment)»
            «generateMethodHeader(method)»
    «ENDFOR»

    @end
    '''

    def static generateInclude(SwiftIncludes include) {
        switch include.type {
            case SwiftIncludes.Type.MODULE: '''@import «include.path»'''
            case SwiftIncludes.Type.SYSTEM: '''#import <«include.path»>'''
            default: '''#import "«include.path»"'''
        }
    }

    def static generateComment(String comment) {
        if (comment.isEmpty) {
            return ""
        }
        return '''
            /**
             * «comment»
             */
        '''
    }

    def static generateClassTypeDefinition(String parentClass, String[] implementProtocols)
    {
        if (parentClass === null) {
            return ""
        }
        ''' : «parentClass»«FOR proto : implementProtocols BEFORE '< ' SEPARATOR ', ' AFTER ' >'»«proto»«ENDFOR»'''
    }

    def static generatePropertyDeclaration(SwiftProperty property) {
        var String[] attributes
        if (property.atomicity == SwiftProperty.Atomicity.NONATOMIC) attributes.add("nonatomic")
        if (property.accessibility == SwiftProperty.Accessibility.READONLY) attributes.add("readonly")
        switch (property.memoryBehaviour) {
            case SwiftProperty.MemoryBehaviour.STRONG: attributes.add("strong")
            case SwiftProperty.MemoryBehaviour.WEAK: attributes.add("weak")
            default: {}
        }
        if (property.nullability == SwiftProperty.Nullability.NONNULL) attributes.add("nonnull")
        var typeName = generateTypeDefinition(property.type)
        '''«FOR attrib : attributes BEFORE '(' SEPARATOR ', ' AFTER ')'»«attrib»«ENDFOR» «typeName» «property.name»;'''
    }

    def static generateTypeDefinition(SwiftType type) {
        val typeName = if (type.templatedTypeName !== null) '''«type.name»<«type.templatedTypeName»>''' else type.name
        switch (type.subtype) {
            case SwiftType.Subtype.POINTER: '''«typeName» *'''
            case SwiftType.Subtype.REFERENCE: '''«typeName» &'''
            default: typeName
        }
    }

    def static generateMethodParam(SwiftMethodParameter methodParameter) '''
    «methodParameter.interfaceName»:(«generateTypeDefinition(methodParameter.type)») «methodParameter.variableName»'''

    def static generateMethodHeader(SwiftMethod method) {
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
