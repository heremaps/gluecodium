//
//
import Foundation
/// SomeStruct
public struct FieldConstructorWithBothComments {
    public var stringField: String
    /// This comment takes precedence
    /// - Parameters
    ///   - stringField:
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithBothComments_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithBothComments {
    return FieldConstructorWithBothComments(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithBothComments {
    defer {
        smoke_FieldConstructorWithBothComments_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithBothComments) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithBothComments_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithBothComments) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithBothComments_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithBothComments? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithBothComments_unwrap_optional_handle(handle)
    return FieldConstructorWithBothComments(cHandle: unwrappedHandle) as FieldConstructorWithBothComments
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithBothComments? {
    defer {
        smoke_FieldConstructorWithBothComments_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithBothComments?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithBothComments_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithBothComments?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithBothComments_release_optional_handle)
}
