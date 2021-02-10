//
//
import Foundation
public protocol ListenerWithProperties : AnyObject {
    typealias StringToDouble = [String: Double]
    var message: String { get set }
    var packedMessage: CalculationResult { get set }
    var structuredMessage: ResultStruct { get set }
    var enumeratedMessage: ResultEnum { get set }
    var arrayedMessage: [String] { get set }
    var mappedMessage: ListenerWithProperties.StringToDouble { get set }
    var bufferedMessage: Data { get set }
}
internal class _ListenerWithProperties: ListenerWithProperties {
    var message: String {
        get {
            return moveFromCType(smoke_ListenerWithProperties_message_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_message_set(self.c_instance, c_value.ref))
        }
    }
    var packedMessage: CalculationResult {
        get {
            return foobar_CalculationResult_moveFromCType(smoke_ListenerWithProperties_packedMessage_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_packedMessage_set(self.c_instance, c_value.ref))
        }
    }
    var structuredMessage: ResultStruct {
        get {
            return foobar_moveFromCType(smoke_ListenerWithProperties_structuredMessage_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_structuredMessage_set(self.c_instance, c_value.ref))
        }
    }
    var enumeratedMessage: ResultEnum {
        get {
            return foobar_moveFromCType(smoke_ListenerWithProperties_enumeratedMessage_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_enumeratedMessage_set(self.c_instance, c_value.ref))
        }
    }
    var arrayedMessage: [String] {
        get {
            return foobar_moveFromCType(smoke_ListenerWithProperties_arrayedMessage_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_arrayedMessage_set(self.c_instance, c_value.ref))
        }
    }
    var mappedMessage: ListenerWithProperties.StringToDouble {
        get {
            return foobar_moveFromCType(smoke_ListenerWithProperties_mappedMessage_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_mappedMessage_set(self.c_instance, c_value.ref))
        }
    }
    var bufferedMessage: Data {
        get {
            return moveFromCType(smoke_ListenerWithProperties_bufferedMessage_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithProperties_bufferedMessage_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cListenerWithProperties: _baseRef) {
        guard cListenerWithProperties != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cListenerWithProperties
    }
    deinit {
        smoke_ListenerWithProperties_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ListenerWithProperties_release_handle(c_instance)
    }
}
public enum ResultEnum : UInt32, CaseIterable, Codable {
    case none
    case result
}
public struct ResultStruct {
    public var result: Double
    public init(result: Double) {
        self.result = result
    }
    internal init(cHandle: _baseRef) {
        result = moveFromCType(smoke_ListenerWithProperties_ResultStruct_result_get(cHandle))
    }
}
@_cdecl("_CBridgeInitsmoke_ListenerWithProperties")
internal func _CBridgeInitsmoke_ListenerWithProperties(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ListenerWithProperties(cListenerWithProperties: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ListenerWithProperties?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ListenerWithProperties_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ListenerWithProperties_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ListenerWithProperties_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ListenerWithProperties_message_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return copyToCType(swift_class.message).ref
    }
    functions.smoke_ListenerWithProperties_message_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.message = moveFromCType(value)
    }
    functions.smoke_ListenerWithProperties_packedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return foobar_copyToCType(swift_class.packedMessage).ref
    }
    functions.smoke_ListenerWithProperties_packedMessage_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.packedMessage = foobar_CalculationResult_moveFromCType(value)
    }
    functions.smoke_ListenerWithProperties_structuredMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return foobar_copyToCType(swift_class.structuredMessage).ref
    }
    functions.smoke_ListenerWithProperties_structuredMessage_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.structuredMessage = foobar_moveFromCType(value)
    }
    functions.smoke_ListenerWithProperties_enumeratedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return foobar_copyToCType(swift_class.enumeratedMessage).ref
    }
    functions.smoke_ListenerWithProperties_enumeratedMessage_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.enumeratedMessage = foobar_moveFromCType(value)
    }
    functions.smoke_ListenerWithProperties_arrayedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return foobar_copyToCType(swift_class.arrayedMessage).ref
    }
    functions.smoke_ListenerWithProperties_arrayedMessage_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.arrayedMessage = foobar_moveFromCType(value)
    }
    functions.smoke_ListenerWithProperties_mappedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return foobar_copyToCType(swift_class.mappedMessage).ref
    }
    functions.smoke_ListenerWithProperties_mappedMessage_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.mappedMessage = foobar_moveFromCType(value)
    }
    functions.smoke_ListenerWithProperties_bufferedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        return copyToCType(swift_class.bufferedMessage).ref
    }
    functions.smoke_ListenerWithProperties_bufferedMessage_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithProperties
        swift_class.bufferedMessage = moveFromCType(value)
    }
    let proxy = smoke_ListenerWithProperties_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ListenerWithProperties_release_handle) : RefHolder(proxy)
}
extension _ListenerWithProperties: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func foobar_ListenerWithProperties_copyFromCType(_ handle: _baseRef) -> ListenerWithProperties {
    if let swift_pointer = smoke_ListenerWithProperties_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerWithProperties {
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerWithProperties_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerWithProperties {
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerWithProperties_get_typed(smoke_ListenerWithProperties_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ListenerWithProperties {
        smoke_ListenerWithProperties_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_ListenerWithProperties_moveFromCType(_ handle: _baseRef) -> ListenerWithProperties {
    if let swift_pointer = smoke_ListenerWithProperties_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerWithProperties {
        smoke_ListenerWithProperties_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerWithProperties_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerWithProperties {
        smoke_ListenerWithProperties_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ListenerWithProperties_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ListenerWithProperties {
        smoke_ListenerWithProperties_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_ListenerWithProperties_copyFromCType(_ handle: _baseRef) -> ListenerWithProperties? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ListenerWithProperties_moveFromCType(handle) as ListenerWithProperties
}
internal func foobar_ListenerWithProperties_moveFromCType(_ handle: _baseRef) -> ListenerWithProperties? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ListenerWithProperties_moveFromCType(handle) as ListenerWithProperties
}
internal func foobar_copyToCType(_ swiftClass: ListenerWithProperties) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ListenerWithProperties) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: ListenerWithProperties?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ListenerWithProperties?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> ResultStruct {
    return ResultStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> ResultStruct {
    defer {
        smoke_ListenerWithProperties_ResultStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: ResultStruct) -> RefHolder {
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_ListenerWithProperties_ResultStruct_create_handle(c_result.ref))
}
internal func foobar_moveToCType(_ swiftType: ResultStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_ListenerWithProperties_ResultStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> ResultStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ListenerWithProperties_ResultStruct_unwrap_optional_handle(handle)
    return ResultStruct(cHandle: unwrappedHandle) as ResultStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> ResultStruct? {
    defer {
        smoke_ListenerWithProperties_ResultStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: ResultStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_ListenerWithProperties_ResultStruct_create_optional_handle(c_result.ref))
}
internal func foobar_moveToCType(_ swiftType: ResultStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_ListenerWithProperties_ResultStruct_release_optional_handle)
}
internal func foobar_copyToCType(_ swiftEnum: ResultEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: ResultEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: ResultEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: ResultEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> ResultEnum {
    return ResultEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> ResultEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> ResultEnum? {
    guard handle != 0 else {
        return nil
    }
    return ResultEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> ResultEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
