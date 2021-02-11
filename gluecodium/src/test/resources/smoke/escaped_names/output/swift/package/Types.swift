//
//
import Foundation
public typealias List = [Struct]
public typealias ExceptionError = Enum
public enum Enum : UInt32, CaseIterable, Codable {
    case naN
}
internal func foobar_copyToCType(_ swiftEnum: Enum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Enum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: Enum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Enum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> Enum {
    return Enum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> Enum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Enum? {
    guard handle != 0 else {
        return nil
    }
    return Enum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Enum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
public struct Struct {
    public var null: Enum
    public init(null: Enum = Enum.naN) {
        self.null = null
    }
    internal init(cHandle: _baseRef) {
        null = foobar_moveFromCType(package_Types_Struct_null_get(cHandle))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Struct {
    return Struct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Struct {
    defer {
        package_Types_Struct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: Struct) -> RefHolder {
    let c_null = foobar_moveToCType(swiftType.null)
    return RefHolder(package_Types_Struct_create_handle(c_null.ref))
}
internal func foobar_moveToCType(_ swiftType: Struct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: package_Types_Struct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Struct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = package_Types_Struct_unwrap_optional_handle(handle)
    return Struct(cHandle: unwrappedHandle) as Struct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Struct? {
    defer {
        package_Types_Struct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: Struct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_null = foobar_moveToCType(swiftType.null)
    return RefHolder(package_Types_Struct_create_optional_handle(c_null.ref))
}
internal func foobar_moveToCType(_ swiftType: Struct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: package_Types_Struct_release_optional_handle)
}
public struct Types {
    public static let const: Enum = Enum.naN
}
extension Enum : Error {
}
