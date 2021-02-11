//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxStruct {
    return AuxStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxStruct {
    defer {
        smoke_AuxStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: AuxStruct) -> RefHolder {
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxStruct_create_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: AuxStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AuxStruct_unwrap_optional_handle(handle)
    return AuxStruct(cHandle: unwrappedHandle) as AuxStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxStruct? {
    defer {
        smoke_AuxStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: AuxStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxStruct_create_optional_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: AuxStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxStruct_release_optional_handle)
}
internal func getRef(_ ref: AuxStruct.ClassInAuxStruct?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AuxStruct_ClassInAuxStruct_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AuxStruct_ClassInAuxStruct_release_handle)
        : RefHolder(handle_copy)
}
internal func foobar_AuxStruct_ClassInAuxStruct_copyFromCType(_ handle: _baseRef) -> AuxStruct.ClassInAuxStruct {
    if let swift_pointer = smoke_AuxStruct_ClassInAuxStruct_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxStruct.ClassInAuxStruct {
        return re_constructed
    }
    let result = AuxStruct.ClassInAuxStruct(cClassInAuxStruct: smoke_AuxStruct_ClassInAuxStruct_copy_handle(handle))
    smoke_AuxStruct_ClassInAuxStruct_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_AuxStruct_ClassInAuxStruct_moveFromCType(_ handle: _baseRef) -> AuxStruct.ClassInAuxStruct {
    if let swift_pointer = smoke_AuxStruct_ClassInAuxStruct_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxStruct.ClassInAuxStruct {
        smoke_AuxStruct_ClassInAuxStruct_release_handle(handle)
        return re_constructed
    }
    let result = AuxStruct.ClassInAuxStruct(cClassInAuxStruct: handle)
    smoke_AuxStruct_ClassInAuxStruct_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_AuxStruct_ClassInAuxStruct_copyFromCType(_ handle: _baseRef) -> AuxStruct.ClassInAuxStruct? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxStruct_ClassInAuxStruct_moveFromCType(handle) as AuxStruct.ClassInAuxStruct
}
internal func foobar_AuxStruct_ClassInAuxStruct_moveFromCType(_ handle: _baseRef) -> AuxStruct.ClassInAuxStruct? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxStruct_ClassInAuxStruct_moveFromCType(handle) as AuxStruct.ClassInAuxStruct
}
internal func foobar_copyToCType(_ swiftClass: AuxStruct.ClassInAuxStruct) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxStruct.ClassInAuxStruct) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: AuxStruct.ClassInAuxStruct?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxStruct.ClassInAuxStruct?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: InterfaceInAuxStruct?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_AuxStruct_InterfaceInAuxStruct_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_AuxStruct_InterfaceInAuxStruct_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_AuxStruct_InterfaceInAuxStruct_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_AuxStruct_InterfaceInAuxStruct_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_AuxStruct_InterfaceInAuxStruct_release_handle) : RefHolder(proxy)
}
internal func foobar_InterfaceInAuxStruct_copyFromCType(_ handle: _baseRef) -> InterfaceInAuxStruct {
    if let swift_pointer = smoke_AuxStruct_InterfaceInAuxStruct_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxStruct {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxStruct_InterfaceInAuxStruct_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxStruct {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxStruct_InterfaceInAuxStruct_get_typed(smoke_AuxStruct_InterfaceInAuxStruct_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceInAuxStruct {
        smoke_AuxStruct_InterfaceInAuxStruct_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InterfaceInAuxStruct_moveFromCType(_ handle: _baseRef) -> InterfaceInAuxStruct {
    if let swift_pointer = smoke_AuxStruct_InterfaceInAuxStruct_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxStruct {
        smoke_AuxStruct_InterfaceInAuxStruct_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxStruct_InterfaceInAuxStruct_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxStruct {
        smoke_AuxStruct_InterfaceInAuxStruct_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxStruct_InterfaceInAuxStruct_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceInAuxStruct {
        smoke_AuxStruct_InterfaceInAuxStruct_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InterfaceInAuxStruct_copyFromCType(_ handle: _baseRef) -> InterfaceInAuxStruct? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InterfaceInAuxStruct_moveFromCType(handle) as InterfaceInAuxStruct
}
internal func foobar_InterfaceInAuxStruct_moveFromCType(_ handle: _baseRef) -> InterfaceInAuxStruct? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InterfaceInAuxStruct_moveFromCType(handle) as InterfaceInAuxStruct
}
internal func foobar_copyToCType(_ swiftClass: InterfaceInAuxStruct) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InterfaceInAuxStruct) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: InterfaceInAuxStruct?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InterfaceInAuxStruct?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxStruct.StructInAuxStruct {
    return AuxStruct.StructInAuxStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxStruct.StructInAuxStruct {
    defer {
        smoke_AuxStruct_StructInAuxStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: AuxStruct.StructInAuxStruct) -> RefHolder {
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxStruct_StructInAuxStruct_create_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: AuxStruct.StructInAuxStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxStruct_StructInAuxStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxStruct.StructInAuxStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AuxStruct_StructInAuxStruct_unwrap_optional_handle(handle)
    return AuxStruct.StructInAuxStruct(cHandle: unwrappedHandle) as AuxStruct.StructInAuxStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxStruct.StructInAuxStruct? {
    defer {
        smoke_AuxStruct_StructInAuxStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: AuxStruct.StructInAuxStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxStruct_StructInAuxStruct_create_optional_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: AuxStruct.StructInAuxStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxStruct_StructInAuxStruct_release_optional_handle)
}
internal func foobar_copyToCType(_ swiftEnum: AuxStruct.EnumInAuxStruct) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: AuxStruct.EnumInAuxStruct) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: AuxStruct.EnumInAuxStruct?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: AuxStruct.EnumInAuxStruct?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> AuxStruct.EnumInAuxStruct {
    return AuxStruct.EnumInAuxStruct(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> AuxStruct.EnumInAuxStruct {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxStruct.EnumInAuxStruct? {
    guard handle != 0 else {
        return nil
    }
    return AuxStruct.EnumInAuxStruct(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxStruct.EnumInAuxStruct? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
