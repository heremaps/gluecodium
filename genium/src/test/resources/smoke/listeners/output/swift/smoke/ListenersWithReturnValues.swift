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
        return copyToCType(swift_class.fetchData()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchData_string = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchData()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchData_Struct = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchData()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchData_enum = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchData()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchData_Array = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchData()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchData_Map = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchData()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchData_instance = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchData()).ref
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
    func fetchData() -> [Double]
    func fetchData() -> ListenersWithReturnValues.StringToDouble
    func fetchData() -> CalculationResult
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
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_double(self.c_instance))
    }
    public func fetchData() -> String {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_string(self.c_instance))
    }
    public func fetchData() -> ResultStruct {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_Struct(self.c_instance))
    }
    public func fetchData() -> ResultEnum {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_enum(self.c_instance))
    }
    public func fetchData() -> [Double] {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_Array(self.c_instance))
    }
    public func fetchData() -> ListenersWithReturnValues.StringToDouble {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchData_Map(self.c_instance))
    }
    public func fetchData() -> CalculationResult {
        return CalculationResultmoveFromCType(smoke_ListenersWithReturnValues_fetchData_instance(self.c_instance))
    }
}
extension _ListenersWithReturnValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ListenersWithReturnValuescopyFromCType(_ handle: _baseRef) -> ListenersWithReturnValues {
    if let swift_pointer = smoke_ListenersWithReturnValues_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenersWithReturnValues {
        return re_constructed
    }
    return _ListenersWithReturnValues(cListenersWithReturnValues: smoke_ListenersWithReturnValues_copy_handle(handle))
}
internal func ListenersWithReturnValuesmoveFromCType(_ handle: _baseRef) -> ListenersWithReturnValues {
    if let swift_pointer = smoke_ListenersWithReturnValues_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenersWithReturnValues {
        smoke_ListenersWithReturnValues_release_handle(handle)
        return re_constructed
    }
    return _ListenersWithReturnValues(cListenersWithReturnValues: handle)
}
internal func ListenersWithReturnValuescopyFromCType(_ handle: _baseRef) -> ListenersWithReturnValues? {
    guard handle != 0 else {
        return nil
    }
    return ListenersWithReturnValuesmoveFromCType(handle) as ListenersWithReturnValues
}
internal func ListenersWithReturnValuesmoveFromCType(_ handle: _baseRef) -> ListenersWithReturnValues? {
    guard handle != 0 else {
        return nil
    }
    return ListenersWithReturnValuesmoveFromCType(handle) as ListenersWithReturnValues
}
internal func copyToCType(_ swiftClass: ListenersWithReturnValues) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ListenersWithReturnValues) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ListenersWithReturnValues?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ListenersWithReturnValues?) -> RefHolder {
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
        result = moveFromCType(smoke_ListenersWithReturnValues_ResultStruct_result_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_result = moveToCType(result)
        return smoke_ListenersWithReturnValues_ResultStruct_create_handle(c_result.ref)
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
internal func copyToCType(_ swiftType: ResultStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: ResultStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ListenersWithReturnValues_ResultStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ResultStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ListenersWithReturnValues_ResultStruct_unwrap_optional_handle(handle)
    return ResultStruct(cHandle: unwrappedHandle) as ResultStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ResultStruct? {
    defer {
        smoke_ListenersWithReturnValues_ResultStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ResultStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_ListenersWithReturnValues_ResultStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: ResultStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ListenersWithReturnValues_ResultStruct_release_optional_handle)
}
