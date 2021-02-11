//
//
import Foundation
internal func getRef(_ ref: AuxClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AuxClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AuxClass_release_handle)
        : RefHolder(handle_copy)
}
internal func foobar_AuxClass_copyFromCType(_ handle: _baseRef) -> AuxClass {
    if let swift_pointer = smoke_AuxClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxClass {
        return re_constructed
    }
    let result = AuxClass(cAuxClass: smoke_AuxClass_copy_handle(handle))
    smoke_AuxClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_AuxClass_moveFromCType(_ handle: _baseRef) -> AuxClass {
    if let swift_pointer = smoke_AuxClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxClass {
        smoke_AuxClass_release_handle(handle)
        return re_constructed
    }
    let result = AuxClass(cAuxClass: handle)
    smoke_AuxClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_AuxClass_copyFromCType(_ handle: _baseRef) -> AuxClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxClass_moveFromCType(handle) as AuxClass
}
internal func foobar_AuxClass_moveFromCType(_ handle: _baseRef) -> AuxClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxClass_moveFromCType(handle) as AuxClass
}
internal func foobar_copyToCType(_ swiftClass: AuxClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: AuxClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: AuxClass.ClassInAuxClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AuxClass_ClassInAuxClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AuxClass_ClassInAuxClass_release_handle)
        : RefHolder(handle_copy)
}
internal func foobar_AuxClass_ClassInAuxClass_copyFromCType(_ handle: _baseRef) -> AuxClass.ClassInAuxClass {
    if let swift_pointer = smoke_AuxClass_ClassInAuxClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxClass.ClassInAuxClass {
        return re_constructed
    }
    let result = AuxClass.ClassInAuxClass(cClassInAuxClass: smoke_AuxClass_ClassInAuxClass_copy_handle(handle))
    smoke_AuxClass_ClassInAuxClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_AuxClass_ClassInAuxClass_moveFromCType(_ handle: _baseRef) -> AuxClass.ClassInAuxClass {
    if let swift_pointer = smoke_AuxClass_ClassInAuxClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxClass.ClassInAuxClass {
        smoke_AuxClass_ClassInAuxClass_release_handle(handle)
        return re_constructed
    }
    let result = AuxClass.ClassInAuxClass(cClassInAuxClass: handle)
    smoke_AuxClass_ClassInAuxClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_AuxClass_ClassInAuxClass_copyFromCType(_ handle: _baseRef) -> AuxClass.ClassInAuxClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxClass_ClassInAuxClass_moveFromCType(handle) as AuxClass.ClassInAuxClass
}
internal func foobar_AuxClass_ClassInAuxClass_moveFromCType(_ handle: _baseRef) -> AuxClass.ClassInAuxClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxClass_ClassInAuxClass_moveFromCType(handle) as AuxClass.ClassInAuxClass
}
internal func foobar_copyToCType(_ swiftClass: AuxClass.ClassInAuxClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxClass.ClassInAuxClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: AuxClass.ClassInAuxClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxClass.ClassInAuxClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: InterfaceInAuxClass?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_AuxClass_InterfaceInAuxClass_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_AuxClass_InterfaceInAuxClass_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_AuxClass_InterfaceInAuxClass_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_AuxClass_InterfaceInAuxClass_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_AuxClass_InterfaceInAuxClass_release_handle) : RefHolder(proxy)
}
internal func foobar_InterfaceInAuxClass_copyFromCType(_ handle: _baseRef) -> InterfaceInAuxClass {
    if let swift_pointer = smoke_AuxClass_InterfaceInAuxClass_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxClass {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxClass_InterfaceInAuxClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxClass {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxClass_InterfaceInAuxClass_get_typed(smoke_AuxClass_InterfaceInAuxClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceInAuxClass {
        smoke_AuxClass_InterfaceInAuxClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InterfaceInAuxClass_moveFromCType(_ handle: _baseRef) -> InterfaceInAuxClass {
    if let swift_pointer = smoke_AuxClass_InterfaceInAuxClass_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxClass {
        smoke_AuxClass_InterfaceInAuxClass_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxClass_InterfaceInAuxClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxClass {
        smoke_AuxClass_InterfaceInAuxClass_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxClass_InterfaceInAuxClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceInAuxClass {
        smoke_AuxClass_InterfaceInAuxClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InterfaceInAuxClass_copyFromCType(_ handle: _baseRef) -> InterfaceInAuxClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InterfaceInAuxClass_moveFromCType(handle) as InterfaceInAuxClass
}
internal func foobar_InterfaceInAuxClass_moveFromCType(_ handle: _baseRef) -> InterfaceInAuxClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InterfaceInAuxClass_moveFromCType(handle) as InterfaceInAuxClass
}
internal func foobar_copyToCType(_ swiftClass: InterfaceInAuxClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InterfaceInAuxClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: InterfaceInAuxClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InterfaceInAuxClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxClass.StructInAuxClass {
    return AuxClass.StructInAuxClass(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxClass.StructInAuxClass {
    defer {
        smoke_AuxClass_StructInAuxClass_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: AuxClass.StructInAuxClass) -> RefHolder {
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxClass_StructInAuxClass_create_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: AuxClass.StructInAuxClass) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxClass_StructInAuxClass_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxClass.StructInAuxClass? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AuxClass_StructInAuxClass_unwrap_optional_handle(handle)
    return AuxClass.StructInAuxClass(cHandle: unwrappedHandle) as AuxClass.StructInAuxClass
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxClass.StructInAuxClass? {
    defer {
        smoke_AuxClass_StructInAuxClass_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: AuxClass.StructInAuxClass?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxClass_StructInAuxClass_create_optional_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: AuxClass.StructInAuxClass?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxClass_StructInAuxClass_release_optional_handle)
}
internal func foobar_copyToCType(_ swiftEnum: AuxClass.EnumInAuxClass) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: AuxClass.EnumInAuxClass) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: AuxClass.EnumInAuxClass?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: AuxClass.EnumInAuxClass?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> AuxClass.EnumInAuxClass {
    return AuxClass.EnumInAuxClass(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> AuxClass.EnumInAuxClass {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AuxClass.EnumInAuxClass? {
    guard handle != 0 else {
        return nil
    }
    return AuxClass.EnumInAuxClass(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AuxClass.EnumInAuxClass? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
