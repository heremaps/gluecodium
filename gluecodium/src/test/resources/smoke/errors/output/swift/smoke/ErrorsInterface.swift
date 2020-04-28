//
//
import Foundation
public protocol ErrorsInterface : AnyObject {
    typealias ExternalError = ExternalErrors
    func methodWithErrors() throws -> Void
    func methodWithExternalErrors() throws -> Void
    func methodWithErrorsAndReturnValue() throws -> String
    static func methodWithPayloadError() throws -> Void
    static func methodWithPayloadErrorAndReturnValue() throws -> String
}
internal class _ErrorsInterface: ErrorsInterface {
    let c_instance : _baseRef
    init(cErrorsInterface: _baseRef) {
        guard cErrorsInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cErrorsInterface
    }
    deinit {
        smoke_ErrorsInterface_release_handle(c_instance)
    }
    public func methodWithErrors() throws -> Void {
        let RESULT = smoke_ErrorsInterface_methodWithErrors(self.c_instance)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as InternalError
        }
    }
    public func methodWithExternalErrors() throws -> Void {
        let RESULT = smoke_ErrorsInterface_methodWithExternalErrors(self.c_instance)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as ExternalError
        }
    }
    public func methodWithErrorsAndReturnValue() throws -> String {
        let RESULT = smoke_ErrorsInterface_methodWithErrorsAndReturnValue(self.c_instance)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as InternalError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
    public static func methodWithPayloadError() throws -> Void {
        let RESULT = smoke_ErrorsInterface_methodWithPayloadError()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as WithPayloadError
        }
    }
    public static func methodWithPayloadErrorAndReturnValue() throws -> String {
        let RESULT = smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue()
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as WithPayloadError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
}
@_cdecl("_CBridgeInitsmoke_ErrorsInterface")
internal func _CBridgeInitsmoke_ErrorsInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ErrorsInterface(cErrorsInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ErrorsInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ErrorsInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ErrorsInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ErrorsInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ErrorsInterface_methodWithErrors = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            try swift_class.methodWithErrors()
            return smoke_ErrorsInterface_methodWithErrors_result(has_value: true, error_value: 0)
        } catch let error as InternalError {
            return smoke_ErrorsInterface_methodWithErrors_result(has_value: false, error_value: copyToCType(error).ref)
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    functions.smoke_ErrorsInterface_methodWithExternalErrors = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            try swift_class.methodWithExternalErrors()
            return smoke_ErrorsInterface_methodWithExternalErrors_result(has_value: true, error_value: 0)
        } catch let error as ExternalError {
            return smoke_ErrorsInterface_methodWithExternalErrors_result(has_value: false, error_value: copyToCType(error).ref)
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    functions.smoke_ErrorsInterface_methodWithErrorsAndReturnValue = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            let call_result = try swift_class.methodWithErrorsAndReturnValue()
            let result_handle = copyToCType(call_result).ref
            return smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result(has_value: true, .init(returned_value: result_handle))
        } catch let error as InternalError {
            return smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result(has_value: false, .init(error_value: copyToCType(error).ref))
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    functions.smoke_ErrorsInterface_methodWithPayloadError = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            try swift_class.methodWithPayloadError()
            return smoke_ErrorsInterface_methodWithPayloadError_result(has_value: true, error_value: 0)
        } catch let error as WithPayloadError {
            return smoke_ErrorsInterface_methodWithPayloadError_result(has_value: false, error_value: copyToCType(error).ref)
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    functions.smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            let call_result = try swift_class.methodWithPayloadErrorAndReturnValue()
            let result_handle = copyToCType(call_result).ref
            return smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_result(has_value: true, .init(returned_value: result_handle))
        } catch let error as WithPayloadError {
            return smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_result(has_value: false, .init(error_value: copyToCType(error).ref))
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    let proxy = smoke_ErrorsInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ErrorsInterface_release_handle) : RefHolder(proxy)
}
extension _ErrorsInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ErrorsInterface_copyFromCType(_ handle: _baseRef) -> ErrorsInterface {
    if let swift_pointer = smoke_ErrorsInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ErrorsInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ErrorsInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ErrorsInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ErrorsInterface_get_typed(smoke_ErrorsInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ErrorsInterface {
        smoke_ErrorsInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ErrorsInterface_moveFromCType(_ handle: _baseRef) -> ErrorsInterface {
    if let swift_pointer = smoke_ErrorsInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ErrorsInterface {
        smoke_ErrorsInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ErrorsInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ErrorsInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ErrorsInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ErrorsInterface {
        smoke_ErrorsInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ErrorsInterface_copyFromCType(_ handle: _baseRef) -> ErrorsInterface? {
    guard handle != 0 else {
        return nil
    }
    return ErrorsInterface_moveFromCType(handle) as ErrorsInterface
}
internal func ErrorsInterface_moveFromCType(_ handle: _baseRef) -> ErrorsInterface? {
    guard handle != 0 else {
        return nil
    }
    return ErrorsInterface_moveFromCType(handle) as ErrorsInterface
}
internal func copyToCType(_ swiftClass: ErrorsInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ErrorsInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ErrorsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ErrorsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
extension InternalError : Error {
}
extension ExternalErrors : Error {
}
public enum InternalError : UInt32, CaseIterable, Codable {
    case errorNone
    case errorFatal
}
internal func copyToCType(_ swiftEnum: InternalError) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: InternalError) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: InternalError?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: InternalError?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> InternalError {
    return InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> InternalError {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalError? {
    guard handle != 0 else {
        return nil
    }
    return InternalError(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> InternalError? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
public enum ExternalErrors : UInt32, CaseIterable, Codable {
    case none
    case boom
    case bust
}
internal func copyToCType(_ swiftEnum: ExternalErrors) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ExternalErrors) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ExternalErrors?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ExternalErrors?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ExternalErrors {
    return ExternalErrors(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ExternalErrors {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ExternalErrors? {
    guard handle != 0 else {
        return nil
    }
    return ExternalErrors(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ExternalErrors? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
