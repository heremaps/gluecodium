//
//
import Foundation
public protocol InterfaceWithStatic : AnyObject {
    var regularProperty: String { get set }
    static var staticProperty: String { get set }
    func regularFunction() -> String
    static func staticFunction() -> String
}
internal class _InterfaceWithStatic: InterfaceWithStatic {
    var regularProperty: String {
        get {
            return moveFromCType(smoke_InterfaceWithStatic_regularProperty_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_InterfaceWithStatic_regularProperty_set(self.c_instance, c_value.ref))
        }
    }
    static var staticProperty: String {
        get {
            return moveFromCType(smoke_InterfaceWithStatic_staticProperty_get())
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_InterfaceWithStatic_staticProperty_set(c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cInterfaceWithStatic: _baseRef) {
        guard cInterfaceWithStatic != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInterfaceWithStatic
    }
    deinit {
        smoke_InterfaceWithStatic_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_InterfaceWithStatic_release_handle(c_instance)
    }
    public func regularFunction() -> String {
        return moveFromCType(smoke_InterfaceWithStatic_regularFunction(self.c_instance))
    }
    public static func staticFunction() -> String {
        return moveFromCType(smoke_InterfaceWithStatic_staticFunction())
    }
}
@_cdecl("_CBridgeInitsmoke_InterfaceWithStatic")
internal func _CBridgeInitsmoke_InterfaceWithStatic(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InterfaceWithStatic(cInterfaceWithStatic: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InterfaceWithStatic?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InterfaceWithStatic_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InterfaceWithStatic_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InterfaceWithStatic_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_InterfaceWithStatic_regularFunction = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InterfaceWithStatic
        return copyToCType(swift_class.regularFunction()).ref
    }
    functions.smoke_InterfaceWithStatic_regularProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InterfaceWithStatic
        return copyToCType(swift_class.regularProperty).ref
    }
    functions.smoke_InterfaceWithStatic_regularProperty_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InterfaceWithStatic
        swift_class.regularProperty = moveFromCType(value)
    }
    let proxy = smoke_InterfaceWithStatic_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InterfaceWithStatic_release_handle) : RefHolder(proxy)
}
extension _InterfaceWithStatic: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func InterfaceWithStatic_copyFromCType(_ handle: _baseRef) -> InterfaceWithStatic {
    if let swift_pointer = smoke_InterfaceWithStatic_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceWithStatic {
        return re_constructed
    }
    if let swift_pointer = smoke_InterfaceWithStatic_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceWithStatic {
        return re_constructed
    }
    if let swift_pointer = smoke_InterfaceWithStatic_get_typed(smoke_InterfaceWithStatic_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceWithStatic {
        smoke_InterfaceWithStatic_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InterfaceWithStatic_moveFromCType(_ handle: _baseRef) -> InterfaceWithStatic {
    if let swift_pointer = smoke_InterfaceWithStatic_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceWithStatic {
        smoke_InterfaceWithStatic_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InterfaceWithStatic_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceWithStatic {
        smoke_InterfaceWithStatic_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InterfaceWithStatic_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceWithStatic {
        smoke_InterfaceWithStatic_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InterfaceWithStatic_copyFromCType(_ handle: _baseRef) -> InterfaceWithStatic? {
    guard handle != 0 else {
        return nil
    }
    return InterfaceWithStatic_moveFromCType(handle) as InterfaceWithStatic
}
internal func InterfaceWithStatic_moveFromCType(_ handle: _baseRef) -> InterfaceWithStatic? {
    guard handle != 0 else {
        return nil
    }
    return InterfaceWithStatic_moveFromCType(handle) as InterfaceWithStatic
}
internal func copyToCType(_ swiftClass: InterfaceWithStatic) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InterfaceWithStatic) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InterfaceWithStatic?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InterfaceWithStatic?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
