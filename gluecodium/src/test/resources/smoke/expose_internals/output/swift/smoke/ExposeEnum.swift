//
//
import Foundation
public enum ExposeEnum : UInt32, CaseIterable, Codable {
    case foo
}
/// :nodoc:
public func copyToCType(_ swiftEnum: ExposeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
/// :nodoc:
public func moveToCType(_ swiftEnum: ExposeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
/// :nodoc:
public func copyToCType(_ swiftEnum: ExposeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
/// :nodoc:
public func moveToCType(_ swiftEnum: ExposeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
/// :nodoc:
public func copyFromCType(_ cValue: UInt32) -> ExposeEnum {
    return ExposeEnum(rawValue: cValue)!
}
/// :nodoc:
public func moveFromCType(_ cValue: UInt32) -> ExposeEnum {
    return copyFromCType(cValue)
}
/// :nodoc:
public func copyFromCType(_ handle: _baseRef) -> ExposeEnum? {
    guard handle != 0 else {
        return nil
    }
    return ExposeEnum(rawValue: uint32_t_value_get(handle))!
}
/// :nodoc:
public func moveFromCType(_ handle: _baseRef) -> ExposeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
