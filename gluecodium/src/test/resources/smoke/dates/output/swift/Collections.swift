//
//
import Foundation
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
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyFromCType(_ handle: _baseRef) -> [DatesSteady.MonotonicDate] {
    var result: [DatesSteady.MonotonicDate] = []
    let count = foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_get(handle, idx)))
    }
    return result
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointmoveFromCType(_ handle: _baseRef) -> [DatesSteady.MonotonicDate] {
    defer {
        foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_release_handle(handle)
    }
    return foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyFromCType(handle)
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyToCType(_ swiftArray: [DatesSteady.MonotonicDate]) -> RefHolder {
    let handle = foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_create_handle()
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_append(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointmoveToCType(_ swiftArray: [DatesSteady.MonotonicDate]) -> RefHolder {
    return RefHolder(ref: foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyToCType(swiftArray).ref, release: foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_release_handle)
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyToCType(_ swiftArray: [DatesSteady.MonotonicDate]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_create_optional_handle()
    let handle = foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        let _item = moveToCType(item)
        foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_append(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointmoveToCType(_ swiftType: [DatesSteady.MonotonicDate]?) -> RefHolder {
    return RefHolder(ref: foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyToCType(swiftType).ref, release: foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_release_optional_handle)
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyFromCType(_ handle: _baseRef) -> [DatesSteady.MonotonicDate]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_unwrap_optional_handle(handle)
    return foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyFromCType(unwrappedHandle) as [DatesSteady.MonotonicDate]
}
internal func foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointmoveFromCType(_ handle: _baseRef) -> [DatesSteady.MonotonicDate]? {
    defer {
        foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1point_release_optional_handle(handle)
    }
    return foobar_ArrayOf__Date_std_2_2chrono_2_2steady_1clock_2_2time_1pointcopyFromCType(handle)
}
