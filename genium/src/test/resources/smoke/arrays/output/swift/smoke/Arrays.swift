//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Arrays?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class Arrays {

    public typealias ProfileId = String
    public typealias ErrorCodeToMessageMap = [Int32: String]
    let c_instance : _baseRef

    public init?(cArrays: _baseRef) {
        guard cArrays != 0 else {
            return nil
        }
        c_instance = cArrays
    }

    deinit {
        smoke_Arrays_release(c_instance)
    }
    public struct BasicStruct {
        public var value: Double

        public init(value: Double) {
            self.value = value
        }

        internal init?(cBasicStruct: _baseRef) {
            value = smoke_Arrays_BasicStruct_value_get(cBasicStruct)
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_Arrays_BasicStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cBasicStruct: _baseRef) -> Void {
            smoke_Arrays_BasicStruct_value_set(cBasicStruct, value)
        }
    }

    public struct FancyStruct {
        public var messages: CollectionOf<String>
        public var numbers: CollectionOf<UInt8>

        public init(messages: CollectionOf<String>, numbers: CollectionOf<UInt8>) {
            self.messages = messages
            self.numbers = numbers
        }

        internal init?(cFancyStruct: _baseRef) {
            messages = StringList(smoke_Arrays_FancyStruct_messages_get(cFancyStruct))
            numbers = UInt8List(smoke_Arrays_FancyStruct_numbers_get(cFancyStruct))
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_Arrays_FancyStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cFancyStruct: _baseRef) -> Void {
            let messagesConversion = messages.c_conversion()
            smoke_Arrays_FancyStruct_messages_set(cFancyStruct, messagesConversion.c_type)
            messagesConversion.cleanup()
            let numbersConversion = numbers.c_conversion()
            smoke_Arrays_FancyStruct_numbers_set(cFancyStruct, numbersConversion.c_type)
            numbersConversion.cleanup()
        }
    }

    public static func methodWithArray<Tinput: Collection>(input: Tinput) -> CollectionOf<String> where Tinput.Element == String {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = smoke_Arrays_methodWithArray(inputHandle.c_type)
        return StringList(handle)
    }

    public static func methodWithArrayInline<Tinput: Collection>(input: Tinput) -> CollectionOf<UInt8> where Tinput.Element == UInt8 {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = smoke_Arrays_methodWithArrayInline(inputHandle.c_type)
        return UInt8List(handle)
    }

    public static func methodWithStructArray<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.BasicStruct> where Tinput.Element == Arrays.BasicStruct {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = smoke_Arrays_methodWithStructArray(inputHandle.c_type)
        return BasicStructList(handle)
    }

    public static func methodWithArrayOfArrays<Tinput: Collection>(input: Tinput) -> CollectionOf<CollectionOf<UInt8>> where Tinput.Element: Collection, Tinput.Element.Element == UInt8 {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = smoke_Arrays_methodWithArrayOfArrays(inputHandle.c_type)
        return UInt8ListList(handle)
    }

    public static func mergeArraysOfStructsWithArrays<TinlineFancyArray: Collection, TfancyArray: Collection>(inlineFancyArray: TinlineFancyArray, fancyArray: TfancyArray) -> CollectionOf<Arrays.FancyStruct> where TinlineFancyArray.Element == Arrays.FancyStruct, TfancyArray.Element == Arrays.FancyStruct {

        let inlineFancyArrayHandle = inlineFancyArray.c_conversion()
        defer {
            inlineFancyArrayHandle.cleanup()
        }

        let fancyArrayHandle = fancyArray.c_conversion()
        defer {
            fancyArrayHandle.cleanup()
        }

        let handle = smoke_Arrays_mergeArraysOfStructsWithArrays(inlineFancyArrayHandle.c_type, fancyArrayHandle.c_type)
        return FancyStructList(handle)
    }

    public static func methodWithArrayOfAliases<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ProfileId> where Tinput.Element == Arrays.ProfileId {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = smoke_Arrays_methodWithArrayOfAliases(inputHandle.c_type)
        return StringList(handle)
    }

    public static func methodWithArrayOfMaps<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.ErrorCodeToMessageMap> where Tinput.Element == Arrays.ErrorCodeToMessageMap {
        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }
        let handle = smoke_Arrays_methodWithArrayOfMaps(inputHandle.c_type)
        return ArraysErrorCodeToMessageMapList(handle)
    }
}

extension Arrays: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertArrays_ErrorCodeToMessageMapToCType(_ swiftDict: Arrays.ErrorCodeToMessageMap) -> _baseRef {
    let cHandle = smoke_Arrays_ErrorCodeToMessageMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release(c_value)
        }
        smoke_Arrays_ErrorCodeToMessageMap_put(cHandle, c_key, c_value)
    }
    return cHandle
}
func convertArrays_ErrorCodeToMessageMapFromCType(_ cHandle: _baseRef) -> Arrays.ErrorCodeToMessageMap {
    var swiftDict: Arrays.ErrorCodeToMessageMap = [:]
    let iteratorHandle = smoke_Arrays_ErrorCodeToMessageMap_iterator(cHandle)
    while smoke_Arrays_ErrorCodeToMessageMap_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Arrays_ErrorCodeToMessageMap_iterator_key(iteratorHandle)
        let swift_key = c_key
        let c_value = smoke_Arrays_ErrorCodeToMessageMap_iterator_value(iteratorHandle)
        defer {
            std_string_release(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Arrays_ErrorCodeToMessageMap_iterator_increment(iteratorHandle)
    }
    smoke_Arrays_ErrorCodeToMessageMap_iterator_release(iteratorHandle)
    return swiftDict
}
