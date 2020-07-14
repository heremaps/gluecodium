//
//
import Foundation
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> Set<DateInterval> {
    var result: Set<DateInterval> = []
    let iterator_handle = SetOf_smoke_DateInterval_iterator(handle)
    while SetOf_smoke_DateInterval_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_smoke_DateInterval_iterator_get(iterator_handle)))
        SetOf_smoke_DateInterval_iterator_increment(iterator_handle)
    }
    SetOf_smoke_DateInterval_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<DateInterval> {
    defer {
        SetOf_smoke_DateInterval_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<DateInterval>) -> RefHolder {
    let handle = SetOf_smoke_DateInterval_create_handle()
    for item in swiftSet {
        SetOf_smoke_DateInterval_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<DateInterval>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_smoke_DateInterval_release_handle)
}
internal func copyToCType(_ swiftSet: Set<DateInterval>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_smoke_DateInterval_create_optional_handle()
    let handle = SetOf_smoke_DateInterval_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_smoke_DateInterval_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<DateInterval>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_smoke_DateInterval_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<DateInterval>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_smoke_DateInterval_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<DateInterval>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<DateInterval>? {
    defer {
        SetOf_smoke_DateInterval_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
