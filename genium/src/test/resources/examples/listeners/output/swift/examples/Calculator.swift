//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
@_cdecl("_CBridgeInitexamples_Calculator")
internal func _CBridgeInitexamples_Calculator(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = Calculator(cCalculator: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: Calculator?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Calculator_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Calculator_release_handle)
        : RefHolder(handle_copy)
}
public class Calculator {
    public init() {
        let _result = Calculator.create()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    let c_instance : _baseRef
    init(cCalculator: _baseRef) {
        guard cCalculator != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCalculator
    }
    deinit {
        examples_Calculator_release_handle(c_instance)
    }
    private static func create() -> _baseRef {
        return moveFromCType(examples_Calculator_create())
    }
    public func registerListener(listener: CalculatorListener) -> Void {
        let c_listener = moveToCType(listener)
        return moveFromCType(examples_Calculator_registerListener(self.c_instance, c_listener.ref))
    }
    public func unregisterListener(listener: CalculatorListener) -> Void {
        let c_listener = moveToCType(listener)
        return moveFromCType(examples_Calculator_unregisterListener(self.c_instance, c_listener.ref))
    }
    public func calculate() -> Void {
        return moveFromCType(examples_Calculator_calculate(self.c_instance))
    }
}
extension Calculator: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CalculatorcopyFromCType(_ handle: _baseRef) -> Calculator {
    if let swift_pointer = examples_Calculator_get_typed(examples_Calculator_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Calculator {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func CalculatormoveFromCType(_ handle: _baseRef) -> Calculator {
    if let swift_pointer = examples_Calculator_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Calculator {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func CalculatorcopyFromCType(_ handle: _baseRef) -> Calculator? {
    guard handle != 0 else {
        return nil
    }
    return CalculatormoveFromCType(handle) as Calculator
}
internal func CalculatormoveFromCType(_ handle: _baseRef) -> Calculator? {
    guard handle != 0 else {
        return nil
    }
    return CalculatormoveFromCType(handle) as Calculator
}
internal func copyToCType(_ swiftClass: Calculator) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Calculator) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Calculator?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Calculator?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}