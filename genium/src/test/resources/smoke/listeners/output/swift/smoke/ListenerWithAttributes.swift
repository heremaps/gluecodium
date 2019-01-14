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
        return swift_class.message.convertToCType()
    }
    functions.smoke_ListenerWithAttributes_message_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.message = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_packedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return getRef(swift_class.packedMessage!, owning: false).ref
    }
    functions.smoke_ListenerWithAttributes_packedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.packedMessage = CalculationResultmoveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_structuredMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.structuredMessage.convertToCType()
    }
    functions.smoke_ListenerWithAttributes_structuredMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.structuredMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_enumeratedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.enumeratedMessage.rawValue
    }
    functions.smoke_ListenerWithAttributes_enumeratedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.enumeratedMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_arrayedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.arrayedMessage.c_conversion().c_type
    }
    functions.smoke_ListenerWithAttributes_arrayedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.arrayedMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_mappedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return convertListenerWithAttributes_StringToDoubleToCType(swift_class.mappedMessage)
    }
    functions.smoke_ListenerWithAttributes_mappedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        swift_class.mappedMessage = moveFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_bufferedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        let result_object = swift_class.bufferedMessage
        let result_handle = byteArray_create_handle()
        result_object.withUnsafeBytes { (result_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(result_handle, result_ptr, result_object.count)
        }
        return result_handle
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
    var packedMessage: CalculationResult? { get set }
    var structuredMessage: ResultStruct { get set }
    var enumeratedMessage: ResultEnum { get set }
    var arrayedMessage: CollectionOf<String> { get set }
    var mappedMessage: ListenerWithAttributes.StringToDouble { get set }
    var bufferedMessage: Data { get set }
}
internal class _ListenerWithAttributes: ListenerWithAttributes {
    var message: String {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_message_get(c_instance))
        }
        set {
            return moveFromCType(smoke_ListenerWithAttributes_message_set(c_instance, newValue))
        }
    }
    var packedMessage: CalculationResult? {
        get {
            return CalculationResultmoveFromCType(smoke_ListenerWithAttributes_packedMessage_get(c_instance))
        }
        set {
            let newValue_handle = getRef(newValue)
            return moveFromCType(smoke_ListenerWithAttributes_packedMessage_set(c_instance, newValue_handle.ref))
        }
    }
    var structuredMessage: ResultStruct {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_structuredMessage_get(c_instance))
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_ListenerWithAttributes_ResultStruct_release_handle(newValue_handle)
            }
            return moveFromCType(smoke_ListenerWithAttributes_structuredMessage_set(c_instance, newValue_handle))
        }
    }
    var enumeratedMessage: ResultEnum {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_enumeratedMessage_get(c_instance))
        }
        set {
            return moveFromCType(smoke_ListenerWithAttributes_enumeratedMessage_set(c_instance, newValue.rawValue))
        }
    }
    var arrayedMessage: CollectionOf<String> {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_arrayedMessage_get(c_instance))
        }
        set {
            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return moveFromCType(smoke_ListenerWithAttributes_arrayedMessage_set(c_instance, newValue_handle.c_type))
        }
    }
    var mappedMessage: ListenerWithAttributes.StringToDouble {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_mappedMessage_get(c_instance))
        }
        set {
            let newValue_handle = convertListenerWithAttributes_StringToDoubleToCType(newValue)
            defer {
                smoke_ListenerWithAttributes_StringToDouble_release_handle(newValue_handle)
            }
            return moveFromCType(smoke_ListenerWithAttributes_mappedMessage_set(c_instance, newValue_handle))
        }
    }
    var bufferedMessage: Data {
        get {
            return moveFromCType(smoke_ListenerWithAttributes_bufferedMessage_get(c_instance))
        }
        set {
            let newValue_handle = byteArray_create_handle()
            defer {
                byteArray_release_handle(newValue_handle)
            }
            newValue.withUnsafeBytes { (newValue_ptr: UnsafePointer<UInt8>) in
                byteArray_assign(newValue_handle, newValue_ptr, newValue.count)
            }
            return moveFromCType(smoke_ListenerWithAttributes_bufferedMessage_set(c_instance, newValue_handle))
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
        smoke_ListenerWithAttributes_release_handle(handle)
        return re_constructed
    }
    return _ListenerWithAttributes(cListenerWithAttributes: handle)
}
internal func ListenerWithAttributesmoveFromCType(_ handle: _baseRef) -> ListenerWithAttributes {
    return ListenerWithAttributescopyFromCType(handle)
}
internal func ListenerWithAttributescopyFromCType(_ handle: _baseRef) -> ListenerWithAttributes? {
    guard handle != 0 else {
        return nil
    }
    return ListenerWithAttributesmoveFromCType(handle) as ListenerWithAttributes
}
internal func ListenerWithAttributesmoveFromCType(_ handle: _baseRef) -> ListenerWithAttributes? {
    return ListenerWithAttributescopyFromCType(handle)
}
public enum ResultEnum : UInt32 {
    case none
    case result
}
internal func copyFromCType(_ cValue: UInt32) -> ResultEnum {
    return ResultEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ResultEnum {
    return copyFromCType(cValue)
}
public struct ResultStruct {
    public var result: Double
    public init(result: Double) {
        self.result = result
    }
    internal init(cHandle: _baseRef) {
        result = moveFromCType(smoke_ListenerWithAttributes_ResultStruct_result_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let result_handle = result
        return smoke_ListenerWithAttributes_ResultStruct_create_handle(result_handle)
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
func convertListenerWithAttributes_StringToDoubleToCType(_ swiftDict: ListenerWithAttributes.StringToDouble) -> _baseRef {
    let c_handle = smoke_ListenerWithAttributes_StringToDouble_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release_handle(c_key)
        }
        let c_value = swift_value
        smoke_ListenerWithAttributes_StringToDouble_put(c_handle, c_key, c_value)
    }
    return c_handle
}