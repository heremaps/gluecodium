//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ListenersWithReturnValues?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ListenersWithReturnValues_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ListenersWithReturnValues_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ListenersWithReturnValues_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ListenersWithReturnValues_fetchData_double = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return swift_class.fetchData()
    }
    functions.smoke_ListenersWithReturnValues_fetchData_string = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return swift_class.fetchData().convertToCType()
    }
    functions.smoke_ListenersWithReturnValues_fetchData_Struct = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return swift_class.fetchData().convertToCType()
    }
    functions.smoke_ListenersWithReturnValues_fetchData_enum = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return swift_class.fetchData().rawValue
    }
    functions.smoke_ListenersWithReturnValues_fetchData_Array = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return swift_class.fetchData().c_conversion().c_type
    }
    functions.smoke_ListenersWithReturnValues_fetchData_Map = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return convertListenersWithReturnValues_StringToDoubleToCType(swift_class.fetchData())
    }
    functions.smoke_ListenersWithReturnValues_fetchData_instance = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return getRef(swift_class.fetchData()!, owning: false).ref
    }
    let proxy = smoke_ListenersWithReturnValues_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ListenersWithReturnValues_release_handle) : RefHolder(proxy)
}
public protocol ListenersWithReturnValues : AnyObject {
    typealias StringToDouble = [String: Double]
    func fetchData() -> Double
    func fetchData() -> String
    func fetchData() -> ResultStruct
    func fetchData() -> ResultEnum
    func fetchData() -> CollectionOf<Double>
    func fetchData() -> ListenersWithReturnValues.StringToDouble
    func fetchData() -> CalculationResult?
}
internal class _ListenersWithReturnValues: ListenersWithReturnValues {
    let c_instance : _baseRef
    init(cListenersWithReturnValues: _baseRef) {
        guard cListenersWithReturnValues != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cListenersWithReturnValues
    }
    deinit {
        smoke_ListenersWithReturnValues_release_handle(c_instance)
    }
    public func fetchData() -> Double {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_double(c_instance))
    }
    public func fetchData() -> String {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_string(c_instance))
    }
    public func fetchData() -> ResultStruct {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_Struct(c_instance))
    }
    public func fetchData() -> ResultEnum {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_enum(c_instance))
    }
    public func fetchData() -> CollectionOf<Double> {
        let result_handle = smoke_ListenersWithReturnValues_fetchData_Array(c_instance)
        return DoubleList(result_handle)
    }
    public func fetchData() -> ListenersWithReturnValues.StringToDouble {
        let result_handle = smoke_ListenersWithReturnValues_fetchData_Map(c_instance)
        defer {
            smoke_ListenersWithReturnValues_StringToDouble_release_handle(result_handle)
        }
        return convertListenersWithReturnValues_StringToDoubleFromCType(result_handle)
    }
    public func fetchData() -> CalculationResult? {
        let cResult = smoke_ListenersWithReturnValues_fetchData_instance(c_instance)
        if cResult == 0 { return nil }
        if let swift_pointer = smoke_CalculationResult_get_swift_object_from_cache(cResult),
                let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculationResult {
            return re_constructed
        }
        return _CalculationResult(cCalculationResult: cResult)
    }
}
extension _ListenersWithReturnValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
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
        result = smoke_ListenersWithReturnValues_ResultStruct_result_get(cHandle)
    }
    internal func convertToCType() -> _baseRef {
        let result_handle = result
        return smoke_ListenersWithReturnValues_ResultStruct_create_handle(result_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ResultStruct {
    return ResultStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ResultStruct {
    defer {
        smoke_ListenersWithReturnValues_ResultStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
func convertListenersWithReturnValues_StringToDoubleToCType(_ swiftDict: ListenersWithReturnValues.StringToDouble) -> _baseRef {
    let c_handle = smoke_ListenersWithReturnValues_StringToDouble_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release_handle(c_key)
        }
        let c_value = swift_value
        smoke_ListenersWithReturnValues_StringToDouble_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertListenersWithReturnValues_StringToDoubleFromCType(_ c_handle: _baseRef) -> ListenersWithReturnValues.StringToDouble {
    var swiftDict: ListenersWithReturnValues.StringToDouble = [:]
    let iterator_handle = smoke_ListenersWithReturnValues_StringToDouble_iterator(c_handle)
    while smoke_ListenersWithReturnValues_StringToDouble_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_ListenersWithReturnValues_StringToDouble_iterator_key(iterator_handle)
        let swift_key: String = moveFromCType(c_key)
        let c_value = smoke_ListenersWithReturnValues_StringToDouble_iterator_value(iterator_handle)
        let swift_value: Double = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_ListenersWithReturnValues_StringToDouble_iterator_increment(iterator_handle)
    }
    smoke_ListenersWithReturnValues_StringToDouble_iterator_release_handle(iterator_handle)
    return swiftDict
}