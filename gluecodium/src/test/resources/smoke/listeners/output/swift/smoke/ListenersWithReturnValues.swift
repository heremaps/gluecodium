//
//
import Foundation
public protocol ListenersWithReturnValues : AnyObject {
    typealias StringToDouble = [String: Double]
    func fetchDataDouble() -> Double
    func fetchDataString() -> String
    func fetchDataStruct() -> ResultStruct
    func fetchDataEnum() -> ResultEnum
    func fetchDataArray() -> [Double]
    func fetchDataMap() -> ListenersWithReturnValues.StringToDouble
    func fetchDataInstance() -> CalculationResult
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
        smoke_ListenersWithReturnValues_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ListenersWithReturnValues_release_handle(c_instance)
    }
    public func fetchDataDouble() -> Double {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchDataDouble(self.c_instance))
    }
    public func fetchDataString() -> String {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchDataString(self.c_instance))
    }
    public func fetchDataStruct() -> ResultStruct {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchDataStruct(self.c_instance))
    }
    public func fetchDataEnum() -> ResultEnum {
        return moveFromCType(smoke_ListenersWithReturnValues_fetchDataEnum(self.c_instance))
    }
    public func fetchDataArray() -> [Double] {
        return foobar_moveFromCType(smoke_ListenersWithReturnValues_fetchDataArray(self.c_instance))
    }
    public func fetchDataMap() -> ListenersWithReturnValues.StringToDouble {
        return foobar_moveFromCType(smoke_ListenersWithReturnValues_fetchDataMap(self.c_instance))
    }
    public func fetchDataInstance() -> CalculationResult {
        return CalculationResult_moveFromCType(smoke_ListenersWithReturnValues_fetchDataInstance(self.c_instance))
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
        result = moveFromCType(smoke_ListenersWithReturnValues_ResultStruct_result_get(cHandle))
    }
}
@_cdecl("_CBridgeInitsmoke_ListenersWithReturnValues")
internal func _CBridgeInitsmoke_ListenersWithReturnValues(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ListenersWithReturnValues(cListenersWithReturnValues: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
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
    functions.smoke_ListenersWithReturnValues_fetchDataDouble = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchDataDouble()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchDataString = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchDataString()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchDataStruct = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchDataStruct()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchDataEnum = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchDataEnum()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchDataArray = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return foobar_copyToCType(swift_class.fetchDataArray()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchDataMap = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return foobar_copyToCType(swift_class.fetchDataMap()).ref
    }
    functions.smoke_ListenersWithReturnValues_fetchDataInstance = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ListenersWithReturnValues
        return copyToCType(swift_class.fetchDataInstance()).ref
    }
    let proxy = smoke_ListenersWithReturnValues_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ListenersWithReturnValues_release_handle) : RefHolder(proxy)
}
extension _ListenersWithReturnValues: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func ListenersWithReturnValues_copyFromCType(_ handle: _baseRef) -> ListenersWithReturnValues {
    if let swift_pointer = smoke_ListenersWithReturnValues_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenersWithReturnValues {
        return re_constructed
    }
    if let swift_pointer = smoke_ListenersWithReturnValues_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenersWithReturnValues {
        return re_constructed
    }
    if let swift_pointer = smoke_ListenersWithReturnValues_get_typed(smoke_ListenersWithReturnValues_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ListenersWithReturnValues {
        smoke_ListenersWithReturnValues_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ListenersWithReturnValues_moveFromCType(_ handle: _baseRef) -> ListenersWithReturnValues {
    if let swift_pointer = smoke_ListenersWithReturnValues_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenersWithReturnValues {
        smoke_ListenersWithReturnValues_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ListenersWithReturnValues_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ListenersWithReturnValues {
        smoke_ListenersWithReturnValues_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ListenersWithReturnValues_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ListenersWithReturnValues {
        smoke_ListenersWithReturnValues_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ListenersWithReturnValues_copyFromCType(_ handle: _baseRef) -> ListenersWithReturnValues? {
    guard handle != 0 else {
        return nil
    }
    return ListenersWithReturnValues_moveFromCType(handle) as ListenersWithReturnValues
}
internal func ListenersWithReturnValues_moveFromCType(_ handle: _baseRef) -> ListenersWithReturnValues? {
    guard handle != 0 else {
        return nil
    }
    return ListenersWithReturnValues_moveFromCType(handle) as ListenersWithReturnValues
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
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_ListenersWithReturnValues_ResultStruct_create_handle(c_result.ref))
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
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_ListenersWithReturnValues_ResultStruct_create_optional_handle(c_result.ref))
}
internal func moveToCType(_ swiftType: ResultStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ListenersWithReturnValues_ResultStruct_release_optional_handle)
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
