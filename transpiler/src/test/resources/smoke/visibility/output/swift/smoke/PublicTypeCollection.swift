//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal struct InternalStruct {
    public var stringField: String

    public init(stringField: String) {
        self.stringField = stringField
    }

    internal init?(cInternalStruct: _baseRef) {
        do {
            let stringFieldHandle = smoke_PublicTypeCollection_InternalStruct_stringField_get(cInternalStruct)
            stringField = String(cString:std_string_data_get(stringFieldHandle))
        }
    }

    internal func convertToCType() -> _baseRef {
        let result = smoke_PublicTypeCollection_InternalStruct_create()
        fillFunction(result)
        return result
    }

    internal func fillFunction(_ cInternalStruct: _baseRef) -> Void {
        smoke_PublicTypeCollection_InternalStruct_stringField_set(cInternalStruct, stringField)
    }
}
