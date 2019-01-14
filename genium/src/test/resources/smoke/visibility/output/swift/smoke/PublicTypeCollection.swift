//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal struct InternalStruct {
    public var stringField: String
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_PublicTypeCollection_InternalStruct_stringField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let stringField_handle = stringField
        return smoke_PublicTypeCollection_InternalStruct_create_handle(stringField_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> InternalStruct {
    return InternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InternalStruct {
    defer {
        smoke_PublicTypeCollection_InternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}