//
//
import Foundation
@OnEnumeration
public enum AttributesEnum : UInt32, CaseIterable, Codable {
    @OnEnumerator
    case nope
}
internal func copyToCType(_ swiftEnum: AttributesEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: AttributesEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: AttributesEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: AttributesEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> AttributesEnum {
    return AttributesEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> AttributesEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesEnum? {
    guard handle != 0 else {
        return nil
    }
    return AttributesEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
