//

//

import Foundation

public protocol FirstParentIsInterfaceInterface : ParentInterface, ParentNarrowOne {

    var parentProperty: String { get set }

    var parentPropertyOne: String { get set }

    var childProperty: String { get set }

    func parentFunction() -> Void

    func someFunctionThatUsesTypeFromAnotherPackage(someParam: SomeCoolClassType) -> Void

    func parentFunctionOne() -> Void

    func childFunction() -> Void
}

internal class _FirstParentIsInterfaceInterface: FirstParentIsInterfaceInterface {


    var parentProperty: String {
        get {
            let c_result_handle = smoke_ParentInterface_parentProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_ParentInterface_parentProperty_set(self.c_instance, c_value.ref)
        }
    }

    var parentPropertyOne: String {
        get {
            let c_result_handle = smoke_ParentNarrowOne_parentPropertyOne_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_ParentNarrowOne_parentPropertyOne_set(self.c_instance, c_value.ref)
        }
    }

    var childProperty: String {
        get {
            let c_result_handle = smoke_FirstParentIsInterfaceInterface_childProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_FirstParentIsInterfaceInterface_childProperty_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef

    init(cFirstParentIsInterfaceInterface: _baseRef) {
        guard cFirstParentIsInterfaceInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cFirstParentIsInterfaceInterface
    }

    deinit {
        smoke_FirstParentIsInterfaceInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_FirstParentIsInterfaceInterface_release_handle(c_instance)
    }

    public func parentFunction() -> Void {
        smoke_ParentInterface_parentFunction(self.c_instance)
    }
    public func someFunctionThatUsesTypeFromAnotherPackage(someParam: SomeCoolClassType) -> Void {
        let c_someParam = moveToCType(someParam)
        smoke_ParentInterface_someFunctionThatUsesTypeFromAnotherPackage(self.c_instance, c_someParam.ref)
    }
    public func parentFunctionOne() -> Void {
        smoke_ParentNarrowOne_parentFunctionOne(self.c_instance)
    }
    public func childFunction() -> Void {
        smoke_FirstParentIsInterfaceInterface_childFunction(self.c_instance)
    }

}






@_cdecl("_CBridgeInitsmoke_FirstParentIsInterfaceInterface")
internal func _CBridgeInitsmoke_FirstParentIsInterfaceInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _FirstParentIsInterfaceInterface(cFirstParentIsInterfaceInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}

internal func getRef(_ ref: FirstParentIsInterfaceInterface?, owning: Bool = true) -> RefHolder {

    guard let reference = ref else {
        return RefHolder(0)
    }

    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_FirstParentIsInterfaceInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_FirstParentIsInterfaceInterface_release_handle)
            : RefHolder(handle_copy)
    }

    var functions = smoke_FirstParentIsInterfaceInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }


    functions.smoke_ParentInterface_parentFunction = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.parentFunction()
    }

    functions.smoke_ParentInterface_someFunctionThatUsesTypeFromAnotherPackage = {(swift_class_pointer, someParam) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.someFunctionThatUsesTypeFromAnotherPackage(someParam: SomeCoolClassType_moveFromCType(someParam))
    }

    functions.smoke_ParentNarrowOne_parentFunctionOne = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.parentFunctionOne()
    }

    functions.smoke_FirstParentIsInterfaceInterface_childFunction = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.childFunction()
    }

    functions.smoke_ParentInterface_parentProperty_get = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        return copyToCType(swift_class.parentProperty).ref
    }

    functions.smoke_ParentInterface_parentProperty_set = {(swift_class_pointer, value) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.parentProperty = moveFromCType(value)
    }

    functions.smoke_ParentNarrowOne_parentPropertyOne_get = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        return copyToCType(swift_class.parentPropertyOne).ref
    }

    functions.smoke_ParentNarrowOne_parentPropertyOne_set = {(swift_class_pointer, value) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.parentPropertyOne = moveFromCType(value)
    }

    functions.smoke_FirstParentIsInterfaceInterface_childProperty_get = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        return copyToCType(swift_class.childProperty).ref
    }

    functions.smoke_FirstParentIsInterfaceInterface_childProperty_set = {(swift_class_pointer, value) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! FirstParentIsInterfaceInterface

        swift_class.childProperty = moveFromCType(value)
    }
    let proxy = smoke_FirstParentIsInterfaceInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_FirstParentIsInterfaceInterface_release_handle) : RefHolder(proxy)
}

extension _FirstParentIsInterfaceInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func FirstParentIsInterfaceInterface_copyFromCType(_ handle: _baseRef) -> FirstParentIsInterfaceInterface {
    if let swift_pointer = smoke_FirstParentIsInterfaceInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? FirstParentIsInterfaceInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_FirstParentIsInterfaceInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? FirstParentIsInterfaceInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_FirstParentIsInterfaceInterface_get_typed(smoke_FirstParentIsInterfaceInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? FirstParentIsInterfaceInterface {
        smoke_FirstParentIsInterfaceInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}

internal func FirstParentIsInterfaceInterface_moveFromCType(_ handle: _baseRef) -> FirstParentIsInterfaceInterface {
    if let swift_pointer = smoke_FirstParentIsInterfaceInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? FirstParentIsInterfaceInterface {
        smoke_FirstParentIsInterfaceInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_FirstParentIsInterfaceInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? FirstParentIsInterfaceInterface {
        smoke_FirstParentIsInterfaceInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_FirstParentIsInterfaceInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? FirstParentIsInterfaceInterface {
        smoke_FirstParentIsInterfaceInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}

internal func FirstParentIsInterfaceInterface_copyFromCType(_ handle: _baseRef) -> FirstParentIsInterfaceInterface? {
    guard handle != 0 else {
        return nil
    }
    return FirstParentIsInterfaceInterface_moveFromCType(handle) as FirstParentIsInterfaceInterface
}
internal func FirstParentIsInterfaceInterface_moveFromCType(_ handle: _baseRef) -> FirstParentIsInterfaceInterface? {
    guard handle != 0 else {
        return nil
    }
    return FirstParentIsInterfaceInterface_moveFromCType(handle) as FirstParentIsInterfaceInterface
}

internal func copyToCType(_ swiftClass: FirstParentIsInterfaceInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: FirstParentIsInterfaceInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: FirstParentIsInterfaceInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: FirstParentIsInterfaceInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}



