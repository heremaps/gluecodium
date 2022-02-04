//
//
import Foundation
public struct DateDefaults {
    public var dateTime: Date
    public var dateTimeUtc: Date
    public var beforeEpoch: Date
    public init(dateTime: Date = Date(timeIntervalSince1970: 1643966117), dateTimeUtc: Date = Date(timeIntervalSince1970: 1643966117), beforeEpoch: Date = Date(timeIntervalSince1970: -1511793883)) {
        self.dateTime = dateTime
        self.dateTimeUtc = dateTimeUtc
        self.beforeEpoch = beforeEpoch
    }
    internal init(cHandle: _baseRef) {
        dateTime = moveFromCType(smoke_DateDefaults_dateTime_get(cHandle))
        dateTimeUtc = moveFromCType(smoke_DateDefaults_dateTimeUtc_get(cHandle))
        beforeEpoch = moveFromCType(smoke_DateDefaults_beforeEpoch_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DateDefaults {
    return DateDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DateDefaults {
    defer {
        smoke_DateDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DateDefaults) -> RefHolder {
    let c_dateTime = moveToCType(swiftType.dateTime)
    let c_dateTimeUtc = moveToCType(swiftType.dateTimeUtc)
    let c_beforeEpoch = moveToCType(swiftType.beforeEpoch)
    return RefHolder(smoke_DateDefaults_create_handle(c_dateTime.ref, c_dateTimeUtc.ref, c_beforeEpoch.ref))
}
internal func moveToCType(_ swiftType: DateDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DateDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DateDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DateDefaults_unwrap_optional_handle(handle)
    return DateDefaults(cHandle: unwrappedHandle) as DateDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DateDefaults? {
    defer {
        smoke_DateDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DateDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_dateTime = moveToCType(swiftType.dateTime)
    let c_dateTimeUtc = moveToCType(swiftType.dateTimeUtc)
    let c_beforeEpoch = moveToCType(swiftType.beforeEpoch)
    return RefHolder(smoke_DateDefaults_create_optional_handle(c_dateTime.ref, c_dateTimeUtc.ref, c_beforeEpoch.ref))
}
internal func moveToCType(_ swiftType: DateDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DateDefaults_release_optional_handle)
}
