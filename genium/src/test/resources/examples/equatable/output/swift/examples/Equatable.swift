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

    internal init?(cEquatableStruct: _baseRef) {
        intField = examples_Equatable_EquatableStruct_intField_get(cEquatableStruct)
        do {
            let stringField_handle = examples_Equatable_EquatableStruct_stringField_get(cEquatableStruct)
            defer {
                std_string_release(stringField_handle)
            }
            stringField = String(cString: std_string_data_get(stringField_handle))
        }
        do {
            let structField_handle = examples_Equatable_EquatableStruct_structField_get(cEquatableStruct)
            defer {
                examples_Equatable_NestedEquatableStruct_release(structField_handle)
            }
            guard
                let structField_unwrapped = NestedEquatableStruct(cNestedEquatableStruct: structField_handle)
            else {
                return nil
            }
            structField = structField_unwrapped
        }
    }

    internal func convertToCType() -> _baseRef {
        let intField_handle = intField
        let stringField_handle = stringField
        let structField_handle = structField.convertToCType()
        defer {
            examples_Equatable_NestedEquatableStruct_release(structField_handle)
        }
        return examples_Equatable_EquatableStruct_create(intField_handle, stringField_handle, structField_handle)
    }
}

public struct NestedEquatableStruct: Equatable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init?(cNestedEquatableStruct: _baseRef) {
        do {
            let fooField_handle = examples_Equatable_NestedEquatableStruct_fooField_get(cNestedEquatableStruct)
            defer {
                std_string_release(fooField_handle)
            }
            fooField = String(cString: std_string_data_get(fooField_handle))
        }
    }
    internal func convertToCType() -> _baseRef {
        let fooField_handle = fooField
        return examples_Equatable_NestedEquatableStruct_create(fooField_handle)
    }
}