//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ListenerWithAttributes?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ListenerWithAttributes_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ListenerWithAttributes_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ListenerWithAttributes_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ListenerWithAttributes_message_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.message).ref
    }
    functions.smoke_ListenerWithAttributes_message_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.message = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_packedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.packedMessage).ref
    }
    functions.smoke_ListenerWithAttributes_packedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.packedMessage = CalculationResultmoveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_structuredMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.structuredMessage).ref
    }
    functions.smoke_ListenerWithAttributes_structuredMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.structuredMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_enumeratedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.enumeratedMessage).ref
    }
    functions.smoke_ListenerWithAttributes_enumeratedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.enumeratedMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_arrayedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.arrayedMessage).ref
    }
    functions.smoke_ListenerWithAttributes_arrayedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.arrayedMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_mappedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.mappedMessage).ref
    }
    functions.smoke_ListenerWithAttributes_mappedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.mappedMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_bufferedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return copyToCType(swift_class.bufferedMessage).ref
    }
    functions.smoke_ListenerWithAttributes_bufferedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.bufferedMessage = moveFromCType(newValue)
    }
    let proxy = smoke_ListenerWithAttributes_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ListenerWithAttributes_release_handle) : RefHolder(proxy)
}
public protocol ListenerWithAttributes : AnyObject {
    typealias StringToDouble = [String: Double]
    var message: String { get set }
    var packedMessage: CalculationResult { get set }
    var structuredMessage: ResultStruct { get set }
    var enumeratedMessage: ResultEnum { get set }
    var arrayedMessage: [String] { get set }
    var mappedMessage: ListenerWithAttributes.StringToDouble { get set }
    var bufferedMessage: Data { get set }
}
internal class _ListenerWithAttributes: ListenerWithAttributes {
    var message: String {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_message_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_message_set(self.c_instance, c_newValue.ref))
        }
    }
    var packedMessage: CalculationResult {
        get {
            return CalculationResultmoveFromCType(smoke_ListenerWithAttributes_packedMessage_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_packedMessage_set(self.c_instance, c_newValue.ref))
        }
    }
    var structuredMessage: ResultStruct {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_structuredMessage_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_structuredMessage_set(self.c_instance, c_newValue.ref))
        }
    }
    var enumeratedMessage: ResultEnum {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_enumeratedMessage_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_enumeratedMessage_set(self.c_instance, c_newValue.ref))
        }
    }
    var arrayedMessage: [String] {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_arrayedMessage_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_arrayedMessage_set(self.c_instance, c_newValue.ref))
        }
    }
    var mappedMessage: ListenerWithAttributes.StringToDouble {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_mappedMessage_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_mappedMessage_set(self.c_instance, c_newValue.ref))
        }
    }
    var bufferedMessage: Data {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_bufferedMessage_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_bufferedMessage_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cListenerWithAttributes: _baseRef) {
        guard cListenerWithAttributes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cListenerWithAttributes
    }
    deinit {
        smoke_ListenerWithAttributes_release_handle(c_instance)
    }
}
extension _ListenerWithAttributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ListenerWithAttributescopyFromCType(_ handle: _baseRef) -> ListenerWithAttributes {
    if let swift_pointer = smoke_ListenerWithAttributes_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerWithAttributes {
        return re_constructed
    }
    return _ListenerWithAttributes(cListenerWithAttributes: smoke_ListenerWithAttributes_copy_handle(handle))
}
internal func ListenerWithAttributesmoveFromCType(_ handle: _baseRef) -> ListenerWithAttributes {
    if let swift_pointer = smoke_ListenerWithAttributes_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenerWithAttributes {
        smoke_ListenerWithAttributes_release_handle(handle)
        return re_constructed
    }
    return _ListenerWithAttributes(cListenerWithAttributes: handle)
}
internal func ListenerWithAttributescopyFromCType(_ handle: _baseRef) -> ListenerWithAttributes? {
    guard handle != 0 else {
        return nil
    }
    return ListenerWithAttributesmoveFromCType(handle) as ListenerWithAttributes
}
internal func ListenerWithAttributesmoveFromCType(_ handle: _baseRef) -> ListenerWithAttributes? {
    guard handle != 0 else {
        return nil
    }
    return ListenerWithAttributesmoveFromCType(handle) as ListenerWithAttributes
}
internal func copyToCType(_ swiftClass: ListenerWithAttributes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ListenerWithAttributes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ListenerWithAttributes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ListenerWithAttributes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
public enum ResultEnum : UInt32, CaseIterable {
    case none
    case result
}
internal func copyToCType(_ swiftEnum: ResultEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ResultEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ResultEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ResultEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ResultEnum {
    return ResultEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ResultEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ResultEnum? {
    guard handle != 0 else {
        return nil
    }
    return ResultEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ResultEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct ResultStruct {
    public var result: Double
    public init(result: Double) {
        self.result = result
    }
    internal init(cHandle: _baseRef) {
        result = moveFromCType(smoke_ListenerWithAttributes_ResultStruct_result_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ResultStruct {
    return ResultStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ResultStruct {
    defer {
        smoke_ListenerWithAttributes_ResultStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ResultStruct) -> RefHolder {
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_ListenerWithAttributes_ResultStruct_create_handle(c_result.ref))
}
internal func moveToCType(_ swiftType: ResultStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ListenerWithAttributes_ResultStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ResultStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ListenerWithAttributes_ResultStruct_unwrap_optional_handle(handle)
    return ResultStruct(cHandle: unwrappedHandle) as ResultStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ResultStruct? {
    defer {
        smoke_ListenerWithAttributes_ResultStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ResultStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_ListenerWithAttributes_ResultStruct_create_optional_handle(c_result.ref))
}
internal func moveToCType(_ swiftType: ResultStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ListenerWithAttributes_ResultStruct_release_optional_handle)
}