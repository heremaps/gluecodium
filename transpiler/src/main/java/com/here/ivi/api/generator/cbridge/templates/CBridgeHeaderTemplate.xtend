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

package com.here.ivi.api.generator.cbridge.templates

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.cbridge.templates.CBridgeIncludeTemplate
import com.here.ivi.api.generator.common.templates.CopyrightNoticeTemplate;
import com.here.ivi.api.model.cmodel.CInterface
import com.here.ivi.api.model.cmodel.CFunction
import com.here.ivi.api.model.cmodel.CStruct

class CBridgeHeaderTemplate{
    public static def generate(CInterface cInterface) '''
    //
    «FOR line : CopyrightNoticeTemplate.generate.split(System.lineSeparator())»
    // «line»
    «ENDFOR»
    //
    // Automatically generated. Do not modify. Your changes will be lost.

    #pragma once
    #ifdef __cplusplus
    extern "C" {
    #endif

    «FOR include: cInterface.headerIncludes BEFORE '\n'»
        «CBridgeIncludeTemplate.generate(include)»
    «ENDFOR»

    «FOR struct: cInterface.structs SEPARATOR '\n'»
        «generateStructDefinition(struct)»
    «ENDFOR»

    «FOR function: cInterface.functions»
        «generateFunctionSignature(function)»
    «ENDFOR»

    #ifdef __cplusplus
    }
    #endif
    '''

    static def generateFunctionSignature(CFunction function) {
        '''
            «function.returnType» «function.name»(«FOR parameter: function.parameters SEPARATOR ', '»«parameter.type» «parameter.name»«ENDFOR»);
        '''
    }
    static def String generateStructDefinition(CStruct struct) {
        return TemplateEngine.render("cbridge/CStruct", struct);
    }

}
