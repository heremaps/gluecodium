//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public enum FreeEnum : UInt32, CaseIterable {
    case foo
    case bar
}
internal func copyToCType(_ swiftEnum: FreeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: FreeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: FreeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: FreeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> FreeEnum {
    return FreeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> FreeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> FreeEnum? {
    guard handle != 0 else {
        return nil
    }
    return FreeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> FreeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
