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
            let stringField_handle = smoke_PublicTypeCollection_InternalStruct_stringField_get(cInternalStruct)
            defer {
                std_string_release(stringField_handle)
            }
            stringField = String(cString: std_string_data_get(stringField_handle))
        }
    }

    internal func convertToCType() -> _baseRef {
        let stringField_handle = stringField
        return smoke_PublicTypeCollection_InternalStruct_create(stringField_handle)
    }
}
