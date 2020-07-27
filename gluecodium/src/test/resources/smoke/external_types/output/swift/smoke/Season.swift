//
//
import Foundation
public enum Season : UInt32, CaseIterable, Codable {
    case winter
    case spring
    case summer
    case autumn
}
internal func copyToCType(_ swiftEnum: Season) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Season) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Season?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Season?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Season {
    return Season(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Season {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Season? {
    guard handle != 0 else {
        return nil
    }
    return Season(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Season? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
