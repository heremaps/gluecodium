//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Errors?, owning: Bool = false) -> RefHolder {
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

    public static func methodWithErrorsAndReturnValue() throws -> String {
        let RESULT = smoke_Errors_methodWithErrorsAndReturnValue()
        if (RESULT.has_value) {
            let result_string_handle = RESULT.returned_value
            defer {
                std_string_release(result_string_handle)
            }
            return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                     count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
        } else {
            throw Errors.InternalError(rawValue: RESULT.error_code)!
        }
    }
}

extension Errors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
