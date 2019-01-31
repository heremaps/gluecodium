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
        swift_class.setSameTypeInstances(interfaceOne: SimpleInterfacemoveFromCType(interfaceOne), interfaceTwo: SimpleInterfacemoveFromCType(interfaceTwo))
    }
    functions.smoke_NestedInterface_getInstanceOne = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return copyToCType(swift_class.getInstanceOne()).ref
    }
    functions.smoke_NestedInterface_getInstanceTwo = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return copyToCType(swift_class.getInstanceTwo()).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withInterface = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return copyToCType(swift_class.makeMoreExternal(input: ExternalInterfacemoveFromCType(input))).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withStruct = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return copyToCType(swift_class.makeMoreExternal(input: moveFromCType(input))).ref
    }
    functions.smoke_NestedInterface_makeMoreExternal_withEnum = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NestedInterface
        return copyToCType(swift_class.makeMoreExternal(input: moveFromCType(input))).ref
    }
    let proxy = smoke_NestedInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_NestedInterface_release_handle) : RefHolder(proxy)
}
public protocol NestedInterface : AnyObject {
    func setSameTypeInstances(interfaceOne: SimpleInterface, interfaceTwo: SimpleInterface) -> Void
    func getInstanceOne() -> SimpleInterface
    func getInstanceTwo() -> SimpleInterface
    func makeMoreExternal(input: ExternalInterface) -> VeryExternalInterface
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
    public func setSameTypeInstances(interfaceOne: SimpleInterface, interfaceTwo: SimpleInterface) -> Void {
        let c_interfaceOne = moveToCType(interfaceOne)
        let c_interfaceTwo = moveToCType(interfaceTwo)
        return moveFromCType(smoke_NestedInterface_setSameTypeInstances(self.c_instance, c_interfaceOne.ref, c_interfaceTwo.ref))
    }
    public func getInstanceOne() -> SimpleInterface {
        return SimpleInterfacemoveFromCType(smoke_NestedInterface_getInstanceOne(self.c_instance))
    }
    public func getInstanceTwo() -> SimpleInterface {
        return SimpleInterfacemoveFromCType(smoke_NestedInterface_getInstanceTwo(self.c_instance))
    }
    public func makeMoreExternal(input: ExternalInterface) -> VeryExternalInterface {
        let c_input = moveToCType(input)
        return VeryExternalInterfacemoveFromCType(smoke_NestedInterface_makeMoreExternal_withInterface(self.c_instance, c_input.ref))
    }
    public func makeMoreExternal(input: ExternalInterface.SomeStruct) -> VeryExternalInterface.SomeStruct {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_NestedInterface_makeMoreExternal_withStruct(self.c_instance, c_input.ref))
    }
    public func makeMoreExternal(input: ExternalInterface.SomeEnum) -> VeryExternalInterface.SomeEnum {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_NestedInterface_makeMoreExternal_withEnum(self.c_instance, c_input.ref))
    }
}
extension _NestedInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func NestedInterfacecopyFromCType(_ handle: _baseRef) -> NestedInterface {
    if let swift_pointer = smoke_NestedInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? NestedInterface {
        return re_constructed
    }
    return _NestedInterface(cNestedInterface: smoke_NestedInterface_copy_handle(handle))
}
internal func NestedInterfacemoveFromCType(_ handle: _baseRef) -> NestedInterface {
    if let swift_pointer = smoke_NestedInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? NestedInterface {
        smoke_NestedInterface_release_handle(handle)
        return re_constructed
    }
    return _NestedInterface(cNestedInterface: handle)
}
internal func NestedInterfacecopyFromCType(_ handle: _baseRef) -> NestedInterface? {
    guard handle != 0 else {
        return nil
    }
    return NestedInterfacemoveFromCType(handle) as NestedInterface
}
internal func NestedInterfacemoveFromCType(_ handle: _baseRef) -> NestedInterface? {
    guard handle != 0 else {
        return nil
    }
    return NestedInterfacemoveFromCType(handle) as NestedInterface
}
internal func copyToCType(_ swiftClass: NestedInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NestedInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: NestedInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NestedInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
