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

import com.here.ivi.api.generator.common.cpp.templates.CppIncludeTemplate
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cmodel.CInterface
import com.here.ivi.api.model.cmodel.CFunction
import com.here.ivi.api.model.cmodel.CParameter

class CBridgeImplementationTemplate {

    public static def generate(CInterface cInterface) '''
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
    «generateHardcodedIncludes(cInterface)»

    «FOR include: cInterface.includes BEFORE '\n'»
        «CppIncludeTemplate.generate(include)»
    «ENDFOR»

    «FOR function: cInterface.functions»
        «generateFunctionSignature(function)»
    «ENDFOR»

    '''

    static def generateHardcodedIncludes(CInterface cInterface) {
        if (cInterface.fileName !== null && cInterface.stubHeaderFileName !== null) {
            '''
            extern "C" {
            #include "«cInterface.fileName»"
            }
            #include <«cInterface.stubHeaderFileName»>
            #import <string>
            '''
        }
        else return ""
    }



    static def generateFunctionSignature(CFunction function) {
        '''
            «function.returnType» «function.name»(«FOR parameter: function.parameters SEPARATOR ', '»«parameter.type» «parameter.name»«ENDFOR») {
                «FOR parameter: function.parameters»
                    «generateParameterConversion(parameter)»
                «ENDFOR»
                «generateDelegateCall(function)»
            }
        '''
    }

    static def generateParameterConversion(CParameter parameter) {
        '''auto cpp_«parameter.name» = «CBridgeTypeConversionTemplate.convertCToCpp(parameter.type, parameter.name)»;'''
    }

    static def generateDelegateCall(CFunction function) {
        '''
        return «CBridgeTypeConversionTemplate.convertCppToC(function.returnType,
            '''«function.delegateName»(«FOR parameter: function.parameters SEPARATOR ', '»cpp_«parameter.name»«ENDFOR»)'''
        )»;
        '''
    }
}
