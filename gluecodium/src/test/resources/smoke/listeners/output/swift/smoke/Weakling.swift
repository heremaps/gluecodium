//
//
import Foundation
public protocol Weakling : AnyObject {
    var listener: ListenerInterface? { get set }
}
internal class _Weakling: Weakling {
    weak var listener: ListenerInterface? {
        get {
            return ListenerInterface_moveFromCType(smoke_Weakling_listener_get(self.c_instance))
        }
        set {
            let c_value = weakToCType(newValue)
            return moveFromCType(smoke_Weakling_listener_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cWeakling: _baseRef) {
        guard cWeakling != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cWeakling
    }
    deinit {
        smoke_Weakling_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Weakling_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_Weakling")
internal func _CBridgeInitsmoke_Weakling(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _Weakling(cWeakling: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: Weakling?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_Weakling_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_Weakling_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_Weakling_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_Weakling_listener_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Weakling
        return copyToCType(swift_class.listener).ref
    }
    functions.smoke_Weakling_listener_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Weakling
        swift_class.listener = ListenerInterface_moveFromCType(value)
    }
    let proxy = smoke_Weakling_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_Weakling_release_handle) : RefHolder(proxy)
}
extension _Weakling: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Weakling_copyFromCType(_ handle: _baseRef) -> Weakling {
    if let swift_pointer = smoke_Weakling_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Weakling {
        return re_constructed
    }
    if let swift_pointer = smoke_Weakling_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Weakling {
        return re_constructed
    }
    if let swift_pointer = smoke_Weakling_get_typed(smoke_Weakling_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Weakling {
        smoke_Weakling_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func Weakling_moveFromCType(_ handle: _baseRef) -> Weakling {
    if let swift_pointer = smoke_Weakling_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Weakling {
        smoke_Weakling_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_Weakling_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Weakling {
        smoke_Weakling_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_Weakling_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Weakling {
        smoke_Weakling_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func Weakling_copyFromCType(_ handle: _baseRef) -> Weakling? {
    guard handle != 0 else {
        return nil
    }
    return Weakling_moveFromCType(handle) as Weakling
}
internal func Weakling_moveFromCType(_ handle: _baseRef) -> Weakling? {
    guard handle != 0 else {
        return nil
    }
    return Weakling_moveFromCType(handle) as Weakling
}
internal func copyToCType(_ swiftClass: Weakling) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Weakling) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Weakling?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Weakling?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
