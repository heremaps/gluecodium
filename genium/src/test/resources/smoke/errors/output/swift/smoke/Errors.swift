//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Errors?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
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

    public enum ExternalErrors : UInt32 {
        case none
        case boom
        case bust
    }

    public static func methodWithErrors() throws -> Void {
        let ERROR_CODE = smoke_Errors_methodWithErrors()
        if (ERROR_CODE != 0) {
            throw Errors.InternalError(rawValue: ERROR_CODE)!
        }
    }

    public static func methodWithExternalErrors() throws -> Void {
        let ERROR_CODE = smoke_Errors_methodWithExternalErrors()
        if (ERROR_CODE != 0) {
            throw Errors.ExternalErrors(rawValue: ERROR_CODE)!
        }
    }

}

extension Errors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
