//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct] {
    var result: [Arrays.BasicStruct] = []
    let count = ArrayOf_BasicStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_BasicStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct] {
    defer {
        ArrayOf_BasicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.BasicStruct]) -> RefHolder {
    let handle = ArrayOf_BasicStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_BasicStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.BasicStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_BasicStruct_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.BasicStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_BasicStruct_create_optional_handle()
    let handle = ArrayOf_BasicStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_BasicStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_BasicStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_BasicStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.BasicStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.BasicStruct]? {
    defer {
        ArrayOf_BasicStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum] {
    var result: [Arrays.ExternalEnum] = []
    let count = ArrayOf_ExternalEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_ExternalEnum_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum] {
    defer {
        ArrayOf_ExternalEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalEnum]) -> RefHolder {
    let handle = ArrayOf_ExternalEnum_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_ExternalEnum_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_ExternalEnum_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_ExternalEnum_create_optional_handle()
    let handle = ArrayOf_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_ExternalEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_ExternalEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_ExternalEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.ExternalEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalEnum]? {
    defer {
        ArrayOf_ExternalEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct] {
    var result: [Arrays.ExternalStruct] = []
    let count = ArrayOf_ExternalStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_ExternalStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct] {
    defer {
        ArrayOf_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalStruct]) -> RefHolder {
    let handle = ArrayOf_ExternalStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_ExternalStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_ExternalStruct_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ExternalStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_ExternalStruct_create_optional_handle()
    let handle = ArrayOf_ExternalStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_ExternalStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_ExternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_ExternalStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.ExternalStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ExternalStruct]? {
    defer {
        ArrayOf_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct] {
    var result: [Arrays.FancyStruct] = []
    let count = ArrayOf_FancyStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_FancyStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct] {
    defer {
        ArrayOf_FancyStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.FancyStruct]) -> RefHolder {
    let handle = ArrayOf_FancyStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_FancyStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.FancyStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_FancyStruct_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.FancyStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_FancyStruct_create_optional_handle()
    let handle = ArrayOf_FancyStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_FancyStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.FancyStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_FancyStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_FancyStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.FancyStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.FancyStruct]? {
    defer {
        ArrayOf_FancyStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum] {
    var result: [Arrays.SomeEnum] = []
    let count = ArrayOf_SomeEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_SomeEnum_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum] {
    defer {
        ArrayOf_SomeEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.SomeEnum]) -> RefHolder {
    let handle = ArrayOf_SomeEnum_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_SomeEnum_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.SomeEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_SomeEnum_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.SomeEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_SomeEnum_create_optional_handle()
    let handle = ArrayOf_SomeEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_SomeEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_SomeEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_SomeEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.SomeEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.SomeEnum]? {
    defer {
        ArrayOf_SomeEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String] {
    var result: [String] = []
    let count = ArrayOf_String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_String_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [String] {
    defer {
        ArrayOf_String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [String]) -> RefHolder {
    let handle = ArrayOf_String_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_String_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_String_release_handle)
}
internal func copyToCType(_ swiftArray: [String]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_String_create_optional_handle()
    let handle = ArrayOf_String_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String]
}
internal func moveFromCType(_ handle: _baseRef) -> [String]? {
    defer {
        ArrayOf_String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8] {
    var result: [UInt8] = []
    let count = ArrayOf_Uint8_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_Uint8_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8] {
    defer {
        ArrayOf_Uint8_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [UInt8]) -> RefHolder {
    let handle = ArrayOf_Uint8_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_Uint8_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [UInt8]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_Uint8_release_handle)
}
internal func copyToCType(_ swiftArray: [UInt8]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_Uint8_create_optional_handle()
    let handle = ArrayOf_Uint8_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_Uint8_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_Uint8_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_Uint8_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8]? {
    defer {
        ArrayOf_Uint8_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap] {
    var result: [Arrays.ErrorCodeToMessageMap] = []
    let count = ArrayOf_MapOf_Int32_To_String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_MapOf_Int32_To_String_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap] {
    defer {
        ArrayOf_MapOf_Int32_To_String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]) -> RefHolder {
    let handle = ArrayOf_MapOf_Int32_To_String_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_MapOf_Int32_To_String_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_MapOf_Int32_To_String_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.ErrorCodeToMessageMap]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_MapOf_Int32_To_String_create_optional_handle()
    let handle = ArrayOf_MapOf_Int32_To_String_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_MapOf_Int32_To_String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.ErrorCodeToMessageMap]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_MapOf_Int32_To_String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_MapOf_Int32_To_String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.ErrorCodeToMessageMap]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.ErrorCodeToMessageMap]? {
    defer {
        ArrayOf_MapOf_Int32_To_String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.StringArray] {
    var result: [Arrays.StringArray] = []
    let count = ArrayOf_ArrayOf_String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_ArrayOf_String_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.StringArray] {
    defer {
        ArrayOf_ArrayOf_String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.StringArray]) -> RefHolder {
    let handle = ArrayOf_ArrayOf_String_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_ArrayOf_String_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.StringArray]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_ArrayOf_String_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.StringArray]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_ArrayOf_String_create_optional_handle()
    let handle = ArrayOf_ArrayOf_String_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_ArrayOf_String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.StringArray]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_ArrayOf_String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.StringArray]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_ArrayOf_String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.StringArray]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.StringArray]? {
    defer {
        ArrayOf_ArrayOf_String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.UintArray] {
    var result: [Arrays.UintArray] = []
    let count = ArrayOf_ArrayOf_Uint8_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_ArrayOf_Uint8_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.UintArray] {
    defer {
        ArrayOf_ArrayOf_Uint8_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Arrays.UintArray]) -> RefHolder {
    let handle = ArrayOf_ArrayOf_Uint8_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_ArrayOf_Uint8_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Arrays.UintArray]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_ArrayOf_Uint8_release_handle)
}
internal func copyToCType(_ swiftArray: [Arrays.UintArray]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_ArrayOf_Uint8_create_optional_handle()
    let handle = ArrayOf_ArrayOf_Uint8_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_ArrayOf_Uint8_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Arrays.UintArray]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_ArrayOf_Uint8_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Arrays.UintArray]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_ArrayOf_Uint8_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Arrays.UintArray]
}
internal func moveFromCType(_ handle: _baseRef) -> [Arrays.UintArray]? {
    defer {
        ArrayOf_ArrayOf_Uint8_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
