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

internal func getRef(_ ref: Calculator) -> RefHolder {
    return RefHolder(ref.c_instance)
}
public class Calculator {
    let c_instance : _baseRef
    public init?(cCalculator: _baseRef) {
        c_instance = cCalculator
    }
    deinit {
        examples_Calculator_release(c_instance)
    }

    public static func registerListener(listener: CalculatorListener) -> Void {
        let listenerHandle = getRef(listener)
        return examples_Calculator_registerListener(listenerHandle.ref)
    }

    public static func unregisterListener(listener: CalculatorListener) -> Void {
        let listenerHandle = getRef(listener)
        return examples_Calculator_unregisterListener(listenerHandle.ref)
    }

    public static func calculate() -> Void {
        return examples_Calculator_calculate()
    }

}
