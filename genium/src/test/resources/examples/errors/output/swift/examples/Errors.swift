//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Errors?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class Errors {
    let c_instance : _baseRef

    init?(cErrors: _baseRef) {
        guard cErrors != 0 else {
            return nil
        }
        c_instance = cErrors
    }

    deinit {
        examples_Errors_release_handle(c_instance)
    }
    public enum InternalErrors : UInt32 {

        case none

        case crashed

        case exploded
    }

    public static func startSomethingOrFail() throws -> Void {
        let ERROR_CODE = examples_Errors_startSomethingOrFail()
        if (ERROR_CODE != 0) {
            throw Errors.InternalErrors(rawValue: ERROR_CODE)!
        }
    }

    public static func getSomethingOrFail() throws -> String {
        let RESULT = examples_Errors_getSomethingOrFail()
        if (RESULT.has_value) {
            let result_string_handle = RESULT.returned_value
            defer {
                std_string_release_handle(result_string_handle)
            }
            return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                     count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
        } else {
            throw Errors.InternalErrors(rawValue: RESULT.error_code)!
        }
    }

}

extension Errors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
