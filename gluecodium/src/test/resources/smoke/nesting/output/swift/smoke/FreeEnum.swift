//
//
import Foundation
public enum FreeEnum : UInt32, CaseIterable, Codable {
    case foo
    case bar
}
internal func foobar_copyToCType(_ swiftEnum: FreeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: FreeEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: FreeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: FreeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> FreeEnum {
    return FreeEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> FreeEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> FreeEnum? {
    guard handle != 0 else {
        return nil
    }
    return FreeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> FreeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
