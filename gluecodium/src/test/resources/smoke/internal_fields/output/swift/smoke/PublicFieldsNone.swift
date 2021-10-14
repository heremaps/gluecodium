//
//
import Foundation
public struct PublicFieldsNone {
    internal var internalField: String
    public init() {
        self.internalField = "foo"
    }
    internal init(internalField: String = "foo") {
        self.internalField = internalField
    }
    internal init(cHandle: _baseRef) {
        internalField = moveFromCType(smoke_PublicFieldsNone_internalField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsNone {
    return PublicFieldsNone(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsNone {
    defer {
        smoke_PublicFieldsNone_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsNone) -> RefHolder {
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsNone_create_handle(c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsNone) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsNone_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicFieldsNone? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicFieldsNone_unwrap_optional_handle(handle)
    return PublicFieldsNone(cHandle: unwrappedHandle) as PublicFieldsNone
}
internal func moveFromCType(_ handle: _baseRef) -> PublicFieldsNone? {
    defer {
        smoke_PublicFieldsNone_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicFieldsNone?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicFieldsNone_create_optional_handle(c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicFieldsNone?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicFieldsNone_release_optional_handle)
}
