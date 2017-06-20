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

import com.here.ivi.api.model.cmodel.CType

/**
Simple type conversion template.

Additional conversion functions for pointers, optionals etc. need to be added in the future.
*/
class CBridgeTypeConversionTemplate {
    def static String convertCToCpp(CType type, String expression) {
        switch(type.toString) {
            //TODO map based on type of type
            case "const char*": '''std::string(«expression»)'''
            default: expression
        }
    }

    def static String convertCppToC(CType type, String expression) {
        switch(type.toString) {
            //TODO map based on type of type
            case "const char*": '''«expression».c_str()'''
            default: expression
        }
    }
}
