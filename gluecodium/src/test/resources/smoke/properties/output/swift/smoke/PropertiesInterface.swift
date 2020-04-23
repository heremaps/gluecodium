//
//
import Foundation
public protocol PropertiesInterface : AnyObject {
    var structProperty: ExampleStruct { get set }
}
internal class _PropertiesInterface: PropertiesInterface {
    var structProperty: ExampleStruct {
        get {
            return moveFromCType(smoke_PropertiesInterface_structProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_PropertiesInterface_structProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cPropertiesInterface: _baseRef) {
        guard cPropertiesInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPropertiesInterface
    }
    deinit {
        smoke_PropertiesInterface_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_PropertiesInterface")
internal func _CBridgeInitsmoke_PropertiesInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _PropertiesInterface(cPropertiesInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: PropertiesInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_PropertiesInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_PropertiesInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_PropertiesInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_PropertiesInterface_structProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! PropertiesInterface
        return copyToCType(swift_class.structProperty).ref
    }
    functions.smoke_PropertiesInterface_structProperty_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! PropertiesInterface
        swift_class.structProperty = moveFromCType(newValue)
    }
    let proxy = smoke_PropertiesInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_PropertiesInterface_release_handle) : RefHolder(proxy)
}
extension _PropertiesInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func PropertiesInterface_copyFromCType(_ handle: _baseRef) -> PropertiesInterface {
    if let swift_pointer = smoke_PropertiesInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PropertiesInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PropertiesInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PropertiesInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PropertiesInterface_get_typed(smoke_PropertiesInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? PropertiesInterface {
        smoke_PropertiesInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func PropertiesInterface_moveFromCType(_ handle: _baseRef) -> PropertiesInterface {
    if let swift_pointer = smoke_PropertiesInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PropertiesInterface {
        smoke_PropertiesInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_PropertiesInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PropertiesInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_PropertiesInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? PropertiesInterface {
        smoke_PropertiesInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func PropertiesInterface_copyFromCType(_ handle: _baseRef) -> PropertiesInterface? {
    guard handle != 0 else {
        return nil
    }
    return PropertiesInterface_moveFromCType(handle) as PropertiesInterface
}
internal func PropertiesInterface_moveFromCType(_ handle: _baseRef) -> PropertiesInterface? {
    guard handle != 0 else {
        return nil
    }
    return PropertiesInterface_moveFromCType(handle) as PropertiesInterface
}
internal func copyToCType(_ swiftClass: PropertiesInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PropertiesInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PropertiesInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PropertiesInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
public struct ExampleStruct {
    public var value: Double
    public init(value: Double) {
        self.value = value
    }
    internal init(cHandle: _baseRef) {
        value = moveFromCType(smoke_PropertiesInterface_ExampleStruct_value_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ExampleStruct {
    return ExampleStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ExampleStruct {
    defer {
        smoke_PropertiesInterface_ExampleStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExampleStruct) -> RefHolder {
    let c_value = moveToCType(swiftType.value)
    return RefHolder(smoke_PropertiesInterface_ExampleStruct_create_handle(c_value.ref))
}
internal func moveToCType(_ swiftType: ExampleStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PropertiesInterface_ExampleStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExampleStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PropertiesInterface_ExampleStruct_unwrap_optional_handle(handle)
    return ExampleStruct(cHandle: unwrappedHandle) as ExampleStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ExampleStruct? {
    defer {
        smoke_PropertiesInterface_ExampleStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExampleStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_value = moveToCType(swiftType.value)
    return RefHolder(smoke_PropertiesInterface_ExampleStruct_create_optional_handle(c_value.ref))
}
internal func moveToCType(_ swiftType: ExampleStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PropertiesInterface_ExampleStruct_release_optional_handle)
}
