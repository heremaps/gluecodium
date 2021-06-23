//
//
import Foundation
public struct SkipField {
    public var field: String
    public init(field: String) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_SkipField_field_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> SkipField {
    return SkipField(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SkipField {
    defer {
        smoke_SkipField_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SkipField) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_SkipField_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: SkipField) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SkipField_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SkipField? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SkipField_unwrap_optional_handle(handle)
    return SkipField(cHandle: unwrappedHandle) as SkipField
}
internal func moveFromCType(_ handle: _baseRef) -> SkipField? {
    defer {
        smoke_SkipField_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SkipField?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_SkipField_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: SkipField?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SkipField_release_optional_handle)
}
