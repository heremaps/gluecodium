//
//
import Foundation
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> Set<TimeInterval> {
    var result: Set<TimeInterval> = []
    let iterator_handle = foobar_SetOf__Duration_iterator(handle)
    while foobar_SetOf__Duration_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf__Duration_iterator_get(iterator_handle)))
        foobar_SetOf__Duration_iterator_increment(iterator_handle)
    }
    foobar_SetOf__Duration_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> Set<TimeInterval> {
    defer {
        foobar_SetOf__Duration_release_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftSet: Set<TimeInterval>) -> RefHolder {
    let handle = foobar_SetOf__Duration_create_handle()
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Duration_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftSet: Set<TimeInterval>) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftSet).ref, release: foobar_SetOf__Duration_release_handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftSet: Set<TimeInterval>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf__Duration_create_optional_handle()
    let handle = foobar_SetOf__Duration_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Duration_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftType: Set<TimeInterval>?) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftType).ref, release: foobar_SetOf__Duration_release_optional_handle)
}
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> Set<TimeInterval>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf__Duration_unwrap_optional_handle(handle)
    return foobar_TimeInterval_copyFromCType(unwrappedHandle) as Set<TimeInterval>
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> Set<TimeInterval>? {
    defer {
        foobar_SetOf__Duration_release_optional_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(_ handle: _baseRef) -> Set<TimeInterval> {
    var result: Set<TimeInterval> = []
    let iterator_handle = foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator(handle)
    while foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_get(iterator_handle)))
        foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_increment(iterator_handle)
    }
    foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondsmoveFromCType(_ handle: _baseRef) -> Set<TimeInterval> {
    defer {
        foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_release_handle(handle)
    }
    return foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(handle)
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(_ swiftSet: Set<TimeInterval>) -> RefHolder {
    let handle = foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_create_handle()
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondsmoveToCType(_ swiftSet: Set<TimeInterval>) -> RefHolder {
    return RefHolder(ref: foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(swiftSet).ref, release: foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_release_handle)
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(_ swiftSet: Set<TimeInterval>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_create_optional_handle()
    let handle = foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondsmoveToCType(_ swiftType: Set<TimeInterval>?) -> RefHolder {
    return RefHolder(ref: foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(swiftType).ref, release: foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle)
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(_ handle: _baseRef) -> Set<TimeInterval>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(handle)
    return foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(unwrappedHandle) as Set<TimeInterval>
}
internal func foobar_SetOf__Duration_std_2_2chrono_2_2millisecondsmoveFromCType(_ handle: _baseRef) -> Set<TimeInterval>? {
    defer {
        foobar_SetOf__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle(handle)
    }
    return foobar_SetOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(handle)
}
