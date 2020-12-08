//
//
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [Date?] {
    var result: [Date?] = []
    let count = ArrayOf_nullable_Date_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_nullable_Date_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Date?] {
    defer {
        ArrayOf_nullable_Date_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Date?]) -> RefHolder {
    let handle = ArrayOf_nullable_Date_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_nullable_Date_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Date?]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_nullable_Date_release_handle)
}
internal func copyToCType(_ swiftArray: [Date?]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_nullable_Date_create_optional_handle()
    let handle = ArrayOf_nullable_Date_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_nullable_Date_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Date?]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_nullable_Date_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Date?]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_nullable_Date_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Date?]
}
internal func moveFromCType(_ handle: _baseRef) -> [Date?]? {
    defer {
        ArrayOf_nullable_Date_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Date] {
    var result: [Date] = []
    let count = ArrayOf__Date_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__Date_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Date] {
    defer {
        ArrayOf__Date_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Date]) -> RefHolder {
    let handle = ArrayOf__Date_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__Date_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Date]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__Date_release_handle)
}
internal func copyToCType(_ swiftArray: [Date]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__Date_create_optional_handle()
    let handle = ArrayOf__Date_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__Date_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Date]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__Date_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Date]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__Date_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Date]
}
internal func moveFromCType(_ handle: _baseRef) -> [Date]? {
    defer {
        ArrayOf__Date_release_optional_handle(handle)
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
