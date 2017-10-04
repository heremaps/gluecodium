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

internal func getRef(_ ref: Instances) -> smoke_InstancesRef {
    guard let instanceReference = ref as? _Instances else {
        fatalError("Not implemented yet")
    }
    return instanceReference.c_instance
}

public protocol Instances {
        func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct?;
}

internal class _Instances: Instances {

    let c_instance : smoke_InstancesRef

    required init?(cInstances: smoke_InstancesRef) {
        c_instance = cInstances
    }

    deinit {
        smoke_Instances_release(c_instance)
    }


    public struct InnerStruct {
        public var value: Int8

        public init(value: Int8) {
            self.value = value
        }

        internal init?(cInnerStruct: smoke_Instances_InnerStructRef) {
            value = smoke_Instances_InnerStruct_value_get(cInnerStruct)
        }

        internal func convertToCType() -> smoke_Instances_InnerStructRef {
            let result = smoke_Instances_InnerStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cInnerStruct: smoke_Instances_InnerStructRef) -> Void {
            smoke_Instances_InnerStruct_value_set(cInnerStruct, value)
        }
    }

    public func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct? {
        let inputStructHandle = inputStruct.convertToCType()
        defer {
            smoke_Instances_InnerStruct_release(inputStructHandle)
        }
        let cResult = smoke_Instances_innerStructMethod(c_instance, inputStructHandle)


        defer {
            smoke_Instances_InnerStruct_release(cResult)
        }

        return InnerStruct(cInnerStruct: cResult)
    }
}


