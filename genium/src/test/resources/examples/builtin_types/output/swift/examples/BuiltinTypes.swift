//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: BuiltinTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_BuiltinTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_BuiltinTypes_release_handle)
        : RefHolder(handle_copy)
}
public class BuiltinTypes {
    let c_instance : _baseRef
    init(cBuiltinTypes: _baseRef) {
        guard cBuiltinTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cBuiltinTypes
    }
    deinit {
        examples_BuiltinTypes_release_handle(c_instance)
    }
    public static func methodWithInt8(inputNumber: Int8) -> Int8 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithInt8(c_inputNumber.ref))
    }
    public static func methodWithUInt8(inputNumber: UInt8) -> UInt8 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithUInt8(c_inputNumber.ref))
    }
    public static func methodWithInt16(inputNumber: Int16) -> Int16 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithInt16(c_inputNumber.ref))
    }
    public static func methodWithUInt16(inputNumber: UInt16) -> UInt16 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithUInt16(c_inputNumber.ref))
    }
    public static func methodWithInt32(inputNumber: Int32) -> Int32 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithInt32(c_inputNumber.ref))
    }
    public static func methodWithUInt32(inputNumber: UInt32) -> UInt32 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithUInt32(c_inputNumber.ref))
    }
    public static func methodWithInt64(inputNumber: Int64) -> Int64 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithInt64(c_inputNumber.ref))
    }
    public static func methodWithUInt64(inputNumber: UInt64) -> UInt64 {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithUInt64(c_inputNumber.ref))
    }
    public static func methodWithBoolean(inputCondition: Bool) -> Bool {
            let c_inputCondition = moveToCType(inputCondition)
        return moveFromCType(examples_BuiltinTypes_methodWithBoolean(c_inputCondition.ref))
    }
    public static func methodWithFloat(inputNumber: Float) -> Float {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithFloat(c_inputNumber.ref))
    }
    public static func methodWithDouble(inputNumber: Double) -> Double {
            let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithDouble(c_inputNumber.ref))
    }
    public static func methodWithByteBuffer(inputBuffer: Data) -> Data {
            let c_inputBuffer = moveToCType(inputBuffer)
        return moveFromCType(examples_BuiltinTypes_methodWithByteBuffer(c_inputBuffer.ref))
    }
    public static func methodWithFloatAndInteger(inputFloat: Float, inputInteger: Int32) -> Double {
            let c_inputFloat = moveToCType(inputFloat)
            let c_inputInteger = moveToCType(inputInteger)
        return moveFromCType(examples_BuiltinTypes_methodWithFloatAndInteger(c_inputFloat.ref, c_inputInteger.ref))
    }
}
extension BuiltinTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func BuiltinTypescopyFromCType(_ handle: _baseRef) -> BuiltinTypes {
    return BuiltinTypes(cBuiltinTypes: examples_BuiltinTypes_copy_handle(handle))
}
internal func BuiltinTypesmoveFromCType(_ handle: _baseRef) -> BuiltinTypes {
    return BuiltinTypes(cBuiltinTypes: handle)
}
internal func BuiltinTypescopyFromCType(_ handle: _baseRef) -> BuiltinTypes? {
    guard handle != 0 else {
        return nil
    }
    return BuiltinTypesmoveFromCType(handle) as BuiltinTypes
}
internal func BuiltinTypesmoveFromCType(_ handle: _baseRef) -> BuiltinTypes? {
    guard handle != 0 else {
        return nil
    }
    return BuiltinTypesmoveFromCType(handle) as BuiltinTypes
}
internal func copyToCType(_ swiftClass: BuiltinTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: BuiltinTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: BuiltinTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: BuiltinTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}