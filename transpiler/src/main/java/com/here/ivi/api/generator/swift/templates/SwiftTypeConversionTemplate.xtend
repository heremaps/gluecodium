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

import com.here.ivi.api.model.swift.SwiftType
import com.here.ivi.api.model.swift.SwiftParameter

/**
Simple type conversion template.

Additional conversion functions for pointers, optionals etc. need to be added in the future.
*/
class SwiftTypeConversionTemplate {
    def static String convertCToSwift(SwiftType type, String functionName, SwiftParameter[] params) {
        switch(type.name) {
            case "String": '''
                {
                    if let handler = «functionName»(«FOR param: params SEPARATOR ", "»c_«param.variableName»«ENDFOR») {
                        let ret_value = String(cString:«functionName»_getData(handler))
                        «functionName»_release(handler)
                        return ret_value
                    }
                    else {
                        return ""
                    }
                }()
                '''
            default: '''«functionName»(«FOR param: params SEPARATOR ", "»c_«param.variableName»«ENDFOR»)'''
        }
    }

    def static String convertSwiftToC(SwiftType type, String expression) {
        switch(type.name) {
            default: expression
        }
    }
}
