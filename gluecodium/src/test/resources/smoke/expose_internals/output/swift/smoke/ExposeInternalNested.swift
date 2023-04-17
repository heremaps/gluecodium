//
//
import Foundation
internal class ExposeInternalNested {
    let c_instance : _baseRef
    init(cExposeInternalNested: _baseRef) {
        guard cExposeInternalNested != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExposeInternalNested
    }
    deinit {
        smoke_ExposeInternalNested_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExposeInternalNested_release_handle(c_instance)
    }
}
internal protocol InternalInterface : AnyObject {
}
internal class _InternalInterface: InternalInterface {
    let c_instance : _baseRef
    init(cInternalInterface: _baseRef) {
        guard cInternalInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalInterface
    }
    deinit {
        smoke_ExposeInternalNested_InternalInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExposeInternalNested_InternalInterface_release_handle(c_instance)
    }
}
internal func getRef(_ ref: ExposeInternalNested?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ExposeInternalNested_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ExposeInternalNested_release_handle)
        : RefHolder(handle_copy)
}
extension ExposeInternalNested: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension ExposeInternalNested: Hashable {
    /// :nodoc:
    public static func == (lhs: ExposeInternalNested, rhs: ExposeInternalNested) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ExposeInternalNested_copyFromCType(_ handle: _baseRef) -> ExposeInternalNested {
    if let swift_pointer = smoke_ExposeInternalNested_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalNested {
        return re_constructed
    }
    let result = ExposeInternalNested(cExposeInternalNested: smoke_ExposeInternalNested_copy_handle(handle))
    smoke_ExposeInternalNested_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExposeInternalNested_moveFromCType(_ handle: _baseRef) -> ExposeInternalNested {
    if let swift_pointer = smoke_ExposeInternalNested_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalNested {
        smoke_ExposeInternalNested_release_handle(handle)
        return re_constructed
    }
    let result = ExposeInternalNested(cExposeInternalNested: handle)
    smoke_ExposeInternalNested_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExposeInternalNested_copyFromCType(_ handle: _baseRef) -> ExposeInternalNested? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalNested_moveFromCType(handle) as ExposeInternalNested
}
internal func ExposeInternalNested_moveFromCType(_ handle: _baseRef) -> ExposeInternalNested? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalNested_moveFromCType(handle) as ExposeInternalNested
}
internal func copyToCType(_ swiftClass: ExposeInternalNested) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExposeInternalNested) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExposeInternalNested?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExposeInternalNested?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@_cdecl("_CBridgeInitsmoke_ExposeInternalNested_InternalInterface")
internal func _CBridgeInitsmoke_ExposeInternalNested_InternalInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InternalInterface(cInternalInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InternalInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ExposeInternalNested_InternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ExposeInternalNested_InternalInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ExposeInternalNested_InternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_ExposeInternalNested_InternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ExposeInternalNested_InternalInterface_release_handle) : RefHolder(proxy)
}
extension _InternalInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func InternalInterface_copyFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_ExposeInternalNested_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalNested_InternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalNested_InternalInterface_get_typed(smoke_ExposeInternalNested_InternalInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalInterface {
        smoke_ExposeInternalNested_InternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalInterface_moveFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_ExposeInternalNested_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_ExposeInternalNested_InternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalNested_InternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_ExposeInternalNested_InternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExposeInternalNested_InternalInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalInterface {
        smoke_ExposeInternalNested_InternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalInterface_copyFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterface_moveFromCType(handle) as InternalInterface
}
internal func InternalInterface_moveFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterface_moveFromCType(handle) as InternalInterface
}
internal func copyToCType(_ swiftClass: InternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
