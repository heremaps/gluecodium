//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Enums?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Enums_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Enums_release_handle)
        : RefHolder(handle_copy)
}
public class Enums {
    public typealias ExampleMap = [Enums.SimpleEnum: UInt64]
    let c_instance : _baseRef
    init(cEnums: _baseRef) {
        guard cEnums != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnums
    }
    deinit {
        smoke_Enums_release_handle(c_instance)
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
        internal init(cHandle: _baseRef) {
            type = Enums.InternalError.init(rawValue: smoke_Enums_ErrorStruct_type_get(cHandle))!
            do {
                let message_handle = smoke_Enums_ErrorStruct_message_get(cHandle)
                defer {
                    std_string_release_handle(message_handle)
                }
                message = String(cString: std_string_data_get(message_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let type_handle = type.rawValue
            let message_handle = message
            return smoke_Enums_ErrorStruct_create_handle(type_handle, message_handle)
        }
    }
    public static func methodWithEnumeration(input: Enums.SimpleEnum) -> Enums.SimpleEnum {
        return moveFromCType(smoke_Enums_methodWithEnumeration(input.rawValue))
    }
    public static func flipEnumValue(input: Enums.InternalError) -> Enums.InternalError {
        return moveFromCType(smoke_Enums_flipEnumValue(input.rawValue))
    }
    public static func extractEnumFromStruct(input: Enums.ErrorStruct) -> Enums.InternalError {
        let input_handle = input.convertToCType()
        defer {
            smoke_Enums_ErrorStruct_release_handle(input_handle)
        }
        return moveFromCType(smoke_Enums_extractEnumFromStruct(input_handle))
    }
    public static func createStructWithEnumInside(type: Enums.InternalError, message: String) -> Enums.ErrorStruct {
        return moveFromCType(smoke_Enums_createStructWithEnumInside(type.rawValue, message))
    }
    public static func methodWithExternalEnum(input: Enums.ExternalEnum) -> Void {
        return moveFromCType(smoke_Enums_methodWithExternalEnum(input.rawValue))
    }
}
extension Enums: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func copyFromCType(_ handle: _baseRef) -> Enums.ErrorStruct {
    return Enums.ErrorStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Enums.ErrorStruct {
    defer {
        smoke_Enums_ErrorStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.SimpleEnum {
    return Enums.SimpleEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.SimpleEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.InternalError {
    return Enums.InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.InternalError {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return Enums.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return Enums.VeryExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return copyFromCType(cValue)
}
func convertEnums_ExampleMapToCType(_ swiftDict: Enums.ExampleMap) -> _baseRef {
    let c_handle = smoke_Enums_ExampleMap_create_handle()
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
        let swift_key: Enums.SimpleEnum = moveFromCType(c_key)
        let c_value = smoke_Enums_ExampleMap_iterator_value(iterator_handle)
        let swift_value: UInt64 = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Enums_ExampleMap_iterator_increment(iterator_handle)
    }
    smoke_Enums_ExampleMap_iterator_release_handle(iterator_handle)
    return swiftDict
}