//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: BuiltinTypes?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class BuiltinTypes {
    let c_instance : _baseRef

    init?(cBuiltinTypes: _baseRef) {
        guard cBuiltinTypes != 0 else {
            return nil
        }
        c_instance = cBuiltinTypes
    }

    deinit {
        examples_BuiltinTypes_release_handle(c_instance)
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
        let inputBuffer_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(inputBuffer_handle)
        }
        inputBuffer.withUnsafeBytes { (inputBuffer_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(inputBuffer_handle, inputBuffer_ptr, inputBuffer.count)
        }
        let result_data_handle = examples_BuiltinTypes_methodWithByteBuffer(inputBuffer_handle)
        defer {
            byteArray_release_handle(result_data_handle)
        }
        return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
    }

    public static func methodWithFloatAndInteger(inputFloat: Float, inputInteger: Int32) -> Double {
        return examples_BuiltinTypes_methodWithFloatAndInteger(inputFloat, inputInteger)
    }

}

extension BuiltinTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
