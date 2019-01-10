//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_InternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_InternalClass_release_handle)
        : RefHolder(handle_copy)
}

internal class InternalClass {

    let c_instance : _baseRef

    init(cInternalClass: _baseRef) {
        guard cInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalClass
    }

    deinit {
        examples_InternalClass_release_handle(c_instance)
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
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            return examples_InternalClass_InternalStruct_create_handle(stringField_handle)
        }
    }

    internal func internalMethod(input: InternalClass.InternalStruct) -> Void {
        let input_handle = input.convertToCType()
        defer {
            examples_InternalClass_InternalStruct_release_handle(input_handle)
        }
        return examples_InternalClass_internalMethod(c_instance, input_handle)
    }
}

extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
