//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Arrays?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Arrays_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Arrays_release_handle)
        : RefHolder(handle_copy)
}
public class Arrays {
    public typealias ProfileId = String
    public typealias ErrorCodeToMessageMap = [Int32: String]
    let c_instance : _baseRef
    init(cArrays: _baseRef) {
        guard cArrays != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cArrays
    }
    deinit {
        smoke_Arrays_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable {
        case foo
        case bar
    }
    public enum ExternalEnum : UInt32, CaseIterable {
        case on
        case off
    }
    public struct BasicStruct {
        public var value: Double
        public init(value: Double) {
            self.value = value
        }
        internal init(cHandle: _baseRef) {
            value = moveFromCType(smoke_Arrays_BasicStruct_value_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_value = moveToCType(value)
            return smoke_Arrays_BasicStruct_create_handle(c_value.ref)
        }
    }
    public struct ExternalStruct {
        public var string: String
        public init(string: String) {
            self.string = string
        }
        internal init(cHandle: _baseRef) {
            string = moveFromCType(smoke_Arrays_ExternalStruct_string_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_string = moveToCType(string)
            return smoke_Arrays_ExternalStruct_create_handle(c_string.ref)
        }
    }
    public struct FancyStruct {
        public var messages: [String]
        public var numbers: [UInt8]
        public var image: Data
        public init(messages: [String], numbers: [UInt8], image: Data) {
            self.messages = messages
            self.numbers = numbers
            self.image = image
        }
        internal init(cHandle: _baseRef) {
            messages = moveFromCType(smoke_Arrays_FancyStruct_messages_get(cHandle))
            numbers = moveFromCType(smoke_Arrays_FancyStruct_numbers_get(cHandle))
            image = moveFromCType(smoke_Arrays_FancyStruct_image_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_messages = moveToCType(messages)
            let c_numbers = moveToCType(numbers)
            let c_image = moveToCType(image)
            return smoke_Arrays_FancyStruct_create_handle(c_messages.ref, c_numbers.ref, c_image.ref)
        }
    }
    public static func methodWithArray(input: [String]) -> [String] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArray(c_input.ref))
    }
    public static func methodWithArrayInline(input: [UInt8]) -> [UInt8] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayInline(c_input.ref))
    }
    public static func methodWithStructArray(input: [Arrays.BasicStruct]) -> [Arrays.BasicStruct] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithStructArray(c_input.ref))
    }
    public static func methodWithExternalStructArray(input: [Arrays.ExternalStruct]) -> [Arrays.ExternalStruct] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithExternalStructArray(c_input.ref))
    }
    public static func methodWithArrayOfArrays(input: [[UInt8]]) -> [[UInt8]] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayOfArrays(c_input.ref))
    }
    public static func mergeArraysOfStructsWithArrays(inlineFancyArray: [Arrays.FancyStruct], fancyArray: [Arrays.FancyStruct]) -> [Arrays.FancyStruct] {
            let c_inlineFancyArray = moveToCType(inlineFancyArray)
            let c_fancyArray = moveToCType(fancyArray)
        return moveFromCType(smoke_Arrays_mergeArraysOfStructsWithArrays(c_inlineFancyArray.ref, c_fancyArray.ref))
    }
    public static func methodWithArrayOfAliases(input: [Arrays.ProfileId]) -> [Arrays.ProfileId] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayOfAliases(c_input.ref))
    }
    public static func methodWithArrayOfMaps(input: [Arrays.ErrorCodeToMessageMap]) -> [Arrays.ErrorCodeToMessageMap] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayOfMaps(c_input.ref))
    }
    public static func methodWithByteBuffer(input: Data) -> Data {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithByteBuffer(c_input.ref))
    }
    public static func methodWithEnumArray(input: [Arrays.SomeEnum]) -> [Arrays.SomeEnum] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithEnumArray(c_input.ref))
    }
    public static func methodWithExternalEnumArray(input: [Arrays.ExternalEnum]) -> [Arrays.ExternalEnum] {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithExternalEnumArray(c_input.ref))
    }
}
extension Arrays: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ArrayscopyFromCType(_ handle: _baseRef) -> Arrays {
    return Arrays(cArrays: smoke_Arrays_copy_handle(handle))
}
internal func ArraysmoveFromCType(_ handle: _baseRef) -> Arrays {
    return Arrays(cArrays: handle)
}
internal func ArrayscopyFromCType(_ handle: _baseRef) -> Arrays? {
    guard handle != 0 else {
        return nil
    }
    return ArraysmoveFromCType(handle) as Arrays
}
internal func ArraysmoveFromCType(_ handle: _baseRef) -> Arrays? {
    guard handle != 0 else {
        return nil
    }
    return ArraysmoveFromCType(handle) as Arrays
}
internal func copyToCType(_ swiftClass: Arrays) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Arrays) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Arrays?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Arrays?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.BasicStruct {
    return Arrays.BasicStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.BasicStruct {
    defer {
        smoke_Arrays_BasicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.BasicStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Arrays.BasicStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Arrays_BasicStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.BasicStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Arrays_BasicStruct_unwrap_optional_handle(handle)
    return Arrays.BasicStruct(cHandle: unwrappedHandle) as Arrays.BasicStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.BasicStruct? {
    defer {
        smoke_Arrays_BasicStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.BasicStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Arrays_BasicStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Arrays.BasicStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Arrays_BasicStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.ExternalStruct {
    return Arrays.ExternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.ExternalStruct {
    defer {
        smoke_Arrays_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.ExternalStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Arrays.ExternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Arrays_ExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.ExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Arrays_ExternalStruct_unwrap_optional_handle(handle)
    return Arrays.ExternalStruct(cHandle: unwrappedHandle) as Arrays.ExternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.ExternalStruct? {
    defer {
        smoke_Arrays_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.ExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Arrays_ExternalStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Arrays.ExternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Arrays_ExternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.FancyStruct {
    return Arrays.FancyStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.FancyStruct {
    defer {
        smoke_Arrays_FancyStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.FancyStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Arrays.FancyStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Arrays_FancyStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.FancyStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Arrays_FancyStruct_unwrap_optional_handle(handle)
    return Arrays.FancyStruct(cHandle: unwrappedHandle) as Arrays.FancyStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.FancyStruct? {
    defer {
        smoke_Arrays_FancyStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.FancyStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Arrays_FancyStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Arrays.FancyStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Arrays_FancyStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Arrays.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Arrays.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Arrays.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Arrays.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Arrays.SomeEnum {
    return Arrays.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Arrays.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return Arrays.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftEnum: Arrays.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Arrays.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Arrays.ExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Arrays.ExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Arrays.ExternalEnum {
    return Arrays.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Arrays.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.ExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return Arrays.ExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.ExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}