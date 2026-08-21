//

//

import Foundation

/// Test case 3
///
/// Input:
/// - This structure does not define explicit constructors / field constructors.
/// - It has three public fields with default values.
/// - All fields use struct type and we check if the name of constructor is properly resolved.
///
/// Expected outcome:
/// - Generated initialized values ctor properly resolves names.
public struct InitializedPublicFieldsViaOverloadedFieldCtors {

    public var initializedField1: StructWithNamedFieldConstructors

    public var initializedField2: StructWithNamedFieldConstructors

    public var initializedField3: StructWithNamedFieldConstructors

    public init(initializedField1: StructWithNamedFieldConstructors = StructWithNamedFieldConstructors(field1: "abc", field2: "def", initializedField1: 9, initializedField2: 11), initializedField2: StructWithNamedFieldConstructors = StructWithNamedFieldConstructors(field1: "abc", field2: "def", initializedField1: 123), initializedField3: StructWithNamedFieldConstructors = StructWithNamedFieldConstructors(field1: "abc", field2: "def")) {
        self.initializedField1 = initializedField1
        self.initializedField2 = initializedField2
        self.initializedField3 = initializedField3
    }
    internal init(cHandle: _baseRef) {
        initializedField1 = moveFromCType(smoke_InitializedPublicFieldsViaOverloadedFieldCtors_initializedField1_get(cHandle))
        initializedField2 = moveFromCType(smoke_InitializedPublicFieldsViaOverloadedFieldCtors_initializedField2_get(cHandle))
        initializedField3 = moveFromCType(smoke_InitializedPublicFieldsViaOverloadedFieldCtors_initializedField3_get(cHandle))
    }
}



internal func copyFromCType(_ handle: _baseRef) -> InitializedPublicFieldsViaOverloadedFieldCtors {
    return InitializedPublicFieldsViaOverloadedFieldCtors(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InitializedPublicFieldsViaOverloadedFieldCtors {
    defer {
        smoke_InitializedPublicFieldsViaOverloadedFieldCtors_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: InitializedPublicFieldsViaOverloadedFieldCtors) -> RefHolder {
    let c_initializedField1 = moveToCType(swiftType.initializedField1)
    let c_initializedField2 = moveToCType(swiftType.initializedField2)
    let c_initializedField3 = moveToCType(swiftType.initializedField3)
    return RefHolder(smoke_InitializedPublicFieldsViaOverloadedFieldCtors_create_handle(c_initializedField1.ref, c_initializedField2.ref, c_initializedField3.ref))
}
internal func moveToCType(_ swiftType: InitializedPublicFieldsViaOverloadedFieldCtors) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InitializedPublicFieldsViaOverloadedFieldCtors_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InitializedPublicFieldsViaOverloadedFieldCtors? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_InitializedPublicFieldsViaOverloadedFieldCtors_unwrap_optional_handle(handle)
    return InitializedPublicFieldsViaOverloadedFieldCtors(cHandle: unwrappedHandle) as InitializedPublicFieldsViaOverloadedFieldCtors
}
internal func moveFromCType(_ handle: _baseRef) -> InitializedPublicFieldsViaOverloadedFieldCtors? {
    defer {
        smoke_InitializedPublicFieldsViaOverloadedFieldCtors_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: InitializedPublicFieldsViaOverloadedFieldCtors?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_initializedField1 = moveToCType(swiftType.initializedField1)
    let c_initializedField2 = moveToCType(swiftType.initializedField2)
    let c_initializedField3 = moveToCType(swiftType.initializedField3)
    return RefHolder(smoke_InitializedPublicFieldsViaOverloadedFieldCtors_create_optional_handle(c_initializedField1.ref, c_initializedField2.ref, c_initializedField3.ref))
}
internal func moveToCType(_ swiftType: InitializedPublicFieldsViaOverloadedFieldCtors?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InitializedPublicFieldsViaOverloadedFieldCtors_release_optional_handle)
}



