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
    public static func methodWithUInt8(inputNumber: UInt8) -> UInt8 {
        let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithUInt8(c_inputNumber.ref))
    }
    public static func methodWithInt32(inputNumber: Int32) -> Int32 {
        let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithInt32(c_inputNumber.ref))
    }
    public static func methodWithUInt64(inputNumber: UInt64) -> UInt64 {
        let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithUInt64(c_inputNumber.ref))
    }
    public static func methodWithBoolean(inputCondition: Bool) -> Bool {
        let c_inputCondition = moveToCType(inputCondition)
        return moveFromCType(examples_BuiltinTypes_methodWithBoolean(c_inputCondition.ref))
    }
    public static func methodWithDouble(inputNumber: Double) -> Double {
        let c_inputNumber = moveToCType(inputNumber)
        return moveFromCType(examples_BuiltinTypes_methodWithDouble(c_inputNumber.ref))
    }
    public static func methodWithString(inputString: String) -> String {
        let c_inputString = moveToCType(inputString)
        return moveFromCType(examples_BuiltinTypes_methodWithString(c_inputString.ref))
    }
    public static func methodWithByteBuffer(inputBuffer: Data) -> Data {
        let c_inputBuffer = moveToCType(inputBuffer)
        return moveFromCType(examples_BuiltinTypes_methodWithByteBuffer(c_inputBuffer.ref))
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
