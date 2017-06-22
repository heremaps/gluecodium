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

/**
Simple type conversion template.

Additional conversion functions for pointers, optionals etc. need to be added in the future.
*/
class SwiftTypeConversionTemplate {
    def static String convertCToSwift(SwiftType type, String expression) {
        switch(type.name) {
            case "String": '''
                {
                    if let ret_pointer = «expression» {
                        let ret_value = String(cString:ret_pointer)
                        //TODO delete_string(ret_pointer)
                        return ret_value
                    }
                    else {
                        return ""
                    }
                }()
                '''
            default: expression
        }
    }

    def static String convertSwiftToC(SwiftType type, String expression) {
        switch(type.name) {
            default: expression
        }
    }
}
