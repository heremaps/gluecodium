//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: CalculatorListener?) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        return RefHolder(instanceReference.c_handle)
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
        return swift_class.onCalculationResult(calculationResult: calculationResult)
    }
    let proxy = examples_CalculatorListener_createProxy(functions)
    return RefHolder(ref: proxy, release: examples_CalculatorListener_release)
}

public protocol CalculatorListener : AnyObject {

    func onCalculationResult(calculationResult: Double) -> Void
}

internal class _CalculatorListener: CalculatorListener {

    let c_instance : _baseRef

    init?(cCalculatorListener: _baseRef) {
        guard cCalculatorListener != 0 else {
            return nil
        }
        c_instance = cCalculatorListener
    }

    deinit {
        examples_CalculatorListener_release(c_instance)
    }
    public func onCalculationResult(calculationResult: Double) -> Void {
        return examples_CalculatorListener_onCalculationResult(c_instance, calculationResult)
    }

}

extension _CalculatorListener: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
