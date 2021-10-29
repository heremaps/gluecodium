//
//
import Foundation
internal protocol ExposeInternalInterface : AnyObject {
}
internal class _ExposeInternalInterface: ExposeInternalInterface {
    let c_instance : _baseRef
    init(cExposeInternalInterface: _baseRef) {
        guard cExposeInternalInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExposeInternalInterface
    }
    deinit {
        smoke_ExposeInternalInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExposeInternalInterface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ExposeInternalInterface")
internal func _CBridgeInitsmoke_ExposeInternalInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ExposeInternalInterface(cExposeInternalInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ExposeInternalInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ExposeInternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ExposeInternalInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ExposeInternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_ExposeInternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ExposeInternalInterface_release_handle) : RefHolder(proxy)
}
extension _ExposeInternalInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func ExposeInternalInterface_copyFromCType(_ handle: _baseRef) -> ExposeInternalInterface {
    if let swift_pointer = smoke_ExposeInternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalInterface_get_typed(smoke_ExposeInternalInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExposeInternalInterface {
        smoke_ExposeInternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ExposeInternalInterface_moveFromCType(_ handle: _baseRef) -> ExposeInternalInterface {
    if let swift_pointer = smoke_ExposeInternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalInterface {
        smoke_ExposeInternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalInterface {
        smoke_ExposeInternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExposeInternalInterface {
        smoke_ExposeInternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ExposeInternalInterface_copyFromCType(_ handle: _baseRef) -> ExposeInternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalInterface_moveFromCType(handle) as ExposeInternalInterface
}
internal func ExposeInternalInterface_moveFromCType(_ handle: _baseRef) -> ExposeInternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalInterface_moveFromCType(handle) as ExposeInternalInterface
}
internal func copyToCType(_ swiftClass: ExposeInternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExposeInternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExposeInternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExposeInternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
