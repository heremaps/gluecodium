//
//
import Foundation
@available(*, deprecated)
public struct DeprecatedWithNoMessage {
    public var field: String
    public init(field: String = "") {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_DeprecatedWithNoMessage_field_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DeprecatedWithNoMessage {
    return DeprecatedWithNoMessage(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DeprecatedWithNoMessage {
    defer {
        smoke_DeprecatedWithNoMessage_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DeprecatedWithNoMessage) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_DeprecatedWithNoMessage_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: DeprecatedWithNoMessage) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecatedWithNoMessage_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DeprecatedWithNoMessage? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DeprecatedWithNoMessage_unwrap_optional_handle(handle)
    return DeprecatedWithNoMessage(cHandle: unwrappedHandle) as DeprecatedWithNoMessage
}
internal func moveFromCType(_ handle: _baseRef) -> DeprecatedWithNoMessage? {
    defer {
        smoke_DeprecatedWithNoMessage_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DeprecatedWithNoMessage?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_DeprecatedWithNoMessage_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: DeprecatedWithNoMessage?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecatedWithNoMessage_release_optional_handle)
}
