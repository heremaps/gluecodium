//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public typealias List = [Struct]
public enum Enum : UInt32, CaseIterable {
    case naN
}
internal func copyToCType(_ swiftEnum: Enum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Enum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Enum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Enum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Enum {
    return Enum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Enum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Enum? {
    guard handle != 0 else {
        return nil
    }
    return Enum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Enum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct Struct {
    public var null: Enum
    public init(null: Enum = Enum.naN) {
        self.null = null
    }
    internal init(cHandle: _baseRef) {
        null = moveFromCType(package_Types_Struct_null_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Struct {
    return Struct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Struct {
    defer {
        package_Types_Struct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Struct) -> RefHolder {
    let c_null = moveToCType(swiftType.null)
    return RefHolder(package_Types_Struct_create_handle(c_null.ref))
}
internal func moveToCType(_ swiftType: Struct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: package_Types_Struct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Struct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = package_Types_Struct_unwrap_optional_handle(handle)
    return Struct(cHandle: unwrappedHandle) as Struct
}
internal func moveFromCType(_ handle: _baseRef) -> Struct? {
    defer {
        package_Types_Struct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Struct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_null = moveToCType(swiftType.null)
    return RefHolder(package_Types_Struct_create_optional_handle(c_null.ref))
}
internal func moveToCType(_ swiftType: Struct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: package_Types_Struct_release_optional_handle)
}
public struct Types {
    public static let const: Enum = Enum.naN
}
