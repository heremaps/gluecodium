//
//
import Foundation
public protocol EnableTagsInSwift : AnyObject {
    func enableTagged() -> Void
    func enableTaggedList() -> Void
}
internal class _EnableTagsInSwift: EnableTagsInSwift {
    let c_instance : _baseRef
    init(cEnableTagsInSwift: _baseRef) {
        guard cEnableTagsInSwift != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnableTagsInSwift
    }
    deinit {
        smoke_EnableTagsInSwift_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EnableTagsInSwift_release_handle(c_instance)
    }
    public func enableTagged() -> Void {
        smoke_EnableTagsInSwift_enableTagged(self.c_instance)
    }
    public func enableTaggedList() -> Void {
        smoke_EnableTagsInSwift_enableTaggedList(self.c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_EnableTagsInSwift")
internal func _CBridgeInitsmoke_EnableTagsInSwift(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _EnableTagsInSwift(cEnableTagsInSwift: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: EnableTagsInSwift?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_EnableTagsInSwift_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_EnableTagsInSwift_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_EnableTagsInSwift_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_EnableTagsInSwift_enableTagged = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! EnableTagsInSwift
        swift_class.enableTagged()
    }
    functions.smoke_EnableTagsInSwift_enableTaggedList = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! EnableTagsInSwift
        swift_class.enableTaggedList()
    }
    let proxy = smoke_EnableTagsInSwift_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_EnableTagsInSwift_release_handle) : RefHolder(proxy)
}
extension _EnableTagsInSwift: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func EnableTagsInSwift_copyFromCType(_ handle: _baseRef) -> EnableTagsInSwift {
    if let swift_pointer = smoke_EnableTagsInSwift_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableTagsInSwift {
        return re_constructed
    }
    if let swift_pointer = smoke_EnableTagsInSwift_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableTagsInSwift {
        return re_constructed
    }
    if let swift_pointer = smoke_EnableTagsInSwift_get_typed(smoke_EnableTagsInSwift_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? EnableTagsInSwift {
        smoke_EnableTagsInSwift_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func EnableTagsInSwift_moveFromCType(_ handle: _baseRef) -> EnableTagsInSwift {
    if let swift_pointer = smoke_EnableTagsInSwift_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableTagsInSwift {
        smoke_EnableTagsInSwift_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_EnableTagsInSwift_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableTagsInSwift {
        smoke_EnableTagsInSwift_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_EnableTagsInSwift_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? EnableTagsInSwift {
        smoke_EnableTagsInSwift_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func EnableTagsInSwift_copyFromCType(_ handle: _baseRef) -> EnableTagsInSwift? {
    guard handle != 0 else {
        return nil
    }
    return EnableTagsInSwift_moveFromCType(handle) as EnableTagsInSwift
}
internal func EnableTagsInSwift_moveFromCType(_ handle: _baseRef) -> EnableTagsInSwift? {
    guard handle != 0 else {
        return nil
    }
    return EnableTagsInSwift_moveFromCType(handle) as EnableTagsInSwift
}
internal func copyToCType(_ swiftClass: EnableTagsInSwift) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnableTagsInSwift) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EnableTagsInSwift?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnableTagsInSwift?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
