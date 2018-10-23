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

    public enum ExternalEnum : UInt32 {
        case fooValue
        case barValue
    }

    public enum VeryExternalEnum : UInt32 {
        case foo
        case bar
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
                let message_handle = smoke_Enums_ErrorStruct_message_get(cErrorStruct)
                defer {
                    std_string_release(message_handle)
                }
                message = String(cString: std_string_data_get(message_handle))
            }
        }

        internal func convertToCType() -> _baseRef {
            let type_handle = type.rawValue
            let message_handle = message
            return smoke_Enums_ErrorStruct_create(type_handle, message_handle)
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
        let input_handle = input.convertToCType()
        defer {
            smoke_Enums_ErrorStruct_release(input_handle)
        }
        let cResult = smoke_Enums_extractEnumFromStruct(input_handle)
        return Enums.InternalError(rawValue: cResult)!
    }

    public static func createStructWithEnumInside(type: Enums.InternalError, message: String) -> Enums.ErrorStruct? {
        let cResult = smoke_Enums_createStructWithEnumInside(type.rawValue, message)
        defer {
            smoke_Enums_ErrorStruct_release(cResult)
        }
        return Enums.ErrorStruct(cErrorStruct: cResult)
    }

    public static func methodWithExternalEnum(input: Enums.ExternalEnum) -> Void {
        return smoke_Enums_methodWithExternalEnum(input.rawValue)
    }
}

extension Enums: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertEnums_ExampleMapToCType(_ swiftDict: Enums.ExampleMap) -> _baseRef {
    let c_handle = smoke_Enums_ExampleMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.rawValue
        let c_value = swift_value
        smoke_Enums_ExampleMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}

func convertEnums_ExampleMapFromCType(_ c_handle: _baseRef) -> Enums.ExampleMap {
    var swiftDict: Enums.ExampleMap = [:]
    let iterator_handle = smoke_Enums_ExampleMap_iterator(c_handle)
    while smoke_Enums_ExampleMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Enums_ExampleMap_iterator_key(iterator_handle)
        let swift_key = Enums.SimpleEnum(rawValue: c_key)!
        let c_value = smoke_Enums_ExampleMap_iterator_value(iterator_handle)
        let swift_value = c_value
        swiftDict[swift_key] = swift_value
        smoke_Enums_ExampleMap_iterator_increment(iterator_handle)
    }
    smoke_Enums_ExampleMap_iterator_release(iterator_handle)
    return swiftDict
}