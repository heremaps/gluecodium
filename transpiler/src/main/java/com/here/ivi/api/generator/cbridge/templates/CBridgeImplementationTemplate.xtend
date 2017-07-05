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

import com.here.ivi.api.generator.cbridge.templates.CBridgeIncludeTemplate
import com.here.ivi.api.generator.common.templates.CopyrightNoticeTemplate;
import com.here.ivi.api.model.cmodel.CInterface
import com.here.ivi.api.model.cmodel.CFunction

class CBridgeImplementationTemplate {

    public static def generate(CInterface cInterface) '''
    //
    «FOR line : CopyrightNoticeTemplate.generate.split(System.lineSeparator())»
    // «line»
    «ENDFOR»
    //
    // Automatically generated. Do not modify. Your changes will be lost.

    «FOR include: cInterface.implementationIncludes BEFORE '\n'»
        «CBridgeIncludeTemplate.generate(include)»
    «ENDFOR»

    «FOR function: cInterface.functions SEPARATOR '\n'»
        «generateFunctionSignature(function)»
    «ENDFOR»

    '''

    static def generateFunctionSignature(CFunction function) {
        '''
            «function.returnType» «function.name»(«FOR parameter: function.parameters SEPARATOR ', '»«parameter.type» «parameter.name»«ENDFOR») {
                «FOR conversion: function.conversions»
                    auto «conversion.name» = «conversion.expression»;
                «ENDFOR»
                «generateDelegateCall(function)»
            }
        '''
    }

    static def generateDelegateCall(CFunction function) {
        if (function.returnConversion !== null) {
            '''
            {
                auto&& «function.returnConversion.name» = «function.delegateCall»;
                return «function.returnConversion.expression»;
            }
            '''
        } else {
            '''«function.delegateCall»;'''
        }
    }
}
