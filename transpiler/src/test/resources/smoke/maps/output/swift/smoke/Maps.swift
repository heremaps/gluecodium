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
            errorMapping = smoke_Maps_StructWithMap_errorMapping_get(cStructWithMap)
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Maps_StructWithMap_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cStructWithMap: _baseRef) -> Void {
            smoke_Maps_StructWithMap_errorMapping_set(cStructWithMap, errorMapping)
        }
    }

    public static func methodWithMap(input: Maps.ErrorCodeToMessageMap) -> Maps.ErrorCodeToMessageMap {
        return smoke_Maps_methodWithMap(input)
    }

    public static func methodWithMapToStruct(input: Maps.NumberToStruct) -> Maps.NumberToStruct {
        return smoke_Maps_methodWithMapToStruct(input)
    }

    public static func methodWithNestedMap(input: Maps.NestedMap) -> Maps.NestedMap {
        return smoke_Maps_methodWithNestedMap(input)
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
}

extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
