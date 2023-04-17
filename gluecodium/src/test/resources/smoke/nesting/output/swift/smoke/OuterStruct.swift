//
//
import Foundation
public struct OuterStruct {
    public var field: String
    public init(field: String) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_OuterStruct_field_get(cHandle))
    }
    public enum InnerEnum : UInt32, CaseIterable, Codable {
        case foo
        case bar
    }
    public typealias TypeAlias = OuterStruct.InnerEnum
    public typealias InstantiationError = OuterStruct.TypeAlias
    public typealias InnerLambda = () -> Void
    public struct InnerStruct {
        public var otherField: [Date]
        public init(otherField: [Date]) {
            self.otherField = otherField
        }
        internal init(cHandle: _baseRef) {
            otherField = foobar_moveFromCType(smoke_OuterStruct_InnerStruct_otherField_get(cHandle))
        }
        public func doSomething() -> Void {
            let c_self_handle = moveToCType(self)
            smoke_OuterStruct_InnerStruct_doSomething(c_self_handle.ref)
        }
    }
    public class InnerClass {
        let c_instance : _baseRef
        init(cInnerClass: _baseRef) {
            guard cInnerClass != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = cInnerClass
        }
        deinit {
            smoke_OuterStruct_InnerClass_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_OuterStruct_InnerClass_release_handle(c_instance)
        }
        public func fooBar() -> Set<Locale> {
            let c_result_handle = smoke_OuterStruct_InnerClass_fooBar(self.c_instance)
            return foobar_moveFromCType(c_result_handle)
        }
    }
    public func doNothing() throws -> Void {
        let c_self_handle = moveToCType(self)
        let RESULT = smoke_OuterStruct_doNothing(c_self_handle.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as OuterStruct.InstantiationError
        }
    }
}
public protocol InnerInterface : AnyObject {
    func barBaz() -> [String: Data]
}
internal class _InnerInterface: InnerInterface {
    let c_instance : _baseRef
    init(cInnerInterface: _baseRef) {
        guard cInnerInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInnerInterface
    }
    deinit {
        smoke_OuterStruct_InnerInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterStruct_InnerInterface_release_handle(c_instance)
    }
    public func barBaz() -> [String: Data] {
        let c_result_handle = smoke_OuterStruct_InnerInterface_barBaz(self.c_instance)
        return foobar_moveFromCType(c_result_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStruct {
    return OuterStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStruct {
    defer {
        smoke_OuterStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStruct) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_OuterStruct_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: OuterStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_OuterStruct_unwrap_optional_handle(handle)
    return OuterStruct(cHandle: unwrappedHandle) as OuterStruct
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStruct? {
    defer {
        smoke_OuterStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_OuterStruct_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: OuterStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStruct_release_optional_handle)
}
internal func getRef(_ ref: OuterStruct.InnerClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_OuterStruct_InnerClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_OuterStruct_InnerClass_release_handle)
        : RefHolder(handle_copy)
}
extension OuterStruct.InnerClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension OuterStruct.InnerClass: Hashable {
    /// :nodoc:
    public static func == (lhs: OuterStruct.InnerClass, rhs: OuterStruct.InnerClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func OuterStruct_InnerClass_copyFromCType(_ handle: _baseRef) -> OuterStruct.InnerClass {
    if let swift_pointer = smoke_OuterStruct_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterStruct.InnerClass {
        return re_constructed
    }
    let result = OuterStruct.InnerClass(cInnerClass: smoke_OuterStruct_InnerClass_copy_handle(handle))
    smoke_OuterStruct_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func OuterStruct_InnerClass_moveFromCType(_ handle: _baseRef) -> OuterStruct.InnerClass {
    if let swift_pointer = smoke_OuterStruct_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterStruct.InnerClass {
        smoke_OuterStruct_InnerClass_release_handle(handle)
        return re_constructed
    }
    let result = OuterStruct.InnerClass(cInnerClass: handle)
    smoke_OuterStruct_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func OuterStruct_InnerClass_copyFromCType(_ handle: _baseRef) -> OuterStruct.InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return OuterStruct_InnerClass_moveFromCType(handle) as OuterStruct.InnerClass
}
internal func OuterStruct_InnerClass_moveFromCType(_ handle: _baseRef) -> OuterStruct.InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return OuterStruct_InnerClass_moveFromCType(handle) as OuterStruct.InnerClass
}
internal func copyToCType(_ swiftClass: OuterStruct.InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterStruct.InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: OuterStruct.InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterStruct.InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@_cdecl("_CBridgeInitsmoke_OuterStruct_InnerInterface")
internal func _CBridgeInitsmoke_OuterStruct_InnerInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InnerInterface(cInnerInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InnerInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_OuterStruct_InnerInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_OuterStruct_InnerInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_OuterStruct_InnerInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_OuterStruct_InnerInterface_barBaz = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InnerInterface
        return foobar_copyToCType(swift_class.barBaz()).ref
    }
    let proxy = smoke_OuterStruct_InnerInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_OuterStruct_InnerInterface_release_handle) : RefHolder(proxy)
}
extension _InnerInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterStruct_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterStruct_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterStruct_InnerInterface_get_typed(smoke_OuterStruct_InnerInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterStruct_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterStruct_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterStruct_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterStruct_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterStruct_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterStruct_InnerInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterStruct_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface? {
    guard handle != 0 else {
        return nil
    }
    return InnerInterface_moveFromCType(handle) as InnerInterface
}
internal func InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface? {
    guard handle != 0 else {
        return nil
    }
    return InnerInterface_moveFromCType(handle) as InnerInterface
}
internal func copyToCType(_ swiftClass: InnerInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InnerInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InnerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InnerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStruct.InnerStruct {
    return OuterStruct.InnerStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStruct.InnerStruct {
    defer {
        smoke_OuterStruct_InnerStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStruct.InnerStruct) -> RefHolder {
    let c_otherField = foobar_moveToCType(swiftType.otherField)
    return RefHolder(smoke_OuterStruct_InnerStruct_create_handle(c_otherField.ref))
}
internal func moveToCType(_ swiftType: OuterStruct.InnerStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStruct_InnerStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStruct.InnerStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_OuterStruct_InnerStruct_unwrap_optional_handle(handle)
    return OuterStruct.InnerStruct(cHandle: unwrappedHandle) as OuterStruct.InnerStruct
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStruct.InnerStruct? {
    defer {
        smoke_OuterStruct_InnerStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStruct.InnerStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_otherField = foobar_moveToCType(swiftType.otherField)
    return RefHolder(smoke_OuterStruct_InnerStruct_create_optional_handle(c_otherField.ref))
}
internal func moveToCType(_ swiftType: OuterStruct.InnerStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStruct_InnerStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: OuterStruct.InnerEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: OuterStruct.InnerEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: OuterStruct.InnerEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: OuterStruct.InnerEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> OuterStruct.InnerEnum {
    return OuterStruct.InnerEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> OuterStruct.InnerEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStruct.InnerEnum? {
    guard handle != 0 else {
        return nil
    }
    return OuterStruct.InnerEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStruct.InnerEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension OuterStruct.InnerEnum : Error {
}
