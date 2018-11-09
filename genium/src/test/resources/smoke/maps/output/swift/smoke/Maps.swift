//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Maps?, owning: Bool = false) -> RefHolder {
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
        internal init(cSomeStruct: _baseRef) {
            do {
                let value_handle = smoke_Maps_SomeStruct_value_get(cSomeStruct)
                defer {
                    std_string_release(value_handle)
                }
                value = String(cString: std_string_data_get(value_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let value_handle = value
            return smoke_Maps_SomeStruct_create(value_handle)
        }
    }

    public struct StructWithMap {
        public var errorMapping: Maps.ErrorCodeToMessageMap
        public init(errorMapping: Maps.ErrorCodeToMessageMap) {
            self.errorMapping = errorMapping
        }
        internal init(cStructWithMap: _baseRef) {
            do {
                let errorMapping_handle = smoke_Maps_StructWithMap_errorMapping_get(cStructWithMap)
                defer {
                    smoke_Maps_ErrorCodeToMessageMap_release(errorMapping_handle)
                }
                errorMapping = convertMaps_ErrorCodeToMessageMapFromCType(errorMapping_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let errorMapping_handle = convertMaps_ErrorCodeToMessageMapToCType(errorMapping)
            defer {
              smoke_Maps_ErrorCodeToMessageMap_release(errorMapping_handle)
            }
            return smoke_Maps_StructWithMap_create(errorMapping_handle)
        }
    }

    public static func methodWithMap(input: Maps.ErrorCodeToMessageMap) -> Maps.ErrorCodeToMessageMap {
        let input_handle = convertMaps_ErrorCodeToMessageMapToCType(input)
        defer {
            smoke_Maps_ErrorCodeToMessageMap_release(input_handle)
        }
        let result_handle = smoke_Maps_methodWithMap(input_handle)
        defer {
            smoke_Maps_ErrorCodeToMessageMap_release(result_handle)
        }
        return convertMaps_ErrorCodeToMessageMapFromCType(result_handle)
    }

    public static func methodWithMapToStruct(input: Maps.NumberToStruct) -> Maps.NumberToStruct {
        let input_handle = convertMaps_NumberToStructToCType(input)
        defer {
            smoke_Maps_NumberToStruct_release(input_handle)
        }
        let result_handle = smoke_Maps_methodWithMapToStruct(input_handle)
        defer {
            smoke_Maps_NumberToStruct_release(result_handle)
        }
        return convertMaps_NumberToStructFromCType(result_handle)
    }

    public static func methodWithNestedMap(input: Maps.NestedMap) -> Maps.NestedMap {
        let input_handle = convertMaps_NestedMapToCType(input)
        defer {
            smoke_Maps_NestedMap_release(input_handle)
        }
        let result_handle = smoke_Maps_methodWithNestedMap(input_handle)
        defer {
            smoke_Maps_NestedMap_release(result_handle)
        }
        return convertMaps_NestedMapFromCType(result_handle)
    }

    public static func methodWithStructWithMap(input: Maps.StructWithMap) -> Maps.StructWithMap {
        let input_handle = input.convertToCType()
        defer {
            smoke_Maps_StructWithMap_release(input_handle)
        }
        let cResult = smoke_Maps_methodWithStructWithMap(input_handle)
        defer {
            smoke_Maps_StructWithMap_release(cResult)
        }
        return Maps.StructWithMap(cStructWithMap: cResult)
    }

    public static func methodWithMapOfArrays(input: Maps.StringToArray) -> Maps.StringToArray {
        let input_handle = convertMaps_StringToArrayToCType(input)
        defer {
            smoke_Maps_StringToArray_release(input_handle)
        }
        let result_handle = smoke_Maps_methodWithMapOfArrays(input_handle)
        defer {
            smoke_Maps_StringToArray_release(result_handle)
        }
        return convertMaps_StringToArrayFromCType(result_handle)
    }
}

extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertMaps_ErrorCodeToMessageMapToCType(_ swiftDict: Maps.ErrorCodeToMessageMap) -> _baseRef {
    let c_handle = smoke_Maps_ErrorCodeToMessageMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release(c_value)
        }
        smoke_Maps_ErrorCodeToMessageMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}

func convertMaps_ErrorCodeToMessageMapFromCType(_ c_handle: _baseRef) -> Maps.ErrorCodeToMessageMap {
    var swiftDict: Maps.ErrorCodeToMessageMap = [:]
    let iterator_handle = smoke_Maps_ErrorCodeToMessageMap_iterator(c_handle)
    while smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Maps_ErrorCodeToMessageMap_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Maps_ErrorCodeToMessageMap_iterator_value(iterator_handle)
        defer {
            std_string_release(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Maps_ErrorCodeToMessageMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_ErrorCodeToMessageMap_iterator_release(iterator_handle)
    return swiftDict
}

func convertMaps_NumberToStructToCType(_ swiftDict: Maps.NumberToStruct) -> _baseRef {
    let c_handle = smoke_Maps_NumberToStruct_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            smoke_Maps_SomeStruct_release(c_value)
        }
        smoke_Maps_NumberToStruct_put(c_handle, c_key, c_value)
    }
    return c_handle
}

func convertMaps_NumberToStructFromCType(_ c_handle: _baseRef) -> Maps.NumberToStruct {
    var swiftDict: Maps.NumberToStruct = [:]
    let iterator_handle = smoke_Maps_NumberToStruct_iterator(c_handle)
    while smoke_Maps_NumberToStruct_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Maps_NumberToStruct_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Maps_NumberToStruct_iterator_value(iterator_handle)
        defer {
            smoke_Maps_SomeStruct_release(c_value)
        }
        let swift_value = Maps.SomeStruct(cSomeStruct: c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToStruct_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToStruct_iterator_release(iterator_handle)
    return swiftDict
}

func convertMaps_NestedMapToCType(_ swiftDict: Maps.NestedMap) -> _baseRef {
    let c_handle = smoke_Maps_NestedMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = convertMaps_NumberToStructToCType(swift_value)
        defer {
            smoke_Maps_NumberToStruct_release(c_value)
        }
        smoke_Maps_NestedMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}

func convertMaps_NestedMapFromCType(_ c_handle: _baseRef) -> Maps.NestedMap {
    var swiftDict: Maps.NestedMap = [:]
    let iterator_handle = smoke_Maps_NestedMap_iterator(c_handle)
    while smoke_Maps_NestedMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Maps_NestedMap_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Maps_NestedMap_iterator_value(iterator_handle)
        defer {
            smoke_Maps_NumberToStruct_release(c_value)
        }
        let swift_value = convertMaps_NumberToStructFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NestedMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_NestedMap_iterator_release(iterator_handle)
    return swiftDict
}

func convertMaps_NumberToTypeDefToCType(_ swiftDict: Maps.NumberToTypeDef) -> _baseRef {
    let c_handle = smoke_Maps_NumberToTypeDef_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release(c_value)
        }
        smoke_Maps_NumberToTypeDef_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertMaps_NumberToTypeDefFromCType(_ c_handle: _baseRef) -> Maps.NumberToTypeDef {
    var swiftDict: Maps.NumberToTypeDef = [:]
    let iterator_handle = smoke_Maps_NumberToTypeDef_iterator(c_handle)
    while smoke_Maps_NumberToTypeDef_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Maps_NumberToTypeDef_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Maps_NumberToTypeDef_iterator_value(iterator_handle)
        defer {
            std_string_release(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToTypeDef_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToTypeDef_iterator_release(iterator_handle)
    return swiftDict
}
func convertMaps_TypeDefToNumberToCType(_ swiftDict: Maps.TypeDefToNumber) -> _baseRef {
    let c_handle = smoke_Maps_TypeDefToNumber_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release(c_key)
        }
        let c_value = swift_value
        smoke_Maps_TypeDefToNumber_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertMaps_TypeDefToNumberFromCType(_ c_handle: _baseRef) -> Maps.TypeDefToNumber {
    var swiftDict: Maps.TypeDefToNumber = [:]
    let iterator_handle = smoke_Maps_TypeDefToNumber_iterator(c_handle)
    while smoke_Maps_TypeDefToNumber_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Maps_TypeDefToNumber_iterator_key(iterator_handle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_Maps_TypeDefToNumber_iterator_value(iterator_handle)
        let swift_value = c_value
        swiftDict[swift_key!] = swift_value
        smoke_Maps_TypeDefToNumber_iterator_increment(iterator_handle)
    }
    smoke_Maps_TypeDefToNumber_iterator_release(iterator_handle)
    return swiftDict
}
func convertMaps_StringToArrayToCType(_ swiftDict: Maps.StringToArray) -> _baseRef {
    let c_handle = smoke_Maps_StringToArray_create()
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
        smoke_Maps_StringToArray_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertMaps_StringToArrayFromCType(_ c_handle: _baseRef) -> Maps.StringToArray {
    var swiftDict: Maps.StringToArray = [:]
    let iterator_handle = smoke_Maps_StringToArray_iterator(c_handle)
    while smoke_Maps_StringToArray_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Maps_StringToArray_iterator_key(iterator_handle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_Maps_StringToArray_iterator_value(iterator_handle)
        let swift_value = Int32List(c_value)
        swiftDict[swift_key!] = swift_value
        smoke_Maps_StringToArray_iterator_increment(iterator_handle)
    }
    smoke_Maps_StringToArray_iterator_release(iterator_handle)
    return swiftDict
}
