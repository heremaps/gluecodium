//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: NestedInterface?) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = smoke_NestedInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_NestedInterface_setSameTypeInstances = {(swift_class_pointer, interfaceOne, interfaceTwo) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return swift_class.setSameTypeInstances(interfaceOne: _SimpleInterface(cSimpleInterface: interfaceOne)!, interfaceTwo: _SimpleInterface(cSimpleInterface: interfaceTwo)!)
    }
    functions.smoke_NestedInterface_getInstanceOne = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swift_class.getInstanceOne()!).ref
    }
    functions.smoke_NestedInterface_getInstanceTwo = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swift_class.getInstanceTwo()!).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withInterface = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swift_class.makeMoreExternal(input: ExternalInterface(cExternalInterface: input)!)!).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withStruct = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return get_pointer((swift_class.makeMoreExternal(input: ExternalInterface.SomeStruct(cExternalInterface.SomeStruct: input)!)!).convertToCType())
    }
    functions.smoke_NestedInterface_makeMoreExternal_withEnum = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return swift_class.makeMoreExternal(input: ExternalInterface.SomeEnum(rawValue: input)!)
    }
    let proxy = smoke_NestedInterface_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_NestedInterface_release)
}

public protocol NestedInterface : AnyObject {

    func setSameTypeInstances(interfaceOne: SimpleInterface?, interfaceTwo: SimpleInterface?) -> Void
    func getInstanceOne() -> SimpleInterface?
    func getInstanceTwo() -> SimpleInterface?
    func makeMoreExternal(input: ExternalInterface?) -> VeryExternalInterface?
    func makeMoreExternal(input: ExternalInterface.SomeStruct) -> VeryExternalInterface.SomeStruct?
    func makeMoreExternal(input: ExternalInterface.SomeEnum) -> VeryExternalInterface.SomeEnum
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
    public func setSameTypeInstances(interfaceOne: SimpleInterface?, interfaceTwo: SimpleInterface?) -> Void {
        let interfaceOne_handle = getRef(interfaceOne)
        let interfaceTwo_handle = getRef(interfaceTwo)
        return smoke_NestedInterface_setSameTypeInstances(c_instance, interfaceOne_handle.ref, interfaceTwo_handle.ref)
    }

    public func getInstanceOne() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceOne(c_instance)

        if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(cResult),
                let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
            return re_constructed
        }
        return _SimpleInterface(cSimpleInterface: cResult)
    }

    public func getInstanceTwo() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceTwo(c_instance)

        if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(cResult),
                let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
            return re_constructed
        }
        return _SimpleInterface(cSimpleInterface: cResult)
    }

    public func makeMoreExternal(input: ExternalInterface?) -> VeryExternalInterface? {
        let input_handle = getRef(input)
        let cResult = smoke_NestedInterface_makeMoreExternal_withInterface(c_instance, input_handle.ref)
        return VeryExternalInterface(cVeryExternalInterface: cResult)
    }
    public func makeMoreExternal(input: ExternalInterface.SomeStruct) -> VeryExternalInterface.SomeStruct? {
        let input_handle = input.convertToCType()
        defer {
            smoke_ExternalInterface_SomeStruct_release(input_handle)
        }
        let cResult = smoke_NestedInterface_makeMoreExternal_withStruct(c_instance, input_handle)
        defer {
            smoke_VeryExternalInterface_SomeStruct_release(cResult)
        }
        return VeryExternalInterface.SomeStruct(cSomeStruct: cResult)
    }
    public func makeMoreExternal(input: ExternalInterface.SomeEnum) -> VeryExternalInterface.SomeEnum {
        let cResult = smoke_NestedInterface_makeMoreExternal_withEnum(c_instance, input.rawValue)
        return VeryExternalInterface.SomeEnum(rawValue: cResult)!
    }
}

extension _NestedInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
