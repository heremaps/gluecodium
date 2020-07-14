//
//
import Foundation
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [DateInterval] {
    var result: [DateInterval] = []
    let count = ArrayOf_smoke_DateInterval_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_smoke_DateInterval_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [DateInterval] {
    defer {
        ArrayOf_smoke_DateInterval_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [DateInterval]) -> RefHolder {
    let handle = ArrayOf_smoke_DateInterval_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_DateInterval_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [DateInterval]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_DateInterval_release_handle)
}
internal func copyToCType(_ swiftArray: [DateInterval]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_DateInterval_create_optional_handle()
    let handle = ArrayOf_smoke_DateInterval_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_DateInterval_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [DateInterval]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_DateInterval_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [DateInterval]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_DateInterval_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [DateInterval]
}
internal func moveFromCType(_ handle: _baseRef) -> [DateInterval]? {
    defer {
        ArrayOf_smoke_DateInterval_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int8] {
    var result: [Int8] = []
    let count = ArrayOf__Byte_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__Byte_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Int8] {
    defer {
        ArrayOf__Byte_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Int8]) -> RefHolder {
    let handle = ArrayOf__Byte_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__Byte_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Int8]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__Byte_release_handle)
}
internal func copyToCType(_ swiftArray: [Int8]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__Byte_create_optional_handle()
    let handle = ArrayOf__Byte_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__Byte_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int8]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__Byte_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__Byte_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int8]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int8]? {
    defer {
        ArrayOf__Byte_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String] {
    var result: [String] = []
    let count = ArrayOf__String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__String_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [String] {
    defer {
        ArrayOf__String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [String]) -> RefHolder {
    let handle = ArrayOf__String_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__String_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__String_release_handle)
}
internal func copyToCType(_ swiftArray: [String]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__String_create_optional_handle()
    let handle = ArrayOf__String_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String]
}
internal func moveFromCType(_ handle: _baseRef) -> [String]? {
    defer {
        ArrayOf__String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
