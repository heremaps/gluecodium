//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: NestedInterface) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }

    var functions = smoke_NestedInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    functions.smoke_NestedInterface_setSameTypeInstances = {(swiftClass_pointer, interfaceOne, interfaceTwo) in
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
    return RefHolder(ref: proxy, release: smoke_NestedInterface_release)
}






public protocol NestedInterface : AnyObject {


    func setSameTypeInstances(interfaceOne: SimpleInterface, interfaceTwo: SimpleInterface) -> Void
    func getInstanceOne() -> SimpleInterface?
    func getInstanceTwo() -> SimpleInterface?

}

internal class _NestedInterface: NestedInterface {


    let c_instance : _baseRef

    init?(cNestedInterface: _baseRef) {
        guard cNestedInterface != 0 else {
            return nil
        }
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

        if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(cResult),
                let reconstructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
            return reconstructed
        }
        return _SimpleInterface(cSimpleInterface: cResult)
    }

    public func getInstanceTwo() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceTwo(c_instance)

        if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(cResult),
                let reconstructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
            return reconstructed
        }
        return _SimpleInterface(cSimpleInterface: cResult)
    }

}

extension _NestedInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
