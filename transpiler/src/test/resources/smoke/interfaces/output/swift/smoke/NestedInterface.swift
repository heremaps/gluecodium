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


internal func getRef(_ ref: NestedInterface) -> RefHolder<smoke_NestedInterfaceRef> {
    if let instanceReference = ref as? _NestedInterface {
        return RefHolder<smoke_NestedInterfaceRef>(instanceReference.c_instance)
    }
    var functions = smoke_NestedInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.smoke_NestedInterface_setSameTypeInstances = {(swiftClass_pointer, interfaceOne, interfaceTwo) in
        precondition(interfaceOne.private_pointer != nil, "Out of memory")
        precondition(interfaceTwo.private_pointer != nil, "Out of memory")
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! NestedInterface
        return swiftClass.setSameTypeInstances(interfaceOne: _SimpleInterface(cSimpleInterface: interfaceOne)!, interfaceTwo: _SimpleInterface(cSimpleInterface: interfaceTwo)!)
    }
    functions.smoke_NestedInterface_getInstanceOne = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swiftClass.getInstanceOne()!).ref
    }
    functions.smoke_NestedInterface_getInstanceTwo = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swiftClass.getInstanceTwo()!).ref
    }
    let proxy = smoke_NestedInterface_createProxy(functions)
    precondition(proxy.private_pointer != nil, "Out of memory")
    return RefHolder(ref: proxy, release: smoke_NestedInterface_release)
}


public protocol NestedInterface : AnyObject {


    func setSameTypeInstances(interfaceOne: SimpleInterface, interfaceTwo: SimpleInterface) -> Void
    func getInstanceOne() -> SimpleInterface?
    func getInstanceTwo() -> SimpleInterface?

}

internal class _NestedInterface: NestedInterface {


    let c_instance : smoke_NestedInterfaceRef

    required init?(cNestedInterface: smoke_NestedInterfaceRef) {
        c_instance = cNestedInterface
    }

    deinit {
        smoke_NestedInterface_release(c_instance)
    }
    public func setSameTypeInstances(interfaceOne: SimpleInterface, interfaceTwo: SimpleInterface) -> Void {
        let interfaceOneHandle = getRef(interfaceOne)
        let interfaceTwoHandle = getRef(interfaceTwo)
        return smoke_NestedInterface_setSameTypeInstances(c_instance, interfaceOneHandle.ref, interfaceTwoHandle.ref)
    }

    public func getInstanceOne() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceOne(c_instance)
        precondition(cResult.private_pointer != nil, "Out of memory")
        return _SimpleInterface(cSimpleInterface: cResult)
    }

    public func getInstanceTwo() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceTwo(c_instance)
        precondition(cResult.private_pointer != nil, "Out of memory")
        return _SimpleInterface(cSimpleInterface: cResult)
    }

}
