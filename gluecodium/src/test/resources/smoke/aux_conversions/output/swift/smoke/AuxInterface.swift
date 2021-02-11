//
//
import Foundation
internal func getRef(_ ref: AuxInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_AuxInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_AuxInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_AuxInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_AuxInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_AuxInterface_release_handle) : RefHolder(proxy)
}
internal func foobar_AuxInterface_copyFromCType(_ handle: _baseRef) -> AuxInterface {
    if let swift_pointer = smoke_AuxInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_get_typed(smoke_AuxInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? AuxInterface {
        smoke_AuxInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_AuxInterface_moveFromCType(_ handle: _baseRef) -> AuxInterface {
    if let swift_pointer = smoke_AuxInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxInterface {
        smoke_AuxInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AuxInterface {
        smoke_AuxInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? AuxInterface {
        smoke_AuxInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_AuxInterface_copyFromCType(_ handle: _baseRef) -> AuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxInterface_moveFromCType(handle) as AuxInterface
}
internal func foobar_AuxInterface_moveFromCType(_ handle: _baseRef) -> AuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_AuxInterface_moveFromCType(handle) as AuxInterface
}
internal func foobar_copyToCType(_ swiftClass: AuxInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: AuxInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: AuxInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: ClassInAuxInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AuxInterface_ClassInAuxInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AuxInterface_ClassInAuxInterface_release_handle)
        : RefHolder(handle_copy)
}
internal func foobar_ClassInAuxInterface_copyFromCType(_ handle: _baseRef) -> ClassInAuxInterface {
    if let swift_pointer = smoke_AuxInterface_ClassInAuxInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ClassInAuxInterface {
        return re_constructed
    }
    let result = ClassInAuxInterface(cClassInAuxInterface: smoke_AuxInterface_ClassInAuxInterface_copy_handle(handle))
    smoke_AuxInterface_ClassInAuxInterface_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_ClassInAuxInterface_moveFromCType(_ handle: _baseRef) -> ClassInAuxInterface {
    if let swift_pointer = smoke_AuxInterface_ClassInAuxInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ClassInAuxInterface {
        smoke_AuxInterface_ClassInAuxInterface_release_handle(handle)
        return re_constructed
    }
    let result = ClassInAuxInterface(cClassInAuxInterface: handle)
    smoke_AuxInterface_ClassInAuxInterface_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_ClassInAuxInterface_copyFromCType(_ handle: _baseRef) -> ClassInAuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ClassInAuxInterface_moveFromCType(handle) as ClassInAuxInterface
}
internal func foobar_ClassInAuxInterface_moveFromCType(_ handle: _baseRef) -> ClassInAuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ClassInAuxInterface_moveFromCType(handle) as ClassInAuxInterface
}
internal func foobar_copyToCType(_ swiftClass: ClassInAuxInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ClassInAuxInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: ClassInAuxInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ClassInAuxInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: InterfaceInAuxInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_AuxInterface_InterfaceInAuxInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_AuxInterface_InterfaceInAuxInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_AuxInterface_InterfaceInAuxInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_AuxInterface_InterfaceInAuxInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_AuxInterface_InterfaceInAuxInterface_release_handle) : RefHolder(proxy)
}
internal func foobar_InterfaceInAuxInterface_copyFromCType(_ handle: _baseRef) -> InterfaceInAuxInterface {
    if let swift_pointer = smoke_AuxInterface_InterfaceInAuxInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_InterfaceInAuxInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_InterfaceInAuxInterface_get_typed(smoke_AuxInterface_InterfaceInAuxInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceInAuxInterface {
        smoke_AuxInterface_InterfaceInAuxInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InterfaceInAuxInterface_moveFromCType(_ handle: _baseRef) -> InterfaceInAuxInterface {
    if let swift_pointer = smoke_AuxInterface_InterfaceInAuxInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxInterface {
        smoke_AuxInterface_InterfaceInAuxInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_InterfaceInAuxInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceInAuxInterface {
        smoke_AuxInterface_InterfaceInAuxInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AuxInterface_InterfaceInAuxInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InterfaceInAuxInterface {
        smoke_AuxInterface_InterfaceInAuxInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InterfaceInAuxInterface_copyFromCType(_ handle: _baseRef) -> InterfaceInAuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InterfaceInAuxInterface_moveFromCType(handle) as InterfaceInAuxInterface
}
internal func foobar_InterfaceInAuxInterface_moveFromCType(_ handle: _baseRef) -> InterfaceInAuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InterfaceInAuxInterface_moveFromCType(handle) as InterfaceInAuxInterface
}
internal func foobar_copyToCType(_ swiftClass: InterfaceInAuxInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InterfaceInAuxInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: InterfaceInAuxInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InterfaceInAuxInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructInAuxInterface {
    return StructInAuxInterface(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructInAuxInterface {
    defer {
        smoke_AuxInterface_StructInAuxInterface_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructInAuxInterface) -> RefHolder {
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxInterface_StructInAuxInterface_create_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: StructInAuxInterface) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxInterface_StructInAuxInterface_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructInAuxInterface? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AuxInterface_StructInAuxInterface_unwrap_optional_handle(handle)
    return StructInAuxInterface(cHandle: unwrappedHandle) as StructInAuxInterface
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructInAuxInterface? {
    defer {
        smoke_AuxInterface_StructInAuxInterface_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructInAuxInterface?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooBar = moveToCType(swiftType.fooBar)
    return RefHolder(smoke_AuxInterface_StructInAuxInterface_create_optional_handle(c_fooBar.ref))
}
internal func foobar_moveToCType(_ swiftType: StructInAuxInterface?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_AuxInterface_StructInAuxInterface_release_optional_handle)
}
internal func foobar_copyToCType(_ swiftEnum: EnumInAuxInterface) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: EnumInAuxInterface) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: EnumInAuxInterface?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: EnumInAuxInterface?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> EnumInAuxInterface {
    return EnumInAuxInterface(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> EnumInAuxInterface {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> EnumInAuxInterface? {
    guard handle != 0 else {
        return nil
    }
    return EnumInAuxInterface(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> EnumInAuxInterface? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
