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

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.swift.SwiftClass
import com.here.ivi.api.model.swift.SwiftProperty
import com.here.ivi.api.model.swift.SwiftMethod

class SwiftFileTemplate {

    public static def generate(SwiftClass swiftClass) '''
    //
    «FOR line : TemplateEngine.render("common/CopyrightNotice", null).split(System.lineSeparator())»
    // «line»
    «ENDFOR»
    //
    // Automatically generated. Do not modify. Your changes will be lost.
    «FOR importFile : swiftClass.imports BEFORE '\n'»
        import «importFile»
    «ENDFOR»

    «generateComment(swiftClass.comment)»
    public class «swiftClass.name»«generateClassTypeDefinition(swiftClass.parentClass, swiftClass.implementsProtocols)» {

    «FOR property : swiftClass.properties»
            @property «generatePropertyDeclaration(property)»
    «ENDFOR»
    «FOR struct : swiftClass.structs»
         «SwiftStructTemplate.generate(struct)»
    «ENDFOR»
        «FOR method : swiftClass.methods»
                «generateComment(method.comment)»
                «generateMethod(swiftClass, method)»
        «ENDFOR»
    }
    '''

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
        '''«FOR attrib : attributes BEFORE '(' SEPARATOR ', ' AFTER ')'»«attrib»«ENDFOR» «property.type» «property.name»;'''
    }

    def static generateMethod(SwiftClass swiftClass, SwiftMethod method) {
        //TODO APIGEN-293 move this out of the templating code into the generator or the view model
        val prefix = if (swiftClass.nameSpace.length > 0) '''«swiftClass.nameSpace»_«swiftClass.name»''' else swiftClass.name
        method.cBaseName = '''«prefix»_«method.name»'''
        SwiftMethodTemplate.generate(method)
    }

}
