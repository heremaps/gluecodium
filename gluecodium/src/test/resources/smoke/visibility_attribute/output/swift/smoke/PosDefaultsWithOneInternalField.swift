//

//

import Foundation

/// Test case 4
///
/// Input:
/// - The structure uses `PositionalDefaults` and should get such constructor.
/// - This structure does not define other constructors / field constructors.
/// - It has one public field with default value.
/// - One of fields is internal.
///
/// Expected outcome:
/// - Generated positional defaults constructor is not public (because it would expose internal field).
public struct PosDefaultsWithOneInternalField {

    internal var internalField: String

    public var publicField: Bool

    public var initializedField: Int32

    internal init(internalField: String, publicField: Bool, initializedField: Int32 = 77) {
        self.internalField = internalField
        self.publicField = publicField
        self.initializedField = initializedField
    }
    internal init(cHandle: _baseRef) {
        internalField = moveFromCType(smoke_PosDefaultsWithOneInternalField_internalField_get(cHandle))
        publicField = moveFromCType(smoke_PosDefaultsWithOneInternalField_publicField_get(cHandle))
        initializedField = moveFromCType(smoke_PosDefaultsWithOneInternalField_initializedField_get(cHandle))
    }
}



internal func copyFromCType(_ handle: _baseRef) -> PosDefaultsWithOneInternalField {
    return PosDefaultsWithOneInternalField(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PosDefaultsWithOneInternalField {
    defer {
        smoke_PosDefaultsWithOneInternalField_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: PosDefaultsWithOneInternalField) -> RefHolder {
    let c_internalField = moveToCType(swiftType.internalField)
    let c_publicField = moveToCType(swiftType.publicField)
    let c_initializedField = moveToCType(swiftType.initializedField)
    return RefHolder(smoke_PosDefaultsWithOneInternalField_create_handle(c_internalField.ref, c_publicField.ref, c_initializedField.ref))
}
internal func moveToCType(_ swiftType: PosDefaultsWithOneInternalField) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PosDefaultsWithOneInternalField_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PosDefaultsWithOneInternalField? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PosDefaultsWithOneInternalField_unwrap_optional_handle(handle)
    return PosDefaultsWithOneInternalField(cHandle: unwrappedHandle) as PosDefaultsWithOneInternalField
}
internal func moveFromCType(_ handle: _baseRef) -> PosDefaultsWithOneInternalField? {
    defer {
        smoke_PosDefaultsWithOneInternalField_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: PosDefaultsWithOneInternalField?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_internalField = moveToCType(swiftType.internalField)
    let c_publicField = moveToCType(swiftType.publicField)
    let c_initializedField = moveToCType(swiftType.initializedField)
    return RefHolder(smoke_PosDefaultsWithOneInternalField_create_optional_handle(c_internalField.ref, c_publicField.ref, c_initializedField.ref))
}
internal func moveToCType(_ swiftType: PosDefaultsWithOneInternalField?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PosDefaultsWithOneInternalField_release_optional_handle)
}



