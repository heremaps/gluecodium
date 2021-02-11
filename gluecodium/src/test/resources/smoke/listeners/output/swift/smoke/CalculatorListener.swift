//
//
import Foundation
public protocol CalculatorListener : AnyObject {
    typealias NamedCalculationResults = [String: Double]
    func onCalculationResult(calculationResult: Double) -> Void
    func onCalculationResultConst(calculationResult: Double) -> Void
    func onCalculationResultStruct(calculationResult: ResultStruct) -> Void
    func onCalculationResultArray(calculationResult: [Double]) -> Void
    func onCalculationResultMap(calculationResults: CalculatorListener.NamedCalculationResults) -> Void
    func onCalculationResultInstance(calculationResult: CalculationResult) -> Void
}
internal class _CalculatorListener: CalculatorListener {
    let c_instance : _baseRef
    init(cCalculatorListener: _baseRef) {
        guard cCalculatorListener != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCalculatorListener
    }
    deinit {
        smoke_CalculatorListener_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CalculatorListener_release_handle(c_instance)
    }
    public func onCalculationResult(calculationResult: Double) -> Void {
        let c_calculationResult = moveToCType(calculationResult)
        return moveFromCType(smoke_CalculatorListener_onCalculationResult(self.c_instance, c_calculationResult.ref))
    }
    public func onCalculationResultConst(calculationResult: Double) -> Void {
        let c_calculationResult = moveToCType(calculationResult)
        return moveFromCType(smoke_CalculatorListener_onCalculationResultConst(self.c_instance, c_calculationResult.ref))
    }
    public func onCalculationResultStruct(calculationResult: ResultStruct) -> Void {
        let c_calculationResult = foobar_moveToCType(calculationResult)
        return moveFromCType(smoke_CalculatorListener_onCalculationResultStruct(self.c_instance, c_calculationResult.ref))
    }
    public func onCalculationResultArray(calculationResult: [Double]) -> Void {
        let c_calculationResult = foobar_moveToCType(calculationResult)
        return moveFromCType(smoke_CalculatorListener_onCalculationResultArray(self.c_instance, c_calculationResult.ref))
    }
    public func onCalculationResultMap(calculationResults: CalculatorListener.NamedCalculationResults) -> Void {
        let c_calculationResults = foobar_moveToCType(calculationResults)
        return moveFromCType(smoke_CalculatorListener_onCalculationResultMap(self.c_instance, c_calculationResults.ref))
    }
    public func onCalculationResultInstance(calculationResult: CalculationResult) -> Void {
        let c_calculationResult = foobar_moveToCType(calculationResult)
        return moveFromCType(smoke_CalculatorListener_onCalculationResultInstance(self.c_instance, c_calculationResult.ref))
    }
}
public struct ResultStruct {
    public var result: Double
    public init(result: Double) {
        self.result = result
    }
    internal init(cHandle: _baseRef) {
        result = moveFromCType(smoke_CalculatorListener_ResultStruct_result_get(cHandle))
    }
}
@_cdecl("_CBridgeInitsmoke_CalculatorListener")
internal func _CBridgeInitsmoke_CalculatorListener(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _CalculatorListener(cCalculatorListener: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: CalculatorListener?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_CalculatorListener_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_CalculatorListener_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_CalculatorListener_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_CalculatorListener_onCalculationResult = {(swift_class_pointer, calculationResult) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResult(calculationResult: moveFromCType(calculationResult))
    }
    functions.smoke_CalculatorListener_onCalculationResultConst = {(swift_class_pointer, calculationResult) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResultConst(calculationResult: moveFromCType(calculationResult))
    }
    functions.smoke_CalculatorListener_onCalculationResultStruct = {(swift_class_pointer, calculationResult) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResultStruct(calculationResult: foobar_moveFromCType(calculationResult))
    }
    functions.smoke_CalculatorListener_onCalculationResultArray = {(swift_class_pointer, calculationResult) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResultArray(calculationResult: foobar_moveFromCType(calculationResult))
    }
    functions.smoke_CalculatorListener_onCalculationResultMap = {(swift_class_pointer, calculationResults) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResultMap(calculationResults: foobar_moveFromCType(calculationResults))
    }
    functions.smoke_CalculatorListener_onCalculationResultInstance = {(swift_class_pointer, calculationResult) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResultInstance(calculationResult: foobar_CalculationResult_moveFromCType(calculationResult))
    }
    let proxy = smoke_CalculatorListener_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_CalculatorListener_release_handle) : RefHolder(proxy)
}
extension _CalculatorListener: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func foobar_CalculatorListener_copyFromCType(_ handle: _baseRef) -> CalculatorListener {
    if let swift_pointer = smoke_CalculatorListener_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculatorListener {
        return re_constructed
    }
    if let swift_pointer = smoke_CalculatorListener_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculatorListener {
        return re_constructed
    }
    if let swift_pointer = smoke_CalculatorListener_get_typed(smoke_CalculatorListener_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? CalculatorListener {
        smoke_CalculatorListener_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_CalculatorListener_moveFromCType(_ handle: _baseRef) -> CalculatorListener {
    if let swift_pointer = smoke_CalculatorListener_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculatorListener {
        smoke_CalculatorListener_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_CalculatorListener_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculatorListener {
        smoke_CalculatorListener_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_CalculatorListener_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? CalculatorListener {
        smoke_CalculatorListener_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_CalculatorListener_copyFromCType(_ handle: _baseRef) -> CalculatorListener? {
    guard handle != 0 else {
        return nil
    }
    return foobar_CalculatorListener_moveFromCType(handle) as CalculatorListener
}
internal func foobar_CalculatorListener_moveFromCType(_ handle: _baseRef) -> CalculatorListener? {
    guard handle != 0 else {
        return nil
    }
    return foobar_CalculatorListener_moveFromCType(handle) as CalculatorListener
}
internal func foobar_copyToCType(_ swiftClass: CalculatorListener) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: CalculatorListener) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: CalculatorListener?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: CalculatorListener?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> ResultStruct {
    return ResultStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> ResultStruct {
    defer {
        smoke_CalculatorListener_ResultStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: ResultStruct) -> RefHolder {
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_CalculatorListener_ResultStruct_create_handle(c_result.ref))
}
internal func foobar_moveToCType(_ swiftType: ResultStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_CalculatorListener_ResultStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> ResultStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_CalculatorListener_ResultStruct_unwrap_optional_handle(handle)
    return ResultStruct(cHandle: unwrappedHandle) as ResultStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> ResultStruct? {
    defer {
        smoke_CalculatorListener_ResultStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: ResultStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_result = moveToCType(swiftType.result)
    return RefHolder(smoke_CalculatorListener_ResultStruct_create_optional_handle(c_result.ref))
}
internal func foobar_moveToCType(_ swiftType: ResultStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_CalculatorListener_ResultStruct_release_optional_handle)
}
