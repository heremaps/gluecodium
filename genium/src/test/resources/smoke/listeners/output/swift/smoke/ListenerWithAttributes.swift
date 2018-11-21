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
            ? RefHolder(ref: handle_copy, release: smoke_ListenerWithAttributes_release)
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
        defer {
            std_string_release(newValue)
        }
        return swift_class.message = String(data: Data(bytes: std_string_data_get(newValue),
                                                count: Int(std_string_size_get(newValue))), encoding: .utf8)!
    }
    functions.smoke_ListenerWithAttributes_packedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return getRef(swift_class.packedMessage!, owning: false).ref
    }
    functions.smoke_ListenerWithAttributes_packedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        var swift_object_newValue: CalculationResult? = nil
        if let swift_pointer_newValue = smoke_CalculationResult_get_swift_object_from_cache(newValue) {
            swift_object_newValue = Unmanaged<AnyObject>.fromOpaque(swift_pointer_newValue).takeUnretainedValue() as? CalculationResult
            if swift_object_newValue != nil {
                defer {
                    smoke_CalculationResult_release(newValue)
                }
            }
        }
        if swift_object_newValue == nil {
            swift_object_newValue = _CalculationResult(cCalculationResult: newValue)
        }
        return swift_class.packedMessage = swift_object_newValue!
    }
    functions.smoke_ListenerWithAttributes_structuredMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.structuredMessage.convertToCType()
    }
    functions.smoke_ListenerWithAttributes_structuredMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        defer {
            smoke_ListenerWithAttributes_ResultStruct_release(newValue)
        }
        return swift_class.structuredMessage = ResultStruct(cResultStruct: newValue)
    }
    functions.smoke_ListenerWithAttributes_enumeratedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.enumeratedMessage.rawValue
    }
    functions.smoke_ListenerWithAttributes_enumeratedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.enumeratedMessage = ResultEnum(rawValue: newValue)!
    }
    functions.smoke_ListenerWithAttributes_arrayedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.arrayedMessage.c_conversion().c_type
    }
    functions.smoke_ListenerWithAttributes_arrayedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return swift_class.arrayedMessage = StringList(newValue)
    }
    functions.smoke_ListenerWithAttributes_mappedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        return convertListenerWithAttributes_StringToDoubleToCType(swift_class.mappedMessage)
    }
    functions.smoke_ListenerWithAttributes_mappedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        defer {
            smoke_ListenerWithAttributes_StringToDouble_release(newValue)
        }
        return swift_class.mappedMessage = convertListenerWithAttributes_StringToDoubleFromCType(newValue)
    }
    functions.smoke_ListenerWithAttributes_bufferedMessage_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        let result = swift_class.bufferedMessage
        let result_handle = byteArray_create()
        result.withUnsafeBytes { (result_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(result_handle, result_ptr, result.count)
        }
        return result_handle
    }
    functions.smoke_ListenerWithAttributes_bufferedMessage_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenerWithAttributes
        defer {
            byteArray_release(newValue)
        }
        return swift_class.bufferedMessage = Data(bytes: byteArray_data_get(newValue), count: byteArray_size_get(newValue))
    }
    let proxy = smoke_ListenerWithAttributes_createProxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ListenerWithAttributes_release) : RefHolder(proxy)
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
            let result_string_handle = smoke_ListenerWithAttributes_message_get(c_instance)
            defer {
                std_string_release(result_string_handle)
            }
            return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                     count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
        }
        set {
            return smoke_ListenerWithAttributes_message_set(c_instance, newValue)
        }
    }
    var packedMessage: CalculationResult? {
        get {
            let cResult = smoke_ListenerWithAttributes_packedMessage_get(c_instance)
            if let swift_pointer = smoke_CalculationResult_get_swift_object_from_cache(cResult),
                    let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculationResult {
                return re_constructed
            }
            return _CalculationResult(cCalculationResult: cResult)
        }
        set {
            let newValue_handle = getRef(newValue)
            return smoke_ListenerWithAttributes_packedMessage_set(c_instance, newValue_handle.ref)
        }
    }
    var structuredMessage: ResultStruct {
        get {
            let cResult = smoke_ListenerWithAttributes_structuredMessage_get(c_instance)
            defer {
                smoke_ListenerWithAttributes_ResultStruct_release(cResult)
            }
            return ResultStruct(cResultStruct: cResult)
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_ListenerWithAttributes_ResultStruct_release(newValue_handle)
            }
            return smoke_ListenerWithAttributes_structuredMessage_set(c_instance, newValue_handle)
        }
    }
    var enumeratedMessage: ResultEnum {
        get {
            let cResult = smoke_ListenerWithAttributes_enumeratedMessage_get(c_instance)
            return ResultEnum(rawValue: cResult)!
        }
        set {
            return smoke_ListenerWithAttributes_enumeratedMessage_set(c_instance, newValue.rawValue)
        }
    }
    var arrayedMessage: CollectionOf<String> {
        get {
            let result_handle = smoke_ListenerWithAttributes_arrayedMessage_get(c_instance)
            return StringList(result_handle)
        }
        set {
            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return smoke_ListenerWithAttributes_arrayedMessage_set(c_instance, newValue_handle.c_type)
        }
    }
    var mappedMessage: ListenerWithAttributes.StringToDouble {
        get {
            let result_handle = smoke_ListenerWithAttributes_mappedMessage_get(c_instance)
            defer {
                smoke_ListenerWithAttributes_StringToDouble_release(result_handle)
            }
            return convertListenerWithAttributes_StringToDoubleFromCType(result_handle)
        }
        set {
            let newValue_handle = convertListenerWithAttributes_StringToDoubleToCType(newValue)
            defer {
                smoke_ListenerWithAttributes_StringToDouble_release(newValue_handle)
            }
            return smoke_ListenerWithAttributes_mappedMessage_set(c_instance, newValue_handle)
        }
    }
    var bufferedMessage: Data {
        get {
            let result_data_handle = smoke_ListenerWithAttributes_bufferedMessage_get(c_instance)
            defer {
                byteArray_release(result_data_handle)
            }
            return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
        }
        set {
            let newValue_handle = byteArray_create()
            defer {
                byteArray_release(newValue_handle)
            }
            newValue.withUnsafeBytes { (newValue_ptr: UnsafePointer<UInt8>) in
                byteArray_assign(newValue_handle, newValue_ptr, newValue.count)
            }
            return smoke_ListenerWithAttributes_bufferedMessage_set(c_instance, newValue_handle)
        }
    }
    let c_instance : _baseRef
    init?(cListenerWithAttributes: _baseRef) {
        guard cListenerWithAttributes != 0 else {
            return nil
        }
        c_instance = cListenerWithAttributes
    }
    deinit {
        smoke_ListenerWithAttributes_release(c_instance)
    }
}
extension _ListenerWithAttributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
public enum ResultEnum : UInt32 {
    case none
    case result
}
public struct ResultStruct {
    public var result: Double
    public init(result: Double) {
        self.result = result
    }
    internal init(cResultStruct: _baseRef) {
        result = smoke_ListenerWithAttributes_ResultStruct_result_get(cResultStruct)
    }
    internal func convertToCType() -> _baseRef {
        let result_handle = result
        return smoke_ListenerWithAttributes_ResultStruct_create(result_handle)
    }
}
func convertListenerWithAttributes_StringToDoubleToCType(_ swiftDict: ListenerWithAttributes.StringToDouble) -> _baseRef {
    let c_handle = smoke_ListenerWithAttributes_StringToDouble_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release(c_key)
        }
        let c_value = swift_value
        smoke_ListenerWithAttributes_StringToDouble_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertListenerWithAttributes_StringToDoubleFromCType(_ c_handle: _baseRef) -> ListenerWithAttributes.StringToDouble {
    var swiftDict: ListenerWithAttributes.StringToDouble = [:]
    let iterator_handle = smoke_ListenerWithAttributes_StringToDouble_iterator(c_handle)
    while smoke_ListenerWithAttributes_StringToDouble_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_ListenerWithAttributes_StringToDouble_iterator_key(iterator_handle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_ListenerWithAttributes_StringToDouble_iterator_value(iterator_handle)
        let swift_value = c_value
        swiftDict[swift_key!] = swift_value
        smoke_ListenerWithAttributes_StringToDouble_iterator_increment(iterator_handle)
    }
    smoke_ListenerWithAttributes_StringToDouble_iterator_release(iterator_handle)
    return swiftDict
}
