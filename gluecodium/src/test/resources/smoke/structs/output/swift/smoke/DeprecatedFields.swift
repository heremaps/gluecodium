//
//
import Foundation
public struct DeprecatedFields {
    public var normalField1: String
    @available(*, deprecated)
    public var deprecatedField: String
    public var normalField2: String
    public init(normalField1: String, normalField2: String) {
        self.normalField1 = normalField1
        self.normalField2 = normalField2
        self.deprecatedField = ""
    }
    @available(*, deprecated)
    public init(normalField1: String, deprecatedField: String = "", normalField2: String) {
        self.normalField1 = normalField1
        self.deprecatedField = deprecatedField
        self.normalField2 = normalField2
    }
    internal init(cHandle: _baseRef) {
        normalField1 = moveFromCType(smoke_DeprecatedFields_normalField1_get(cHandle))
        deprecatedField = moveFromCType(smoke_DeprecatedFields_deprecatedField_get(cHandle))
        normalField2 = moveFromCType(smoke_DeprecatedFields_normalField2_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DeprecatedFields {
    return DeprecatedFields(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DeprecatedFields {
    defer {
        smoke_DeprecatedFields_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DeprecatedFields) -> RefHolder {
    let c_normalField1 = moveToCType(swiftType.normalField1)
    let c_deprecatedField = moveToCType(swiftType.deprecatedField)
    let c_normalField2 = moveToCType(swiftType.normalField2)
    return RefHolder(smoke_DeprecatedFields_create_handle(c_normalField1.ref, c_deprecatedField.ref, c_normalField2.ref))
}
internal func moveToCType(_ swiftType: DeprecatedFields) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecatedFields_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DeprecatedFields? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DeprecatedFields_unwrap_optional_handle(handle)
    return DeprecatedFields(cHandle: unwrappedHandle) as DeprecatedFields
}
internal func moveFromCType(_ handle: _baseRef) -> DeprecatedFields? {
    defer {
        smoke_DeprecatedFields_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DeprecatedFields?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_normalField1 = moveToCType(swiftType.normalField1)
    let c_deprecatedField = moveToCType(swiftType.deprecatedField)
    let c_normalField2 = moveToCType(swiftType.normalField2)
    return RefHolder(smoke_DeprecatedFields_create_optional_handle(c_normalField1.ref, c_deprecatedField.ref, c_normalField2.ref))
}
internal func moveToCType(_ swiftType: DeprecatedFields?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecatedFields_release_optional_handle)
}
