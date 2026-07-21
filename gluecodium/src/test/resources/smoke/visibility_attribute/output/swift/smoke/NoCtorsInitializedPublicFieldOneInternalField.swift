//

//

import Foundation

/// Test case 2
///
/// Input:
/// - This structure does not define explicit constructors / field constructors.
/// - It has one public field with default value.
/// - One of fields is internal.
///
/// Expected outcome:
/// - Generated initialized args constructor is not public (because it would expose internal field).
public struct NoCtorsInitializedPublicFieldOneInternalField {

    internal var internalField: String

    public var publicField: Bool

    public var initializedField: Int32

    internal init(internalField: String, publicField: Bool, initializedField: Int32 = 77) {
        self.internalField = internalField
        self.publicField = publicField
        self.initializedField = initializedField
    }
    internal init(cHandle: _baseRef) {
        internalField = moveFromCType(smoke_NoCtorsInitializedPublicFieldOneInternalField_internalField_get(cHandle))
        publicField = moveFromCType(smoke_NoCtorsInitializedPublicFieldOneInternalField_publicField_get(cHandle))
        initializedField = moveFromCType(smoke_NoCtorsInitializedPublicFieldOneInternalField_initializedField_get(cHandle))
    }
}



internal func copyFromCType(_ handle: _baseRef) -> NoCtorsInitializedPublicFieldOneInternalField {
    return NoCtorsInitializedPublicFieldOneInternalField(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> NoCtorsInitializedPublicFieldOneInternalField {
    defer {
        smoke_NoCtorsInitializedPublicFieldOneInternalField_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: NoCtorsInitializedPublicFieldOneInternalField) -> RefHolder {
    let c_internalField = moveToCType(swiftType.internalField)
    let c_publicField = moveToCType(swiftType.publicField)
    let c_initializedField = moveToCType(swiftType.initializedField)
    return RefHolder(smoke_NoCtorsInitializedPublicFieldOneInternalField_create_handle(c_internalField.ref, c_publicField.ref, c_initializedField.ref))
}
internal func moveToCType(_ swiftType: NoCtorsInitializedPublicFieldOneInternalField) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_NoCtorsInitializedPublicFieldOneInternalField_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> NoCtorsInitializedPublicFieldOneInternalField? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_NoCtorsInitializedPublicFieldOneInternalField_unwrap_optional_handle(handle)
    return NoCtorsInitializedPublicFieldOneInternalField(cHandle: unwrappedHandle) as NoCtorsInitializedPublicFieldOneInternalField
}
internal func moveFromCType(_ handle: _baseRef) -> NoCtorsInitializedPublicFieldOneInternalField? {
    defer {
        smoke_NoCtorsInitializedPublicFieldOneInternalField_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: NoCtorsInitializedPublicFieldOneInternalField?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_internalField = moveToCType(swiftType.internalField)
    let c_publicField = moveToCType(swiftType.publicField)
    let c_initializedField = moveToCType(swiftType.initializedField)
    return RefHolder(smoke_NoCtorsInitializedPublicFieldOneInternalField_create_optional_handle(c_internalField.ref, c_publicField.ref, c_initializedField.ref))
}
internal func moveToCType(_ swiftType: NoCtorsInitializedPublicFieldOneInternalField?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_NoCtorsInitializedPublicFieldOneInternalField_release_optional_handle)
}



