//
//
import Foundation
public struct FieldConstructorWithExcluded {
    /// Some field
    public var stringField: String
    /// Some field constructor
    /// - Parameters
    ///   - stringField: Some field
    /// :nodoc:
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithExcluded_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithExcluded {
    return FieldConstructorWithExcluded(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithExcluded {
    defer {
        smoke_FieldConstructorWithExcluded_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithExcluded) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithExcluded_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithExcluded) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithExcluded_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithExcluded? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithExcluded_unwrap_optional_handle(handle)
    return FieldConstructorWithExcluded(cHandle: unwrappedHandle) as FieldConstructorWithExcluded
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithExcluded? {
    defer {
        smoke_FieldConstructorWithExcluded_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithExcluded?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithExcluded_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithExcluded?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithExcluded_release_optional_handle)
}
