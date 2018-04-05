//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InternalClass?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

internal class InternalClass {

    let c_instance : _baseRef

    public init?(cInternalClass: _baseRef) {
        guard cInternalClass != 0 else {
            return nil
        }
        c_instance = cInternalClass
    }

    deinit {
        examples_InternalClass_release(c_instance)
    }

    internal struct InternalStruct {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init?(cInternalStruct: _baseRef) {
            do {
                let stringFieldHandle = examples_InternalClass_InternalStruct_stringField_get(cInternalStruct)
                stringField = String(cString:std_string_data_get(stringFieldHandle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = examples_InternalClass_InternalStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cInternalStruct: _baseRef) -> Void {
            examples_InternalClass_InternalStruct_stringField_set(cInternalStruct, stringField)
        }
    }

    internal func internalMethod(input: InternalClass.InternalStruct) -> Void {
        let inputHandle = input.convertToCType()
        defer {
            examples_InternalClass_InternalStruct_release(inputHandle)
        }
        return examples_InternalClass_internalMethod(c_instance, inputHandle)
    }
}

extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
