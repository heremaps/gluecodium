//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: StaticMethods?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_StaticMethods_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_StaticMethods_release_handle)
        : RefHolder(handle_copy)
}
public class StaticMethods {
    let c_instance : _baseRef
    init(cStaticMethods: _baseRef) {
        guard cStaticMethods != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cStaticMethods
    }
    deinit {
        smoke_StaticMethods_release_handle(c_instance)
    }
    public static func returnInvertedBoolean(input: Bool) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_StaticMethods_returnInvertedBoolean(c_input.ref))
    }
    public static func returnAndBoolean(input1: Bool, input2: Bool) -> Bool {
            let c_input1 = moveToCType(input1)
            let c_input2 = moveToCType(input2)
        return moveFromCType(smoke_StaticMethods_returnAndBoolean(c_input1.ref, c_input2.ref))
    }
    public static func returnInputByteBuffer(inputBuffer: Data) -> Data {
            let c_inputBuffer = moveToCType(inputBuffer)
        return moveFromCType(smoke_StaticMethods_returnInputByteBuffer(c_inputBuffer.ref))
    }
    public static func returnReverseByteBuffer(inputBuffer: Data) -> Data {
            let c_inputBuffer = moveToCType(inputBuffer)
        return moveFromCType(smoke_StaticMethods_returnReverseByteBuffer(c_inputBuffer.ref))
    }
    public static func concatenateByteBuffers(input1: Data, input2: Data) -> Data {
            let c_input1 = moveToCType(input1)
            let c_input2 = moveToCType(input2)
        return moveFromCType(smoke_StaticMethods_concatenateByteBuffers(c_input1.ref, c_input2.ref))
    }
    public static func returnFloat(inputNumber: Float) -> Float {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnFloat(c_inputNumber.ref))
    }
    public static func returnIncrementedFloat(inputNumber: Float) -> Float {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnIncrementedFloat(c_inputNumber.ref))
    }
    public static func sumTwoFloats(inputNumber1: Float, inputNumber2: Float) -> Float {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoFloats(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnDouble(inputNumber: Double) -> Double {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnDouble(c_inputNumber.ref))
    }
    public static func returnIncrementedDouble(inputNumber: Double) -> Double {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnIncrementedDouble(c_inputNumber.ref))
    }
    public static func sumTwoDoubles(inputNumber1: Double, inputNumber2: Double) -> Double {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoDoubles(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnNextNumberINT8(inputNumber: Int8) -> Int8 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT8(c_inputNumber.ref))
    }
    public static func sumTwoNumbersINT8(inputNumber1: Int8, inputNumber2: Int8) -> Int8 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT8(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeINT8() -> Int8 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT8())
    }
    public static func returnNextNumberUINT8(inputNumber: UInt8) -> UInt8 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT8(c_inputNumber.ref))
    }
    public static func sumTwoNumbersUINT8(inputNumber1: UInt8, inputNumber2: UInt8) -> UInt8 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT8(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeUINT8() -> UInt8 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT8())
    }
    public static func returnNextNumberINT16(inputNumber: Int16) -> Int16 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT16(c_inputNumber.ref))
    }
    public static func sumTwoNumbersINT16(inputNumber1: Int16, inputNumber2: Int16) -> Int16 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT16(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeINT16() -> Int16 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT16())
    }
    public static func returnNextNumberUINT16(inputNumber: UInt16) -> UInt16 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT16(c_inputNumber.ref))
    }
    public static func sumTwoNumbersUINT16(inputNumber1: UInt16, inputNumber2: UInt16) -> UInt16 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT16(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeUINT16() -> UInt16 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT16())
    }
    public static func returnNextNumberINT32(inputNumber: Int32) -> Int32 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT32(c_inputNumber.ref))
    }
    public static func sumTwoNumbersINT32(inputNumber1: Int32, inputNumber2: Int32) -> Int32 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT32(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeINT32() -> Int32 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT32())
    }
    public static func returnNextNumberUINT32(inputNumber: UInt32) -> UInt32 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT32(c_inputNumber.ref))
    }
    public static func sumTwoNumbersUINT32(inputNumber1: UInt32, inputNumber2: UInt32) -> UInt32 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT32(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeUINT32() -> UInt32 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT32())
    }
    public static func returnNextNumberINT64(inputNumber: Int64) -> Int64 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT64(c_inputNumber.ref))
    }
    public static func sumTwoNumbersINT64(inputNumber1: Int64, inputNumber2: Int64) -> Int64 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT64(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeINT64() -> Int64 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT64())
    }
    public static func returnNextNumberUINT64(inputNumber: UInt64) -> UInt64 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT64(c_inputNumber.ref))
    }
    public static func sumTwoNumbersUINT64(inputNumber1: UInt64, inputNumber2: UInt64) -> UInt64 {
            let c_inputNumber1 = moveToCType(inputNumber1)
            let c_inputNumber2 = moveToCType(inputNumber2)
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT64(c_inputNumber1.ref, c_inputNumber2.ref))
    }
    public static func returnPrimeUINT64() -> UInt64 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT64())
    }
    public static func returnInputString(inputString: String) -> String {
            let c_inputString = moveToCType(inputString)
        return moveFromCType(smoke_StaticMethods_returnInputString(c_inputString.ref))
    }
    public static func concatenateStrings(inputString1: String, inputString2: String) -> String {
            let c_inputString1 = moveToCType(inputString1)
            let c_inputString2 = moveToCType(inputString2)
        return moveFromCType(smoke_StaticMethods_concatenateStrings(c_inputString1.ref, c_inputString2.ref))
    }
    public static func returnHelloString() -> String {
        return moveFromCType(smoke_StaticMethods_returnHelloString())
    }
    public static func returnEmpty() -> String {
        return moveFromCType(smoke_StaticMethods_returnEmpty())
    }
}
extension StaticMethods: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func StaticMethodscopyFromCType(_ handle: _baseRef) -> StaticMethods {
    return StaticMethods(cStaticMethods: smoke_StaticMethods_copy_handle(handle))
}
internal func StaticMethodsmoveFromCType(_ handle: _baseRef) -> StaticMethods {
    return StaticMethods(cStaticMethods: handle)
}
internal func StaticMethodscopyFromCType(_ handle: _baseRef) -> StaticMethods? {
    guard handle != 0 else {
        return nil
    }
    return StaticMethodsmoveFromCType(handle) as StaticMethods
}
internal func StaticMethodsmoveFromCType(_ handle: _baseRef) -> StaticMethods? {
    guard handle != 0 else {
        return nil
    }
    return StaticMethodsmoveFromCType(handle) as StaticMethods
}
internal func copyToCType(_ swiftClass: StaticMethods) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: StaticMethods) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: StaticMethods?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: StaticMethods?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}