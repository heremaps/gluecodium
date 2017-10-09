//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
// 
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

public class Basic {

    /**
     * Example static method for Basic feature which takes a String and returns a String
     * * @param[in] inputString Input string
     */
    public static func basicMethod(inputString: String) -> String? {
        let result_string_handle = smoke_Basic_basicMethod(inputString)
        defer {
            std_string_release(result_string_handle)
        }
        if let ret_value = String(data: Data(bytes: std_string_data_get(result_string_handle),
                                             count: Int(std_string_size_get(result_string_handle))), encoding: .utf8) {
            return ret_value
        }
        return nil
    }
}


