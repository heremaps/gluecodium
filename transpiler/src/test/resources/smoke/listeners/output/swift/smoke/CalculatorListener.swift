//
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
    functions.smoke_CalculatorListener_onCalculationResultMap = {(swiftClass_pointer, calculationResults) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! CalculatorListener
        defer {
            smoke_CalculatorListener_NamedCalculationResults_release(calculationResults)
        }
        return swiftClass.onCalculationResultMap(calculationResults: convertNamedCalculationResultsFromCType(calculationResults))
    }
    let proxy = smoke_CalculatorListener_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_CalculatorListener_release)
}

public protocol CalculatorListener : AnyObject {
    typealias NamedCalculationResults = [String: Double]
    func onCalculationResult(calculationResult: Double) -> Void
    func onCalculationResultConst(calculationResult: Double) -> Void
    func onCalculationResultStruct(calculationResult: ResultStruct) -> Void
    func onCalculationResultArray<TcalculationResult: Collection>(calculationResult: TcalculationResult) -> Void where TcalculationResult.Element == Double
    func onCalculationResultMap(calculationResults: NamedCalculationResults) -> Void
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
    public func onCalculationResultMap(calculationResults: NamedCalculationResults) -> Void {
        let calculationResultsHandle = convertNamedCalculationResultsToCType(calculationResults)
        defer {
            smoke_CalculatorListener_NamedCalculationResults_release(calculationResultsHandle)
        }
        return smoke_CalculatorListener_onCalculationResultMap(c_instance, calculationResultsHandle)
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

func convertNamedCalculationResultsToCType(_ swiftDict: NamedCalculationResults) -> _baseRef {
    let cHandle = smoke_CalculatorListener_NamedCalculationResults_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release(c_key)
        }
        let c_value = swift_value
        smoke_CalculatorListener_NamedCalculationResults_put(cHandle, c_key, c_value)
    }
    return cHandle
}
func convertNamedCalculationResultsFromCType(_ cHandle: _baseRef) -> NamedCalculationResults {
    var swiftDict: NamedCalculationResults = [:]
    let iteratorHandle = smoke_CalculatorListener_NamedCalculationResults_iterator(cHandle)
    while smoke_CalculatorListener_NamedCalculationResults_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_CalculatorListener_NamedCalculationResults_iterator_key(iteratorHandle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_CalculatorListener_NamedCalculationResults_iterator_value(iteratorHandle)
        let swift_value = c_value
        swiftDict[swift_key!] = swift_value
        smoke_CalculatorListener_NamedCalculationResults_iterator_increment(iteratorHandle)
    }
    smoke_CalculatorListener_NamedCalculationResults_iterator_release(iteratorHandle)
    return swiftDict
}
