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
        intField = examples_Equatable_EquatableStruct_intField_get(cHandle)
        do {
            let stringField_handle = examples_Equatable_EquatableStruct_stringField_get(cHandle)
            defer {
                std_string_release_handle(stringField_handle)
            }
            stringField = String(cString: std_string_data_get(stringField_handle))
        }
        do {
            let structField_handle = examples_Equatable_EquatableStruct_structField_get(cHandle)
            defer {
                examples_Equatable_NestedEquatableStruct_release_handle(structField_handle)
            }
            structField = NestedEquatableStruct(cHandle: structField_handle)
        }
    }
    internal func convertToCType() -> _baseRef {
        let intField_handle = intField
        let stringField_handle = stringField
        let structField_handle = structField.convertToCType()
        defer {
            examples_Equatable_NestedEquatableStruct_release_handle(structField_handle)
        }
        return examples_Equatable_EquatableStruct_create_handle(intField_handle, stringField_handle, structField_handle)
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
public struct NestedEquatableStruct: Equatable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init(cHandle: _baseRef) {
        do {
            let fooField_handle = examples_Equatable_NestedEquatableStruct_fooField_get(cHandle)
            defer {
                std_string_release_handle(fooField_handle)
            }
            fooField = String(cString: std_string_data_get(fooField_handle))
        }
    }
    internal func convertToCType() -> _baseRef {
        let fooField_handle = fooField
        return examples_Equatable_NestedEquatableStruct_create_handle(fooField_handle)
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