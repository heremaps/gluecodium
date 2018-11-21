//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InternalClass?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

internal class InternalClass {

    let c_instance : _baseRef

    init?(cInternalClass: _baseRef) {
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
        internal init(cInternalStruct: _baseRef) {
            do {
                let stringField_handle = examples_InternalClass_InternalStruct_stringField_get(cInternalStruct)
                defer {
                    std_string_release(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            return examples_InternalClass_InternalStruct_create(stringField_handle)
        }
    }

    internal func internalMethod(input: InternalClass.InternalStruct) -> Void {
        let input_handle = input.convertToCType()
        defer {
            examples_InternalClass_InternalStruct_release(input_handle)
        }
        return examples_InternalClass_internalMethod(c_instance, input_handle)
    }
}

extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
