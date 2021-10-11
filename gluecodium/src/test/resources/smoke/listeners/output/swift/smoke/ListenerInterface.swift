//
//
import Foundation
public protocol ListenerInterface : AnyObject {
    func notify() -> Void
}
internal class _ListenerInterface: ListenerInterface {
    let c_instance : _baseRef
    init(cListenerInterface: _baseRef) {
        guard cListenerInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cListenerInterface
    }
    deinit {
        smoke_ListenerInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ListenerInterface_release_handle(c_instance)
    }
    public func notify() -> Void {
        smoke_ListenerInterface_notify(self.c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ListenerInterface")
internal func _CBridgeInitsmoke_ListenerInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ListenerInterface(cListenerInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal class ListenerInterface_WeakHolder {
    weak var value: ListenerInterface?
    init(_ value: ListenerInterface) {
        self.value = value
    }
}
internal func getRef(_ ref: ListenerInterface?, owning: Bool = true, isWeak: Bool = false) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ListenerInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ListenerInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ListenerInterface_FunctionTable()
    let strongRef: AnyObject = isWeak ? ListenerInterface_WeakHolder(reference) : reference
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(strongRef).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ListenerInterface_notify = {(swift_class_pointer) in
        let unretained_value = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue()
        let swift_class: ListenerInterface
        if (unretained_value is ListenerInterface_WeakHolder) {
            if let weak_value = (unretained_value as! ListenerInterface_WeakHolder).value {
                swift_class = weak_value
            } else {
                return
            }
        } else {
            swift_class = unretained_value as! ListenerInterface
        }
        swift_class.notify()
    }
    let proxy = smoke_ListenerInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ListenerInterface_release_handle) : RefHolder(proxy)
}
internal func weakToCType(_ swiftClass: ListenerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true, isWeak: true)
}
extension _ListenerInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func ListenerInterface_copyFromCType(_ handle: _baseRef) -> ListenerInterface {
    if let swift_pointer = smoke_ListenerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerInterface_get_typed(smoke_ListenerInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ListenerInterface {
        smoke_ListenerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ListenerInterface_moveFromCType(_ handle: _baseRef) -> ListenerInterface {
    if let swift_pointer = smoke_ListenerInterface_get_swift_object_from_cache(handle) {
        let re_constructed_uncast = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue()
        if let re_constructed = re_constructed_uncast as? ListenerInterface {
            smoke_ListenerInterface_release_handle(handle)
            return re_constructed
        }
        if let weak_value = (re_constructed_uncast as? ListenerInterface_WeakHolder)?.value {
            smoke_ListenerInterface_release_handle(handle)
            return weak_value
        }
    }
    if let swift_pointer = smoke_ListenerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerInterface {
        smoke_ListenerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ListenerInterface {
        smoke_ListenerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ListenerInterface_copyFromCType(_ handle: _baseRef) -> ListenerInterface? {
    guard handle != 0 else {
        return nil
    }
    return ListenerInterface_moveFromCType(handle) as ListenerInterface
}
internal func ListenerInterface_moveFromCType(_ handle: _baseRef) -> ListenerInterface? {
    guard handle != 0 else {
        return nil
    }
    return ListenerInterface_moveFromCType(handle) as ListenerInterface
}
internal func copyToCType(_ swiftClass: ListenerInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ListenerInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ListenerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ListenerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
