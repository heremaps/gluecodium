//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Enums?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class Enums {
    public typealias ExampleMap = [Enums.SimpleEnum: UInt64]

    let c_instance : _baseRef

    public init?(cEnums: _baseRef) {
        guard cEnums != 0 else {
            return nil
        }
        c_instance = cEnums
    }

    deinit {
        smoke_Enums_release(c_instance)
    }
    public enum SimpleEnum : UInt32 {

        case first

        case second
    }

    public enum InternalError : UInt32 {

        case errorNone

        case errorFatal = 999
    }

    public struct ErrorStruct {
        public var type: Enums.InternalError
        public var message: String

        public init(type: Enums.InternalError, message: String) {
            self.type = type
            self.message = message
        }

        internal init?(cErrorStruct: _baseRef) {
            type = Enums.InternalError.init(rawValue: smoke_Enums_ErrorStruct_type_get(cErrorStruct))!
            do {
                let messageHandle = smoke_Enums_ErrorStruct_message_get(cErrorStruct)
                defer {
                    std_string_release(messageHandle)
                }
                message = String(cString: std_string_data_get(messageHandle))
            }
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_Enums_ErrorStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cErrorStruct: _baseRef) -> Void {
            smoke_Enums_ErrorStruct_type_set(cErrorStruct, type.rawValue)
            smoke_Enums_ErrorStruct_message_set(cErrorStruct, message)
        }
    }

    public static func methodWithEnumeration(input: Enums.SimpleEnum) -> Enums.SimpleEnum {
        let cResult = smoke_Enums_methodWithEnumeration(input.rawValue)
        return Enums.SimpleEnum(rawValue: cResult)!
    }

    public static func flipEnumValue(input: Enums.InternalError) -> Enums.InternalError {
        let cResult = smoke_Enums_flipEnumValue(input.rawValue)
        return Enums.InternalError(rawValue: cResult)!
    }

    public static func extractEnumFromStruct(input: Enums.ErrorStruct) -> Enums.InternalError {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Enums_ErrorStruct_release(inputHandle)
        }
        let cResult = smoke_Enums_extractEnumFromStruct(inputHandle)
        return Enums.InternalError(rawValue: cResult)!
    }

    public static func createStructWithEnumInside(type: Enums.InternalError, message: String) -> Enums.ErrorStruct? {
        let cResult = smoke_Enums_createStructWithEnumInside(type.rawValue, message)
        defer {
            smoke_Enums_ErrorStruct_release(cResult)
        }
        return Enums.ErrorStruct(cErrorStruct: cResult)
    }

}

extension Enums: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertEnums_ExampleMapToCType(_ swiftDict: Enums.ExampleMap) -> _baseRef {
    let cHandle = smoke_Enums_ExampleMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.rawValue
        let c_value = swift_value
        smoke_Enums_ExampleMap_put(cHandle, c_key, c_value)
    }
    return cHandle
}

func convertEnums_ExampleMapFromCType(_ cHandle: _baseRef) -> Enums.ExampleMap {
    var swiftDict: Enums.ExampleMap = [:]
    let iteratorHandle = smoke_Enums_ExampleMap_iterator(cHandle)
    while smoke_Enums_ExampleMap_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_Enums_ExampleMap_iterator_key(iteratorHandle)
        let swift_key = Enums.SimpleEnum(rawValue: c_key)!
        let c_value = smoke_Enums_ExampleMap_iterator_value(iteratorHandle)
        let swift_value = c_value
        swiftDict[swift_key] = swift_value
        smoke_Enums_ExampleMap_iterator_increment(iteratorHandle)
    }
    smoke_Enums_ExampleMap_iterator_release(iteratorHandle)
    return swiftDict
}