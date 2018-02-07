//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Basic?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class Basic {
    let c_instance : _baseRef

    public init?(cBasic: _baseRef) {
        guard cBasic != 0 else {
            return nil
        }
        c_instance = cBasic
    }

    deinit {
        smoke_Basic_release(c_instance)
    }
    /**
     Example static method for Basic feature which takes a String and returns a String
     - Parameter inputString: Input string
     - Returns: Output string
     */
    public static func basicMethod(inputString: String) -> String? {
        let result_string_handle = smoke_Basic_basicMethod(inputString)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

}

extension Basic: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

