//
//
import Foundation
public struct EnumOptionSetComments : OptionSet, CaseIterable, Codable {
    public let rawValue: UInt32
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    public static let one = EnumOptionSetComments(rawValue: 1)
    @available(*, deprecated)
    public static let two = EnumOptionSetComments(rawValue: 2)
    /// Foo bar
    public static let three = EnumOptionSetComments(rawValue: 4)
    public static var allCases: [EnumOptionSetComments] {
        return [.one, .two, .three]
    }
}
internal func copyToCType(_ swiftEnum: EnumOptionSetComments) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumOptionSetComments) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: EnumOptionSetComments?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumOptionSetComments?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> EnumOptionSetComments {
    return EnumOptionSetComments(rawValue: cValue)
}
internal func moveFromCType(_ cValue: UInt32) -> EnumOptionSetComments {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumOptionSetComments? {
    guard handle != 0 else {
        return nil
    }
    return EnumOptionSetComments(rawValue: uint32_t_value_get(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> EnumOptionSetComments? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
