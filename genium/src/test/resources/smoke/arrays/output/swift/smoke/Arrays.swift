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
    init?(cArrays: _baseRef) {
        guard cArrays != 0 else {
            return nil
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
        internal init(cBasicStruct: _baseRef) {
            value = smoke_Arrays_BasicStruct_value_get(cBasicStruct)
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
        internal init(cExternalStruct: _baseRef) {
            do {
                let string_handle = smoke_Arrays_ExternalStruct_string_get(cExternalStruct)
                defer {
                    std_string_release_handle(string_handle)
                }
                string = String(cString: std_string_data_get(string_handle))
            }
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
        internal init(cFancyStruct: _baseRef) {
            messages = StringList(smoke_Arrays_FancyStruct_messages_get(cFancyStruct))
            numbers = UInt8List(smoke_Arrays_FancyStruct_numbers_get(cFancyStruct))
            do {
                let image_handle = smoke_Arrays_FancyStruct_image_get(cFancyStruct)
                defer {
                    byteArray_release_handle(image_handle)
                }
                if let array_data_handle = byteArray_data_get(image_handle) {
                    image = Data(bytes: array_data_handle, count: Int(byteArray_size_get(image_handle)))
                } else {
                    image = Data()
                }
            }
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
        let result_handle = smoke_Arrays_methodWithArray(input_handle.c_type)
        return StringList(result_handle)
    }
    public static func methodWithArrayInline<Tinput: Collection>(input: Tinput) -> CollectionOf<UInt8> where Tinput.Element == UInt8 {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithArrayInline(input_handle.c_type)
        return UInt8List(result_handle)
    }
    public static func methodWithStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.BasicStruct> where Tinput.Element == Arrays.BasicStruct {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithStructArray(input_handle.c_type)
        return BasicStructList(result_handle)
    }
    public static func methodWithExternalStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ExternalStruct> where Tinput.Element == Arrays.ExternalStruct {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithExternalStructArray(input_handle.c_type)
        return ExternalStructList(result_handle)
    }
    public static func methodWithArrayOfArrays<Tinput: Collection>(input: Tinput) -> CollectionOf<CollectionOf<UInt8>> where Tinput.Element: Collection, Tinput.Element.Element == UInt8 {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithArrayOfArrays(input_handle.c_type)
        return UInt8ListList(result_handle)
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
        let result_handle = smoke_Arrays_mergeArraysOfStructsWithArrays(inlineFancyArray_handle.c_type, fancyArray_handle.c_type)
        return FancyStructList(result_handle)
    }
    public static func methodWithArrayOfAliases<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ProfileId> where Tinput.Element == Arrays.ProfileId {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithArrayOfAliases(input_handle.c_type)
        return StringList(result_handle)
    }
    public static func methodWithArrayOfMaps<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ErrorCodeToMessageMap> where Tinput.Element == Arrays.ErrorCodeToMessageMap {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithArrayOfMaps(input_handle.c_type)
        return ArraysErrorCodeToMessageMapList(result_handle)
    }
    public static func methodWithByteBuffer(input: Data) -> Data {
        let input_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(input_handle)
        }
        input.withUnsafeBytes { (input_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(input_handle, input_ptr, input.count)
        }
        let result_data_handle = smoke_Arrays_methodWithByteBuffer(input_handle)
        defer {
            byteArray_release_handle(result_data_handle)
        }
        return Data(bytes: byteArray_data_get(result_data_handle), count: Int(byteArray_size_get(result_data_handle)))
    }
    public static func methodWithEnumArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SomeEnum> where Tinput.Element == Arrays.SomeEnum {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithEnumArray(input_handle.c_type)
        return SomeEnumList(result_handle)
    }
    public static func methodWithExternalEnumArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ExternalEnum> where Tinput.Element == Arrays.ExternalEnum {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Arrays_methodWithExternalEnumArray(input_handle.c_type)
        return ExternalEnumList(result_handle)
    }
}
extension Arrays: NativeBase {
    var c_handle: _baseRef { return c_instance }
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
func convertArrays_ErrorCodeToMessageMapFromCType(_ c_handle: _baseRef) -> Arrays.ErrorCodeToMessageMap {
    var swiftDict: Arrays.ErrorCodeToMessageMap = [:]
    let iterator_handle = smoke_Arrays_ErrorCodeToMessageMap_iterator(c_handle)
    while smoke_Arrays_ErrorCodeToMessageMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Arrays_ErrorCodeToMessageMap_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Arrays_ErrorCodeToMessageMap_iterator_value(iterator_handle)
        defer {
            std_string_release_handle(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Arrays_ErrorCodeToMessageMap_iterator_increment(iterator_handle)
    }
    smoke_Arrays_ErrorCodeToMessageMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
