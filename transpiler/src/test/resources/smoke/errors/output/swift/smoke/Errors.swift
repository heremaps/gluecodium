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



internal func getRef(_ ref: Errors) -> RefHolder {
    return RefHolder(ref.c_instance)
}
public class Errors {
    let c_instance : _baseRef

    public init?(cErrors: _baseRef) {
        guard cErrors != 0 else {
            return nil
        }
        c_instance = cErrors
    }

    deinit {
        smoke_Errors_release(c_instance)
    }
    public enum InternalError : UInt32 {

        case errorNone

        case errorFatal
    }

    public static func methodWithErrors() throws -> Void {
        let ERROR_CODE = smoke_Errors_methodWithErrors()
        if (ERROR_CODE != 0) {
            throw Errors.InternalError(rawValue: ERROR_CODE)!
        }
    }

}

extension Errors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
