import Foundation
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval] {
    var swiftDict: [URLCredential.Persistence: DateInterval] = [:]
    let iterator_handle = MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator(handle)
    while MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_value(iterator_handle)) as DateInterval
        MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_increment(iterator_handle)
    }
    MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval] {
    defer {
        MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [URLCredential.Persistence: DateInterval]) -> RefHolder {
    let c_handle = MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [URLCredential.Persistence: DateInterval]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [URLCredential.Persistence: DateInterval]
}
internal func moveFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: DateInterval]? {
    defer {
        MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [URLCredential.Persistence: DateInterval]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_create_optional_handle()
    let handle = MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [URLCredential.Persistence: DateInterval]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_smoke_URLCredential_1Persistence_To_smoke_DateInterval_release_optional_handle)
}
