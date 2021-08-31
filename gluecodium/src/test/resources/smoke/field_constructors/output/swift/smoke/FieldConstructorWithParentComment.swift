//
//
import Foundation
/// SomeStruct
public struct FieldConstructorWithParentComment {
    public var stringField: String
    /// There are constructors
    /// - Parameters
    ///   - stringField:
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithParentComment_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithParentComment {
    return FieldConstructorWithParentComment(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithParentComment {
    defer {
        smoke_FieldConstructorWithParentComment_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithParentComment) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithParentComment_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithParentComment) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithParentComment_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithParentComment? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithParentComment_unwrap_optional_handle(handle)
    return FieldConstructorWithParentComment(cHandle: unwrappedHandle) as FieldConstructorWithParentComment
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithParentComment? {
    defer {
        smoke_FieldConstructorWithParentComment_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithParentComment?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithParentComment_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithParentComment?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithParentComment_release_optional_handle)
}
