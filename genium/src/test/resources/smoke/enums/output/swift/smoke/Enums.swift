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
    public enum SimpleEnum : UInt32, CaseIterable {
        case first
        case second
    }
    public enum InternalError : UInt32, CaseIterable {
        case errorNone
        case errorFatal = 999
    }
    public enum ExternalEnum : UInt32, CaseIterable {
        case fooValue
        case barValue
    }
    public enum VeryExternalEnum : UInt32, CaseIterable {
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
            type = moveFromCType(smoke_Enums_ErrorStruct_type_get(cHandle))
            message = moveFromCType(smoke_Enums_ErrorStruct_message_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_type = moveToCType(type)
            let c_message = moveToCType(message)
            return smoke_Enums_ErrorStruct_create_handle(c_type.ref, c_message.ref)
        }
    }
    public static func methodWithEnumeration(input: Enums.SimpleEnum) -> Enums.SimpleEnum {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_methodWithEnumeration(c_input.ref))
    }
    public static func flipEnumValue(input: Enums.InternalError) -> Enums.InternalError {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_flipEnumValue(c_input.ref))
    }
    public static func extractEnumFromStruct(input: Enums.ErrorStruct) -> Enums.InternalError {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_extractEnumFromStruct(c_input.ref))
    }
    public static func createStructWithEnumInside(type: Enums.InternalError, message: String) -> Enums.ErrorStruct {
            let c_type = moveToCType(type)
            let c_message = moveToCType(message)
        return moveFromCType(smoke_Enums_createStructWithEnumInside(c_type.ref, c_message.ref))
    }
    public static func methodWithExternalEnum(input: Enums.ExternalEnum) -> Void {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_methodWithExternalEnum(c_input.ref))
    }
}
extension Enums: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func EnumscopyFromCType(_ handle: _baseRef) -> Enums {
    return Enums(cEnums: smoke_Enums_copy_handle(handle))
}
internal func EnumsmoveFromCType(_ handle: _baseRef) -> Enums {
    return Enums(cEnums: handle)
}
internal func EnumscopyFromCType(_ handle: _baseRef) -> Enums? {
    guard handle != 0 else {
        return nil
    }
    return EnumsmoveFromCType(handle) as Enums
}
internal func EnumsmoveFromCType(_ handle: _baseRef) -> Enums? {
    guard handle != 0 else {
        return nil
    }
    return EnumsmoveFromCType(handle) as Enums
}
internal func copyToCType(_ swiftClass: Enums) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Enums) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Enums?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Enums?) -> RefHolder {
    return getRef(swiftClass, owning: true)
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
internal func copyToCType(_ swiftType: Enums.ErrorStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Enums.ErrorStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Enums_ErrorStruct_release_handle)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.SimpleEnum {
    return Enums.SimpleEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.SimpleEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Enums.SimpleEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Enums.SimpleEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.InternalError {
    return Enums.InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.InternalError {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Enums.InternalError) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Enums.InternalError) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return Enums.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Enums.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Enums.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return Enums.VeryExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: Enums.VeryExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: Enums.VeryExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}