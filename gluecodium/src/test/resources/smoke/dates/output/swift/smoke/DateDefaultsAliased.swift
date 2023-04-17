//
//
import Foundation
public struct DateDefaultsAliased {
    public var dateTime: DateAlias
    public var dateTimeUtc: DateAlias
    public var beforeEpoch: DateAlias
    public var exactlyEpoch: DateAlias
    public init(dateTime: DateAlias = Date(timeIntervalSince1970: 1643966117), dateTimeUtc: DateAlias = Date(timeIntervalSince1970: 1643966117), beforeEpoch: DateAlias = Date(timeIntervalSince1970: -1511793883), exactlyEpoch: DateAlias = Date(timeIntervalSince1970: 0)) {
        self.dateTime = dateTime
        self.dateTimeUtc = dateTimeUtc
        self.beforeEpoch = beforeEpoch
        self.exactlyEpoch = exactlyEpoch
    }
    internal init(cHandle: _baseRef) {
        dateTime = moveFromCType(smoke_DateDefaultsAliased_dateTime_get(cHandle))
        dateTimeUtc = moveFromCType(smoke_DateDefaultsAliased_dateTimeUtc_get(cHandle))
        beforeEpoch = moveFromCType(smoke_DateDefaultsAliased_beforeEpoch_get(cHandle))
        exactlyEpoch = moveFromCType(smoke_DateDefaultsAliased_exactlyEpoch_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DateDefaultsAliased {
    return DateDefaultsAliased(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DateDefaultsAliased {
    defer {
        smoke_DateDefaultsAliased_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DateDefaultsAliased) -> RefHolder {
    let c_dateTime = moveToCType(swiftType.dateTime)
    let c_dateTimeUtc = moveToCType(swiftType.dateTimeUtc)
    let c_beforeEpoch = moveToCType(swiftType.beforeEpoch)
    let c_exactlyEpoch = moveToCType(swiftType.exactlyEpoch)
    return RefHolder(smoke_DateDefaultsAliased_create_handle(c_dateTime.ref, c_dateTimeUtc.ref, c_beforeEpoch.ref, c_exactlyEpoch.ref))
}
internal func moveToCType(_ swiftType: DateDefaultsAliased) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DateDefaultsAliased_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DateDefaultsAliased? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DateDefaultsAliased_unwrap_optional_handle(handle)
    return DateDefaultsAliased(cHandle: unwrappedHandle) as DateDefaultsAliased
}
internal func moveFromCType(_ handle: _baseRef) -> DateDefaultsAliased? {
    defer {
        smoke_DateDefaultsAliased_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DateDefaultsAliased?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_dateTime = moveToCType(swiftType.dateTime)
    let c_dateTimeUtc = moveToCType(swiftType.dateTimeUtc)
    let c_beforeEpoch = moveToCType(swiftType.beforeEpoch)
    let c_exactlyEpoch = moveToCType(swiftType.exactlyEpoch)
    return RefHolder(smoke_DateDefaultsAliased_create_optional_handle(c_dateTime.ref, c_dateTimeUtc.ref, c_beforeEpoch.ref, c_exactlyEpoch.ref))
}
internal func moveToCType(_ swiftType: DateDefaultsAliased?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DateDefaultsAliased_release_optional_handle)
}
