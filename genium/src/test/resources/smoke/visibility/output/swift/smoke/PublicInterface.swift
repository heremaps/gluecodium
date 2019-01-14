//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: PublicInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_PublicInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_PublicInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_PublicInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_PublicInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_PublicInterface_release_handle) : RefHolder(proxy)
}
public protocol PublicInterface : AnyObject {
}
internal class _PublicInterface: PublicInterface {
    let c_instance : _baseRef
    init(cPublicInterface: _baseRef) {
        guard cPublicInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPublicInterface
    }
    deinit {
        smoke_PublicInterface_release_handle(c_instance)
    }
}
extension _PublicInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func PublicInterfacecopyFromCType(_ handle: _baseRef) -> PublicInterface {
    if let swift_pointer = smoke_PublicInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PublicInterface {
        smoke_PublicInterface_release_handle(handle)
        return re_constructed
    }
    return _PublicInterface(cPublicInterface: handle)
}
internal func PublicInterfacemoveFromCType(_ handle: _baseRef) -> PublicInterface {
    return PublicInterfacecopyFromCType(handle)
}
internal func PublicInterfacecopyFromCType(_ handle: _baseRef) -> PublicInterface? {
    guard handle != 0 else {
        return nil
    }
    return PublicInterfacemoveFromCType(handle) as PublicInterface
}
internal func PublicInterfacemoveFromCType(_ handle: _baseRef) -> PublicInterface? {
    return PublicInterfacecopyFromCType(handle)
}
internal struct InternalStruct {
    public var stringField: String
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_PublicInterface_InternalStruct_stringField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let stringField_handle = stringField
        return smoke_PublicInterface_InternalStruct_create_handle(stringField_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> InternalStruct {
    return InternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InternalStruct {
    defer {
        smoke_PublicInterface_InternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}