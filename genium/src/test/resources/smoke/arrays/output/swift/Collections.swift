//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct] {
    var result: [Arrays.BasicStruct] = []
    let count = arrayCollection_BasicStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_BasicStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct] {
    defer {
        arrayCollection_BasicStruct_release_handle(handle)
    }
    var result: [Arrays.BasicStruct] = []
    let count = arrayCollection_BasicStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_BasicStruct_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [Arrays.BasicStruct]) -> RefHolder {
    let handle = arrayCollection_BasicStruct_create_handle()
    for item in swiftArray {
        arrayCollection_BasicStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.BasicStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_BasicStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum] {
    var result: [Arrays.ExternalEnum] = []
    let count = arrayCollection_ExternalEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_ExternalEnum_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum] {
    defer {
        arrayCollection_ExternalEnum_release_handle(handle)
    }
    var result: [Arrays.ExternalEnum] = []
    let count = arrayCollection_ExternalEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_ExternalEnum_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalEnum]) -> RefHolder {
    let handle = arrayCollection_ExternalEnum_create_handle()
    for item in swiftArray {
        arrayCollection_ExternalEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_ExternalEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct] {
    var result: [Arrays.ExternalStruct] = []
    let count = arrayCollection_ExternalStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_ExternalStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct] {
    defer {
        arrayCollection_ExternalStruct_release_handle(handle)
    }
    var result: [Arrays.ExternalStruct] = []
    let count = arrayCollection_ExternalStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_ExternalStruct_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalStruct]) -> RefHolder {
    let handle = arrayCollection_ExternalStruct_create_handle()
    for item in swiftArray {
        arrayCollection_ExternalStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_ExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct] {
    var result: [Arrays.FancyStruct] = []
    let count = arrayCollection_FancyStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_FancyStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct] {
    defer {
        arrayCollection_FancyStruct_release_handle(handle)
    }
    var result: [Arrays.FancyStruct] = []
    let count = arrayCollection_FancyStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_FancyStruct_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [Arrays.FancyStruct]) -> RefHolder {
    let handle = arrayCollection_FancyStruct_create_handle()
    for item in swiftArray {
        arrayCollection_FancyStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.FancyStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_FancyStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum] {
    var result: [Arrays.SomeEnum] = []
    let count = arrayCollection_SomeEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_SomeEnum_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum] {
    defer {
        arrayCollection_SomeEnum_release_handle(handle)
    }
    var result: [Arrays.SomeEnum] = []
    let count = arrayCollection_SomeEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_SomeEnum_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [Arrays.SomeEnum]) -> RefHolder {
    let handle = arrayCollection_SomeEnum_create_handle()
    for item in swiftArray {
        arrayCollection_SomeEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.SomeEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_SomeEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap] {
    var result: [Arrays.ErrorCodeToMessageMap] = []
    let count = arrayCollection_Int32StringMap_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_Int32StringMap_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap] {
    defer {
        arrayCollection_Int32StringMap_release_handle(handle)
    }
    var result: [Arrays.ErrorCodeToMessageMap] = []
    let count = arrayCollection_Int32StringMap_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_Int32StringMap_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]) -> RefHolder {
    let handle = arrayCollection_Int32StringMap_create_handle()
    for item in swiftArray {
        arrayCollection_Int32StringMap_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_Int32StringMap_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String] {
    var result: [String] = []
    let count = arrayCollection_String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_String_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [String] {
    defer {
        arrayCollection_String_release_handle(handle)
    }
    var result: [String] = []
    let count = arrayCollection_String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_String_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [String]) -> RefHolder {
    let handle = arrayCollection_String_create_handle()
    for item in swiftArray {
        arrayCollection_String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_String_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8] {
    var result: [UInt8] = []
    let count = arrayCollection_UInt8_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_UInt8_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8] {
    defer {
        arrayCollection_UInt8_release_handle(handle)
    }
    var result: [UInt8] = []
    let count = arrayCollection_UInt8_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_UInt8_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [UInt8]) -> RefHolder {
    let handle = arrayCollection_UInt8_create_handle()
    for item in swiftArray {
        arrayCollection_UInt8_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [UInt8]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_UInt8_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[String]] {
    var result: [[String]] = []
    let count = arrayCollection_StringArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_StringArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [[String]] {
    defer {
        arrayCollection_StringArray_release_handle(handle)
    }
    var result: [[String]] = []
    let count = arrayCollection_StringArray_count(handle)
    for idx in 0..<count {
        result.append(moveFromCType(arrayCollection_StringArray_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [[String]]) -> RefHolder {
    let handle = arrayCollection_StringArray_create_handle()
    for item in swiftArray {
        arrayCollection_StringArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [[String]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_StringArray_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[UInt8]] {
    var result: [[UInt8]] = []
    let count = arrayCollection_UInt8Array_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_UInt8Array_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [[UInt8]] {
    defer {
        arrayCollection_UInt8Array_release_handle(handle)
    }
    var result: [[UInt8]] = []
    let count = arrayCollection_UInt8Array_count(handle)
    for idx in 0..<count {
        result.append(moveFromCType(arrayCollection_UInt8Array_get(handle, idx)))
    }
    return result
}
internal func copyToCType(_ swiftArray: [[UInt8]]) -> RefHolder {
    let handle = arrayCollection_UInt8Array_create_handle()
    for item in swiftArray {
        arrayCollection_UInt8Array_append(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [[UInt8]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_UInt8Array_release_handle)
}
