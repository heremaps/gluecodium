//
//
import Foundation
@OnEnumeration
public enum AttributesEnum : UInt32, CaseIterable, Codable {
    @OnEnumerator
    case nope
}
internal func foobar_copyToCType(_ swiftEnum: AttributesEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: AttributesEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: AttributesEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: AttributesEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> AttributesEnum {
    return AttributesEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> AttributesEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> AttributesEnum? {
    guard handle != 0 else {
        return nil
    }
    return AttributesEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> AttributesEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
