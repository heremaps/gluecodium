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

internal func getRef(_ ref: NestedInstantiableTwo) -> smoke_NestedInstantiableTwoRef {
    guard let instanceReference = ref as? _NestedInstantiableTwo else {
        fatalError("Not implemented yet")
    }
    return instanceReference.c_instance
}

public protocol NestedInstantiableTwo {
        func setMultipleTypeInstances(instanceOne: SimpleInstantiableOne, instanceTwo: SimpleInstantiableTwo, nestedInstantiable: NestedInstantiableOne) -> Void;
        func getInstantiableOne() -> SimpleInstantiableOne?;
        func getInstantiableTwo() -> SimpleInstantiableTwo?;
        func getNestedInstantiable() -> NestedInstantiableOne?;
        func setSelfInstantiable(selfInstance: NestedInstantiableTwo) -> Void;
        func getSelfInstantiable() -> NestedInstantiableTwo?;
}

internal class _NestedInstantiableTwo: NestedInstantiableTwo {


    let c_instance : smoke_NestedInstantiableTwoRef

    required init?(cNestedInstantiableTwo: smoke_NestedInstantiableTwoRef) {
        c_instance = cNestedInstantiableTwo
    }

    deinit {
        smoke_NestedInstantiableTwo_release(c_instance)
    }



    public func setMultipleTypeInstances(instanceOne: SimpleInstantiableOne, instanceTwo: SimpleInstantiableTwo, nestedInstantiable: NestedInstantiableOne) -> Void {
        let instanceOneHandle = getRef(instanceOne)
        let instanceTwoHandle = getRef(instanceTwo)
        let nestedInstantiableHandle = getRef(nestedInstantiable)
        return smoke_NestedInstantiableTwo_setMultipleTypeInstances(c_instance, instanceOneHandle, instanceTwoHandle, nestedInstantiableHandle)
    }
    public func getInstantiableOne() -> SimpleInstantiableOne? {
        let cResult = smoke_NestedInstantiableTwo_getInstantiableOne(c_instance)


        return _SimpleInstantiableOne(cSimpleInstantiableOne: cResult)
    }
    public func getInstantiableTwo() -> SimpleInstantiableTwo? {
        let cResult = smoke_NestedInstantiableTwo_getInstantiableTwo(c_instance)


        return _SimpleInstantiableTwo(cSimpleInstantiableTwo: cResult)
    }
    public func getNestedInstantiable() -> NestedInstantiableOne? {
        let cResult = smoke_NestedInstantiableTwo_getNestedInstantiable(c_instance)


        return _NestedInstantiableOne(cNestedInstantiableOne: cResult)
    }
    public func setSelfInstantiable(selfInstance: NestedInstantiableTwo) -> Void {
        let selfInstanceHandle = getRef(selfInstance)
        return smoke_NestedInstantiableTwo_setSelfInstantiable(c_instance, selfInstanceHandle)
    }
    public func getSelfInstantiable() -> NestedInstantiableTwo? {
        let cResult = smoke_NestedInstantiableTwo_getSelfInstantiable(c_instance)


        return _NestedInstantiableTwo(cNestedInstantiableTwo: cResult)
    }
}



