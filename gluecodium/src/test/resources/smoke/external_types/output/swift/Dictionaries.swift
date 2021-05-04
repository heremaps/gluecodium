import Foundation
import UIKit
internal func foobar_copyFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: UIColor] {
    var swiftDict: [URLCredential.Persistence: UIColor] = [:]
    let iterator_handle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_iterator(handle)
    while foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_iterator_value(iterator_handle)) as UIColor
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_iterator_increment(iterator_handle)
    }
    foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: UIColor] {
    defer {
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [URLCredential.Persistence: UIColor]) -> RefHolder {
    let c_handle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [URLCredential.Persistence: UIColor]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: UIColor]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [URLCredential.Persistence: UIColor]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [URLCredential.Persistence: UIColor]? {
    defer {
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [URLCredential.Persistence: UIColor]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_create_optional_handle()
    let handle = foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [URLCredential.Persistence: UIColor]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_smoke_URLCredential_1Persistence_To_smoke_UIColor_release_optional_handle)
}
