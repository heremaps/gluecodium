//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: NestedInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_NestedInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_NestedInterface_release_handle)
            : RefHolder(handle_copy)
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
        var swift_object_interfaceOne: SimpleInterface? = nil
        if let swift_pointer_interfaceOne = smoke_SimpleInterface_get_swift_object_from_cache(interfaceOne) {
            swift_object_interfaceOne = Unmanaged<AnyObject>.fromOpaque(swift_pointer_interfaceOne).takeUnretainedValue() as? SimpleInterface
            if swift_object_interfaceOne != nil {
                defer {
                    smoke_SimpleInterface_release_handle(interfaceOne)
                }
            }
        }
        if swift_object_interfaceOne == nil {
            swift_object_interfaceOne = _SimpleInterface(cSimpleInterface: interfaceOne)
        }
        var swift_object_interfaceTwo: SimpleInterface? = nil
        if let swift_pointer_interfaceTwo = smoke_SimpleInterface_get_swift_object_from_cache(interfaceTwo) {
            swift_object_interfaceTwo = Unmanaged<AnyObject>.fromOpaque(swift_pointer_interfaceTwo).takeUnretainedValue() as? SimpleInterface
            if swift_object_interfaceTwo != nil {
                defer {
                    smoke_SimpleInterface_release_handle(interfaceTwo)
                }
            }
        }
        if swift_object_interfaceTwo == nil {
            swift_object_interfaceTwo = _SimpleInterface(cSimpleInterface: interfaceTwo)
        }
        swift_class.setSameTypeInstances(interfaceOne: swift_object_interfaceOne!, interfaceTwo: swift_object_interfaceTwo!)
    }
    functions.smoke_NestedInterface_getInstanceOne = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swift_class.getInstanceOne()!, owning: false).ref
    }
    functions.smoke_NestedInterface_getInstanceTwo = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return getRef(swift_class.getInstanceTwo()!, owning: false).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withInterface = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        var swift_object_input: ExternalInterface? = nil
        if swift_object_input == nil {
            swift_object_input = ExternalInterface(cExternalInterface: input)
        }
        return getRef(swift_class.makeMoreExternal(input: swift_object_input!)!, owning: false).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withStruct = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        defer {
            smoke_ExternalInterface_SomeStruct_release_handle(input)
        }
        return swift_class.makeMoreExternal(input: ExternalInterface.SomeStruct(cHandle: input)).convertToCType()
    }
    functions.smoke_NestedInterface_makeMoreExternal_withEnum = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return swift_class.makeMoreExternal(input: ExternalInterface.SomeEnum(rawValue: input)!).rawValue
    }
    let proxy = smoke_NestedInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_NestedInterface_release_handle) : RefHolder(proxy)
}
public protocol NestedInterface : AnyObject {
    func setSameTypeInstances(interfaceOne: SimpleInterface?, interfaceTwo: SimpleInterface?) -> Void
    func getInstanceOne() -> SimpleInterface?
    func getInstanceTwo() -> SimpleInterface?
    func makeMoreExternal(input: ExternalInterface?) -> VeryExternalInterface?
    func makeMoreExternal(input: ExternalInterface.SomeStruct) -> VeryExternalInterface.SomeStruct
    func makeMoreExternal(input: ExternalInterface.SomeEnum) -> VeryExternalInterface.SomeEnum
}
internal class _NestedInterface: NestedInterface {
    let c_instance : _baseRef
    init(cNestedInterface: _baseRef) {
        guard cNestedInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cNestedInterface
    }
    deinit {
        smoke_NestedInterface_release_handle(c_instance)
    }
    public func setSameTypeInstances(interfaceOne: SimpleInterface?, interfaceTwo: SimpleInterface?) -> Void {
        let interfaceOne_handle = getRef(interfaceOne)
        let interfaceTwo_handle = getRef(interfaceTwo)
        return smoke_NestedInterface_setSameTypeInstances(c_instance, interfaceOne_handle.ref, interfaceTwo_handle.ref)
    }
    public func getInstanceOne() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceOne(c_instance)
        if cResult == 0 { return nil }
        if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(cResult),
                let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
            return re_constructed
        }
        return _SimpleInterface(cSimpleInterface: cResult)
    }
    public func getInstanceTwo() -> SimpleInterface? {
        let cResult = smoke_NestedInterface_getInstanceTwo(c_instance)
        if cResult == 0 { return nil }
        if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(cResult),
                let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
            return re_constructed
        }
        return _SimpleInterface(cSimpleInterface: cResult)
    }
    public func makeMoreExternal(input: ExternalInterface?) -> VeryExternalInterface? {
        let input_handle = getRef(input)
        let cResult = smoke_NestedInterface_makeMoreExternal_withInterface(c_instance, input_handle.ref)
        if cResult == 0 { return nil }
        return VeryExternalInterface(cVeryExternalInterface: cResult)
    }
    public func makeMoreExternal(input: ExternalInterface.SomeStruct) -> VeryExternalInterface.SomeStruct {
        let input_handle = input.convertToCType()
        defer {
            smoke_ExternalInterface_SomeStruct_release_handle(input_handle)
        }
        return moveFromCType(smoke_NestedInterface_makeMoreExternal_withStruct(c_instance, input_handle))
    }
    public func makeMoreExternal(input: ExternalInterface.SomeEnum) -> VeryExternalInterface.SomeEnum {
        let cResult = smoke_NestedInterface_makeMoreExternal_withEnum(c_instance, input.rawValue)
        return VeryExternalInterface.SomeEnum(rawValue: cResult)!
    }
}
extension _NestedInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}