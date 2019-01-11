//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
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
            return 0
        } catch let error as InternalError {
            return error.rawValue
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    functions.smoke_ErrorsInterface_methodWithExternalErrors = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            try swift_class.methodWithExternalErrors()
            return 0
        } catch let error as ExternalErrors {
            return error.rawValue
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    functions.smoke_ErrorsInterface_methodWithErrorsAndReturnValue = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ErrorsInterface
        do {
            let call_result = try swift_class.methodWithErrorsAndReturnValue()
            let result_handle = call_result.convertToCType()
            return smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result(has_value: true, .init(returned_value: result_handle))
        } catch let error as InternalError {
            return smoke_ErrorsInterface_methodWithErrorsAndReturnValue_result(has_value: false, .init(error_code: error.rawValue))
        } catch {
            fatalError("Unexpected error: \(error)")
        }
    }
    let proxy = smoke_ErrorsInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ErrorsInterface_release_handle) : RefHolder(proxy)
}
public protocol ErrorsInterface : AnyObject {
    func methodWithErrors() throws -> Void
    func methodWithExternalErrors() throws -> Void
    func methodWithErrorsAndReturnValue() throws -> String
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
        let ERROR_CODE = smoke_ErrorsInterface_methodWithErrors(c_instance)
        if (ERROR_CODE != 0) {
            throw InternalError(rawValue: ERROR_CODE)!
        }
    }
    public func methodWithExternalErrors() throws -> Void {
        let ERROR_CODE = smoke_ErrorsInterface_methodWithExternalErrors(c_instance)
        if (ERROR_CODE != 0) {
            throw ExternalErrors(rawValue: ERROR_CODE)!
        }
    }
    public func methodWithErrorsAndReturnValue() throws -> String {
        let RESULT = smoke_ErrorsInterface_methodWithErrorsAndReturnValue(c_instance)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw InternalError(rawValue: RESULT.error_code)!
        }
    }
}
extension _ErrorsInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
public enum InternalError : UInt32 {
    case errorNone
    case errorFatal
}
internal func copyFromCType(_ cValue: UInt32) -> InternalError {
    return InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> InternalError {
    return copyFromCType(cValue)
}
public enum ExternalErrors : UInt32 {
    case none
    case boom
    case bust
}
internal func copyFromCType(_ cValue: UInt32) -> ExternalErrors {
    return ExternalErrors(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ExternalErrors {
    return copyFromCType(cValue)
}