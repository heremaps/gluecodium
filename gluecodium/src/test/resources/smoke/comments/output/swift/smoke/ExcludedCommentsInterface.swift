//
//
import Foundation
/// This is some very useful interface.
/// :nodoc:
public protocol ExcludedCommentsInterface : AnyObject {
}
internal class _ExcludedCommentsInterface: ExcludedCommentsInterface {
    let c_instance : _baseRef
    init(cExcludedCommentsInterface: _baseRef) {
        guard cExcludedCommentsInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExcludedCommentsInterface
    }
    deinit {
        smoke_ExcludedCommentsInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExcludedCommentsInterface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ExcludedCommentsInterface")
internal func _CBridgeInitsmoke_ExcludedCommentsInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ExcludedCommentsInterface(cExcludedCommentsInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ExcludedCommentsInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ExcludedCommentsInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ExcludedCommentsInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ExcludedCommentsInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_ExcludedCommentsInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ExcludedCommentsInterface_release_handle) : RefHolder(proxy)
}
extension _ExcludedCommentsInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func foobar_ExcludedCommentsInterface_copyFromCType(_ handle: _baseRef) -> ExcludedCommentsInterface {
    if let swift_pointer = smoke_ExcludedCommentsInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedCommentsInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExcludedCommentsInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedCommentsInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExcludedCommentsInterface_get_typed(smoke_ExcludedCommentsInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExcludedCommentsInterface {
        smoke_ExcludedCommentsInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_ExcludedCommentsInterface_moveFromCType(_ handle: _baseRef) -> ExcludedCommentsInterface {
    if let swift_pointer = smoke_ExcludedCommentsInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedCommentsInterface {
        smoke_ExcludedCommentsInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExcludedCommentsInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedCommentsInterface {
        smoke_ExcludedCommentsInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExcludedCommentsInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExcludedCommentsInterface {
        smoke_ExcludedCommentsInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_ExcludedCommentsInterface_copyFromCType(_ handle: _baseRef) -> ExcludedCommentsInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ExcludedCommentsInterface_moveFromCType(handle) as ExcludedCommentsInterface
}
internal func foobar_ExcludedCommentsInterface_moveFromCType(_ handle: _baseRef) -> ExcludedCommentsInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ExcludedCommentsInterface_moveFromCType(handle) as ExcludedCommentsInterface
}
internal func foobar_copyToCType(_ swiftClass: ExcludedCommentsInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ExcludedCommentsInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: ExcludedCommentsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ExcludedCommentsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
