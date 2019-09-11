//
//
import Foundation
public protocol Interface : AnyObject {
}
internal class _Interface: Interface {
    let c_instance : _baseRef
    init(cInterface: _baseRef) {
        guard cInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInterface
    }
    deinit {
        package_Interface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitpackage_Interface")
internal func _CBridgeInitpackage_Interface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _Interface(cInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: Interface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = package_Interface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: package_Interface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = package_Interface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = package_Interface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: package_Interface_release_handle) : RefHolder(proxy)
}
extension _Interface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InterfacecopyFromCType(_ handle: _baseRef) -> Interface {
    if let swift_pointer = package_Interface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Interface {
        return re_constructed
    }
    if let swift_pointer = package_Interface_get_typed(package_Interface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Interface {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InterfacemoveFromCType(_ handle: _baseRef) -> Interface {
    if let swift_pointer = package_Interface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Interface {
        package_Interface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = package_Interface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Interface {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InterfacecopyFromCType(_ handle: _baseRef) -> Interface? {
    guard handle != 0 else {
        return nil
    }
    return InterfacemoveFromCType(handle) as Interface
}
internal func InterfacemoveFromCType(_ handle: _baseRef) -> Interface? {
    guard handle != 0 else {
        return nil
    }
    return InterfacemoveFromCType(handle) as Interface
}
internal func copyToCType(_ swiftClass: Interface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Interface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Interface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Interface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
