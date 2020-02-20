//
//
import Foundation
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
    public enum SimpleEnum : UInt32, CaseIterable, Codable {
        case first
        case second
    }
    public enum InternalErrorCode : UInt32, CaseIterable, Codable {
        case errorNone
        case errorFatal = 999
    }
    public enum ExternalEnum : UInt32, CaseIterable, Codable {
        case fooValue
        case barValue
    }
    public enum VeryExternalEnum : UInt32, CaseIterable, Codable {
        case foo
        case bar
    }
    public struct ErrorStruct {
        public var type: Enums.InternalErrorCode
        public var message: String
        public init(type: Enums.InternalErrorCode, message: String) {
            self.type = type
            self.message = message
        }
        internal init(cHandle: _baseRef) {
            type = moveFromCType(smoke_Enums_ErrorStruct_type_get(cHandle))
            message = moveFromCType(smoke_Enums_ErrorStruct_message_get(cHandle))
        }
    }
    public static func methodWithEnumeration(input: Enums.SimpleEnum) -> Enums.SimpleEnum {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_methodWithEnumeration(c_input.ref))
    }
    public static func flipEnumValue(input: Enums.InternalErrorCode) -> Enums.InternalErrorCode {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_flipEnumValue(c_input.ref))
    }
    public static func extractEnumFromStruct(input: Enums.ErrorStruct) -> Enums.InternalErrorCode {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_extractEnumFromStruct(c_input.ref))
    }
    public static func createStructWithEnumInside(type: Enums.InternalErrorCode, message: String) -> Enums.ErrorStruct {
        let c_type = moveToCType(type)
        let c_message = moveToCType(message)
        return moveFromCType(smoke_Enums_createStructWithEnumInside(c_type.ref, c_message.ref))
    }
    public static func methodWithExternalEnum(input: Enums.ExternalEnum) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Enums_methodWithExternalEnum(c_input.ref))
    }
}
internal func getRef(_ ref: Enums?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Enums_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Enums_release_handle)
        : RefHolder(handle_copy)
}
extension Enums: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Enums_copyFromCType(_ handle: _baseRef) -> Enums {
    return Enums(cEnums: smoke_Enums_copy_handle(handle))
}
internal func Enums_moveFromCType(_ handle: _baseRef) -> Enums {
    return Enums(cEnums: handle)
}
internal func Enums_copyFromCType(_ handle: _baseRef) -> Enums? {
    guard handle != 0 else {
        return nil
    }
    return Enums_moveFromCType(handle) as Enums
}
internal func Enums_moveFromCType(_ handle: _baseRef) -> Enums? {
    guard handle != 0 else {
        return nil
    }
    return Enums_moveFromCType(handle) as Enums
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
    let c_type = moveToCType(swiftType.type)
    let c_message = moveToCType(swiftType.message)
    return RefHolder(smoke_Enums_ErrorStruct_create_handle(c_type.ref, c_message.ref))
}
internal func moveToCType(_ swiftType: Enums.ErrorStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Enums_ErrorStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Enums.ErrorStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Enums_ErrorStruct_unwrap_optional_handle(handle)
    return Enums.ErrorStruct(cHandle: unwrappedHandle) as Enums.ErrorStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Enums.ErrorStruct? {
    defer {
        smoke_Enums_ErrorStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Enums.ErrorStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_type = moveToCType(swiftType.type)
    let c_message = moveToCType(swiftType.message)
    return RefHolder(smoke_Enums_ErrorStruct_create_optional_handle(c_type.ref, c_message.ref))
}
internal func moveToCType(_ swiftType: Enums.ErrorStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Enums_ErrorStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Enums.SimpleEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.SimpleEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Enums.SimpleEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.SimpleEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.SimpleEnum {
    return Enums.SimpleEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.SimpleEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Enums.SimpleEnum? {
    guard handle != 0 else {
        return nil
    }
    return Enums.SimpleEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Enums.SimpleEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftEnum: Enums.InternalErrorCode) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.InternalErrorCode) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Enums.InternalErrorCode?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.InternalErrorCode?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.InternalErrorCode {
    return Enums.InternalErrorCode(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.InternalErrorCode {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Enums.InternalErrorCode? {
    guard handle != 0 else {
        return nil
    }
    return Enums.InternalErrorCode(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Enums.InternalErrorCode? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftEnum: Enums.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Enums.ExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.ExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return Enums.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Enums.ExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return Enums.ExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Enums.ExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftEnum: Enums.VeryExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.VeryExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Enums.VeryExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Enums.VeryExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return Enums.VeryExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Enums.VeryExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return Enums.VeryExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Enums.VeryExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
