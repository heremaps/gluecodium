//
//
import Foundation
/// SomeStruct
public struct FieldConstructorWithComment {
    /// Some field
    public var stringField: String
    /// Some field constructor
    /// - Parameters
    ///   - stringField: Some field
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithComment_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithComment {
    return FieldConstructorWithComment(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithComment {
    defer {
        smoke_FieldConstructorWithComment_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithComment) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithComment_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithComment) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithComment_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithComment? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithComment_unwrap_optional_handle(handle)
    return FieldConstructorWithComment(cHandle: unwrappedHandle) as FieldConstructorWithComment
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithComment? {
    defer {
        smoke_FieldConstructorWithComment_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithComment?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithComment_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithComment?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithComment_release_optional_handle)
}
