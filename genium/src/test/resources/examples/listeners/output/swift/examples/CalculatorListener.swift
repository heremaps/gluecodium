//
//
import Foundation
public protocol CalculatorListener : AnyObject {
    func onCalculationResult(calculationResult: Double) -> Void
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
        examples_CalculatorListener_release_handle(c_instance)
    }
    public func onCalculationResult(calculationResult: Double) -> Void {
        let c_calculationResult = moveToCType(calculationResult)
        return moveFromCType(examples_CalculatorListener_onCalculationResult(self.c_instance, c_calculationResult.ref))
    }
}
@_cdecl("_CBridgeInitexamples_CalculatorListener")
internal func _CBridgeInitexamples_CalculatorListener(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _CalculatorListener(cCalculatorListener: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: CalculatorListener?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_CalculatorListener_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_CalculatorListener_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_CalculatorListener_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_CalculatorListener_onCalculationResult = {(swift_class_pointer, calculationResult) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CalculatorListener
        swift_class.onCalculationResult(calculationResult: moveFromCType(calculationResult))
    }
    let proxy = examples_CalculatorListener_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_CalculatorListener_release_handle) : RefHolder(proxy)
}
extension _CalculatorListener: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CalculatorListenercopyFromCType(_ handle: _baseRef) -> CalculatorListener {
    if let swift_pointer = examples_CalculatorListener_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculatorListener {
        return re_constructed
    }
    if let swift_pointer = examples_CalculatorListener_get_typed(examples_CalculatorListener_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? CalculatorListener {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func CalculatorListenermoveFromCType(_ handle: _baseRef) -> CalculatorListener {
    if let swift_pointer = examples_CalculatorListener_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CalculatorListener {
        examples_CalculatorListener_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = examples_CalculatorListener_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? CalculatorListener {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func CalculatorListenercopyFromCType(_ handle: _baseRef) -> CalculatorListener? {
    guard handle != 0 else {
        return nil
    }
    return CalculatorListenermoveFromCType(handle) as CalculatorListener
}
internal func CalculatorListenermoveFromCType(_ handle: _baseRef) -> CalculatorListener? {
    guard handle != 0 else {
        return nil
    }
    return CalculatorListenermoveFromCType(handle) as CalculatorListener
}
internal func copyToCType(_ swiftClass: CalculatorListener) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CalculatorListener) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CalculatorListener?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CalculatorListener?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
