//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: CalculatorListener) -> RefHolder<examples_CalculatorListenerRef> {
    if let instanceReference = ref as? _CalculatorListener {
        return RefHolder<examples_CalculatorListenerRef>(instanceReference.c_instance)
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
    precondition(proxy.private_pointer != nil, "Out of memory")
    return RefHolder(ref: proxy, release: examples_CalculatorListener_release)
}

public protocol CalculatorListener : AnyObject {

    func onCalculationResult(calculationResult: Double) -> Void

}

internal class _CalculatorListener: CalculatorListener {

    let c_instance : examples_CalculatorListenerRef

    required init?(cCalculatorListener: examples_CalculatorListenerRef) {
        c_instance = cCalculatorListener
    }

    deinit {
        examples_CalculatorListener_release(c_instance)
    }
    public func onCalculationResult(calculationResult: Double) -> Void {
        return examples_CalculatorListener_onCalculationResult(c_instance, calculationResult)
    }

}
