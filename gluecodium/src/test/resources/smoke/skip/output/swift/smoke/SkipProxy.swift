//
//
import Foundation
public protocol SkipProxy : AnyObject {
    var skippedInJava: String { get set }
    var skippedInDart: Float { get set }
    func notInJava(input: String) -> String
    func notInDart(input: Float) -> Float
}
internal class _SkipProxy: SkipProxy {
    var skippedInJava: String {
        get {
            return moveFromCType(smoke_SkipProxy_skippedInJava_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_SkipProxy_skippedInJava_set(self.c_instance, c_value.ref))
        }
    }
    var skippedInDart: Float {
        get {
            return moveFromCType(smoke_SkipProxy_skippedInDart_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_SkipProxy_skippedInDart_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cSkipProxy: _baseRef) {
        guard cSkipProxy != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSkipProxy
    }
    deinit {
        smoke_SkipProxy_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SkipProxy_release_handle(c_instance)
    }
    public func notInJava(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SkipProxy_notInJava(self.c_instance, c_input.ref))
    }
    public func notInDart(input: Float) -> Float {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SkipProxy_notInDart(self.c_instance, c_input.ref))
    }
}
@_cdecl("_CBridgeInitsmoke_SkipProxy")
internal func _CBridgeInitsmoke_SkipProxy(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _SkipProxy(cSkipProxy: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: SkipProxy?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_SkipProxy_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_SkipProxy_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_SkipProxy_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_SkipProxy_notInJava = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipProxy
        return copyToCType(swift_class.notInJava(input: moveFromCType(input))).ref
    }
    functions.smoke_SkipProxy_notInDart = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipProxy
        return copyToCType(swift_class.notInDart(input: moveFromCType(input))).ref
    }
    functions.smoke_SkipProxy_skippedInJava_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipProxy
        return copyToCType(swift_class.skippedInJava).ref
    }
    functions.smoke_SkipProxy_skippedInJava_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipProxy
        swift_class.skippedInJava = moveFromCType(value)
    }
    functions.smoke_SkipProxy_skippedInDart_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipProxy
        return copyToCType(swift_class.skippedInDart).ref
    }
    functions.smoke_SkipProxy_skippedInDart_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SkipProxy
        swift_class.skippedInDart = moveFromCType(value)
    }
    let proxy = smoke_SkipProxy_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_SkipProxy_release_handle) : RefHolder(proxy)
}
extension _SkipProxy: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SkipProxy_copyFromCType(_ handle: _baseRef) -> SkipProxy {
    if let swift_pointer = smoke_SkipProxy_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipProxy {
        return re_constructed
    }
    if let swift_pointer = smoke_SkipProxy_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipProxy {
        return re_constructed
    }
    if let swift_pointer = smoke_SkipProxy_get_typed(smoke_SkipProxy_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? SkipProxy {
        smoke_SkipProxy_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func SkipProxy_moveFromCType(_ handle: _baseRef) -> SkipProxy {
    if let swift_pointer = smoke_SkipProxy_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipProxy {
        smoke_SkipProxy_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_SkipProxy_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipProxy {
        smoke_SkipProxy_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_SkipProxy_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? SkipProxy {
        smoke_SkipProxy_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func SkipProxy_copyFromCType(_ handle: _baseRef) -> SkipProxy? {
    guard handle != 0 else {
        return nil
    }
    return SkipProxy_moveFromCType(handle) as SkipProxy
}
internal func SkipProxy_moveFromCType(_ handle: _baseRef) -> SkipProxy? {
    guard handle != 0 else {
        return nil
    }
    return SkipProxy_moveFromCType(handle) as SkipProxy
}
internal func copyToCType(_ swiftClass: SkipProxy) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipProxy) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SkipProxy?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipProxy?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
