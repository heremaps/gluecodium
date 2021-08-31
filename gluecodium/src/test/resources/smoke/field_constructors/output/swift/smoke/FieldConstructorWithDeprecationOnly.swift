//
//
import Foundation
public struct FieldConstructorWithDeprecationOnly {
    public var stringField: String
    /// - Parameters
    ///   - stringField:
    @available(*, deprecated, message: "Shouldn't really use it")
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorWithDeprecationOnly_stringField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationOnly {
    return FieldConstructorWithDeprecationOnly(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationOnly {
    defer {
        smoke_FieldConstructorWithDeprecationOnly_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithDeprecationOnly) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithDeprecationOnly_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithDeprecationOnly) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithDeprecationOnly_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationOnly? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorWithDeprecationOnly_unwrap_optional_handle(handle)
    return FieldConstructorWithDeprecationOnly(cHandle: unwrappedHandle) as FieldConstructorWithDeprecationOnly
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorWithDeprecationOnly? {
    defer {
        smoke_FieldConstructorWithDeprecationOnly_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorWithDeprecationOnly?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_FieldConstructorWithDeprecationOnly_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorWithDeprecationOnly?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorWithDeprecationOnly_release_optional_handle)
}
