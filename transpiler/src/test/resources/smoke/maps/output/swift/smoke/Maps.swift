//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Maps?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class Maps {
    public typealias ErrorCodeToMessageMap = [Int32: String]
    public typealias NumberToStruct = [UInt8: Maps.SomeStruct]
    public typealias NestedMap = [UInt8: Maps.NumberToStruct]
    public typealias NumberToTypeDef = [UInt8: Maps.SomeId]
    public typealias TypeDefToNumber = [Maps.SomeId: UInt8]
    public typealias SomeId = String
    public typealias StringToArray = [String: CollectionOf<Int32>]

    let c_instance : _baseRef

    public init?(cMaps: _baseRef) {
        guard cMaps != 0 else {
            return nil
        }
        c_instance = cMaps
    }

    deinit {
        smoke_Maps_release(c_instance)
    }

    public struct SomeStruct {
        public var value: String
        public init(value: String) {
            self.value = value
        }
        internal init?(cSomeStruct: _baseRef) {
            do {
                let valueHandle = smoke_Maps_SomeStruct_value_get(cSomeStruct)
                value = String(cString:std_string_data_get(valueHandle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Maps_SomeStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cSomeStruct: _baseRef) -> Void {
            smoke_Maps_SomeStruct_value_set(cSomeStruct, value)
        }
    }

    public struct StructWithMap {
        public var errorMapping: Maps.ErrorCodeToMessageMap
        public init(errorMapping: Maps.ErrorCodeToMessageMap) {
            self.errorMapping = errorMapping
        }
        internal init?(cStructWithMap: _baseRef) {
            errorMapping = convertMaps_ErrorCodeToMessageMapFromCType(smoke_Maps_StructWithMap_errorMapping_get(cStructWithMap))
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Maps_StructWithMap_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cStructWithMap: _baseRef) -> Void {
            let errorMappingConversion = convertMaps_ErrorCodeToMessageMapToCType(errorMapping)
            smoke_Maps_StructWithMap_errorMapping_set(cStructWithMap, errorMappingConversion)
            smoke_Maps_ErrorCodeToMessageMap_release(errorMappingConversion)
        }
    }

    public static func methodWithMap(input: Maps.ErrorCodeToMessageMap) -> Maps.ErrorCodeToMessageMap {
        let inputHandle = convertMaps_ErrorCodeToMessageMapToCType(input)
        defer {
            smoke_Maps_ErrorCodeToMessageMap_release(inputHandle)
        }
        let resultHandle = smoke_Maps_methodWithMap(inputHandle)
        defer {
            smoke_Maps_ErrorCodeToMessageMap_release(resultHandle)
        }
        return convertMaps_ErrorCodeToMessageMapFromCType(resultHandle)
    }

    public static func methodWithMapToStruct(input: Maps.NumberToStruct) -> Maps.NumberToStruct {
        let inputHandle = convertMaps_NumberToStructToCType(input)
        defer {
            smoke_Maps_NumberToStruct_release(inputHandle)
        }
        let resultHandle = smoke_Maps_methodWithMapToStruct(inputHandle)
        defer {
            smoke_Maps_NumberToStruct_release(resultHandle)
        }
        return convertMaps_NumberToStructFromCType(resultHandle)
    }

    public static func methodWithNestedMap(input: Maps.NestedMap) -> Maps.NestedMap {
        let inputHandle = convertMaps_NestedMapToCType(input)
        defer {
            smoke_Maps_NestedMap_release(inputHandle)
        }
        let resultHandle = smoke_Maps_methodWithNestedMap(inputHandle)
        defer {
            smoke_Maps_NestedMap_release(resultHandle)
        }
        return convertMaps_NestedMapFromCType(resultHandle)
    }

    public static func methodWithStructWithMap(input: Maps.StructWithMap) -> Maps.StructWithMap? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Maps_StructWithMap_release(inputHandle)
        }
        let cResult = smoke_Maps_methodWithStructWithMap(inputHandle)
        defer {
            smoke_Maps_StructWithMap_release(cResult)
        }
        return Maps.StructWithMap(cStructWithMap: cResult)
    }

    public static func methodWithMapOfArrays(input: Maps.StringToArray) -> Maps.StringToArray {
        let inputHandle = convertMaps_StringToArrayToCType(input)
        defer {
            smoke_Maps_StringToArray_release(inputHandle)
        }
        let resultHandle = smoke_Maps_methodWithMapOfArrays(inputHandle)
        defer {
            smoke_Maps_StringToArray_release(resultHandle)
        }
        return convertMaps_StringToArrayFromCType(resultHandle)
    }
}

extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertMaps_ErrorCodeToMessageMapToCType(_ swiftDict: Maps.ErrorCodeToMessageMap) -> _baseRef {
    let cHandle = smoke_Maps_ErrorCodeToMessageMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release(c_value)
        }
        smoke_Maps_ErrorCodeToMessageMap_put(cHandle, c_key, c_value)
    }
    return cHandle
}

func convertMaps_ErrorCodeToMessageMapFromCType(_ cHandle: _baseRef) -> Maps.ErrorCodeToMessageMap {
    var swiftDict: Maps.ErrorCodeToMessageMap = [:]
    let iteratorHandle = smoke_Maps_ErrorCodeToMessageMap_iterator(cHandle)
    while smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Maps_ErrorCodeToMessageMap_iterator_key(iteratorHandle)
        let swift_key = c_key
        let c_value = smoke_Maps_ErrorCodeToMessageMap_iterator_value(iteratorHandle)
        defer {
            std_string_release(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Maps_ErrorCodeToMessageMap_iterator_increment(iteratorHandle)
    }
    smoke_Maps_ErrorCodeToMessageMap_iterator_release(iteratorHandle)
    return swiftDict
}

func convertMaps_NumberToStructToCType(_ swiftDict: Maps.NumberToStruct) -> _baseRef {
    let cHandle = smoke_Maps_NumberToStruct_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            smoke_Maps_SomeStruct_release(c_value)
        }
        smoke_Maps_NumberToStruct_put(cHandle, c_key, c_value)
    }
    return cHandle
}

func convertMaps_NumberToStructFromCType(_ cHandle: _baseRef) -> Maps.NumberToStruct {
    var swiftDict: Maps.NumberToStruct = [:]
    let iteratorHandle = smoke_Maps_NumberToStruct_iterator(cHandle)
    while smoke_Maps_NumberToStruct_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Maps_NumberToStruct_iterator_key(iteratorHandle)
        let swift_key = c_key
        let c_value = smoke_Maps_NumberToStruct_iterator_value(iteratorHandle)
        defer {
            smoke_Maps_SomeStruct_release(c_value)
        }
        let swift_value = Maps.SomeStruct(cSomeStruct: c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToStruct_iterator_increment(iteratorHandle)
    }
    smoke_Maps_NumberToStruct_iterator_release(iteratorHandle)
    return swiftDict
}

func convertMaps_NestedMapToCType(_ swiftDict: Maps.NestedMap) -> _baseRef {
    let cHandle = smoke_Maps_NestedMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = convertMaps_NumberToStructToCType(swift_value)
        defer {
            smoke_Maps_NumberToStruct_release(c_value)
        }
        smoke_Maps_NestedMap_put(cHandle, c_key, c_value)
    }
    return cHandle
}

func convertMaps_NestedMapFromCType(_ cHandle: _baseRef) -> Maps.NestedMap {
    var swiftDict: Maps.NestedMap = [:]
    let iteratorHandle = smoke_Maps_NestedMap_iterator(cHandle)
    while smoke_Maps_NestedMap_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Maps_NestedMap_iterator_key(iteratorHandle)
        let swift_key = c_key
        let c_value = smoke_Maps_NestedMap_iterator_value(iteratorHandle)
        defer {
            smoke_Maps_NumberToStruct_release(c_value)
        }
        let swift_value = convertMaps_NumberToStructFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NestedMap_iterator_increment(iteratorHandle)
    }
    smoke_Maps_NestedMap_iterator_release(iteratorHandle)
    return swiftDict
}

func convertMaps_NumberToTypeDefToCType(_ swiftDict: Maps.NumberToTypeDef) -> _baseRef {
    let cHandle = smoke_Maps_NumberToTypeDef_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release(c_value)
        }
        smoke_Maps_NumberToTypeDef_put(cHandle, c_key, c_value)
    }
    return cHandle
}
func convertMaps_NumberToTypeDefFromCType(_ cHandle: _baseRef) -> Maps.NumberToTypeDef {
    var swiftDict: Maps.NumberToTypeDef = [:]
    let iteratorHandle = smoke_Maps_NumberToTypeDef_iterator(cHandle)
    while smoke_Maps_NumberToTypeDef_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Maps_NumberToTypeDef_iterator_key(iteratorHandle)
        let swift_key = c_key
        let c_value = smoke_Maps_NumberToTypeDef_iterator_value(iteratorHandle)
        defer {
            std_string_release(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToTypeDef_iterator_increment(iteratorHandle)
    }
    smoke_Maps_NumberToTypeDef_iterator_release(iteratorHandle)
    return swiftDict
}
func convertMaps_TypeDefToNumberToCType(_ swiftDict: Maps.TypeDefToNumber) -> _baseRef {
    let cHandle = smoke_Maps_TypeDefToNumber_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release(c_key)
        }
        let c_value = swift_value
        smoke_Maps_TypeDefToNumber_put(cHandle, c_key, c_value)
    }
    return cHandle
}
func convertMaps_TypeDefToNumberFromCType(_ cHandle: _baseRef) -> Maps.TypeDefToNumber {
    var swiftDict: Maps.TypeDefToNumber = [:]
    let iteratorHandle = smoke_Maps_TypeDefToNumber_iterator(cHandle)
    while smoke_Maps_TypeDefToNumber_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Maps_TypeDefToNumber_iterator_key(iteratorHandle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_Maps_TypeDefToNumber_iterator_value(iteratorHandle)
        let swift_value = c_value
        swiftDict[swift_key!] = swift_value
        smoke_Maps_TypeDefToNumber_iterator_increment(iteratorHandle)
    }
    smoke_Maps_TypeDefToNumber_iterator_release(iteratorHandle)
    return swiftDict
}
func convertMaps_StringToArrayToCType(_ swiftDict: Maps.StringToArray) -> _baseRef {
    let cHandle = smoke_Maps_StringToArray_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release(c_key)
        }
        let c_conversion = swift_value.c_conversion()
        defer {
            c_conversion.cleanup()
        }
        let c_value = c_conversion.c_type
        smoke_Maps_StringToArray_put(cHandle, c_key, c_value)
    }
    return cHandle
}
func convertMaps_StringToArrayFromCType(_ cHandle: _baseRef) -> Maps.StringToArray {
    var swiftDict: Maps.StringToArray = [:]
    let iteratorHandle = smoke_Maps_StringToArray_iterator(cHandle)
    while smoke_Maps_StringToArray_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Maps_StringToArray_iterator_key(iteratorHandle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_Maps_StringToArray_iterator_value(iteratorHandle)
        let swift_value = Int32List(c_value)
        swiftDict[swift_key!] = swift_value
        smoke_Maps_StringToArray_iterator_increment(iteratorHandle)
    }
    smoke_Maps_StringToArray_iterator_release(iteratorHandle)
    return swiftDict
}
