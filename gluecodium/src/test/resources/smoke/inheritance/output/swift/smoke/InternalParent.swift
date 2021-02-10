//
//
import Foundation
internal class InternalParent {
    let c_instance : _baseRef
    init(cInternalParent: _baseRef) {
        guard cInternalParent != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalParent
    }
    deinit {
        smoke_InternalParent_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_InternalParent_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_InternalParent")
internal func _CBridgeInitsmoke_InternalParent(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = InternalParent(cInternalParent: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InternalParent?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalParent_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalParent_release_handle)
        : RefHolder(handle_copy)
}
extension InternalParent: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension InternalParent: Hashable {
    // :nodoc:
    public static func == (lhs: InternalParent, rhs: InternalParent) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_InternalParent_copyFromCType(_ handle: _baseRef) -> InternalParent {
    if let swift_pointer = smoke_InternalParent_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalParent {
        return re_constructed
    }
    if let swift_pointer = smoke_InternalParent_get_typed(smoke_InternalParent_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalParent {
        smoke_InternalParent_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InternalParent_moveFromCType(_ handle: _baseRef) -> InternalParent {
    if let swift_pointer = smoke_InternalParent_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalParent {
        smoke_InternalParent_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InternalParent_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalParent {
        smoke_InternalParent_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InternalParent_copyFromCType(_ handle: _baseRef) -> InternalParent? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InternalParent_moveFromCType(handle) as InternalParent
}
internal func foobar_InternalParent_moveFromCType(_ handle: _baseRef) -> InternalParent? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InternalParent_moveFromCType(handle) as InternalParent
}
internal func foobar_copyToCType(_ swiftClass: InternalParent) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InternalParent) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: InternalParent?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InternalParent?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
