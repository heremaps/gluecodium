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

internal func getRef(_ ref: BuiltinTypes) -> RefHolder<examples_BuiltinTypesRef> {
    return RefHolder<examples_BuiltinTypesRef>(ref.c_instance)
}
public class BuiltinTypes {
    let c_instance : examples_BuiltinTypesRef
    public required init?(cBuiltinTypes: examples_BuiltinTypesRef) {
        c_instance = cBuiltinTypes
    }
    deinit {
        examples_BuiltinTypes_release(c_instance)
    }

    public static func methodWithInt8(inputNumber: Int8) -> Int8 {
        return examples_BuiltinTypes_methodWithInt8(inputNumber)
    }

    public static func methodWithUInt8(inputNumber: UInt8) -> UInt8 {
        return examples_BuiltinTypes_methodWithUInt8(inputNumber)
    }

    public static func methodWithInt16(inputNumber: Int16) -> Int16 {
        return examples_BuiltinTypes_methodWithInt16(inputNumber)
    }

    public static func methodWithUInt16(inputNumber: UInt16) -> UInt16 {
        return examples_BuiltinTypes_methodWithUInt16(inputNumber)
    }

    public static func methodWithInt32(inputNumber: Int32) -> Int32 {
        return examples_BuiltinTypes_methodWithInt32(inputNumber)
    }

    public static func methodWithUInt32(inputNumber: UInt32) -> UInt32 {
        return examples_BuiltinTypes_methodWithUInt32(inputNumber)
    }

    public static func methodWithInt64(inputNumber: Int64) -> Int64 {
        return examples_BuiltinTypes_methodWithInt64(inputNumber)
    }

    public static func methodWithUInt64(inputNumber: UInt64) -> UInt64 {
        return examples_BuiltinTypes_methodWithUInt64(inputNumber)
    }

    public static func methodWithBoolean(inputCondition: Bool) -> Bool {
        return examples_BuiltinTypes_methodWithBoolean(inputCondition)
    }

    public static func methodWithFloat(inputNumber: Float) -> Float {
        return examples_BuiltinTypes_methodWithFloat(inputNumber)
    }

    public static func methodWithDouble(inputNumber: Double) -> Double {
        return examples_BuiltinTypes_methodWithDouble(inputNumber)
    }

    public static func methodWithByteBuffer(inputBuffer: Data) -> Data {
        return inputBuffer.withUnsafeBytes { (inputBuffer_ptr: UnsafePointer<UInt8>) -> Data in
            let result_data_handle = examples_BuiltinTypes_methodWithByteBuffer(inputBuffer_ptr, Int64(inputBuffer.count))

            defer {
                byteArray_release(result_data_handle)
            }
            return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
        }
    }

    public static func methodWithFloatAndInteger(inputFloat: Float, inputInteger: Int32) -> Double {
        return examples_BuiltinTypes_methodWithFloatAndInteger(inputFloat, inputInteger)
    }

}
