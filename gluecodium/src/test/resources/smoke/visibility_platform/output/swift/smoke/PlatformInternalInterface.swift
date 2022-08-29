//
//
import Foundation
internal protocol PlatformInternalInterface : AnyObject {
}
internal class _PlatformInternalInterface: PlatformInternalInterface {
    let c_instance : _baseRef
    init(cPlatformInternalInterface: _baseRef) {
        guard cPlatformInternalInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPlatformInternalInterface
    }
    deinit {
        smoke_PlatformInternalInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_PlatformInternalInterface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_PlatformInternalInterface")
internal func _CBridgeInitsmoke_PlatformInternalInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _PlatformInternalInterface(cPlatformInternalInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: PlatformInternalInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_PlatformInternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_PlatformInternalInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_PlatformInternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_PlatformInternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_PlatformInternalInterface_release_handle) : RefHolder(proxy)
}
extension _PlatformInternalInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func PlatformInternalInterface_copyFromCType(_ handle: _baseRef) -> PlatformInternalInterface {
    if let swift_pointer = smoke_PlatformInternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PlatformInternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PlatformInternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PlatformInternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PlatformInternalInterface_get_typed(smoke_PlatformInternalInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? PlatformInternalInterface {
        smoke_PlatformInternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func PlatformInternalInterface_moveFromCType(_ handle: _baseRef) -> PlatformInternalInterface {
    if let swift_pointer = smoke_PlatformInternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PlatformInternalInterface {
        smoke_PlatformInternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_PlatformInternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PlatformInternalInterface {
        smoke_PlatformInternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_PlatformInternalInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? PlatformInternalInterface {
        smoke_PlatformInternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func PlatformInternalInterface_copyFromCType(_ handle: _baseRef) -> PlatformInternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return PlatformInternalInterface_moveFromCType(handle) as PlatformInternalInterface
}
internal func PlatformInternalInterface_moveFromCType(_ handle: _baseRef) -> PlatformInternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return PlatformInternalInterface_moveFromCType(handle) as PlatformInternalInterface
}
internal func copyToCType(_ swiftClass: PlatformInternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PlatformInternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PlatformInternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PlatformInternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
