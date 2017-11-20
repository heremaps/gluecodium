//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Attributes) -> RefHolder<smoke_AttributesRef> {
    return RefHolder<smoke_AttributesRef>(ref.c_instance)
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
            let handle =  smoke_Attributes_arrayAttribute_get(c_instance)
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
    let c_instance : smoke_AttributesRef
    public required init?(cAttributes: smoke_AttributesRef) {
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
        internal init?(cExampleStruct: smoke_Attributes_ExampleStructRef) {
            value = smoke_Attributes_ExampleStruct_value_get(cExampleStruct)
        }
        internal func convertToCType() -> smoke_Attributes_ExampleStructRef {
            let result = smoke_Attributes_ExampleStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cExampleStruct: smoke_Attributes_ExampleStructRef) -> Void {
            smoke_Attributes_ExampleStruct_value_set(cExampleStruct, value)
        }
    }
}