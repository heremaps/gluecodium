//
//
import Foundation
public enum EnumWithAlias : UInt32, CaseIterable, Codable {
    case one = 2
    case two
    case three
    public static let first = EnumWithAlias.one
    public static let theBest = EnumWithAlias.first
}
internal func copyToCType(_ swiftEnum: EnumWithAlias) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumWithAlias) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: EnumWithAlias?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumWithAlias?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> EnumWithAlias {
    return EnumWithAlias(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> EnumWithAlias {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumWithAlias? {
    guard handle != 0 else {
        return nil
    }
    return EnumWithAlias(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> EnumWithAlias? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
