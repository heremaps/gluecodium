//
//
import Foundation
public struct SerializableEquatableStruct: Hashable, Codable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init(cHandle: _baseRef) {
        fooField = moveFromCType(smoke_SerializableEquatableStruct_fooField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> SerializableEquatableStruct {
    return SerializableEquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SerializableEquatableStruct {
    defer {
        smoke_SerializableEquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SerializableEquatableStruct) -> RefHolder {
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_SerializableEquatableStruct_create_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: SerializableEquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SerializableEquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SerializableEquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SerializableEquatableStruct_unwrap_optional_handle(handle)
    return SerializableEquatableStruct(cHandle: unwrappedHandle) as SerializableEquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> SerializableEquatableStruct? {
    defer {
        smoke_SerializableEquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SerializableEquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_SerializableEquatableStruct_create_optional_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: SerializableEquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SerializableEquatableStruct_release_optional_handle)
}
