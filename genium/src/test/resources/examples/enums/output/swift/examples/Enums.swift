//
//

import Foundation
public enum ShoeSizes : UInt32, CaseIterable {
    case small = 39
    case biggerThanSmall
    case normal = 43
    case big = 46
}
internal func copyToCType(_ swiftEnum: ShoeSizes) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ShoeSizes) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ShoeSizes?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ShoeSizes?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ShoeSizes {
    return ShoeSizes(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ShoeSizes {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ShoeSizes? {
    guard handle != 0 else {
        return nil
    }
    return ShoeSizes(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ShoeSizes? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}