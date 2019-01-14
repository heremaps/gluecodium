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
        return moveFromCType(smoke_StaticMethods_returnInvertedBoolean(input))
    }
    public static func returnAndBoolean(input1: Bool, input2: Bool) -> Bool {
        return moveFromCType(smoke_StaticMethods_returnAndBoolean(input1, input2))
    }
    public static func returnInputByteBuffer(inputBuffer: Data) -> Data {
        let inputBuffer_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(inputBuffer_handle)
        }
        inputBuffer.withUnsafeBytes { (inputBuffer_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(inputBuffer_handle, inputBuffer_ptr, inputBuffer.count)
        }
        return moveFromCType(smoke_StaticMethods_returnInputByteBuffer(inputBuffer_handle))
    }
    public static func returnReverseByteBuffer(inputBuffer: Data) -> Data {
        let inputBuffer_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(inputBuffer_handle)
        }
        inputBuffer.withUnsafeBytes { (inputBuffer_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(inputBuffer_handle, inputBuffer_ptr, inputBuffer.count)
        }
        return moveFromCType(smoke_StaticMethods_returnReverseByteBuffer(inputBuffer_handle))
    }
    public static func concatenateByteBuffers(input1: Data, input2: Data) -> Data {
        let input1_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(input1_handle)
        }
        input1.withUnsafeBytes { (input1_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(input1_handle, input1_ptr, input1.count)
        }
        let input2_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(input2_handle)
        }
        input2.withUnsafeBytes { (input2_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(input2_handle, input2_ptr, input2.count)
        }
        return moveFromCType(smoke_StaticMethods_concatenateByteBuffers(input1_handle, input2_handle))
    }
    public static func returnFloat(inputNumber: Float) -> Float {
        return moveFromCType(smoke_StaticMethods_returnFloat(inputNumber))
    }
    public static func returnIncrementedFloat(inputNumber: Float) -> Float {
        return moveFromCType(smoke_StaticMethods_returnIncrementedFloat(inputNumber))
    }
    public static func sumTwoFloats(inputNumber1: Float, inputNumber2: Float) -> Float {
        return moveFromCType(smoke_StaticMethods_sumTwoFloats(inputNumber1, inputNumber2))
    }
    public static func returnDouble(inputNumber: Double) -> Double {
        return moveFromCType(smoke_StaticMethods_returnDouble(inputNumber))
    }
    public static func returnIncrementedDouble(inputNumber: Double) -> Double {
        return moveFromCType(smoke_StaticMethods_returnIncrementedDouble(inputNumber))
    }
    public static func sumTwoDoubles(inputNumber1: Double, inputNumber2: Double) -> Double {
        return moveFromCType(smoke_StaticMethods_sumTwoDoubles(inputNumber1, inputNumber2))
    }
    public static func returnNextNumberINT8(inputNumber: Int8) -> Int8 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT8(inputNumber))
    }
    public static func sumTwoNumbersINT8(inputNumber1: Int8, inputNumber2: Int8) -> Int8 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT8(inputNumber1, inputNumber2))
    }
    public static func returnPrimeINT8() -> Int8 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT8())
    }
    public static func returnNextNumberUINT8(inputNumber: UInt8) -> UInt8 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT8(inputNumber))
    }
    public static func sumTwoNumbersUINT8(inputNumber1: UInt8, inputNumber2: UInt8) -> UInt8 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT8(inputNumber1, inputNumber2))
    }
    public static func returnPrimeUINT8() -> UInt8 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT8())
    }
    public static func returnNextNumberINT16(inputNumber: Int16) -> Int16 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT16(inputNumber))
    }
    public static func sumTwoNumbersINT16(inputNumber1: Int16, inputNumber2: Int16) -> Int16 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT16(inputNumber1, inputNumber2))
    }
    public static func returnPrimeINT16() -> Int16 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT16())
    }
    public static func returnNextNumberUINT16(inputNumber: UInt16) -> UInt16 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT16(inputNumber))
    }
    public static func sumTwoNumbersUINT16(inputNumber1: UInt16, inputNumber2: UInt16) -> UInt16 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT16(inputNumber1, inputNumber2))
    }
    public static func returnPrimeUINT16() -> UInt16 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT16())
    }
    public static func returnNextNumberINT32(inputNumber: Int32) -> Int32 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT32(inputNumber))
    }
    public static func sumTwoNumbersINT32(inputNumber1: Int32, inputNumber2: Int32) -> Int32 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT32(inputNumber1, inputNumber2))
    }
    public static func returnPrimeINT32() -> Int32 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT32())
    }
    public static func returnNextNumberUINT32(inputNumber: UInt32) -> UInt32 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT32(inputNumber))
    }
    public static func sumTwoNumbersUINT32(inputNumber1: UInt32, inputNumber2: UInt32) -> UInt32 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT32(inputNumber1, inputNumber2))
    }
    public static func returnPrimeUINT32() -> UInt32 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT32())
    }
    public static func returnNextNumberINT64(inputNumber: Int64) -> Int64 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberINT64(inputNumber))
    }
    public static func sumTwoNumbersINT64(inputNumber1: Int64, inputNumber2: Int64) -> Int64 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersINT64(inputNumber1, inputNumber2))
    }
    public static func returnPrimeINT64() -> Int64 {
        return moveFromCType(smoke_StaticMethods_returnPrimeINT64())
    }
    public static func returnNextNumberUINT64(inputNumber: UInt64) -> UInt64 {
        return moveFromCType(smoke_StaticMethods_returnNextNumberUINT64(inputNumber))
    }
    public static func sumTwoNumbersUINT64(inputNumber1: UInt64, inputNumber2: UInt64) -> UInt64 {
        return moveFromCType(smoke_StaticMethods_sumTwoNumbersUINT64(inputNumber1, inputNumber2))
    }
    public static func returnPrimeUINT64() -> UInt64 {
        return moveFromCType(smoke_StaticMethods_returnPrimeUINT64())
    }
    public static func returnInputString(inputString: String) -> String {
        return moveFromCType(smoke_StaticMethods_returnInputString(inputString))
    }
    public static func concatenateStrings(inputString1: String, inputString2: String) -> String {
        return moveFromCType(smoke_StaticMethods_concatenateStrings(inputString1, inputString2))
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
    return StaticMethods(cStaticMethods: handle)
}
internal func StaticMethodsmoveFromCType(_ handle: _baseRef) -> StaticMethods {
    return StaticMethodscopyFromCType(handle)
}
internal func StaticMethodscopyFromCType(_ handle: _baseRef) -> StaticMethods? {
    guard handle != 0 else {
        return nil
    }
    return StaticMethodsmoveFromCType(handle) as StaticMethods
}
internal func StaticMethodsmoveFromCType(_ handle: _baseRef) -> StaticMethods? {
    return StaticMethodscopyFromCType(handle)
}