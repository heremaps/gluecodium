//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Attributes) -> RefHolder {
    return RefHolder(ref.c_instance)
}
public class Attributes {

    public var builtInTypeAttribute: UInt32 {
        get {
            return smoke_Attributes_builtInTypeAttribute_get(c_instance)
        }
        set {
            return smoke_Attributes_builtInTypeAttribute_set(c_instance, newValue)
        }
    }

    public var readonlyAttribute: Float {
        get {
            return smoke_Attributes_readonlyAttribute_get(c_instance)
        }

    }

    public var structAttribute: Attributes.ExampleStruct {
        get {
            let cResult = smoke_Attributes_structAttribute_get(c_instance)
            defer {
                smoke_Attributes_ExampleStruct_release(cResult)
            }
            return Attributes.ExampleStruct(cExampleStruct: cResult)!
        }
        set {
            let newValueHandle = newValue.convertToCType()
            defer {
                smoke_Attributes_ExampleStruct_release(newValueHandle)
            }
            return smoke_Attributes_structAttribute_set(c_instance, newValueHandle)
        }
    }

    public var arrayAttribute: CollectionOf<String> {
        get {

            let handle = smoke_Attributes_arrayAttribute_get(c_instance)
            return StringList(handle)
        }
        set {

            let newValueHandle = newValue.c_conversion()
            defer {
                newValueHandle.cleanup()
            }
            return smoke_Attributes_arrayAttribute_set(c_instance, newValueHandle.c_type)
        }
    }

    public var complexTypeAttribute: Attributes.InternalError {
        get {
            let cResult = smoke_Attributes_complexTypeAttribute_get(c_instance)
            return Attributes.InternalError(rawValue: cResult)!
        }
        set {
            return smoke_Attributes_complexTypeAttribute_set(c_instance, newValue.rawValue)
        }
    }

    public var byteBufferAttribute: Data {
        get {
            let result_data_handle = smoke_Attributes_byteBufferAttribute_get(c_instance)
            defer {
                byteArray_release(result_data_handle)
            }
            return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
        }
        set {
            return newValue.withUnsafeBytes { (newValue_ptr: UnsafePointer<UInt8>) -> Void in
                return smoke_Attributes_byteBufferAttribute_set(c_instance, newValue_ptr, Int64(newValue.count))
            }
        }
    }
    let c_instance : _baseRef

    public init?(cAttributes: _baseRef) {
        guard cAttributes.private_pointer != nil else {
            return nil
        }
        c_instance = cAttributes
    }

    deinit {
        smoke_Attributes_release(c_instance)
    }
    public enum InternalError : UInt32 {

        case errorNone

        case errorFatal = 999
    }

    public struct ExampleStruct {
        public var value: Double

        public init(value: Double) {
            self.value = value
        }

        internal init?(cExampleStruct: _baseRef) {
            value = smoke_Attributes_ExampleStruct_value_get(cExampleStruct)
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_Attributes_ExampleStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cExampleStruct: _baseRef) -> Void {
            smoke_Attributes_ExampleStruct_value_set(cExampleStruct, value)
        }
    }

}
