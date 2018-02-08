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


internal func getRef(_ ref: AttributesInterface) -> RefHolder {
    if let instanceReference = ref as? _AttributesInterface {
        return RefHolder(instanceReference.c_instance)
    }

    var functions = smoke_AttributesInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    let proxy = smoke_AttributesInterface_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_AttributesInterface_release)
}






public protocol AttributesInterface : AnyObject {


    var structAttribute: ExampleStruct { get set }


}

internal class _AttributesInterface: AttributesInterface {



    var structAttribute: ExampleStruct {
        get {
            let cResult = smoke_AttributesInterface_structAttribute_get(c_instance)
            defer {
                smoke_AttributesInterface_ExampleStruct_release(cResult)
            }
            return ExampleStruct(cExampleStruct: cResult)!
        }
        set {
            let newValueHandle = newValue.convertToCType()
            defer {
                smoke_AttributesInterface_ExampleStruct_release(newValueHandle)
            }
            return smoke_AttributesInterface_structAttribute_set(c_instance, newValueHandle)
        }
    }
    let c_instance : _baseRef

    init?(cAttributesInterface: _baseRef) {
        guard cAttributesInterface != 0 else {
            return nil
        }
        c_instance = cAttributesInterface
    }

    deinit {
        smoke_AttributesInterface_release(c_instance)
    }
}
public struct ExampleStruct {
    public var value: Double

    public init(value: Double) {
        self.value = value
    }

    internal init?(cExampleStruct: _baseRef) {
        value = smoke_AttributesInterface_ExampleStruct_value_get(cExampleStruct)
    }

    internal func convertToCType() -> _baseRef {
        let result = smoke_AttributesInterface_ExampleStruct_create()
        fillFunction(result)
        return result
    }

    internal func fillFunction(_ cExampleStruct: _baseRef) -> Void {
        smoke_AttributesInterface_ExampleStruct_value_set(cExampleStruct, value)
    }
}
