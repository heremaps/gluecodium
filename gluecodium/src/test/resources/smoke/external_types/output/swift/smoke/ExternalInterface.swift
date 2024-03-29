//
//
import Foundation
public protocol ExternalInterface : AnyObject {
    var someProperty: String { get }
    func someMethod(someParameter: Int8) -> Void
}
internal class _ExternalInterface: ExternalInterface {
    var someProperty: String {
        get {
            let c_result_handle = smoke_ExternalInterface_someProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
    }
    let c_instance : _baseRef
    init(cExternalInterface: _baseRef) {
        guard cExternalInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExternalInterface
    }
    deinit {
        smoke_ExternalInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExternalInterface_release_handle(c_instance)
    }
    public func someMethod(someParameter: Int8) -> Void {
        let c_someParameter = moveToCType(someParameter)
        smoke_ExternalInterface_someMethod(self.c_instance, c_someParameter.ref)
    }
}
public enum SomeEnum : UInt32, CaseIterable, Codable {
    case someValue
}
public struct SomeStruct {
    public var someField: String
    public init(someField: String) {
        self.someField = someField
    }
    internal init(cHandle: _baseRef) {
        someField = moveFromCType(smoke_ExternalInterface_SomeStruct_someField_get(cHandle))
    }
}
@_cdecl("_CBridgeInitsmoke_ExternalInterface")
internal func _CBridgeInitsmoke_ExternalInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ExternalInterface(cExternalInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ExternalInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ExternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ExternalInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ExternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ExternalInterface_someMethod = {(swift_class_pointer, someParameter) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ExternalInterface
        swift_class.someMethod(someParameter: moveFromCType(someParameter))
    }
    functions.smoke_ExternalInterface_someProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ExternalInterface
        return copyToCType(swift_class.someProperty).ref
    }
    let proxy = smoke_ExternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ExternalInterface_release_handle) : RefHolder(proxy)
}
extension _ExternalInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func ExternalInterface_copyFromCType(_ handle: _baseRef) -> ExternalInterface {
    if let swift_pointer = smoke_ExternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ExternalInterface_get_typed(smoke_ExternalInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExternalInterface {
        smoke_ExternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ExternalInterface_moveFromCType(_ handle: _baseRef) -> ExternalInterface {
    if let swift_pointer = smoke_ExternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExternalInterface {
        smoke_ExternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExternalInterface {
        smoke_ExternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ExternalInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExternalInterface {
        smoke_ExternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ExternalInterface_copyFromCType(_ handle: _baseRef) -> ExternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return ExternalInterface_moveFromCType(handle) as ExternalInterface
}
internal func ExternalInterface_moveFromCType(_ handle: _baseRef) -> ExternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return ExternalInterface_moveFromCType(handle) as ExternalInterface
}
internal func copyToCType(_ swiftClass: ExternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct {
    return SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct {
    defer {
        smoke_ExternalInterface_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExternalInterface_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExternalInterface_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ExternalInterface_SomeStruct_unwrap_optional_handle(handle)
    return SomeStruct(cHandle: unwrappedHandle) as SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct? {
    defer {
        smoke_ExternalInterface_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExternalInterface_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExternalInterface_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> SomeEnum {
    return SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
