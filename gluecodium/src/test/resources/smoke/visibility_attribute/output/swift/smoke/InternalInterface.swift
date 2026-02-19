//

//

import Foundation

internal protocol InternalInterface : AnyObject {

    static var somePropertyOfInternalInterface: String { get set }

    func fooBar() -> Void
}

internal class _InternalInterface: InternalInterface {


    static var somePropertyOfInternalInterface: String {
        get {
            let c_result_handle = smoke_InternalInterface_somePropertyOfInternalInterface_get()
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_InternalInterface_somePropertyOfInternalInterface_set(c_value.ref)
        }
    }
    let c_instance : _baseRef

    init(cInternalInterface: _baseRef) {
        guard cInternalInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalInterface
    }

    deinit {
        smoke_InternalInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_InternalInterface_release_handle(c_instance)
    }

    public func fooBar() -> Void {
        smoke_InternalInterface_fooBar(self.c_instance)
    }

}






@_cdecl("_CBridgeInitsmoke_InternalInterface")
internal func _CBridgeInitsmoke_InternalInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InternalInterface(cInternalInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}

internal func getRef(_ ref: InternalInterface?, owning: Bool = true) -> RefHolder {

    guard let reference = ref else {
        return RefHolder(0)
    }

    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InternalInterface_release_handle)
            : RefHolder(handle_copy)
    }

    var functions = smoke_InternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }


    functions.smoke_InternalInterface_fooBar = {(swift_class_pointer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InternalInterface

        swift_class.fooBar()
    }
    let proxy = smoke_InternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InternalInterface_release_handle) : RefHolder(proxy)
}

extension _InternalInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func InternalInterface_copyFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_InternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_InternalInterface_get_typed(smoke_InternalInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalInterface {
        smoke_InternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}

internal func InternalInterface_moveFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_InternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_InternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InternalInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalInterface {
        smoke_InternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}

internal func InternalInterface_copyFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterface_moveFromCType(handle) as InternalInterface
}
internal func InternalInterface_moveFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterface_moveFromCType(handle) as InternalInterface
}

internal func copyToCType(_ swiftClass: InternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: InternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: InternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: InternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}



