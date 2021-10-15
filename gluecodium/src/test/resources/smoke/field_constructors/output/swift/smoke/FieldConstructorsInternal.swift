//
//
import Foundation
public struct FieldConstructorsInternal {
    public var publicField: String
    internal var internalField: Double
    internal init() {
        self.publicField = "foo"
        self.internalField = 42
    }
    internal init(publicField: String) {
        self.publicField = publicField
        self.internalField = 42
    }
    internal init(internalField: Double) {
        self.internalField = internalField
        self.publicField = "foo"
    }
    internal init(internalField: Double, publicField: String) {
        self.internalField = internalField
        self.publicField = publicField
    }
    internal init(cHandle: _baseRef) {
        publicField = moveFromCType(smoke_FieldConstructorsInternal_publicField_get(cHandle))
        internalField = moveFromCType(smoke_FieldConstructorsInternal_internalField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsInternal {
    return FieldConstructorsInternal(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsInternal {
    defer {
        smoke_FieldConstructorsInternal_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsInternal) -> RefHolder {
    let c_publicField = moveToCType(swiftType.publicField)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_FieldConstructorsInternal_create_handle(c_publicField.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsInternal) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsInternal_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsInternal? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorsInternal_unwrap_optional_handle(handle)
    return FieldConstructorsInternal(cHandle: unwrappedHandle) as FieldConstructorsInternal
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsInternal? {
    defer {
        smoke_FieldConstructorsInternal_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsInternal?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField = moveToCType(swiftType.publicField)
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_FieldConstructorsInternal_create_optional_handle(c_publicField.ref, c_internalField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsInternal?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsInternal_release_optional_handle)
}
