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


internal func getRef(_ ref: InterfaceWithStruct) -> RefHolder {
    if let instanceReference = ref as? _InterfaceWithStruct {
        return RefHolder(instanceReference.c_instance)
    }

    var functions = smoke_InterfaceWithStruct_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    functions.smoke_InterfaceWithStruct_innerStructMethod = {(swiftClass_pointer, inputStruct) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InterfaceWithStruct
        return get_pointer((swiftClass.innerStructMethod(inputStruct: InnerStruct(cInnerStruct: inputStruct)!)!).convertToCType())
    }
    let proxy = smoke_InterfaceWithStruct_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_InterfaceWithStruct_release)
}






public protocol InterfaceWithStruct : AnyObject {


    func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct?

}

internal class _InterfaceWithStruct: InterfaceWithStruct {


    let c_instance : _baseRef

    init?(cInterfaceWithStruct: _baseRef) {
        guard cInterfaceWithStruct != 0 else {
            return nil
        }
        c_instance = cInterfaceWithStruct
    }

    deinit {
        smoke_InterfaceWithStruct_release(c_instance)
    }
    public func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct? {
        let inputStructHandle = inputStruct.convertToCType()
        defer {
            smoke_InterfaceWithStruct_InnerStruct_release(inputStructHandle)
        }
        let cResult = smoke_InterfaceWithStruct_innerStructMethod(c_instance, inputStructHandle)
        defer {
            smoke_InterfaceWithStruct_InnerStruct_release(cResult)
        }
        return InnerStruct(cInnerStruct: cResult)
    }

}
public struct InnerStruct {
    public var value: Int8

    public init(value: Int8) {
        self.value = value
    }

    internal init?(cInnerStruct: _baseRef) {
        value = smoke_InterfaceWithStruct_InnerStruct_value_get(cInnerStruct)
    }

    internal func convertToCType() -> _baseRef {
        let result = smoke_InterfaceWithStruct_InnerStruct_create()
        fillFunction(result)
        return result
    }

    internal func fillFunction(_ cInnerStruct: _baseRef) -> Void {
        smoke_InterfaceWithStruct_InnerStruct_value_set(cInnerStruct, value)
    }
}
