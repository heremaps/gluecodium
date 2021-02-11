//
//
import Foundation
internal enum SwiftSeason_internal : UInt32, CaseIterable, Codable {
    case winter
    case spring
    case summer
    case autumn
}
internal func foobar_copyToCType(_ swiftEnum_ext: SwiftSeason) -> PrimitiveHolder<UInt32> {
    let swiftEnum = SeasonConverter.convertToInternal(swiftEnum_ext)
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: SwiftSeason) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum_ext: SwiftSeason?) -> RefHolder {
    guard let swiftEnum_ext = swiftEnum_ext else {
        return RefHolder(0)
    }
    let swiftEnum = SeasonConverter.convertToInternal(swiftEnum_ext) as SwiftSeason_internal?
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum_ext: SwiftSeason?) -> RefHolder {
    guard let swiftEnum_ext = swiftEnum_ext else {
        return RefHolder(0)
    }
    let swiftEnum = SeasonConverter.convertToInternal(swiftEnum_ext) as SwiftSeason_internal?
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> SwiftSeason {
    return SeasonConverter.convertFromInternal(SwiftSeason_internal(rawValue: cValue)!)
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> SwiftSeason {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> SwiftSeason? {
    guard handle != 0 else {
        return nil
    }
    return SeasonConverter.convertFromInternal(SwiftSeason_internal(rawValue: uint32_t_value_get(handle))!)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> SwiftSeason? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
