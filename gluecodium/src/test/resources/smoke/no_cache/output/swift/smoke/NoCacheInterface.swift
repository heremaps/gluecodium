//
//
import Foundation
public protocol NoCacheInterface : AnyObject {
    func foo() -> Void
}
internal class _NoCacheInterface: NoCacheInterface {
    let c_instance : _baseRef
    init(cNoCacheInterface: _baseRef) {
        guard cNoCacheInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cNoCacheInterface
    }
    deinit {
        smoke_NoCacheInterface_release_handle(c_instance)
    }
    public func foo() -> Void {
        smoke_NoCacheInterface_foo(self.c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_NoCacheInterface")
internal func _CBridgeInitsmoke_NoCacheInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _NoCacheInterface(cNoCacheInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: NoCacheInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_NoCacheInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_NoCacheInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_NoCacheInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_NoCacheInterface_foo = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! NoCacheInterface
        swift_class.foo()
    }
    let proxy = smoke_NoCacheInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_NoCacheInterface_release_handle) : RefHolder(proxy)
}
extension _NoCacheInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func NoCacheInterface_copyFromCType(_ handle: _baseRef) -> NoCacheInterface {
    if let swift_pointer = smoke_NoCacheInterface_get_typed(smoke_NoCacheInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? NoCacheInterface {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func NoCacheInterface_moveFromCType(_ handle: _baseRef) -> NoCacheInterface {
    if let swift_pointer = smoke_NoCacheInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? NoCacheInterface {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func NoCacheInterface_copyFromCType(_ handle: _baseRef) -> NoCacheInterface? {
    guard handle != 0 else {
        return nil
    }
    return NoCacheInterface_moveFromCType(handle) as NoCacheInterface
}
internal func NoCacheInterface_moveFromCType(_ handle: _baseRef) -> NoCacheInterface? {
    guard handle != 0 else {
        return nil
    }
    return NoCacheInterface_moveFromCType(handle) as NoCacheInterface
}
internal func copyToCType(_ swiftClass: NoCacheInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NoCacheInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: NoCacheInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NoCacheInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
