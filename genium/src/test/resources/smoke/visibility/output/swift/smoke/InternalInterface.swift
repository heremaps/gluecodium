//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InternalInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InternalInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_InternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InternalInterface_release_handle) : RefHolder(proxy)
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
        smoke_InternalInterface_release_handle(c_instance)
    }
}
extension _InternalInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InternalInterfacecopyFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_InternalInterface_release_handle(handle)
        return re_constructed
    }
    return _InternalInterface(cInternalInterface: handle)
}
internal func InternalInterfacemoveFromCType(_ handle: _baseRef) -> InternalInterface {
    return InternalInterfacecopyFromCType(handle)
}
internal func InternalInterfacecopyFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterfacemoveFromCType(handle) as InternalInterface
}
internal func InternalInterfacemoveFromCType(_ handle: _baseRef) -> InternalInterface? {
    return InternalInterfacecopyFromCType(handle)
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