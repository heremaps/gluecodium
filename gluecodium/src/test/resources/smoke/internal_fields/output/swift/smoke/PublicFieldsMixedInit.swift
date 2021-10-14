//
//
import Foundation
public struct PublicFieldsMixedInit {
    public var publicField1: String
    public var publicField2: String
    internal var internalField: String
    public init(publicField1: String = "bar", publicField2: String) {
        self.publicField1 = publicField1
        self.publicField2 = publicField2
        self.internalField = "foo"
    }
    internal init(publicField1: String = "bar", publicField2: String, internalField: String = "foo") {
        self.publicField1 = publicField1
        self.publicField2 = publicField2
        self.internalField = internalField
    }
    internal init(cHandle: _baseRef) {
        publicField1 = moveFromCType(smoke_PublicFieldsMixedInit_publicField1_get(cHandle))
        publicField2 = moveFromCType(smoke_PublicFieldsMixedInit_publicField2_get(cHandle))
        internalField = moveFromCType(smoke_PublicFieldsMixedInit_internalField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsMixedInit {
    return PublicFieldsMixedInit(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsMixedInit {
    defer {
        smoke_PublicFieldsMixedInit_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsMixedInit) -> RefHolder {
    let c_publicField1 = moveToCType(swiftType.publicField1)
    let c_publicField2 = moveToCType(swiftType.publicField2)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsMixedInit_create_handle(c_publicField1.ref, c_publicField2.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsMixedInit) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsMixedInit_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsMixedInit? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicFieldsMixedInit_unwrap_optional_handle(handle)
    return PublicFieldsMixedInit(cHandle: unwrappedHandle) as PublicFieldsMixedInit
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsMixedInit? {
    defer {
        smoke_PublicFieldsMixedInit_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsMixedInit?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField1 = moveToCType(swiftType.publicField1)
    let c_publicField2 = moveToCType(swiftType.publicField2)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsMixedInit_create_optional_handle(c_publicField1.ref, c_publicField2.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsMixedInit?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsMixedInit_release_optional_handle)
}
