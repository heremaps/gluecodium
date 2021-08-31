//
//
import Foundation
public struct FieldConstructorWithDeprecationAndComment {
    public var stringField: String
    /// Some field constructor
    /// - Parameters
    ///   - stringField:
    @available(*, deprecated, message: "Shouldn't really use it")
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithDeprecationAndComment_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationAndComment {
    return FieldConstructorWithDeprecationAndComment(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationAndComment {
    defer {
        smoke_FieldConstructorWithDeprecationAndComment_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithDeprecationAndComment) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithDeprecationAndComment_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithDeprecationAndComment) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithDeprecationAndComment_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationAndComment? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithDeprecationAndComment_unwrap_optional_handle(handle)
    return FieldConstructorWithDeprecationAndComment(cHandle: unwrappedHandle) as FieldConstructorWithDeprecationAndComment
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationAndComment? {
    defer {
        smoke_FieldConstructorWithDeprecationAndComment_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithDeprecationAndComment?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithDeprecationAndComment_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithDeprecationAndComment?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithDeprecationAndComment_release_optional_handle)
}
