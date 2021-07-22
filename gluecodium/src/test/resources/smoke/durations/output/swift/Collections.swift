//
//
import Foundation
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> [TimeInterval] {
    var result: [TimeInterval] = []
    let count = foobar_ArrayOf__Duration_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Duration_get(handle, idx)))
    }
    return result
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> [TimeInterval] {
    defer {
        foobar_ArrayOf__Duration_release_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftArray: [TimeInterval]) -> RefHolder {
    let handle = foobar_ArrayOf__Duration_create_handle()
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Duration_append(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftArray: [TimeInterval]) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftArray).ref, release: foobar_ArrayOf__Duration_release_handle)
}
internal func foobar_TimeInterval_copyToCType(_ swiftArray: [TimeInterval]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Duration_create_optional_handle()
    let handle = foobar_ArrayOf__Duration_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Duration_append(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_TimeInterval_moveToCType(_ swiftType: [TimeInterval]?) -> RefHolder {
    return RefHolder(ref: foobar_TimeInterval_copyToCType(swiftType).ref, release: foobar_ArrayOf__Duration_release_optional_handle)
}
internal func foobar_TimeInterval_copyFromCType(_ handle: _baseRef) -> [TimeInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Duration_unwrap_optional_handle(handle)
    return foobar_TimeInterval_copyFromCType(unwrappedHandle) as [TimeInterval]
}
internal func foobar_TimeInterval_moveFromCType(_ handle: _baseRef) -> [TimeInterval]? {
    defer {
        foobar_ArrayOf__Duration_release_optional_handle(handle)
    }
    return foobar_TimeInterval_copyFromCType(handle)
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(_ handle: _baseRef) -> [TimeInterval] {
    var result: [TimeInterval] = []
    let count = foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_get(handle, idx)))
    }
    return result
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondsmoveFromCType(_ handle: _baseRef) -> [TimeInterval] {
    defer {
        foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_release_handle(handle)
    }
    return foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(handle)
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(_ swiftArray: [TimeInterval]) -> RefHolder {
    let handle = foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_create_handle()
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_append(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondsmoveToCType(_ swiftArray: [TimeInterval]) -> RefHolder {
    return RefHolder(ref: foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(swiftArray).ref, release: foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_release_handle)
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(_ swiftArray: [TimeInterval]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_create_optional_handle()
    let handle = foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_append(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondsmoveToCType(_ swiftType: [TimeInterval]?) -> RefHolder {
    return RefHolder(ref: foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyToCType(swiftType).ref, release: foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle)
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(_ handle: _baseRef) -> [TimeInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_unwrap_optional_handle(handle)
    return foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(unwrappedHandle) as [TimeInterval]
}
internal func foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondsmoveFromCType(_ handle: _baseRef) -> [TimeInterval]? {
    defer {
        foobar_ArrayOf__Duration_std_2_2chrono_2_2milliseconds_release_optional_handle(handle)
    }
    return foobar_ArrayOf__Duration_std_2_2chrono_2_2millisecondscopyFromCType(handle)
}
