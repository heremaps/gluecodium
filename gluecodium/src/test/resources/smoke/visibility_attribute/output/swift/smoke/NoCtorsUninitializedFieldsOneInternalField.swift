//

//

import Foundation

/// Test case 1
///
/// Input:
/// - This structure does not define explicit constructors / field constructors.
/// - It has fields without default values.
/// - One of fields is internal.
///
/// Expected outcome:
/// - Generated all args constructor is not public (because it would expose internal field).
public struct NoCtorsUninitializedFieldsOneInternalField {

    internal var internalField: String

    public var publicField: Bool

    internal init(internalField: String, publicField: Bool) {
        self.internalField = internalField
        self.publicField = publicField
    }
    internal init(cHandle: _baseRef) {
        internalField = moveFromCType(smoke_NoCtorsUninitializedFieldsOneInternalField_internalField_get(cHandle))
        publicField = moveFromCType(smoke_NoCtorsUninitializedFieldsOneInternalField_publicField_get(cHandle))
    }
}



internal func copyFromCType(_ handle: _baseRef) -> NoCtorsUninitializedFieldsOneInternalField {
    return NoCtorsUninitializedFieldsOneInternalField(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> NoCtorsUninitializedFieldsOneInternalField {
    defer {
        smoke_NoCtorsUninitializedFieldsOneInternalField_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: NoCtorsUninitializedFieldsOneInternalField) -> RefHolder {
    let c_internalField = moveToCType(swiftType.internalField)
    let c_publicField = moveToCType(swiftType.publicField)
    return RefHolder(smoke_NoCtorsUninitializedFieldsOneInternalField_create_handle(c_internalField.ref, c_publicField.ref))
}
internal func moveToCType(_ swiftType: NoCtorsUninitializedFieldsOneInternalField) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_NoCtorsUninitializedFieldsOneInternalField_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> NoCtorsUninitializedFieldsOneInternalField? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_NoCtorsUninitializedFieldsOneInternalField_unwrap_optional_handle(handle)
    return NoCtorsUninitializedFieldsOneInternalField(cHandle: unwrappedHandle) as NoCtorsUninitializedFieldsOneInternalField
}
internal func moveFromCType(_ handle: _baseRef) -> NoCtorsUninitializedFieldsOneInternalField? {
    defer {
        smoke_NoCtorsUninitializedFieldsOneInternalField_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: NoCtorsUninitializedFieldsOneInternalField?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_internalField = moveToCType(swiftType.internalField)
    let c_publicField = moveToCType(swiftType.publicField)
    return RefHolder(smoke_NoCtorsUninitializedFieldsOneInternalField_create_optional_handle(c_internalField.ref, c_publicField.ref))
}
internal func moveToCType(_ swiftType: NoCtorsUninitializedFieldsOneInternalField?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_NoCtorsUninitializedFieldsOneInternalField_release_optional_handle)
}



