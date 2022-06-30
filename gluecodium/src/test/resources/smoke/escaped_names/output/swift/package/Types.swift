//
//
import Foundation
public struct Types {
    public static let const: Types.Enum = Types.Enum.naN
    public enum Enum : UInt32, CaseIterable, Codable {
        case naN
    }
    public typealias ULong = [Types.Struct]
    public typealias ExceptionError = Types.Enum
    public struct Struct {
        public var null: Types.Enum
        public init(null: Types.Enum = Types.Enum.naN) {
            self.null = null
        }
        internal init(cHandle: _baseRef) {
            null = moveFromCType(package_Types_Struct_null_get(cHandle))
        }
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Types.Struct {
    return Types.Struct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Types.Struct {
    defer {
        package_Types_Struct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Types.Struct) -> RefHolder {
    let c_null = moveToCType(swiftType.null)
    return RefHolder(package_Types_Struct_create_handle(c_null.ref))
}
internal func moveToCType(_ swiftType: Types.Struct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: package_Types_Struct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Types.Struct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = package_Types_Struct_unwrap_optional_handle(handle)
    return Types.Struct(cHandle: unwrappedHandle) as Types.Struct
}
internal func moveFromCType(_ handle: _baseRef) -> Types.Struct? {
    defer {
        package_Types_Struct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Types.Struct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_null = moveToCType(swiftType.null)
    return RefHolder(package_Types_Struct_create_optional_handle(c_null.ref))
}
internal func moveToCType(_ swiftType: Types.Struct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: package_Types_Struct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Types.Enum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Types.Enum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Types.Enum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Types.Enum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Types.Enum {
    return Types.Enum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Types.Enum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Types.Enum? {
    guard handle != 0 else {
        return nil
    }
    return Types.Enum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Types.Enum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension Types.Enum : Error {
}
