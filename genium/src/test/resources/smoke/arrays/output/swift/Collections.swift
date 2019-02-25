//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct] {
    var result: [Arrays.BasicStruct] = []
    let count = arrayCollection_BasicStructArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_BasicStructArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct] {
    defer {
        arrayCollection_BasicStructArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.BasicStruct]) -> RefHolder {
    let handle = arrayCollection_BasicStructArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_BasicStructArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.BasicStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_BasicStructArray_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.BasicStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_BasicStructArray_create_optional_handle()
    let handle = arrayCollection_BasicStructArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_BasicStructArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_BasicStructArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_BasicStructArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.BasicStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct]? {
    defer {
        arrayCollection_BasicStructArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum] {
    var result: [Arrays.ExternalEnum] = []
    let count = arrayCollection_ExternalEnumArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_ExternalEnumArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum] {
    defer {
        arrayCollection_ExternalEnumArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalEnum]) -> RefHolder {
    let handle = arrayCollection_ExternalEnumArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_ExternalEnumArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_ExternalEnumArray_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_ExternalEnumArray_create_optional_handle()
    let handle = arrayCollection_ExternalEnumArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_ExternalEnumArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_ExternalEnumArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_ExternalEnumArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.ExternalEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum]? {
    defer {
        arrayCollection_ExternalEnumArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct] {
    var result: [Arrays.ExternalStruct] = []
    let count = arrayCollection_ExternalStructArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_ExternalStructArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct] {
    defer {
        arrayCollection_ExternalStructArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalStruct]) -> RefHolder {
    let handle = arrayCollection_ExternalStructArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_ExternalStructArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_ExternalStructArray_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_ExternalStructArray_create_optional_handle()
    let handle = arrayCollection_ExternalStructArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_ExternalStructArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_ExternalStructArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_ExternalStructArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.ExternalStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct]? {
    defer {
        arrayCollection_ExternalStructArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct] {
    var result: [Arrays.FancyStruct] = []
    let count = arrayCollection_FancyStructArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_FancyStructArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct] {
    defer {
        arrayCollection_FancyStructArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.FancyStruct]) -> RefHolder {
    let handle = arrayCollection_FancyStructArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_FancyStructArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.FancyStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_FancyStructArray_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.FancyStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_FancyStructArray_create_optional_handle()
    let handle = arrayCollection_FancyStructArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_FancyStructArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.FancyStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_FancyStructArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_FancyStructArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.FancyStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct]? {
    defer {
        arrayCollection_FancyStructArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum] {
    var result: [Arrays.SomeEnum] = []
    let count = arrayCollection_SomeEnumArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_SomeEnumArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum] {
    defer {
        arrayCollection_SomeEnumArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.SomeEnum]) -> RefHolder {
    let handle = arrayCollection_SomeEnumArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_SomeEnumArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.SomeEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_SomeEnumArray_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.SomeEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_SomeEnumArray_create_optional_handle()
    let handle = arrayCollection_SomeEnumArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_SomeEnumArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_SomeEnumArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_SomeEnumArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.SomeEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum]? {
    defer {
        arrayCollection_SomeEnumArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String] {
    var result: [String] = []
    let count = arrayCollection_StringArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_StringArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [String] {
    defer {
        arrayCollection_StringArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [String]) -> RefHolder {
    let handle = arrayCollection_StringArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_StringArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_StringArray_release_handle)
}
internal func copyToCType(_ swiftArray: [String]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_StringArray_create_optional_handle()
    let handle = arrayCollection_StringArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_StringArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_StringArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_StringArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String]
}
internal func moveFromCType(_ handle: _baseRef) -> [String]? {
    defer {
        arrayCollection_StringArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8] {
    var result: [UInt8] = []
    let count = arrayCollection_UInt8Array_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_UInt8Array_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8] {
    defer {
        arrayCollection_UInt8Array_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [UInt8]) -> RefHolder {
    let handle = arrayCollection_UInt8Array_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_UInt8Array_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [UInt8]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_UInt8Array_release_handle)
}
internal func copyToCType(_ swiftArray: [UInt8]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_UInt8Array_create_optional_handle()
    let handle = arrayCollection_UInt8Array_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_UInt8Array_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_UInt8Array_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_UInt8Array_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8]? {
    defer {
        arrayCollection_UInt8Array_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap] {
    var result: [Arrays.ErrorCodeToMessageMap] = []
    let count = arrayCollection_Int32ToStringMapArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_Int32ToStringMapArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap] {
    defer {
        arrayCollection_Int32ToStringMapArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]) -> RefHolder {
    let handle = arrayCollection_Int32ToStringMapArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_Int32ToStringMapArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_Int32ToStringMapArray_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_Int32ToStringMapArray_create_optional_handle()
    let handle = arrayCollection_Int32ToStringMapArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_Int32ToStringMapArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.ErrorCodeToMessageMap]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_Int32ToStringMapArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_Int32ToStringMapArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.ErrorCodeToMessageMap]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap]? {
    defer {
        arrayCollection_Int32ToStringMapArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.ArrayOfArrays {
    var result: Arrays.ArrayOfArrays = []
    let count = arrayCollection_StringArrayArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_StringArrayArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.ArrayOfArrays {
    defer {
        arrayCollection_StringArrayArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: Arrays.ArrayOfArrays) -> RefHolder {
    let handle = arrayCollection_StringArrayArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_StringArrayArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: Arrays.ArrayOfArrays) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_StringArrayArray_release_handle)
}
internal func copyToCType(_ swiftArray: Arrays.ArrayOfArrays?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_StringArrayArray_create_optional_handle()
    let handle = arrayCollection_StringArrayArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_StringArrayArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Arrays.ArrayOfArrays?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_StringArrayArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.ArrayOfArrays? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_StringArrayArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Arrays.ArrayOfArrays
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.ArrayOfArrays? {
    defer {
        arrayCollection_StringArrayArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[UInt8]] {
    var result: [[UInt8]] = []
    let count = arrayCollection_UInt8ArrayArray_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(arrayCollection_UInt8ArrayArray_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [[UInt8]] {
    defer {
        arrayCollection_UInt8ArrayArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [[UInt8]]) -> RefHolder {
    let handle = arrayCollection_UInt8ArrayArray_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        arrayCollection_UInt8ArrayArray_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [[UInt8]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: arrayCollection_UInt8ArrayArray_release_handle)
}
internal func copyToCType(_ swiftArray: [[UInt8]]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = arrayCollection_UInt8ArrayArray_create_optional_handle()
    let handle = arrayCollection_UInt8ArrayArray_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        arrayCollection_UInt8ArrayArray_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[UInt8]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: arrayCollection_UInt8ArrayArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[UInt8]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = arrayCollection_UInt8ArrayArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[UInt8]]
}
internal func moveFromCType(_ handle: _baseRef) -> [[UInt8]]? {
    defer {
        arrayCollection_UInt8ArrayArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
