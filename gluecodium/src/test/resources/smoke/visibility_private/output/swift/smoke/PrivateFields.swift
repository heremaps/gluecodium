//
//
import Foundation
public struct PrivateFields {
    public var publicField: String
    fileprivate var privateField: String
    public init(publicField: String) {
        self.publicField = publicField
        self.privateField = "nonsense"
    }
    public init(publicField: String, privateField: String) {
        self.publicField = publicField
        self.privateField = privateField
    }
    internal init(cHandle: _baseRef) {
        publicField = moveFromCType(smoke_PrivateFields_publicField_get(cHandle))
        privateField = moveFromCType(smoke_PrivateFields_privateField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PrivateFields {
    return PrivateFields(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PrivateFields {
    defer {
        smoke_PrivateFields_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PrivateFields) -> RefHolder {
    let c_publicField = moveToCType(swiftType.publicField)
    let c_privateField = moveToCType(swiftType.privateField)
    return RefHolder(smoke_PrivateFields_create_handle(c_publicField.ref, c_privateField.ref))
}
internal func moveToCType(_ swiftType: PrivateFields) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PrivateFields_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PrivateFields? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PrivateFields_unwrap_optional_handle(handle)
    return PrivateFields(cHandle: unwrappedHandle) as PrivateFields
}
internal func moveFromCType(_ handle: _baseRef) -> PrivateFields? {
    defer {
        smoke_PrivateFields_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PrivateFields?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField = moveToCType(swiftType.publicField)
    let c_privateField = moveToCType(swiftType.privateField)
    return RefHolder(smoke_PrivateFields_create_optional_handle(c_publicField.ref, c_privateField.ref))
}
internal func moveToCType(_ swiftType: PrivateFields?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PrivateFields_release_optional_handle)
}
