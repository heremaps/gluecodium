//
//
import Foundation
internal func foobar_copyToCType(_ swiftEnum: URLCredential.Persistence) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(UInt32(swiftEnum.rawValue))
}
internal func foobar_moveToCType(_ swiftEnum: URLCredential.Persistence) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: URLCredential.Persistence?) -> RefHolder {
    if let rawValue = swiftEnum?.rawValue {
        return copyToCType(UInt32(rawValue) as UInt32?)
    } else {
        return RefHolder(0)
    }
}
internal func foobar_moveToCType(_ swiftEnum: URLCredential.Persistence?) -> RefHolder {
    if let rawValue = swiftEnum?.rawValue {
        return moveToCType(UInt32(rawValue) as UInt32?)
    } else {
        return RefHolder(0)
    }
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> URLCredential.Persistence {
    return URLCredential.Persistence(rawValue: UInt(cValue))!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> URLCredential.Persistence {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> URLCredential.Persistence? {
    guard handle != 0 else {
        return nil
    }
    return URLCredential.Persistence(rawValue: UInt(uint32_t_value_get(handle)))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> URLCredential.Persistence? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
