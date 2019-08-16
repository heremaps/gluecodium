//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
@_cdecl("_CBridgeInitsmoke_PlatformNamesListener")
internal func _CBridgeInitsmoke_PlatformNamesListener(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _bazListener(cbazListener: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: bazListener?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_PlatformNamesListener_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_PlatformNamesListener_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_PlatformNamesListener_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_PlatformNamesListener_BazMethod = {(swift_class_pointer, BazParameter) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! bazListener
        swift_class.BazMethod(moveFromCType(BazParameter))
    }
    let proxy = smoke_PlatformNamesListener_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_PlatformNamesListener_release_handle) : RefHolder(proxy)
}
public protocol bazListener : AnyObject {
    func BazMethod(_ BazParameter: String) -> Void
}
internal class _bazListener: bazListener {
    let c_instance : _baseRef
    init(cbazListener: _baseRef) {
        guard cbazListener != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cbazListener
    }
    deinit {
        smoke_PlatformNamesListener_release_handle(c_instance)
    }
    public func BazMethod(_ BazParameter: String) -> Void {
        let c_BazParameter = moveToCType(BazParameter)
        return moveFromCType(smoke_PlatformNamesListener_BazMethod(self.c_instance, c_BazParameter.ref))
    }
}
extension _bazListener: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func bazListenercopyFromCType(_ handle: _baseRef) -> bazListener {
    if let swift_pointer = smoke_PlatformNamesListener_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? bazListener {
        return re_constructed
    }
    if let swift_pointer = smoke_PlatformNamesListener_get_typed(smoke_PlatformNamesListener_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? bazListener {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func bazListenermoveFromCType(_ handle: _baseRef) -> bazListener {
    if let swift_pointer = smoke_PlatformNamesListener_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? bazListener {
        smoke_PlatformNamesListener_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_PlatformNamesListener_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? bazListener {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func bazListenercopyFromCType(_ handle: _baseRef) -> bazListener? {
    guard handle != 0 else {
        return nil
    }
    return bazListenermoveFromCType(handle) as bazListener
}
internal func bazListenermoveFromCType(_ handle: _baseRef) -> bazListener? {
    guard handle != 0 else {
        return nil
    }
    return bazListenermoveFromCType(handle) as bazListener
}
internal func copyToCType(_ swiftClass: bazListener) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: bazListener) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: bazListener?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: bazListener?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}