//
//
import Foundation
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
        smoke_PublicInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_PublicInterface_release_handle(c_instance)
    }
}
internal struct InternalStruct {
    internal var fieldOfInternalType: PublicClass.InternalStruct
    internal init(fieldOfInternalType: PublicClass.InternalStruct) {
        self.fieldOfInternalType = fieldOfInternalType
    }
    internal init(cHandle: _baseRef) {
        fieldOfInternalType = moveFromCType(smoke_PublicInterface_InternalStruct_fieldOfInternalType_get(cHandle))
    }
}
@_cdecl("_CBridgeInitsmoke_PublicInterface")
internal func _CBridgeInitsmoke_PublicInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _PublicInterface(cPublicInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
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
extension _PublicInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func PublicInterface_copyFromCType(_ handle: _baseRef) -> PublicInterface {
    if let swift_pointer = smoke_PublicInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PublicInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PublicInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PublicInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PublicInterface_get_typed(smoke_PublicInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? PublicInterface {
        smoke_PublicInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func PublicInterface_moveFromCType(_ handle: _baseRef) -> PublicInterface {
    if let swift_pointer = smoke_PublicInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PublicInterface {
        smoke_PublicInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_PublicInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PublicInterface {
        smoke_PublicInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_PublicInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? PublicInterface {
        smoke_PublicInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func PublicInterface_copyFromCType(_ handle: _baseRef) -> PublicInterface? {
    guard handle != 0 else {
        return nil
    }
    return PublicInterface_moveFromCType(handle) as PublicInterface
}
internal func PublicInterface_moveFromCType(_ handle: _baseRef) -> PublicInterface? {
    guard handle != 0 else {
        return nil
    }
    return PublicInterface_moveFromCType(handle) as PublicInterface
}
internal func copyToCType(_ swiftClass: PublicInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PublicInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PublicInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PublicInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
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
internal func copyToCType(_ swiftType: InternalStruct) -> RefHolder {
    let c_fieldOfInternalType = moveToCType(swiftType.fieldOfInternalType)
    return RefHolder(smoke_PublicInterface_InternalStruct_create_handle(c_fieldOfInternalType.ref))
}
internal func moveToCType(_ swiftType: InternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicInterface_InternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicInterface_InternalStruct_unwrap_optional_handle(handle)
    return InternalStruct(cHandle: unwrappedHandle) as InternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> InternalStruct? {
    defer {
        smoke_PublicInterface_InternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fieldOfInternalType = moveToCType(swiftType.fieldOfInternalType)
    return RefHolder(smoke_PublicInterface_InternalStruct_create_optional_handle(c_fieldOfInternalType.ref))
}
internal func moveToCType(_ swiftType: InternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicInterface_InternalStruct_release_optional_handle)
}
