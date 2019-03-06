//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public struct EquatableStruct: Equatable {
    public var intField: Int32
    public var stringField: String
    public var structField: NestedEquatableStruct
    public init(intField: Int32, stringField: String, structField: NestedEquatableStruct) {
        self.intField = intField
        self.stringField = stringField
        self.structField = structField
    }
    internal init(cHandle: _baseRef) {
        intField = moveFromCType(examples_Equatable_EquatableStruct_intField_get(cHandle))
        stringField = moveFromCType(examples_Equatable_EquatableStruct_stringField_get(cHandle))
        structField = moveFromCType(examples_Equatable_EquatableStruct_structField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_intField = moveToCType(intField)
        let c_stringField = moveToCType(stringField)
        let c_structField = moveToCType(structField)
        return examples_Equatable_EquatableStruct_create_handle(c_intField.ref, c_stringField.ref, c_structField.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableStruct {
    return EquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableStruct {
    defer {
        examples_Equatable_EquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: EquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Equatable_EquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Equatable_EquatableStruct_unwrap_optional_handle(handle)
    return EquatableStruct(cHandle: unwrappedHandle) as EquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableStruct? {
    defer {
        examples_Equatable_EquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(examples_Equatable_EquatableStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: EquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Equatable_EquatableStruct_release_optional_handle)
}
public struct NestedEquatableStruct: Equatable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init(cHandle: _baseRef) {
        fooField = moveFromCType(examples_Equatable_NestedEquatableStruct_fooField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_fooField = moveToCType(fooField)
        return examples_Equatable_NestedEquatableStruct_create_handle(c_fooField.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> NestedEquatableStruct {
    return NestedEquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> NestedEquatableStruct {
    defer {
        examples_Equatable_NestedEquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: NestedEquatableStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: NestedEquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Equatable_NestedEquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> NestedEquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Equatable_NestedEquatableStruct_unwrap_optional_handle(handle)
    return NestedEquatableStruct(cHandle: unwrappedHandle) as NestedEquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> NestedEquatableStruct? {
    defer {
        examples_Equatable_NestedEquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: NestedEquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(examples_Equatable_NestedEquatableStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: NestedEquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Equatable_NestedEquatableStruct_release_optional_handle)
}