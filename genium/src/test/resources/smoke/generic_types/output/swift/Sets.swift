//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> Set<Float> {
    var result: Set<Float> = []
    let iterator_handle = SetOf_Float_iterator(handle)
    while SetOf_Float_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_Float_iterator_get(iterator_handle)))
        SetOf_Float_iterator_increment(iterator_handle)
    }
    SetOf_Float_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Float> {
    defer {
        SetOf_Float_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Float>) -> RefHolder {
    let handle = SetOf_Float_create_handle()
    for item in swiftSet {
        SetOf_Float_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Float>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_Float_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Float>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_Float_create_optional_handle()
    let handle = SetOf_Float_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_Float_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Float>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_Float_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Float>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_Float_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Float>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Float>? {
    defer {
        SetOf_Float_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
    var result: Set<GenericTypesWithCompoundTypes.ExternalEnum> = []
    let iterator_handle = SetOf_ExternalEnum_iterator(handle)
    while SetOf_ExternalEnum_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_ExternalEnum_iterator_get(iterator_handle)))
        SetOf_ExternalEnum_iterator_increment(iterator_handle)
    }
    SetOf_ExternalEnum_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
    defer {
        SetOf_ExternalEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>) -> RefHolder {
    let handle = SetOf_ExternalEnum_create_handle()
    for item in swiftSet {
        SetOf_ExternalEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_ExternalEnum_release_handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_ExternalEnum_create_optional_handle()
    let handle = SetOf_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_ExternalEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<GenericTypesWithCompoundTypes.ExternalEnum>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_ExternalEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_ExternalEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<GenericTypesWithCompoundTypes.ExternalEnum>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum>? {
    defer {
        SetOf_ExternalEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum> {
    var result: Set<GenericTypesWithCompoundTypes.SomeEnum> = []
    let iterator_handle = SetOf_SomeEnum_iterator(handle)
    while SetOf_SomeEnum_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_SomeEnum_iterator_get(iterator_handle)))
        SetOf_SomeEnum_iterator_increment(iterator_handle)
    }
    SetOf_SomeEnum_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum> {
    defer {
        SetOf_SomeEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> RefHolder {
    let handle = SetOf_SomeEnum_create_handle()
    for item in swiftSet {
        SetOf_SomeEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_SomeEnum_release_handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_SomeEnum_create_optional_handle()
    let handle = SetOf_SomeEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_SomeEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<GenericTypesWithCompoundTypes.SomeEnum>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_SomeEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_SomeEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<GenericTypesWithCompoundTypes.SomeEnum>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum>? {
    defer {
        SetOf_SomeEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Int32> {
    var result: Set<Int32> = []
    let iterator_handle = SetOf_Int_iterator(handle)
    while SetOf_Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_Int_iterator_get(iterator_handle)))
        SetOf_Int_iterator_increment(iterator_handle)
    }
    SetOf_Int_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Int32> {
    defer {
        SetOf_Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    let handle = SetOf_Int_create_handle()
    for item in swiftSet {
        SetOf_Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_Int_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Int32>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_Int_create_optional_handle()
    let handle = SetOf_Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Int32>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Int32>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Int32>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Int32>? {
    defer {
        SetOf_Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<String> {
    var result: Set<String> = []
    let iterator_handle = SetOf_String_iterator(handle)
    while SetOf_String_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_String_iterator_get(iterator_handle)))
        SetOf_String_iterator_increment(iterator_handle)
    }
    SetOf_String_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<String> {
    defer {
        SetOf_String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<String>) -> RefHolder {
    let handle = SetOf_String_create_handle()
    for item in swiftSet {
        SetOf_String_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<String>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_String_release_handle)
}
internal func copyToCType(_ swiftSet: Set<String>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_String_create_optional_handle()
    let handle = SetOf_String_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_String_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<String>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<String>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<String>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<String>? {
    defer {
        SetOf_String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<UInt8> {
    var result: Set<UInt8> = []
    let iterator_handle = SetOf_UByte_iterator(handle)
    while SetOf_UByte_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_UByte_iterator_get(iterator_handle)))
        SetOf_UByte_iterator_increment(iterator_handle)
    }
    SetOf_UByte_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<UInt8> {
    defer {
        SetOf_UByte_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<UInt8>) -> RefHolder {
    let handle = SetOf_UByte_create_handle()
    for item in swiftSet {
        SetOf_UByte_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<UInt8>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_UByte_release_handle)
}
internal func copyToCType(_ swiftSet: Set<UInt8>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_UByte_create_optional_handle()
    let handle = SetOf_UByte_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_UByte_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<UInt8>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_UByte_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<UInt8>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_UByte_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<UInt8>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<UInt8>? {
    defer {
        SetOf_UByte_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]> {
    var result: Set<[Int32: Bool]> = []
    let iterator_handle = SetOf_MapOf_Int_To_Boolean_iterator(handle)
    while SetOf_MapOf_Int_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_MapOf_Int_To_Boolean_iterator_get(iterator_handle)))
        SetOf_MapOf_Int_To_Boolean_iterator_increment(iterator_handle)
    }
    SetOf_MapOf_Int_To_Boolean_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]> {
    defer {
        SetOf_MapOf_Int_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32: Bool]>) -> RefHolder {
    let handle = SetOf_MapOf_Int_To_Boolean_create_handle()
    for item in swiftSet {
        SetOf_MapOf_Int_To_Boolean_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<[Int32: Bool]>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_MapOf_Int_To_Boolean_release_handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32: Bool]>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_MapOf_Int_To_Boolean_create_optional_handle()
    let handle = SetOf_MapOf_Int_To_Boolean_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_MapOf_Int_To_Boolean_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<[Int32: Bool]>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_MapOf_Int_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_MapOf_Int_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<[Int32: Bool]>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]>? {
    defer {
        SetOf_MapOf_Int_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Set<Int32>> {
    var result: Set<Set<Int32>> = []
    let iterator_handle = SetOf_SetOf_Int_iterator(handle)
    while SetOf_SetOf_Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_SetOf_Int_iterator_get(iterator_handle)))
        SetOf_SetOf_Int_iterator_increment(iterator_handle)
    }
    SetOf_SetOf_Int_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Set<Int32>> {
    defer {
        SetOf_SetOf_Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Set<Int32>>) -> RefHolder {
    let handle = SetOf_SetOf_Int_create_handle()
    for item in swiftSet {
        SetOf_SetOf_Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Set<Int32>>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_SetOf_Int_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Set<Int32>>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_SetOf_Int_create_optional_handle()
    let handle = SetOf_SetOf_Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_SetOf_Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Set<Int32>>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_SetOf_Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Set<Int32>>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_SetOf_Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Set<Int32>>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Set<Int32>>? {
    defer {
        SetOf_SetOf_Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32]> {
    var result: Set<[Int32]> = []
    let iterator_handle = SetOf_ArrayOf_Int_iterator(handle)
    while SetOf_ArrayOf_Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_ArrayOf_Int_iterator_get(iterator_handle)))
        SetOf_ArrayOf_Int_iterator_increment(iterator_handle)
    }
    SetOf_ArrayOf_Int_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32]> {
    defer {
        SetOf_ArrayOf_Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32]>) -> RefHolder {
    let handle = SetOf_ArrayOf_Int_create_handle()
    for item in swiftSet {
        SetOf_ArrayOf_Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<[Int32]>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_ArrayOf_Int_release_handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32]>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_ArrayOf_Int_create_optional_handle()
    let handle = SetOf_ArrayOf_Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_ArrayOf_Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<[Int32]>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_ArrayOf_Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32]>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_ArrayOf_Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<[Int32]>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32]>? {
    defer {
        SetOf_ArrayOf_Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
