//
//
import Foundation
public struct ExposeStruct {
    public var field: String
    public init(field: String) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_ExposeStruct_field_get(cHandle))
    }
}
/// :nodoc:
public func copyFromCType(_ handle: _baseRef) -> ExposeStruct {
    return ExposeStruct(cHandle: handle)
}
/// :nodoc:
public func moveFromCType(_ handle: _baseRef) -> ExposeStruct {
    defer {
        smoke_ExposeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
/// :nodoc:
public func copyToCType(_ swiftType: ExposeStruct) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_ExposeStruct_create_handle(c_field.ref))
}
/// :nodoc:
public func moveToCType(_ swiftType: ExposeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExposeStruct_release_handle)
}
/// :nodoc:
public func copyFromCType(_ handle: _baseRef) -> ExposeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ExposeStruct_unwrap_optional_handle(handle)
    return ExposeStruct(cHandle: unwrappedHandle) as ExposeStruct
}
/// :nodoc:
public func moveFromCType(_ handle: _baseRef) -> ExposeStruct? {
    defer {
        smoke_ExposeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
/// :nodoc:
public func copyToCType(_ swiftType: ExposeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_ExposeStruct_create_optional_handle(c_field.ref))
}
/// :nodoc:
public func moveToCType(_ swiftType: ExposeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExposeStruct_release_optional_handle)
}
