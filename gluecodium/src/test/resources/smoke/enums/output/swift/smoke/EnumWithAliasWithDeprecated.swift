//
//
import Foundation
public enum EnumWithAliasWithDeprecated : UInt32, CaseIterable, Codable {
    @available(*, deprecated)
    case one = 2
    case two
    case three
    public static let first = EnumWithAliasWithDeprecated.one
    public static var allCases: [EnumWithAliasWithDeprecated] {
        return [.one, .two, .three, .first]
    }
    /// A type that can be used as a key for encoding and decoding.
    public enum Key: CodingKey {
        case rawValue
    }
    /// The error which is thrown if initialisation with decoder has failed
    public enum CodingError: Error {
        case unknownValue
    }
    /// Creates a new instance by decoding from the given decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .one
        case 1:
            self = .two
        case 2:
            self = .three
        default:
            throw CodingError.unknownValue
        }
    }
    /// Encodes this value into the given encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .one:
            try container.encode(0, forKey: .rawValue)
        case .two:
            try container.encode(1, forKey: .rawValue)
        case .three:
            try container.encode(2, forKey: .rawValue)
        }
    }
}
internal func copyToCType(_ swiftEnum: EnumWithAliasWithDeprecated) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumWithAliasWithDeprecated) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: EnumWithAliasWithDeprecated?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: EnumWithAliasWithDeprecated?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> EnumWithAliasWithDeprecated {
    return EnumWithAliasWithDeprecated(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> EnumWithAliasWithDeprecated {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumWithAliasWithDeprecated? {
    guard handle != 0 else {
        return nil
    }
    return EnumWithAliasWithDeprecated(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> EnumWithAliasWithDeprecated? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
