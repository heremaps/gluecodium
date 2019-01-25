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
        public var messages: CollectionOf<String>
        public var numbers: CollectionOf<UInt8>
        public var image: Data
        public init(messages: CollectionOf<String>, numbers: CollectionOf<UInt8>, image: Data) {
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
    public static func methodWithArray<Tinput: Collection>(input: Tinput) -> CollectionOf<String> where Tinput.Element == String {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArray(c_input.ref))
    }
    public static func methodWithArrayInline<Tinput: Collection>(input: Tinput) -> CollectionOf<UInt8> where Tinput.Element == UInt8 {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayInline(c_input.ref))
    }
    public static func methodWithStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.BasicStruct> where Tinput.Element == Arrays.BasicStruct {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithStructArray(c_input.ref))
    }
    public static func methodWithExternalStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ExternalStruct> where Tinput.Element == Arrays.ExternalStruct {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithExternalStructArray(c_input.ref))
    }
    public static func methodWithArrayOfArrays<Tinput: Collection>(input: Tinput) -> CollectionOf<CollectionOf<UInt8>> where Tinput.Element: Collection, Tinput.Element.Element == UInt8 {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayOfArrays(c_input.ref))
    }
    public static func mergeArraysOfStructsWithArrays<TinlineFancyArray: Collection, TfancyArray: Collection>(inlineFancyArray: TinlineFancyArray, fancyArray: TfancyArray) -> CollectionOf<Arrays.FancyStruct> where TinlineFancyArray.Element == Arrays.FancyStruct, TfancyArray.Element == Arrays.FancyStruct {
            let c_inlineFancyArray = moveToCType(inlineFancyArray)
            let c_fancyArray = moveToCType(fancyArray)
        return moveFromCType(smoke_Arrays_mergeArraysOfStructsWithArrays(c_inlineFancyArray.ref, c_fancyArray.ref))
    }
    public static func methodWithArrayOfAliases<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ProfileId> where Tinput.Element == Arrays.ProfileId {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayOfAliases(c_input.ref))
    }
    public static func methodWithArrayOfMaps<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ErrorCodeToMessageMap> where Tinput.Element == Arrays.ErrorCodeToMessageMap {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithArrayOfMaps(c_input.ref))
    }
    public static func methodWithByteBuffer(input: Data) -> Data {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithByteBuffer(c_input.ref))
    }
    public static func methodWithEnumArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SomeEnum> where Tinput.Element == Arrays.SomeEnum {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithEnumArray(c_input.ref))
    }
    public static func methodWithExternalEnumArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ExternalEnum> where Tinput.Element == Arrays.ExternalEnum {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Arrays_methodWithExternalEnumArray(c_input.ref))
    }
}
extension Arrays: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ArrayscopyFromCType(_ handle: _baseRef) -> Arrays {
    return Arrays(cArrays: handle)
}
internal func ArraysmoveFromCType(_ handle: _baseRef) -> Arrays {
    return ArrayscopyFromCType(handle)
}
internal func ArrayscopyFromCType(_ handle: _baseRef) -> Arrays? {
    guard handle != 0 else {
        return nil
    }
    return ArraysmoveFromCType(handle) as Arrays
}
internal func ArraysmoveFromCType(_ handle: _baseRef) -> Arrays? {
    return ArrayscopyFromCType(handle)
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
internal func copyFromCType(_ cValue: UInt32) -> Arrays.SomeEnum {
    return Arrays.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Arrays.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Arrays.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Arrays.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}
internal func copyFromCType(_ cValue: UInt32) -> Arrays.ExternalEnum {
    return Arrays.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Arrays.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Arrays.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Arrays.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}