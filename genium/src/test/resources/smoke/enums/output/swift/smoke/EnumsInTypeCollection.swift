//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public enum TCEnum : UInt32, CaseIterable {
    case first
    case second
}
internal func copyToCType(_ swiftEnum: TCEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: TCEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: TCEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: TCEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> TCEnum {
    return TCEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> TCEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> TCEnum? {
    guard handle != 0 else {
        return nil
    }
    return TCEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> TCEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}