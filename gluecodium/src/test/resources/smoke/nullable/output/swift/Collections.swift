//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Date?] {
    var result: [Date?] = []
    let count = foobar_ArrayOf_nullable_Date_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_nullable_Date_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Date?] {
    defer {
        foobar_ArrayOf_nullable_Date_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [Date?]) -> RefHolder {
    let handle = foobar_ArrayOf_nullable_Date_create_handle()
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf_nullable_Date_append(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [Date?]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_nullable_Date_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [Date?]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_nullable_Date_create_optional_handle()
    let handle = foobar_ArrayOf_nullable_Date_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf_nullable_Date_append(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Date?]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_nullable_Date_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Date?]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_nullable_Date_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Date?]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Date?]? {
    defer {
        foobar_ArrayOf_nullable_Date_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Date] {
    var result: [Date] = []
    let count = foobar_ArrayOf__Date_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Date_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Date] {
    defer {
        foobar_ArrayOf__Date_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [Date]) -> RefHolder {
    let handle = foobar_ArrayOf__Date_create_handle()
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Date_append(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [Date]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf__Date_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [Date]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Date_create_optional_handle()
    let handle = foobar_ArrayOf__Date_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Date_append(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Date]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf__Date_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Date]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Date_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Date]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Date]? {
    defer {
        foobar_ArrayOf__Date_release_optional_handle(handle)
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
        let _item = moveToCType(item)
        foobar_ArrayOf__String_append(handle, _item.ref)
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
        let _item = moveToCType(item)
        foobar_ArrayOf__String_append(handle, _item.ref)
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
