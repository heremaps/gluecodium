//
//
import Foundation
public protocol SkipTagsInSwift : AnyObject {
    func dontSkipTagged() -> Void
}
internal class _SkipTagsInSwift: SkipTagsInSwift {
    let c_instance : _baseRef
    init(cSkipTagsInSwift: _baseRef) {
        guard cSkipTagsInSwift != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSkipTagsInSwift
    }
    deinit {
        smoke_SkipTagsInSwift_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SkipTagsInSwift_release_handle(c_instance)
    }
    public func dontSkipTagged() -> Void {
        smoke_SkipTagsInSwift_dontSkipTagged(self.c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_SkipTagsInSwift")
internal func _CBridgeInitsmoke_SkipTagsInSwift(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _SkipTagsInSwift(cSkipTagsInSwift: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: SkipTagsInSwift?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_SkipTagsInSwift_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_SkipTagsInSwift_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_SkipTagsInSwift_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_SkipTagsInSwift_dontSkipTagged = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipTagsInSwift
        swift_class.dontSkipTagged()
    }
    let proxy = smoke_SkipTagsInSwift_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_SkipTagsInSwift_release_handle) : RefHolder(proxy)
}
extension _SkipTagsInSwift: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func SkipTagsInSwift_copyFromCType(_ handle: _baseRef) -> SkipTagsInSwift {
    if let swift_pointer = smoke_SkipTagsInSwift_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTagsInSwift {
        return re_constructed
    }
    if let swift_pointer = smoke_SkipTagsInSwift_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTagsInSwift {
        return re_constructed
    }
    if let swift_pointer = smoke_SkipTagsInSwift_get_typed(smoke_SkipTagsInSwift_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? SkipTagsInSwift {
        smoke_SkipTagsInSwift_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func SkipTagsInSwift_moveFromCType(_ handle: _baseRef) -> SkipTagsInSwift {
    if let swift_pointer = smoke_SkipTagsInSwift_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTagsInSwift {
        smoke_SkipTagsInSwift_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_SkipTagsInSwift_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTagsInSwift {
        smoke_SkipTagsInSwift_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_SkipTagsInSwift_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? SkipTagsInSwift {
        smoke_SkipTagsInSwift_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func SkipTagsInSwift_copyFromCType(_ handle: _baseRef) -> SkipTagsInSwift? {
    guard handle != 0 else {
        return nil
    }
    return SkipTagsInSwift_moveFromCType(handle) as SkipTagsInSwift
}
internal func SkipTagsInSwift_moveFromCType(_ handle: _baseRef) -> SkipTagsInSwift? {
    guard handle != 0 else {
        return nil
    }
    return SkipTagsInSwift_moveFromCType(handle) as SkipTagsInSwift
}
internal func copyToCType(_ swiftClass: SkipTagsInSwift) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipTagsInSwift) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SkipTagsInSwift?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipTagsInSwift?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
