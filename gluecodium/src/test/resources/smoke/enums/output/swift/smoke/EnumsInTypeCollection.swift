//
//
import Foundation
public struct EnumsInTypeCollection {
    public enum TCEnum : UInt32, CaseIterable, Codable {
        case first
        case second
    }
}
internal func copyToCType(_ swiftEnum: EnumsInTypeCollection.TCEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumsInTypeCollection.TCEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: EnumsInTypeCollection.TCEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumsInTypeCollection.TCEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> EnumsInTypeCollection.TCEnum {
    return EnumsInTypeCollection.TCEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> EnumsInTypeCollection.TCEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumsInTypeCollection.TCEnum? {
    guard handle != 0 else {
        return nil
    }
    return EnumsInTypeCollection.TCEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> EnumsInTypeCollection.TCEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
