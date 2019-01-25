//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Errors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Errors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Errors_release_handle)
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
        smoke_Errors_release_handle(c_instance)
    }
    public enum InternalError : UInt32, CaseIterable {
        case errorNone
        case errorFatal
    }
    public enum ExternalErrors : UInt32, CaseIterable {
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
            return moveFromCType(RESULT.returned_value)
        } else {
            throw Errors.InternalError(rawValue: RESULT.error_code)!
        }
    }
}
extension Errors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ErrorscopyFromCType(_ handle: _baseRef) -> Errors {
    return Errors(cErrors: smoke_Errors_copy_handle(handle))
}
internal func ErrorsmoveFromCType(_ handle: _baseRef) -> Errors {
    return Errors(cErrors: handle)
}
internal func ErrorscopyFromCType(_ handle: _baseRef) -> Errors? {
    guard handle != 0 else {
        return nil
    }
    return ErrorsmoveFromCType(handle) as Errors
}
internal func ErrorsmoveFromCType(_ handle: _baseRef) -> Errors? {
    guard handle != 0 else {
        return nil
    }
    return ErrorsmoveFromCType(handle) as Errors
}
internal func copyToCType(_ swiftClass: Errors) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Errors) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Errors?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Errors?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ cValue: UInt32) -> Errors.InternalError {
    return Errors.InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Errors.InternalError {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Errors.InternalError) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Errors.InternalError) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}
internal func copyFromCType(_ cValue: UInt32) -> Errors.ExternalErrors {
    return Errors.ExternalErrors(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Errors.ExternalErrors {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Errors.ExternalErrors) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Errors.ExternalErrors) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}