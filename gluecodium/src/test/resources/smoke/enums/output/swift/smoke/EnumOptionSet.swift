//
//
import Foundation
public struct EnumOptionSet : OptionSet, CaseIterable, Codable {
    public let rawValue: UInt32
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    public static let one = EnumOptionSet(rawValue: 1)
    public static let two = EnumOptionSet(rawValue: 2)
    public static let three = EnumOptionSet(rawValue: 4)
    public static var allCases: [EnumOptionSet] {
        return [.one, .two, .three]
    }
}
internal func copyToCType(_ swiftEnum: EnumOptionSet) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumOptionSet) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: EnumOptionSet?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumOptionSet?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> EnumOptionSet {
    return EnumOptionSet(rawValue: cValue)
}
internal func moveFromCType(_ cValue: UInt32) -> EnumOptionSet {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumOptionSet? {
    guard handle != 0 else {
        return nil
    }
    return EnumOptionSet(rawValue: uint32_t_value_get(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> EnumOptionSet? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
