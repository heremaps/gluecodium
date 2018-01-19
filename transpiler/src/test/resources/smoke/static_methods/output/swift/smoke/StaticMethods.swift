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



internal func getRef(_ ref: StaticMethods) -> RefHolder {
    return RefHolder(ref.c_instance)
}
public class StaticMethods {
    let c_instance : _baseRef

    public init?(cStaticMethods: _baseRef) {
        guard cStaticMethods.private_pointer != nil else {
            return nil
        }
        c_instance = cStaticMethods
    }

    deinit {
        smoke_StaticMethods_release(c_instance)
    }
    public static func returnInvertedBoolean(input: Bool) -> Bool {
        return smoke_StaticMethods_returnInvertedBoolean(input)
    }

    public static func returnAndBoolean(input1: Bool, input2: Bool) -> Bool {
        return smoke_StaticMethods_returnAndBoolean(input1, input2)
    }

    public static func returnInputByteBuffer(inputBuffer: Data) -> Data {
        return inputBuffer.withUnsafeBytes { (inputBuffer_ptr: UnsafePointer<UInt8>) -> Data in
            let result_data_handle = smoke_StaticMethods_returnInputByteBuffer(inputBuffer_ptr, Int64(inputBuffer.count))
            defer {
                byteArray_release(result_data_handle)
            }
            return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
        }
    }

    public static func returnReverseByteBuffer(inputBuffer: Data) -> Data {
        return inputBuffer.withUnsafeBytes { (inputBuffer_ptr: UnsafePointer<UInt8>) -> Data in
            let result_data_handle = smoke_StaticMethods_returnReverseByteBuffer(inputBuffer_ptr, Int64(inputBuffer.count))
            defer {
                byteArray_release(result_data_handle)
            }
            return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
        }
    }

    public static func concatenateByteBuffers(input1: Data, input2: Data) -> Data {
        return input1.withUnsafeBytes { (input1_ptr: UnsafePointer<UInt8>) -> Data in
            return input2.withUnsafeBytes { (input2_ptr: UnsafePointer<UInt8>) -> Data in
                let result_data_handle = smoke_StaticMethods_concatenateByteBuffers(input1_ptr, Int64(input1.count), input2_ptr, Int64(input2.count))
                defer {
                    byteArray_release(result_data_handle)
                }
                return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
            }
        }
    }

    public static func returnFloat(inputNumber: Float) -> Float {
        return smoke_StaticMethods_returnFloat(inputNumber)
    }

    public static func returnIncrementedFloat(inputNumber: Float) -> Float {
        return smoke_StaticMethods_returnIncrementedFloat(inputNumber)
    }

    public static func sumTwoFloats(inputNumber1: Float, inputNumber2: Float) -> Float {
        return smoke_StaticMethods_sumTwoFloats(inputNumber1, inputNumber2)
    }

    public static func returnDouble(inputNumber: Double) -> Double {
        return smoke_StaticMethods_returnDouble(inputNumber)
    }

    public static func returnIncrementedDouble(inputNumber: Double) -> Double {
        return smoke_StaticMethods_returnIncrementedDouble(inputNumber)
    }

    public static func sumTwoDoubles(inputNumber1: Double, inputNumber2: Double) -> Double {
        return smoke_StaticMethods_sumTwoDoubles(inputNumber1, inputNumber2)
    }

    public static func returnNextNumberINT8(inputNumber: Int8) -> Int8 {
        return smoke_StaticMethods_returnNextNumberINT8(inputNumber)
    }

    public static func sumTwoNumbersINT8(inputNumber1: Int8, inputNumber2: Int8) -> Int8 {
        return smoke_StaticMethods_sumTwoNumbersINT8(inputNumber1, inputNumber2)
    }

    public static func returnPrimeINT8() -> Int8 {
        return smoke_StaticMethods_returnPrimeINT8()
    }

    public static func returnNextNumberUINT8(inputNumber: UInt8) -> UInt8 {
        return smoke_StaticMethods_returnNextNumberUINT8(inputNumber)
    }

    public static func sumTwoNumbersUINT8(inputNumber1: UInt8, inputNumber2: UInt8) -> UInt8 {
        return smoke_StaticMethods_sumTwoNumbersUINT8(inputNumber1, inputNumber2)
    }

    public static func returnPrimeUINT8() -> UInt8 {
        return smoke_StaticMethods_returnPrimeUINT8()
    }

    public static func returnNextNumberINT16(inputNumber: Int16) -> Int16 {
        return smoke_StaticMethods_returnNextNumberINT16(inputNumber)
    }

    public static func sumTwoNumbersINT16(inputNumber1: Int16, inputNumber2: Int16) -> Int16 {
        return smoke_StaticMethods_sumTwoNumbersINT16(inputNumber1, inputNumber2)
    }

    public static func returnPrimeINT16() -> Int16 {
        return smoke_StaticMethods_returnPrimeINT16()
    }

    public static func returnNextNumberUINT16(inputNumber: UInt16) -> UInt16 {
        return smoke_StaticMethods_returnNextNumberUINT16(inputNumber)
    }

    public static func sumTwoNumbersUINT16(inputNumber1: UInt16, inputNumber2: UInt16) -> UInt16 {
        return smoke_StaticMethods_sumTwoNumbersUINT16(inputNumber1, inputNumber2)
    }

    public static func returnPrimeUINT16() -> UInt16 {
        return smoke_StaticMethods_returnPrimeUINT16()
    }

    public static func returnNextNumberINT32(inputNumber: Int32) -> Int32 {
        return smoke_StaticMethods_returnNextNumberINT32(inputNumber)
    }

    public static func sumTwoNumbersINT32(inputNumber1: Int32, inputNumber2: Int32) -> Int32 {
        return smoke_StaticMethods_sumTwoNumbersINT32(inputNumber1, inputNumber2)
    }

    public static func returnPrimeINT32() -> Int32 {
        return smoke_StaticMethods_returnPrimeINT32()
    }

    public static func returnNextNumberUINT32(inputNumber: UInt32) -> UInt32 {
        return smoke_StaticMethods_returnNextNumberUINT32(inputNumber)
    }

    public static func sumTwoNumbersUINT32(inputNumber1: UInt32, inputNumber2: UInt32) -> UInt32 {
        return smoke_StaticMethods_sumTwoNumbersUINT32(inputNumber1, inputNumber2)
    }

    public static func returnPrimeUINT32() -> UInt32 {
        return smoke_StaticMethods_returnPrimeUINT32()
    }

    public static func returnNextNumberINT64(inputNumber: Int64) -> Int64 {
        return smoke_StaticMethods_returnNextNumberINT64(inputNumber)
    }

    public static func sumTwoNumbersINT64(inputNumber1: Int64, inputNumber2: Int64) -> Int64 {
        return smoke_StaticMethods_sumTwoNumbersINT64(inputNumber1, inputNumber2)
    }

    public static func returnPrimeINT64() -> Int64 {
        return smoke_StaticMethods_returnPrimeINT64()
    }

    public static func returnNextNumberUINT64(inputNumber: UInt64) -> UInt64 {
        return smoke_StaticMethods_returnNextNumberUINT64(inputNumber)
    }

    public static func sumTwoNumbersUINT64(inputNumber1: UInt64, inputNumber2: UInt64) -> UInt64 {
        return smoke_StaticMethods_sumTwoNumbersUINT64(inputNumber1, inputNumber2)
    }

    public static func returnPrimeUINT64() -> UInt64 {
        return smoke_StaticMethods_returnPrimeUINT64()
    }

    public static func returnInputString(inputString: String) -> String? {
        let result_string_handle = smoke_StaticMethods_returnInputString(inputString)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

    public static func concatenateStrings(inputString1: String, inputString2: String) -> String? {
        let result_string_handle = smoke_StaticMethods_concatenateStrings(inputString1, inputString2)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

    public static func returnHelloString() -> String? {
        let result_string_handle = smoke_StaticMethods_returnHelloString()
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

    public static func returnEmpty() -> String? {
        let result_string_handle = smoke_StaticMethods_returnEmpty()
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

}
