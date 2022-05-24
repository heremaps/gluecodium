//
//
import Foundation
public class InternalAttributes {
    internal typealias InternalError = String
    internal typealias InternalLambda = () -> Void
    let c_instance : _baseRef
    init(cInternalAttributes: _baseRef) {
        guard cInternalAttributes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalAttributes
    }
    deinit {
        smoke_InternalAttributes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_InternalAttributes_release_handle(c_instance)
    }
    internal class InternalClass {
        let c_instance : _baseRef
        init(cInternalClass: _baseRef) {
            guard cInternalClass != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = cInternalClass
        }
        deinit {
            smoke_InternalAttributes_InternalClass_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_InternalAttributes_InternalClass_release_handle(c_instance)
        }
    }
    internal enum InternalEnum : UInt32, CaseIterable, Codable {
        case foo
    }
    internal struct InternalStruct {
        public var stringField: String
        internal init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_InternalAttributes_InternalStruct_stringField_get(cHandle))
        }
    }
}
internal protocol InternalInterface : AnyObject {
}
internal class _InternalInterface: InternalInterface {
    let c_instance : _baseRef
    init(cInternalInterface: _baseRef) {
        guard cInternalInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalInterface
    }
    deinit {
        smoke_InternalAttributes_InternalInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_InternalAttributes_InternalInterface_release_handle(c_instance)
    }
}
internal func getRef(_ ref: InternalAttributes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalAttributes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalAttributes_release_handle)
        : RefHolder(handle_copy)
}
extension InternalAttributes: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension InternalAttributes: Hashable {
    /// :nodoc:
    public static func == (lhs: InternalAttributes, rhs: InternalAttributes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func InternalAttributes_copyFromCType(_ handle: _baseRef) -> InternalAttributes {
    if let swift_pointer = smoke_InternalAttributes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalAttributes {
        return re_constructed
    }
    let result = InternalAttributes(cInternalAttributes: smoke_InternalAttributes_copy_handle(handle))
    smoke_InternalAttributes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InternalAttributes_moveFromCType(_ handle: _baseRef) -> InternalAttributes {
    if let swift_pointer = smoke_InternalAttributes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalAttributes {
        smoke_InternalAttributes_release_handle(handle)
        return re_constructed
    }
    let result = InternalAttributes(cInternalAttributes: handle)
    smoke_InternalAttributes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InternalAttributes_copyFromCType(_ handle: _baseRef) -> InternalAttributes? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes_moveFromCType(handle) as InternalAttributes
}
internal func InternalAttributes_moveFromCType(_ handle: _baseRef) -> InternalAttributes? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes_moveFromCType(handle) as InternalAttributes
}
internal func copyToCType(_ swiftClass: InternalAttributes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalAttributes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalAttributes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalAttributes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: InternalAttributes.InternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalAttributes_InternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalAttributes_InternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension InternalAttributes.InternalClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension InternalAttributes.InternalClass: Hashable {
    /// :nodoc:
    public static func == (lhs: InternalAttributes.InternalClass, rhs: InternalAttributes.InternalClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func InternalAttributes_InternalClass_copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalClass {
    if let swift_pointer = smoke_InternalAttributes_InternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalAttributes.InternalClass {
        return re_constructed
    }
    let result = InternalAttributes.InternalClass(cInternalClass: smoke_InternalAttributes_InternalClass_copy_handle(handle))
    smoke_InternalAttributes_InternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InternalAttributes_InternalClass_moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalClass {
    if let swift_pointer = smoke_InternalAttributes_InternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalAttributes.InternalClass {
        smoke_InternalAttributes_InternalClass_release_handle(handle)
        return re_constructed
    }
    let result = InternalAttributes.InternalClass(cInternalClass: handle)
    smoke_InternalAttributes_InternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InternalAttributes_InternalClass_copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes_InternalClass_moveFromCType(handle) as InternalAttributes.InternalClass
}
internal func InternalAttributes_InternalClass_moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes_InternalClass_moveFromCType(handle) as InternalAttributes.InternalClass
}
internal func copyToCType(_ swiftClass: InternalAttributes.InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalAttributes.InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalAttributes.InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalAttributes.InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@_cdecl("_CBridgeInitsmoke_InternalAttributes_InternalInterface")
internal func _CBridgeInitsmoke_InternalAttributes_InternalInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InternalInterface(cInternalInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InternalInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InternalAttributes_InternalInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InternalAttributes_InternalInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InternalAttributes_InternalInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_InternalAttributes_InternalInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InternalAttributes_InternalInterface_release_handle) : RefHolder(proxy)
}
extension _InternalInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func InternalInterface_copyFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_InternalAttributes_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_InternalAttributes_InternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_InternalAttributes_InternalInterface_get_typed(smoke_InternalAttributes_InternalInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalInterface {
        smoke_InternalAttributes_InternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalInterface_moveFromCType(_ handle: _baseRef) -> InternalInterface {
    if let swift_pointer = smoke_InternalAttributes_InternalInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_InternalAttributes_InternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InternalAttributes_InternalInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalInterface {
        smoke_InternalAttributes_InternalInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_InternalAttributes_InternalInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalInterface {
        smoke_InternalAttributes_InternalInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalInterface_copyFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterface_moveFromCType(handle) as InternalInterface
}
internal func InternalInterface_moveFromCType(_ handle: _baseRef) -> InternalInterface? {
    guard handle != 0 else {
        return nil
    }
    return InternalInterface_moveFromCType(handle) as InternalInterface
}
internal func copyToCType(_ swiftClass: InternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func InternalAttributes_InternalLambda_copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalLambda {
    return InternalAttributes_InternalLambda_moveFromCType(smoke_InternalAttributes_InternalLambda_copy_handle(handle))
}
internal func InternalAttributes_InternalLambda_moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalLambda {
    let refHolder = RefHolder(ref: handle, release: smoke_InternalAttributes_InternalLambda_release_handle)
    return { () -> Void in
        return moveFromCType(smoke_InternalAttributes_InternalLambda_call(refHolder.ref))
    }
}
internal func InternalAttributes_InternalLambda_copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalLambda? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes_InternalLambda_copyFromCType(handle) as InternalAttributes.InternalLambda
}
internal func InternalAttributes_InternalLambda_moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalLambda? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes_InternalLambda_moveFromCType(handle) as InternalAttributes.InternalLambda
}
internal func InternalAttributes_InternalLambda_createFunctionalTable(_ swiftType: @escaping InternalAttributes.InternalLambda) -> smoke_InternalAttributes_InternalLambda_FunctionTable {
    class smoke_InternalAttributes_InternalLambda_Holder {
        let closure: InternalAttributes.InternalLambda
        init(_ closure: @escaping InternalAttributes.InternalLambda) {
            self.closure = closure
        }
    }
    var functions = smoke_InternalAttributes_InternalLambda_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_InternalAttributes_InternalLambda_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_InternalAttributes_InternalLambda_call = { swift_closure_pointer in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_InternalAttributes_InternalLambda_Holder
        return copyToCType(closure_holder.closure()).ref
    }
    return functions
}
internal func InternalAttributes_InternalLambda_copyToCType(_ swiftType: @escaping InternalAttributes.InternalLambda) -> RefHolder {
    let handle = smoke_InternalAttributes_InternalLambda_create_proxy(InternalAttributes_InternalLambda_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func InternalAttributes_InternalLambda_moveToCType(_ swiftType: @escaping InternalAttributes.InternalLambda) -> RefHolder {
    let handle = smoke_InternalAttributes_InternalLambda_create_proxy(InternalAttributes_InternalLambda_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_InternalAttributes_InternalLambda_release_handle)
}
internal func InternalAttributes_InternalLambda_copyToCType(_ swiftType: InternalAttributes.InternalLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_InternalAttributes_InternalLambda_create_optional_proxy(InternalAttributes_InternalLambda_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func InternalAttributes_InternalLambda_moveToCType(_ swiftType: InternalAttributes.InternalLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_InternalAttributes_InternalLambda_create_optional_proxy(InternalAttributes_InternalLambda_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_InternalAttributes_InternalLambda_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalStruct {
    return InternalAttributes.InternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalStruct {
    defer {
        smoke_InternalAttributes_InternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalAttributes.InternalStruct) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_InternalAttributes_InternalStruct_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: InternalAttributes.InternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InternalAttributes_InternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_InternalAttributes_InternalStruct_unwrap_optional_handle(handle)
    return InternalAttributes.InternalStruct(cHandle: unwrappedHandle) as InternalAttributes.InternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalStruct? {
    defer {
        smoke_InternalAttributes_InternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalAttributes.InternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_InternalAttributes_InternalStruct_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: InternalAttributes.InternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InternalAttributes_InternalStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: InternalAttributes.InternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: InternalAttributes.InternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: InternalAttributes.InternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: InternalAttributes.InternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> InternalAttributes.InternalEnum {
    return InternalAttributes.InternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> InternalAttributes.InternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalAttributes.InternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return InternalAttributes.InternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> InternalAttributes.InternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension String : Error {
}
