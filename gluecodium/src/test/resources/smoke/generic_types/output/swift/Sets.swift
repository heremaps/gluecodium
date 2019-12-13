//
//
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> Set<Float> {
    var result: Set<Float> = []
    let iterator_handle = SetOf__Float_iterator(handle)
    while SetOf__Float_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf__Float_iterator_get(iterator_handle)))
        SetOf__Float_iterator_increment(iterator_handle)
    }
    SetOf__Float_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Float> {
    defer {
        SetOf__Float_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Float>) -> RefHolder {
    let handle = SetOf__Float_create_handle()
    for item in swiftSet {
        SetOf__Float_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Float>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf__Float_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Float>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf__Float_create_optional_handle()
    let handle = SetOf__Float_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf__Float_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Float>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf__Float_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Float>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf__Float_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Float>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Float>? {
    defer {
        SetOf__Float_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
    var result: Set<GenericTypesWithCompoundTypes.ExternalEnum> = []
    let iterator_handle = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle)
    while SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(iterator_handle)))
        SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(iterator_handle)
    }
    SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
    defer {
        SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>) -> RefHolder {
    let handle = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle()
    for item in swiftSet {
        SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle()
    let handle = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<GenericTypesWithCompoundTypes.ExternalEnum>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<GenericTypesWithCompoundTypes.ExternalEnum>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum>? {
    defer {
        SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum> {
    var result: Set<GenericTypesWithCompoundTypes.SomeEnum> = []
    let iterator_handle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle)
    while SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(iterator_handle)))
        SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(iterator_handle)
    }
    SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum> {
    defer {
        SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> RefHolder {
    let handle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle()
    for item in swiftSet {
        SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle)
}
internal func copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle()
    let handle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<GenericTypesWithCompoundTypes.SomeEnum>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<GenericTypesWithCompoundTypes.SomeEnum>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum>? {
    defer {
        SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Int32> {
    var result: Set<Int32> = []
    let iterator_handle = SetOf__Int_iterator(handle)
    while SetOf__Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf__Int_iterator_get(iterator_handle)))
        SetOf__Int_iterator_increment(iterator_handle)
    }
    SetOf__Int_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Int32> {
    defer {
        SetOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    let handle = SetOf__Int_create_handle()
    for item in swiftSet {
        SetOf__Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf__Int_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Int32>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf__Int_create_optional_handle()
    let handle = SetOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf__Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Int32>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Int32>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Int32>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Int32>? {
    defer {
        SetOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<String> {
    var result: Set<String> = []
    let iterator_handle = SetOf__String_iterator(handle)
    while SetOf__String_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf__String_iterator_get(iterator_handle)))
        SetOf__String_iterator_increment(iterator_handle)
    }
    SetOf__String_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<String> {
    defer {
        SetOf__String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<String>) -> RefHolder {
    let handle = SetOf__String_create_handle()
    for item in swiftSet {
        SetOf__String_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<String>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf__String_release_handle)
}
internal func copyToCType(_ swiftSet: Set<String>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf__String_create_optional_handle()
    let handle = SetOf__String_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf__String_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<String>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf__String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<String>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf__String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<String>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<String>? {
    defer {
        SetOf__String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<UInt8> {
    var result: Set<UInt8> = []
    let iterator_handle = SetOf__UByte_iterator(handle)
    while SetOf__UByte_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf__UByte_iterator_get(iterator_handle)))
        SetOf__UByte_iterator_increment(iterator_handle)
    }
    SetOf__UByte_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<UInt8> {
    defer {
        SetOf__UByte_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<UInt8>) -> RefHolder {
    let handle = SetOf__UByte_create_handle()
    for item in swiftSet {
        SetOf__UByte_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<UInt8>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf__UByte_release_handle)
}
internal func copyToCType(_ swiftSet: Set<UInt8>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf__UByte_create_optional_handle()
    let handle = SetOf__UByte_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf__UByte_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<UInt8>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf__UByte_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<UInt8>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf__UByte_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<UInt8>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<UInt8>? {
    defer {
        SetOf__UByte_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]> {
    var result: Set<[Int32: Bool]> = []
    let iterator_handle = SetOf_MapOf__Int_To__Boolean_iterator(handle)
    while SetOf_MapOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_MapOf__Int_To__Boolean_iterator_get(iterator_handle)))
        SetOf_MapOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    SetOf_MapOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]> {
    defer {
        SetOf_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32: Bool]>) -> RefHolder {
    let handle = SetOf_MapOf__Int_To__Boolean_create_handle()
    for item in swiftSet {
        SetOf_MapOf__Int_To__Boolean_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<[Int32: Bool]>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_MapOf__Int_To__Boolean_release_handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32: Bool]>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = SetOf_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_MapOf__Int_To__Boolean_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<[Int32: Bool]>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<[Int32: Bool]>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]>? {
    defer {
        SetOf_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Set<Int32>> {
    var result: Set<Set<Int32>> = []
    let iterator_handle = SetOf_SetOf__Int_iterator(handle)
    while SetOf_SetOf__Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_SetOf__Int_iterator_get(iterator_handle)))
        SetOf_SetOf__Int_iterator_increment(iterator_handle)
    }
    SetOf_SetOf__Int_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Set<Int32>> {
    defer {
        SetOf_SetOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Set<Int32>>) -> RefHolder {
    let handle = SetOf_SetOf__Int_create_handle()
    for item in swiftSet {
        SetOf_SetOf__Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Set<Int32>>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_SetOf__Int_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Set<Int32>>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_SetOf__Int_create_optional_handle()
    let handle = SetOf_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_SetOf__Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Set<Int32>>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_SetOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Set<Int32>>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_SetOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Set<Int32>>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Set<Int32>>? {
    defer {
        SetOf_SetOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32]> {
    var result: Set<[Int32]> = []
    let iterator_handle = SetOf_ArrayOf__Int_iterator(handle)
    while SetOf_ArrayOf__Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(SetOf_ArrayOf__Int_iterator_get(iterator_handle)))
        SetOf_ArrayOf__Int_iterator_increment(iterator_handle)
    }
    SetOf_ArrayOf__Int_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32]> {
    defer {
        SetOf_ArrayOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32]>) -> RefHolder {
    let handle = SetOf_ArrayOf__Int_create_handle()
    for item in swiftSet {
        SetOf_ArrayOf__Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<[Int32]>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: SetOf_ArrayOf__Int_release_handle)
}
internal func copyToCType(_ swiftSet: Set<[Int32]>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = SetOf_ArrayOf__Int_create_optional_handle()
    let handle = SetOf_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        SetOf_ArrayOf__Int_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<[Int32]>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: SetOf_ArrayOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<[Int32]>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = SetOf_ArrayOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<[Int32]>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<[Int32]>? {
    defer {
        SetOf_ArrayOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}