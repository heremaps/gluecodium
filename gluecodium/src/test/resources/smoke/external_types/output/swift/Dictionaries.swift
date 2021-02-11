import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval] {
    var swiftDict: [URLCredential.Persistence: DateInterval] = [:]
    let iterator_handle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator(handle)
    while foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_is_valid(handle, iterator_handle) {
        swiftDict[foobar_moveFromCType(foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_key(iterator_handle))] =
            foobar_moveFromCType(foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_value(iterator_handle)) as DateInterval
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_increment(iterator_handle)
    }
    foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval] {
    defer {
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [URLCredential.Persistence: DateInterval]) -> RefHolder {
    let c_handle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_create_handle()
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [URLCredential.Persistence: DateInterval]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [URLCredential.Persistence: DateInterval]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval]? {
    defer {
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [URLCredential.Persistence: DateInterval]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_create_optional_handle()
    let handle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [URLCredential.Persistence: DateInterval]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_optional_handle)
}
