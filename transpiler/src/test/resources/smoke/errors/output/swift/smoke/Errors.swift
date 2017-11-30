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

internal func getRef(_ ref: Errors) -> RefHolder<smoke_ErrorsRef> {
    return RefHolder<smoke_ErrorsRef>(ref.c_instance)
}

public class Errors {

    let c_instance : smoke_ErrorsRef

    public required init?(cErrors: smoke_ErrorsRef) {
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
        let ERROR = Errors.InternalError(rawValue: smoke_Errors_methodWithErrors())!
        if (ERROR != Errors.InternalError.errorNone) {
            throw ERROR
        }
    }

}
