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


internal func getRef(_ ref: InterfaceWithStruct) -> RefHolder<smoke_InterfaceWithStructRef> {
    guard let instanceReference = ref as? _InterfaceWithStruct else {
        fatalError("Not implemented yet")
    }
    return RefHolder<smoke_InterfaceWithStructRef>(instanceReference.c_instance)
}


public protocol InterfaceWithStruct : AnyObject {


        func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct?;

}

internal class _InterfaceWithStruct: InterfaceWithStruct {


    let c_instance : smoke_InterfaceWithStructRef

    required init?(cInterfaceWithStruct: smoke_InterfaceWithStructRef) {
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

    internal init?(cInnerStruct: smoke_InterfaceWithStruct_InnerStructRef) {
        value = smoke_InterfaceWithStruct_InnerStruct_value_get(cInnerStruct)
    }

    internal func convertToCType() -> smoke_InterfaceWithStruct_InnerStructRef {
        let result = smoke_InterfaceWithStruct_InnerStruct_create()
        fillFunction(result)
        return result
    }

    internal func fillFunction(_ cInnerStruct: smoke_InterfaceWithStruct_InnerStructRef) -> Void {
        smoke_InterfaceWithStruct_InnerStruct_value_set(cInnerStruct, value)
    }
}
