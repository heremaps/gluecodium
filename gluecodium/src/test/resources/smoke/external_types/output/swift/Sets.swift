//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence> {
    var result: Set<URLCredential.Persistence> = []
    let iterator_handle = foobar_SetOf_smoke_URLCredential_1Persistence_iterator(handle)
    while foobar_SetOf_smoke_URLCredential_1Persistence_iterator_is_valid(handle, iterator_handle) {
        result.insert(foobar_copyFromCType(foobar_SetOf_smoke_URLCredential_1Persistence_iterator_get(iterator_handle)))
        foobar_SetOf_smoke_URLCredential_1Persistence_iterator_increment(iterator_handle)
    }
    foobar_SetOf_smoke_URLCredential_1Persistence_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence> {
    defer {
        foobar_SetOf_smoke_URLCredential_1Persistence_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<URLCredential.Persistence>) -> RefHolder {
    let handle = foobar_SetOf_smoke_URLCredential_1Persistence_create_handle()
    for item in swiftSet {
        foobar_SetOf_smoke_URLCredential_1Persistence_insert(handle, foobar_moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<URLCredential.Persistence>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_smoke_URLCredential_1Persistence_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<URLCredential.Persistence>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_smoke_URLCredential_1Persistence_create_optional_handle()
    let handle = foobar_SetOf_smoke_URLCredential_1Persistence_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        foobar_SetOf_smoke_URLCredential_1Persistence_insert(handle, foobar_moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<URLCredential.Persistence>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_smoke_URLCredential_1Persistence_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_smoke_URLCredential_1Persistence_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<URLCredential.Persistence>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence>? {
    defer {
        foobar_SetOf_smoke_URLCredential_1Persistence_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
