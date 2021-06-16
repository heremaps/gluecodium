import Foundation
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> [String: TimeInterval] {
    var swiftDict: [String: TimeInterval] = [:]
    let iterator_handle = foobar_MapOf__String_To__Duration_iterator(handle)
    while foobar_MapOf__String_To__Duration_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__String_To__Duration_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__String_To__Duration_iterator_value(iterator_handle)) as TimeInterval
        foobar_MapOf__String_To__Duration_iterator_increment(iterator_handle)
    }
    foobar_MapOf__String_To__Duration_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> [String: TimeInterval] {
    defer {
        foobar_MapOf__String_To__Duration_release_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftDict: [String: TimeInterval]) -> RefHolder {
    let c_handle = foobar_MapOf__String_To__Duration_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To__Duration_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftDict: [String: TimeInterval]) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftDict).ref, release: foobar_MapOf__String_To__Duration_release_handle)
}
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> [String: TimeInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__String_To__Duration_unwrap_optional_handle(handle)
    return foobar_TimeInterval_copyFromCType(unwrappedHandle) as [String: TimeInterval]
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> [String: TimeInterval]? {
    defer {
        foobar_MapOf__String_To__Duration_release_optional_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftDict: [String: TimeInterval]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__String_To__Duration_create_optional_handle()
    let handle = foobar_MapOf__String_To__Duration_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To__Duration_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftType: [String: TimeInterval]?) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftType).ref, release: foobar_MapOf__String_To__Duration_release_optional_handle)
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyFromCType(_ handle: _baseRef) -> [String: TimeInterval] {
    var swiftDict: [String: TimeInterval] = [:]
    let iterator_handle = foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator(handle)
    while foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_value(iterator_handle)) as TimeInterval
        foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_increment(iterator_handle)
    }
    foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondsmoveFromCType(_ handle: _baseRef) -> [String: TimeInterval] {
    defer {
        foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_release_handle(handle)
    }
    return foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyFromCType(handle)
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyToCType(_ swiftDict: [String: TimeInterval]) -> RefHolder {
    let c_handle = foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondsmoveToCType(_ swiftDict: [String: TimeInterval]) -> RefHolder {
    return RefHolder(ref: foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyToCType(swiftDict).ref, release: foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_release_handle)
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyFromCType(_ handle: _baseRef) -> [String: TimeInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(handle)
    return foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyFromCType(unwrappedHandle) as [String: TimeInterval]
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondsmoveFromCType(_ handle: _baseRef) -> [String: TimeInterval]? {
    defer {
        foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle(handle)
    }
    return foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyFromCType(handle)
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyToCType(_ swiftDict: [String: TimeInterval]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_create_optional_handle()
    let handle = foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondsmoveToCType(_ swiftType: [String: TimeInterval]?) -> RefHolder {
    return RefHolder(ref: foobar_MapOf__String_To__Duration_std_2_2chrono_2_2millisecondscopyToCType(swiftType).ref, release: foobar_MapOf__String_To__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle)
}
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> [TimeInterval: String] {
    var swiftDict: [TimeInterval: String] = [:]
    let iterator_handle = foobar_MapOf__Duration_To__String_iterator(handle)
    while foobar_MapOf__Duration_To__String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Duration_To__String_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__Duration_To__String_iterator_value(iterator_handle)) as String
        foobar_MapOf__Duration_To__String_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Duration_To__String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> [TimeInterval: String] {
    defer {
        foobar_MapOf__Duration_To__String_release_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftDict: [TimeInterval: String]) -> RefHolder {
    let c_handle = foobar_MapOf__Duration_To__String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Duration_To__String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftDict: [TimeInterval: String]) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftDict).ref, release: foobar_MapOf__Duration_To__String_release_handle)
}
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> [TimeInterval: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Duration_To__String_unwrap_optional_handle(handle)
    return foobar_TimeInterval_copyFromCType(unwrappedHandle) as [TimeInterval: String]
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> [TimeInterval: String]? {
    defer {
        foobar_MapOf__Duration_To__String_release_optional_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftDict: [TimeInterval: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Duration_To__String_create_optional_handle()
    let handle = foobar_MapOf__Duration_To__String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Duration_To__String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftType: [TimeInterval: String]?) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftType).ref, release: foobar_MapOf__Duration_To__String_release_optional_handle)
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyFromCType(_ handle: _baseRef) -> [TimeInterval: String] {
    var swiftDict: [TimeInterval: String] = [:]
    let iterator_handle = foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator(handle)
    while foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_value(iterator_handle)) as String
        foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringmoveFromCType(_ handle: _baseRef) -> [TimeInterval: String] {
    defer {
        foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_release_handle(handle)
    }
    return foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyFromCType(handle)
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyToCType(_ swiftDict: [TimeInterval: String]) -> RefHolder {
    let c_handle = foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringmoveToCType(_ swiftDict: [TimeInterval: String]) -> RefHolder {
    return RefHolder(ref: foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyToCType(swiftDict).ref, release: foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_release_handle)
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyFromCType(_ handle: _baseRef) -> [TimeInterval: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_unwrap_optional_handle(handle)
    return foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyFromCType(unwrappedHandle) as [TimeInterval: String]
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringmoveFromCType(_ handle: _baseRef) -> [TimeInterval: String]? {
    defer {
        foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_release_optional_handle(handle)
    }
    return foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyFromCType(handle)
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyToCType(_ swiftDict: [TimeInterval: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_create_optional_handle()
    let handle = foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringmoveToCType(_ swiftType: [TimeInterval: String]?) -> RefHolder {
    return RefHolder(ref: foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__StringcopyToCType(swiftType).ref, release: foobar_MapOf__Duration_std_2_2chrono_2_2milliseconds_To__String_release_optional_handle)
}
