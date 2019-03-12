//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ObjcChildInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ObjcChildInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ObjcChildInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ObjcChildInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_ObjcChildInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ObjcChildInterface_release_handle) : RefHolder(proxy)
}
@objc
public protocol ObjcChildInterface : ObjcInterface {
}
internal class _ObjcChildInterface: ObjcChildInterface {
    let c_instance : _baseRef
    init(cObjcChildInterface: _baseRef) {
        guard cObjcChildInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cObjcChildInterface
    }
    deinit {
        smoke_ObjcChildInterface_release_handle(c_instance)
    }
}
extension _ObjcChildInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ObjcChildInterfacecopyFromCType(_ handle: _baseRef) -> ObjcChildInterface {
    if let swift_pointer = smoke_ObjcChildInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcChildInterface {
        smoke_ObjcChildInterface_release_handle(handle)
        return re_constructed
    }
    return _ObjcChildInterface(cObjcChildInterface: handle)
}
internal func ObjcChildInterfacemoveFromCType(_ handle: _baseRef) -> ObjcChildInterface {
    return ObjcChildInterfacecopyFromCType(handle)
}
internal func ObjcChildInterfacecopyFromCType(_ handle: _baseRef) -> ObjcChildInterface? {
    guard handle != 0 else {
        return nil
    }
    return ObjcChildInterfacemoveFromCType(handle) as ObjcChildInterface
}
internal func ObjcChildInterfacemoveFromCType(_ handle: _baseRef) -> ObjcChildInterface? {
    return ObjcChildInterfacecopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: ObjcChildInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcChildInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ObjcChildInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcChildInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}