//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
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
    public static func registerListener(listener: CalculatorListener?) -> Void {
            let c_listener = moveToCType(listener)
        return moveFromCType(examples_Calculator_registerListener(c_listener.ref))
    }
    public static func unregisterListener(listener: CalculatorListener?) -> Void {
            let c_listener = moveToCType(listener)
        return moveFromCType(examples_Calculator_unregisterListener(c_listener.ref))
    }
    public static func calculate() -> Void {
        return moveFromCType(examples_Calculator_calculate())
    }
}
extension Calculator: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CalculatorcopyFromCType(_ handle: _baseRef) -> Calculator {
    return Calculator(cCalculator: examples_Calculator_copy_handle(handle))
}
internal func CalculatormoveFromCType(_ handle: _baseRef) -> Calculator {
    return Calculator(cCalculator: handle)
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