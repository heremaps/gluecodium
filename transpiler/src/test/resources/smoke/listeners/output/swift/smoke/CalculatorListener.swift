//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: CalculatorListener) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = smoke_CalculatorListener_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.smoke_CalculatorListener_onCalculationResult = {(swiftClass_pointer, calculationResult) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! CalculatorListener
        return swiftClass.onCalculationResult(calculationResult: calculationResult)
    }
    functions.smoke_CalculatorListener_onCalculationResultConst = {(swiftClass_pointer, calculationResult) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! CalculatorListener
        return swiftClass.onCalculationResultConst(calculationResult: calculationResult)
    }
    functions.smoke_CalculatorListener_onCalculationResultStruct = {(swiftClass_pointer, calculationResult) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! CalculatorListener
        return swiftClass.onCalculationResultStruct(calculationResult: ResultStruct(cResultStruct: calculationResult)!)
    }
    functions.smoke_CalculatorListener_onCalculationResultArray = {(swiftClass_pointer, calculationResult) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! CalculatorListener
        return swiftClass.onCalculationResultArray(calculationResult: DoubleList(calculationResult))
    }
    let proxy = smoke_CalculatorListener_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_CalculatorListener_release)
}

public protocol CalculatorListener : AnyObject {
    func onCalculationResult(calculationResult: Double) -> Void
    func onCalculationResultConst(calculationResult: Double) -> Void
    func onCalculationResultStruct(calculationResult: ResultStruct) -> Void
    func onCalculationResultArray<TcalculationResult: Collection>(calculationResult: TcalculationResult) -> Void where TcalculationResult.Element == Double
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
        smoke_CalculatorListener_release(c_instance)
    }
    public func onCalculationResult(calculationResult: Double) -> Void {
        return smoke_CalculatorListener_onCalculationResult(c_instance, calculationResult)
    }
    public func onCalculationResultConst(calculationResult: Double) -> Void {
        return smoke_CalculatorListener_onCalculationResultConst(c_instance, calculationResult)
    }
    public func onCalculationResultStruct(calculationResult: ResultStruct) -> Void {
        let calculationResultHandle = calculationResult.convertToCType()
        defer {
            smoke_CalculatorListener_ResultStruct_release(calculationResultHandle)
        }
        return smoke_CalculatorListener_onCalculationResultStruct(c_instance, calculationResultHandle)
    }
    public func onCalculationResultArray<TcalculationResult: Collection>(calculationResult: TcalculationResult) -> Void where TcalculationResult.Element == Double {
        let calculationResultHandle = calculationResult.c_conversion()
        defer {
            calculationResultHandle.cleanup()
        }
        return smoke_CalculatorListener_onCalculationResultArray(c_instance, calculationResultHandle.c_type)
    }
}

extension _CalculatorListener: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

public struct ResultStruct {
    public var result: Double
    public init(result: Double) {
        self.result = result
    }
    internal init?(cResultStruct: _baseRef) {
        result = smoke_CalculatorListener_ResultStruct_result_get(cResultStruct)
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_CalculatorListener_ResultStruct_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cResultStruct: _baseRef) -> Void {
        smoke_CalculatorListener_ResultStruct_result_set(cResultStruct, result)
    }
}
