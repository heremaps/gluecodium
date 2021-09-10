//
//
import Foundation
public struct FieldConstructorWithExcludedOnly {
    public var stringField: String
    /// - Parameters
    ///   - stringField:
    /// :nodoc:
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithExcludedOnly_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithExcludedOnly {
    return FieldConstructorWithExcludedOnly(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithExcludedOnly {
    defer {
        smoke_FieldConstructorWithExcludedOnly_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithExcludedOnly) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithExcludedOnly_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithExcludedOnly) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithExcludedOnly_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithExcludedOnly? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithExcludedOnly_unwrap_optional_handle(handle)
    return FieldConstructorWithExcludedOnly(cHandle: unwrappedHandle) as FieldConstructorWithExcludedOnly
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithExcludedOnly? {
    defer {
        smoke_FieldConstructorWithExcludedOnly_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithExcludedOnly?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithExcludedOnly_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithExcludedOnly?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithExcludedOnly_release_optional_handle)
}
