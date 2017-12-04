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

internal func getRef(_ ref: Errors) -> RefHolder<examples_ErrorsRef> {
    return RefHolder<examples_ErrorsRef>(ref.c_instance)
}

public class Errors {

    let c_instance : examples_ErrorsRef

    public required init?(cErrors: examples_ErrorsRef) {
        c_instance = cErrors
    }

    deinit {
        examples_Errors_release(c_instance)
    }

    public enum InternalErrors : UInt32 {

        case none

        case crashed

        case exploded
    }

    public static func startSomethingOrFail() throws -> Void {
        let ERROR = Errors.InternalErrors(rawValue: examples_Errors_startSomethingOrFail())!
        if (ERROR != Errors.InternalErrors.none) {
            throw ERROR
        }
    }

    public static func getSomethingOrFail() throws -> String? {
        let RESULT = examples_Errors_getSomethingOrFail()
        if (RESULT.has_value) {
            let result_string_handle = RESULT.returned_value
            defer {
                std_string_release(result_string_handle)
            }
            return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                     count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
        } else {
            throw Errors.InternalErrors(rawValue: RESULT.error_code)!
        }
    }
}
