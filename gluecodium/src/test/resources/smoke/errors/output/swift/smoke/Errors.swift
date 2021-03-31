//
//
import Foundation
public class Errors {
    public typealias InternalError = Errors.InternalErrorCode
    public typealias ExternalError = Errors.ExternalErrors
    let c_instance : _baseRef
    init(cErrors: _baseRef) {
        guard cErrors != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cErrors
    }
    deinit {
        smoke_Errors_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Errors_release_handle(c_instance)
    }
    public enum InternalErrorCode : UInt32, CaseIterable, Codable {
        case errorNone
        case errorFatal
    }
    public enum ExternalErrors : UInt32, CaseIterable, Codable {
        case none
        case boom
        case bust
    }
    public static func methodWithErrors() throws -> Void {
        let RESULT = smoke_Errors_methodWithErrors()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Errors.InternalError
        }
    }
    public static func methodWithExternalErrors() throws -> Void {
        let RESULT = smoke_Errors_methodWithExternalErrors()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Errors.ExternalError
        }
    }
    public static func methodWithErrorsAndReturnValue() throws -> String {
        let RESULT = smoke_Errors_methodWithErrorsAndReturnValue()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Errors.InternalError
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
    public static func methodWithPayloadError() throws -> Void {
        let RESULT = smoke_Errors_methodWithPayloadError()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as WithPayloadError
        }
    }
    public static func methodWithPayloadErrorAndReturnValue() throws -> String {
        let RESULT = smoke_Errors_methodWithPayloadErrorAndReturnValue()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as WithPayloadError
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
}
internal func getRef(_ ref: Errors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Errors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Errors_release_handle)
        : RefHolder(handle_copy)
}
extension Errors: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension Errors: Hashable {
    /// :nodoc:
    public static func == (lhs: Errors, rhs: Errors) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func Errors_copyFromCType(_ handle: _baseRef) -> Errors {
    if let swift_pointer = smoke_Errors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Errors {
        return re_constructed
    }
    let result = Errors(cErrors: smoke_Errors_copy_handle(handle))
    smoke_Errors_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Errors_moveFromCType(_ handle: _baseRef) -> Errors {
    if let swift_pointer = smoke_Errors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Errors {
        smoke_Errors_release_handle(handle)
        return re_constructed
    }
    let result = Errors(cErrors: handle)
    smoke_Errors_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Errors_copyFromCType(_ handle: _baseRef) -> Errors? {
    guard handle != 0 else {
        return nil
    }
    return Errors_moveFromCType(handle) as Errors
}
internal func Errors_moveFromCType(_ handle: _baseRef) -> Errors? {
    guard handle != 0 else {
        return nil
    }
    return Errors_moveFromCType(handle) as Errors
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
internal func copyToCType(_ swiftEnum: Errors.InternalErrorCode) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Errors.InternalErrorCode) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Errors.InternalErrorCode?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Errors.InternalErrorCode?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Errors.InternalErrorCode {
    return Errors.InternalErrorCode(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Errors.InternalErrorCode {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Errors.InternalErrorCode? {
    guard handle != 0 else {
        return nil
    }
    return Errors.InternalErrorCode(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Errors.InternalErrorCode? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftEnum: Errors.ExternalErrors) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Errors.ExternalErrors) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Errors.ExternalErrors?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Errors.ExternalErrors?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Errors.ExternalErrors {
    return Errors.ExternalErrors(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Errors.ExternalErrors {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Errors.ExternalErrors? {
    guard handle != 0 else {
        return nil
    }
    return Errors.ExternalErrors(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Errors.ExternalErrors? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension Errors.InternalErrorCode : Error {
}
extension Errors.ExternalErrors : Error {
}
