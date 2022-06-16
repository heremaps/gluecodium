//
//
import Foundation
public struct PrivateFieldsMore {
    public var publicField: String
    fileprivate var privateField: String
    fileprivate var anotherPrivateField: String
    public init(publicField: String, privateField: String) {
        self.publicField = publicField
        self.privateField = privateField
        self.anotherPrivateField = "more nonsense"
    }
    internal init(cHandle: _baseRef) {
        publicField = moveFromCType(smoke_PrivateFieldsMore_publicField_get(cHandle))
        privateField = moveFromCType(smoke_PrivateFieldsMore_privateField_get(cHandle))
        anotherPrivateField = moveFromCType(smoke_PrivateFieldsMore_anotherPrivateField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PrivateFieldsMore {
    return PrivateFieldsMore(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PrivateFieldsMore {
    defer {
        smoke_PrivateFieldsMore_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PrivateFieldsMore) -> RefHolder {
    let c_publicField = moveToCType(swiftType.publicField)
    let c_privateField = moveToCType(swiftType.privateField)
    let c_anotherPrivateField = moveToCType(swiftType.anotherPrivateField)
    return RefHolder(smoke_PrivateFieldsMore_create_handle(c_publicField.ref, c_privateField.ref, c_anotherPrivateField.ref))
}
internal func moveToCType(_ swiftType: PrivateFieldsMore) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PrivateFieldsMore_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PrivateFieldsMore? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PrivateFieldsMore_unwrap_optional_handle(handle)
    return PrivateFieldsMore(cHandle: unwrappedHandle) as PrivateFieldsMore
}
internal func moveFromCType(_ handle: _baseRef) -> PrivateFieldsMore? {
    defer {
        smoke_PrivateFieldsMore_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PrivateFieldsMore?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField = moveToCType(swiftType.publicField)
    let c_privateField = moveToCType(swiftType.privateField)
    let c_anotherPrivateField = moveToCType(swiftType.anotherPrivateField)
    return RefHolder(smoke_PrivateFieldsMore_create_optional_handle(c_publicField.ref, c_privateField.ref, c_anotherPrivateField.ref))
}
internal func moveToCType(_ swiftType: PrivateFieldsMore?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PrivateFieldsMore_release_optional_handle)
}
