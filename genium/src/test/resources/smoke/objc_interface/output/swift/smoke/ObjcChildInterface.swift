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
            ? RefHolder(ref: handle_copy, release: smoke_ObjcChildInterface_release)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ObjcChildInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_ObjcChildInterface_createProxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ObjcChildInterface_release) : RefHolder(proxy)
}
@objc
public protocol ObjcChildInterface : ObjcInterface {
}
internal class _ObjcChildInterface: ObjcChildInterface {
    let c_instance : _baseRef
    init?(cObjcChildInterface: _baseRef) {
        guard cObjcChildInterface != 0 else {
            return nil
        }
        c_instance = cObjcChildInterface
    }
    deinit {
        smoke_ObjcChildInterface_release(c_instance)
    }
}
extension _ObjcChildInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
