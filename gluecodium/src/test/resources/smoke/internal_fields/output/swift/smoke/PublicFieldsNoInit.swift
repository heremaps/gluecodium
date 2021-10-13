//
//
import Foundation
public struct PublicFieldsNoInit {
    public var publicField: String
    internal var internalField: String
    public init(publicField: String) {
        self.publicField = publicField
        self.internalField = "foo"
    }
    internal init(publicField: String, internalField: String = "foo") {
        self.publicField = publicField
        self.internalField = internalField
    }
    internal init(cHandle: _baseRef) {
        publicField = moveFromCType(smoke_PublicFieldsNoInit_publicField_get(cHandle))
        internalField = moveFromCType(smoke_PublicFieldsNoInit_internalField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsNoInit {
    return PublicFieldsNoInit(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsNoInit {
    defer {
        smoke_PublicFieldsNoInit_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsNoInit) -> RefHolder {
    let c_publicField = moveToCType(swiftType.publicField)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsNoInit_create_handle(c_publicField.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsNoInit) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsNoInit_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsNoInit? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicFieldsNoInit_unwrap_optional_handle(handle)
    return PublicFieldsNoInit(cHandle: unwrappedHandle) as PublicFieldsNoInit
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsNoInit? {
    defer {
        smoke_PublicFieldsNoInit_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsNoInit?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField = moveToCType(swiftType.publicField)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsNoInit_create_optional_handle(c_publicField.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsNoInit?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsNoInit_release_optional_handle)
}
