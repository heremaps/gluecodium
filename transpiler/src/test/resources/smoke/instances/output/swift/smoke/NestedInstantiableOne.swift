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

internal func getRef(_ ref: NestedInstantiableOne) -> smoke_NestedInstantiableOneRef {
    guard let instanceReference = ref as? _NestedInstantiableOne else {
        fatalError("Not implemented yet")
    }
    return instanceReference.c_instance
}

public protocol NestedInstantiableOne {
        func setSameTypeInstances(instanceOne: SimpleInstantiableOne, instanceTwo: SimpleInstantiableOne) -> Void;
        func getInstanceOne() -> SimpleInstantiableOne?;
        func getInstanceTwo() -> SimpleInstantiableOne?;
}

internal class _NestedInstantiableOne: NestedInstantiableOne {


    let c_instance : smoke_NestedInstantiableOneRef

    required init?(cNestedInstantiableOne: smoke_NestedInstantiableOneRef) {
        c_instance = cNestedInstantiableOne
    }

    deinit {
        smoke_NestedInstantiableOne_release(c_instance)
    }



    public func setSameTypeInstances(instanceOne: SimpleInstantiableOne, instanceTwo: SimpleInstantiableOne) -> Void {
        let instanceOneHandle = getRef(instanceOne)
        let instanceTwoHandle = getRef(instanceTwo)
        return smoke_NestedInstantiableOne_setSameTypeInstances(c_instance, instanceOneHandle, instanceTwoHandle)
    }
    public func getInstanceOne() -> SimpleInstantiableOne? {
        let cResult = smoke_NestedInstantiableOne_getInstanceOne(c_instance)


        return _SimpleInstantiableOne(cSimpleInstantiableOne: cResult)
    }
    public func getInstanceTwo() -> SimpleInstantiableOne? {
        let cResult = smoke_NestedInstantiableOne_getInstanceTwo(c_instance)


        return _SimpleInstantiableOne(cSimpleInstantiableOne: cResult)
    }
}



