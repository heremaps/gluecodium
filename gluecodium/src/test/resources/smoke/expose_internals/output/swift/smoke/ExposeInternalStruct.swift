//
//
import Foundation
internal struct ExposeInternalStruct {
    internal var field: String
    internal init(field: String) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_ExposeInternalStruct_field_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ExposeInternalStruct {
    return ExposeInternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ExposeInternalStruct {
    defer {
        smoke_ExposeInternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExposeInternalStruct) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_ExposeInternalStruct_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: ExposeInternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExposeInternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExposeInternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ExposeInternalStruct_unwrap_optional_handle(handle)
    return ExposeInternalStruct(cHandle: unwrappedHandle) as ExposeInternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ExposeInternalStruct? {
    defer {
        smoke_ExposeInternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExposeInternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_ExposeInternalStruct_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: ExposeInternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExposeInternalStruct_release_optional_handle)
}
