//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: CalculatorListener) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }

    var functions = examples_CalculatorListener_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    functions.examples_CalculatorListener_onCalculationResult = {(swiftClass_pointer, calculationResult) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! CalculatorListener
        return swiftClass.onCalculationResult(calculationResult: calculationResult)
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
