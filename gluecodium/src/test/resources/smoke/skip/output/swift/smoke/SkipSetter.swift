//
//
import Foundation
public protocol SkipSetter : AnyObject {
    var foo: String { get }
}
internal class _SkipSetter: SkipSetter {
    var foo: String {
        get {
            let c_result_handle = smoke_SkipSetter_foo_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
    }
    let c_instance : _baseRef
    init(cSkipSetter: _baseRef) {
        guard cSkipSetter != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSkipSetter
    }
    deinit {
        smoke_SkipSetter_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SkipSetter_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_SkipSetter")
internal func _CBridgeInitsmoke_SkipSetter(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _SkipSetter(cSkipSetter: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: SkipSetter?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_SkipSetter_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_SkipSetter_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_SkipSetter_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_SkipSetter_foo_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipSetter
        return copyToCType(swift_class.foo).ref
    }
    let proxy = smoke_SkipSetter_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_SkipSetter_release_handle) : RefHolder(proxy)
}
extension _SkipSetter: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func SkipSetter_copyFromCType(_ handle: _baseRef) -> SkipSetter {
    if let swift_pointer = smoke_SkipSetter_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipSetter {
        return re_constructed
    }
    if let swift_pointer = smoke_SkipSetter_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipSetter {
        return re_constructed
    }
    if let swift_pointer = smoke_SkipSetter_get_typed(smoke_SkipSetter_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? SkipSetter {
        smoke_SkipSetter_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func SkipSetter_moveFromCType(_ handle: _baseRef) -> SkipSetter {
    if let swift_pointer = smoke_SkipSetter_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipSetter {
        smoke_SkipSetter_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_SkipSetter_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipSetter {
        smoke_SkipSetter_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_SkipSetter_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? SkipSetter {
        smoke_SkipSetter_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func SkipSetter_copyFromCType(_ handle: _baseRef) -> SkipSetter? {
    guard handle != 0 else {
        return nil
    }
    return SkipSetter_moveFromCType(handle) as SkipSetter
}
internal func SkipSetter_moveFromCType(_ handle: _baseRef) -> SkipSetter? {
    guard handle != 0 else {
        return nil
    }
    return SkipSetter_moveFromCType(handle) as SkipSetter
}
internal func copyToCType(_ swiftClass: SkipSetter) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipSetter) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SkipSetter?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipSetter?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
