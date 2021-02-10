//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> [DateInterval] {
    var result: [DateInterval] = []
    let count = foobar_ArrayOf_smoke_DateInterval_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_smoke_DateInterval_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [DateInterval] {
    defer {
        foobar_ArrayOf_smoke_DateInterval_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [DateInterval]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_DateInterval_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_DateInterval_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [DateInterval]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_DateInterval_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [DateInterval]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_DateInterval_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_DateInterval_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_DateInterval_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [DateInterval]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_DateInterval_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [DateInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_DateInterval_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [DateInterval]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [DateInterval]? {
    defer {
        foobar_ArrayOf_smoke_DateInterval_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int8] {
    var result: [Int8] = []
    let count = foobar_ArrayOf__Byte_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Byte_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int8] {
    defer {
        foobar_ArrayOf__Byte_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [Int8]) -> RefHolder {
    let handle = foobar_ArrayOf__Byte_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf__Byte_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [Int8]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf__Byte_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [Int8]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Byte_create_optional_handle()
    let handle = foobar_ArrayOf__Byte_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf__Byte_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int8]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf__Byte_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Byte_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int8]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int8]? {
    defer {
        foobar_ArrayOf__Byte_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String] {
    var result: [String] = []
    let count = foobar_ArrayOf__String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__String_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String] {
    defer {
        foobar_ArrayOf__String_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [String]) -> RefHolder {
    let handle = foobar_ArrayOf__String_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf__String_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [String]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf__String_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [String]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__String_create_optional_handle()
    let handle = foobar_ArrayOf__String_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf__String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [String]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf__String_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__String_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [String]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String]? {
    defer {
        foobar_ArrayOf__String_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
