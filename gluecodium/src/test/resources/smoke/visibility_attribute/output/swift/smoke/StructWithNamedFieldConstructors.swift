//

//

import Foundation

/// A helper structure for test case 3.
/// It defines a few named field constructors.
/// All fields are public.
/// Two of them are initialized.
public struct StructWithNamedFieldConstructors {

    public var field1: String

    public var field2: String

    public var initializedField1: Int32

    public var initializedField2: Int32


    public init(field1: String, field2: String, initializedField1: Int32, initializedField2: Int32) {
        self.field1 = field1
        self.field2 = field2
        self.initializedField1 = initializedField1
        self.initializedField2 = initializedField2
    }


    public init(field1: String, field2: String) {
        self.field1 = field1
        self.field2 = field2
        self.initializedField1 = 77
        self.initializedField2 = 101
    }


    public init(field1: String, field2: String, initializedField1: Int32) {
        self.field1 = field1
        self.field2 = field2
        self.initializedField1 = initializedField1
        self.initializedField2 = 101
    }

    internal init(cHandle: _baseRef) {
        field1 = moveFromCType(smoke_StructWithNamedFieldConstructors_field1_get(cHandle))
        field2 = moveFromCType(smoke_StructWithNamedFieldConstructors_field2_get(cHandle))
        initializedField1 = moveFromCType(smoke_StructWithNamedFieldConstructors_initializedField1_get(cHandle))
        initializedField2 = moveFromCType(smoke_StructWithNamedFieldConstructors_initializedField2_get(cHandle))
    }
}



internal func copyFromCType(_ handle: _baseRef) -> StructWithNamedFieldConstructors {
    return StructWithNamedFieldConstructors(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithNamedFieldConstructors {
    defer {
        smoke_StructWithNamedFieldConstructors_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: StructWithNamedFieldConstructors) -> RefHolder {
    let c_field1 = moveToCType(swiftType.field1)
    let c_field2 = moveToCType(swiftType.field2)
    let c_initializedField1 = moveToCType(swiftType.initializedField1)
    let c_initializedField2 = moveToCType(swiftType.initializedField2)
    return RefHolder(smoke_StructWithNamedFieldConstructors_create_handle(c_field1.ref, c_field2.ref, c_initializedField1.ref, c_initializedField2.ref))
}
internal func moveToCType(_ swiftType: StructWithNamedFieldConstructors) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithNamedFieldConstructors_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithNamedFieldConstructors? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructWithNamedFieldConstructors_unwrap_optional_handle(handle)
    return StructWithNamedFieldConstructors(cHandle: unwrappedHandle) as StructWithNamedFieldConstructors
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithNamedFieldConstructors? {
    defer {
        smoke_StructWithNamedFieldConstructors_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: StructWithNamedFieldConstructors?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field1 = moveToCType(swiftType.field1)
    let c_field2 = moveToCType(swiftType.field2)
    let c_initializedField1 = moveToCType(swiftType.initializedField1)
    let c_initializedField2 = moveToCType(swiftType.initializedField2)
    return RefHolder(smoke_StructWithNamedFieldConstructors_create_optional_handle(c_field1.ref, c_field2.ref, c_initializedField1.ref, c_initializedField2.ref))
}
internal func moveToCType(_ swiftType: StructWithNamedFieldConstructors?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithNamedFieldConstructors_release_optional_handle)
}



