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
internal func getRef(_ ref: InstanceWithStruct) -> RefHolder<smoke_InstanceWithStructRef> {
    guard let instanceReference = ref as? _InstanceWithStruct else {
        fatalError("Not implemented yet")
    }
    return RefHolder<smoke_InstanceWithStructRef>(instanceReference.c_instance)
}

public protocol InstanceWithStruct {
        func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct?;
}

internal class _InstanceWithStruct: InstanceWithStruct {

    let c_instance : smoke_InstanceWithStructRef

    required init?(cInstanceWithStruct: smoke_InstanceWithStructRef) {
        c_instance = cInstanceWithStruct
    }

    deinit {
        smoke_InstanceWithStruct_release(c_instance)
    }


    public struct InnerStruct {
        public var value: Int8

        public init(value: Int8) {
            self.value = value
        }

        internal init?(cInnerStruct: smoke_InstanceWithStruct_InnerStructRef) {
            value = smoke_InstanceWithStruct_InnerStruct_value_get(cInnerStruct)
        }

        internal func convertToCType() -> smoke_InstanceWithStruct_InnerStructRef {
            let result = smoke_InstanceWithStruct_InnerStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cInnerStruct: smoke_InstanceWithStruct_InnerStructRef) -> Void {
            smoke_InstanceWithStruct_InnerStruct_value_set(cInnerStruct, value)
        }
    }

    public func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct? {
        let inputStructHandle = inputStruct.convertToCType()
        defer {
            smoke_InstanceWithStruct_InnerStruct_release(inputStructHandle)
        }
        let cResult = smoke_InstanceWithStruct_innerStructMethod(c_instance, inputStructHandle)


        defer {
            smoke_InstanceWithStruct_InnerStruct_release(cResult)
        }

        return InnerStruct(cInnerStruct: cResult)
    }
}


