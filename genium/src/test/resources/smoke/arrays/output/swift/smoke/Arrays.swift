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
    public enum SomeEnum : UInt32 {
        case foo
        case bar
    }
    public enum ExternalEnum : UInt32 {
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
            let value_handle = value
            return smoke_Arrays_BasicStruct_create_handle(value_handle)
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
            let string_handle = string
            return smoke_Arrays_ExternalStruct_create_handle(string_handle)
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
            let messages_conversion = messages.c_conversion()
            defer {
              messages_conversion.cleanup()
            }
            let messages_handle = messages_conversion.c_type
            let numbers_conversion = numbers.c_conversion()
            defer {
              numbers_conversion.cleanup()
            }
            let numbers_handle = numbers_conversion.c_type
            let image_handle = byteArray_create_handle()
            defer {
                byteArray_release_handle(image_handle)
            }
            image.withUnsafeBytes { (image_ptr: UnsafePointer<UInt8>) in
                byteArray_assign(image_handle, image_ptr, image.count)
            }
            return smoke_Arrays_FancyStruct_create_handle(messages_handle, numbers_handle, image_handle)
        }
    }
    public static func methodWithArray<Tinput: Collection>(input: Tinput) -> CollectionOf<String> where Tinput.Element == String {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithArray(input_handle.c_type))
    }
    public static func methodWithArrayInline<Tinput: Collection>(input: Tinput) -> CollectionOf<UInt8> where Tinput.Element == UInt8 {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithArrayInline(input_handle.c_type))
    }
    public static func methodWithStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.BasicStruct> where Tinput.Element == Arrays.BasicStruct {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithStructArray(input_handle.c_type))
    }
    public static func methodWithExternalStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ExternalStruct> where Tinput.Element == Arrays.ExternalStruct {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithExternalStructArray(input_handle.c_type))
    }
    public static func methodWithArrayOfArrays<Tinput: Collection>(input: Tinput) -> CollectionOf<CollectionOf<UInt8>> where Tinput.Element: Collection, Tinput.Element.Element == UInt8 {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithArrayOfArrays(input_handle.c_type))
    }
    public static func mergeArraysOfStructsWithArrays<TinlineFancyArray: Collection, TfancyArray: Collection>(inlineFancyArray: TinlineFancyArray, fancyArray: TfancyArray) -> CollectionOf<Arrays.FancyStruct> where TinlineFancyArray.Element == Arrays.FancyStruct, TfancyArray.Element == Arrays.FancyStruct {
        let inlineFancyArray_handle = inlineFancyArray.c_conversion()
        defer {
            inlineFancyArray_handle.cleanup()
        }
        let fancyArray_handle = fancyArray.c_conversion()
        defer {
            fancyArray_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_mergeArraysOfStructsWithArrays(inlineFancyArray_handle.c_type, fancyArray_handle.c_type))
    }
    public static func methodWithArrayOfAliases<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ProfileId> where Tinput.Element == Arrays.ProfileId {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithArrayOfAliases(input_handle.c_type))
    }
    public static func methodWithArrayOfMaps<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ErrorCodeToMessageMap> where Tinput.Element == Arrays.ErrorCodeToMessageMap {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithArrayOfMaps(input_handle.c_type))
    }
    public static func methodWithByteBuffer(input: Data) -> Data {
        let input_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(input_handle)
        }
        input.withUnsafeBytes { (input_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(input_handle, input_ptr, input.count)
        }
        return moveFromCType(smoke_Arrays_methodWithByteBuffer(input_handle))
    }
    public static func methodWithEnumArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SomeEnum> where Tinput.Element == Arrays.SomeEnum {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithEnumArray(input_handle.c_type))
    }
    public static func methodWithExternalEnumArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ExternalEnum> where Tinput.Element == Arrays.ExternalEnum {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_Arrays_methodWithExternalEnumArray(input_handle.c_type))
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
internal func copyFromCType(_ handle: _baseRef) -> Arrays.BasicStruct {
    return Arrays.BasicStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.BasicStruct {
    defer {
        smoke_Arrays_BasicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
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
internal func copyFromCType(_ handle: _baseRef) -> Arrays.FancyStruct {
    return Arrays.FancyStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.FancyStruct {
    defer {
        smoke_Arrays_FancyStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ cValue: UInt32) -> Arrays.SomeEnum {
    return Arrays.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Arrays.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Arrays.ExternalEnum {
    return Arrays.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Arrays.ExternalEnum {
    return copyFromCType(cValue)
}
func convertArrays_ErrorCodeToMessageMapToCType(_ swiftDict: Arrays.ErrorCodeToMessageMap) -> _baseRef {
    let c_handle = smoke_Arrays_ErrorCodeToMessageMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release_handle(c_value)
        }
        smoke_Arrays_ErrorCodeToMessageMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}