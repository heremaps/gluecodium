//
//
import Foundation
internal enum ExposeInternalEnum : UInt32, CaseIterable, Codable {
    case foo
}
internal func copyToCType(_ swiftEnum: ExposeInternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ExposeInternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ExposeInternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ExposeInternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ExposeInternalEnum {
    return ExposeInternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ExposeInternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ExposeInternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ExposeInternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
