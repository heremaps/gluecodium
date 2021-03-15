//
//
import Foundation
public protocol ExposeInterface : AnyObject {
}
internal class _ExposeInterface: ExposeInterface {
    let c_instance : _baseRef
    init(cExposeInterface: _baseRef) {
        guard cExposeInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExposeInterface
    }
    deinit {
        smoke_ExposeInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExposeInterface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ExposeInterface")
internal func _CBridgeInitsmoke_ExposeInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ExposeInterface(cExposeInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
/// :nodoc:
public func getRef(_ ref: ExposeInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ExposeInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ExposeInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ExposeInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_ExposeInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ExposeInterface_release_handle) : RefHolder(proxy)
}
extension _ExposeInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
/// :nodoc:
public func ExposeInterface_copyFromCType(_ handle: _baseRef) -> ExposeInterface {
    if let swift_pointer = smoke_ExposeInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInterface_get_typed(smoke_ExposeInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExposeInterface {
        smoke_ExposeInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
/// :nodoc:
public func ExposeInterface_moveFromCType(_ handle: _baseRef) -> ExposeInterface {
    if let swift_pointer = smoke_ExposeInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInterface {
        smoke_ExposeInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInterface {
        smoke_ExposeInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExposeInterface {
        smoke_ExposeInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
/// :nodoc:
public func ExposeInterface_copyFromCType(_ handle: _baseRef) -> ExposeInterface? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInterface_moveFromCType(handle) as ExposeInterface
}
/// :nodoc:
public func ExposeInterface_moveFromCType(_ handle: _baseRef) -> ExposeInterface? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInterface_moveFromCType(handle) as ExposeInterface
}
/// :nodoc:
public func copyToCType(_ swiftClass: ExposeInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
/// :nodoc:
public func moveToCType(_ swiftClass: ExposeInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
/// :nodoc:
public func copyToCType(_ swiftClass: ExposeInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
/// :nodoc:
public func moveToCType(_ swiftClass: ExposeInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
