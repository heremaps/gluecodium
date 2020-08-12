//
//
import Foundation
public protocol EquatableInterface : AnyObject {
}
internal class _EquatableInterface: EquatableInterface {
    let c_instance : _baseRef
    init(cEquatableInterface: _baseRef) {
        guard cEquatableInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEquatableInterface
    }
    deinit {
        smoke_EquatableInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EquatableInterface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_EquatableInterface")
internal func _CBridgeInitsmoke_EquatableInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _EquatableInterface(cEquatableInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: EquatableInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_EquatableInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_EquatableInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_EquatableInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_EquatableInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_EquatableInterface_release_handle) : RefHolder(proxy)
}
extension _EquatableInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
public func ==(lhs: EquatableInterface, rhs: EquatableInterface) -> Bool {
    guard let lhsImpl = lhs as? _EquatableInterface else { return lhs === rhs }
    guard let rhsImpl = rhs as? _EquatableInterface else { return lhs === rhs }
    return lhsImpl == rhsImpl
}
extension _EquatableInterface: Hashable {
    public static func == (lhs: _EquatableInterface, rhs: _EquatableInterface) -> Bool {
        return smoke_EquatableInterface_equal(lhs.c_handle, rhs.c_handle)
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(smoke_EquatableInterface_hash(c_handle))
    }
}
internal func EquatableInterface_copyFromCType(_ handle: _baseRef) -> EquatableInterface {
    if let swift_pointer = smoke_EquatableInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EquatableInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_EquatableInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EquatableInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_EquatableInterface_get_typed(smoke_EquatableInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? EquatableInterface {
        smoke_EquatableInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func EquatableInterface_moveFromCType(_ handle: _baseRef) -> EquatableInterface {
    if let swift_pointer = smoke_EquatableInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EquatableInterface {
        smoke_EquatableInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_EquatableInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EquatableInterface {
        smoke_EquatableInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_EquatableInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? EquatableInterface {
        smoke_EquatableInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func EquatableInterface_copyFromCType(_ handle: _baseRef) -> EquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return EquatableInterface_moveFromCType(handle) as EquatableInterface
}
internal func EquatableInterface_moveFromCType(_ handle: _baseRef) -> EquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return EquatableInterface_moveFromCType(handle) as EquatableInterface
}
internal func copyToCType(_ swiftClass: EquatableInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EquatableInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EquatableInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EquatableInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
