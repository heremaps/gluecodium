//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Errors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Errors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Errors_release_handle)
        : RefHolder(handle_copy)
}
public class Errors {
    let c_instance : _baseRef
    init(cErrors: _baseRef) {
        guard cErrors != 0 else {
            fatalError("Nullptr value is not supported for initializers")
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
            return moveFromCType(RESULT.returned_value)
        } else {
            throw Errors.InternalErrors(rawValue: RESULT.error_code)!
        }
    }
}
extension Errors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ErrorscopyFromCType(_ handle: _baseRef) -> Errors {
    return Errors(cErrors: handle)
}
internal func ErrorsmoveFromCType(_ handle: _baseRef) -> Errors {
    return ErrorscopyFromCType(handle)
}
internal func ErrorscopyFromCType(_ handle: _baseRef) -> Errors? {
    guard handle != 0 else {
        return nil
    }
    return ErrorsmoveFromCType(handle) as Errors
}
internal func ErrorsmoveFromCType(_ handle: _baseRef) -> Errors? {
    return ErrorscopyFromCType(handle)
}
internal func copyFromCType(_ cValue: UInt32) -> Errors.InternalErrors {
    return Errors.InternalErrors(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Errors.InternalErrors {
    return copyFromCType(cValue)
}