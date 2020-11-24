//
//
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence> {
    var result: Set<URLCredential.Persistence> = []
    let iterator_handle = SetOf_smoke_URLCredential_1Persistence_iterator(handle)
    while SetOf_smoke_URLCredential_1Persistence_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_smoke_URLCredential_1Persistence_iterator_get(iterator_handle)))
        SetOf_smoke_URLCredential_1Persistence_iterator_increment(iterator_handle)
    }
    SetOf_smoke_URLCredential_1Persistence_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence> {
    defer {
        SetOf_smoke_URLCredential_1Persistence_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<URLCredential.Persistence>) -> RefHolder {
    let handle = SetOf_smoke_URLCredential_1Persistence_create_handle()
    for item in swiftSet {
        SetOf_smoke_URLCredential_1Persistence_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<URLCredential.Persistence>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_smoke_URLCredential_1Persistence_release_handle)
}
internal func copyToCType(_ swiftSet: Set<URLCredential.Persistence>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_smoke_URLCredential_1Persistence_create_optional_handle()
    let handle = SetOf_smoke_URLCredential_1Persistence_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_smoke_URLCredential_1Persistence_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<URLCredential.Persistence>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_smoke_URLCredential_1Persistence_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_smoke_URLCredential_1Persistence_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<URLCredential.Persistence>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<URLCredential.Persistence>? {
    defer {
        SetOf_smoke_URLCredential_1Persistence_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
