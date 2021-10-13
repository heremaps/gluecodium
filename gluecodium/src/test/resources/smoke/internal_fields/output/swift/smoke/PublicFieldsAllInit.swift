//
//
import Foundation
public struct PublicFieldsAllInit {
    public var publicField: String
    internal var internalField: String
    public init(publicField: String = "bar") {
        self.publicField = publicField
        self.internalField = "foo"
    }
    internal init(publicField: String = "bar", internalField: String = "foo") {
        self.publicField = publicField
        self.internalField = internalField
    }
    internal init(cHandle: _baseRef) {
        publicField = moveFromCType(smoke_PublicFieldsAllInit_publicField_get(cHandle))
        internalField = moveFromCType(smoke_PublicFieldsAllInit_internalField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsAllInit {
    return PublicFieldsAllInit(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsAllInit {
    defer {
        smoke_PublicFieldsAllInit_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsAllInit) -> RefHolder {
    let c_publicField = moveToCType(swiftType.publicField)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsAllInit_create_handle(c_publicField.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsAllInit) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsAllInit_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsAllInit? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicFieldsAllInit_unwrap_optional_handle(handle)
    return PublicFieldsAllInit(cHandle: unwrappedHandle) as PublicFieldsAllInit
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsAllInit? {
    defer {
        smoke_PublicFieldsAllInit_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsAllInit?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField = moveToCType(swiftType.publicField)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsAllInit_create_optional_handle(c_publicField.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsAllInit?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsAllInit_release_optional_handle)
}
