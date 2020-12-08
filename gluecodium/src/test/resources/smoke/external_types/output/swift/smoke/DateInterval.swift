//
//
import Foundation
extension DateInterval {
    internal init?(cHandle: _baseRef) {
        self.init(start: moveFromCType(smoke_DateInterval_start_get(cHandle)), end: moveFromCType(smoke_DateInterval_end_get(cHandle)))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DateInterval {
    return DateInterval(cHandle: handle)!
}
internal func moveFromCType(_ handle: _baseRef) -> DateInterval {
    defer {
        smoke_DateInterval_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DateInterval) -> RefHolder {
    let c_start = moveToCType(swiftType.start)
    let c_end = moveToCType(swiftType.end)
    return RefHolder(smoke_DateInterval_create_handle(c_start.ref, c_end.ref))
}
internal func moveToCType(_ swiftType: DateInterval) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DateInterval_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DateInterval? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DateInterval_unwrap_optional_handle(handle)
    return DateInterval(cHandle: unwrappedHandle)! as DateInterval
}
internal func moveFromCType(_ handle: _baseRef) -> DateInterval? {
    defer {
        smoke_DateInterval_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DateInterval?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_start = moveToCType(swiftType.start)
    let c_end = moveToCType(swiftType.end)
    return RefHolder(smoke_DateInterval_create_optional_handle(c_start.ref, c_end.ref))
}
internal func moveToCType(_ swiftType: DateInterval?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DateInterval_release_optional_handle)
}
