//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<Float> {
    var result: Set<Float> = []
    let iterator_handle = foobar_SetOf__Float_iterator(handle)
    while foobar_SetOf__Float_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf__Float_iterator_get(iterator_handle)))
        foobar_SetOf__Float_iterator_increment(iterator_handle)
    }
    foobar_SetOf__Float_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<Float> {
    defer {
        foobar_SetOf__Float_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<Float>) -> RefHolder {
    let handle = foobar_SetOf__Float_create_handle()
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Float_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<Float>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf__Float_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<Float>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf__Float_create_optional_handle()
    let handle = foobar_SetOf__Float_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Float_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<Float>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf__Float_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<Float>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf__Float_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<Float>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<Float>? {
    defer {
        foobar_SetOf__Float_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
    var result: Set<GenericTypesWithCompoundTypes.ExternalEnum> = []
    let iterator_handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle)
    while foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, iterator_handle) {
        result.insert(foobar_copyFromCType(foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(iterator_handle)))
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(iterator_handle)
    }
    foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
    defer {
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>) -> RefHolder {
    let handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle()
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.ExternalEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle()
    let handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<GenericTypesWithCompoundTypes.ExternalEnum>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<GenericTypesWithCompoundTypes.ExternalEnum>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.ExternalEnum>? {
    defer {
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum> {
    var result: Set<GenericTypesWithCompoundTypes.SomeEnum> = []
    let iterator_handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle)
    while foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, iterator_handle) {
        result.insert(foobar_copyFromCType(foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(iterator_handle)))
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(iterator_handle)
    }
    foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum> {
    defer {
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> RefHolder {
    let handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle()
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<GenericTypesWithCompoundTypes.SomeEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle()
    let handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<GenericTypesWithCompoundTypes.SomeEnum>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<GenericTypesWithCompoundTypes.SomeEnum>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<GenericTypesWithCompoundTypes.SomeEnum>? {
    defer {
        foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<Int32> {
    var result: Set<Int32> = []
    let iterator_handle = foobar_SetOf__Int_iterator(handle)
    while foobar_SetOf__Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf__Int_iterator_get(iterator_handle)))
        foobar_SetOf__Int_iterator_increment(iterator_handle)
    }
    foobar_SetOf__Int_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<Int32> {
    defer {
        foobar_SetOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    let handle = foobar_SetOf__Int_create_handle()
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Int_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf__Int_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<Int32>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf__Int_create_optional_handle()
    let handle = foobar_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__Int_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<Int32>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<Int32>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<Int32>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<Int32>? {
    defer {
        foobar_SetOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<Set<Int32>> {
    var result: Set<Set<Int32>> = []
    let iterator_handle = foobar_SetOf_foobar_SetOf__Int_iterator(handle)
    while foobar_SetOf_foobar_SetOf__Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(foobar_copyFromCType(foobar_SetOf_foobar_SetOf__Int_iterator_get(iterator_handle)))
        foobar_SetOf_foobar_SetOf__Int_iterator_increment(iterator_handle)
    }
    foobar_SetOf_foobar_SetOf__Int_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<Set<Int32>> {
    defer {
        foobar_SetOf_foobar_SetOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<Set<Int32>>) -> RefHolder {
    let handle = foobar_SetOf_foobar_SetOf__Int_create_handle()
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_foobar_SetOf__Int_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<Set<Int32>>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_foobar_SetOf__Int_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<Set<Int32>>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_foobar_SetOf__Int_create_optional_handle()
    let handle = foobar_SetOf_foobar_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_foobar_SetOf__Int_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<Set<Int32>>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_foobar_SetOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<Set<Int32>>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_foobar_SetOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<Set<Int32>>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<Set<Int32>>? {
    defer {
        foobar_SetOf_foobar_SetOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<String> {
    var result: Set<String> = []
    let iterator_handle = foobar_SetOf__String_iterator(handle)
    while foobar_SetOf__String_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf__String_iterator_get(iterator_handle)))
        foobar_SetOf__String_iterator_increment(iterator_handle)
    }
    foobar_SetOf__String_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<String> {
    defer {
        foobar_SetOf__String_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<String>) -> RefHolder {
    let handle = foobar_SetOf__String_create_handle()
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__String_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<String>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf__String_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<String>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf__String_create_optional_handle()
    let handle = foobar_SetOf__String_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__String_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<String>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf__String_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<String>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf__String_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<String>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<String>? {
    defer {
        foobar_SetOf__String_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<UInt8> {
    var result: Set<UInt8> = []
    let iterator_handle = foobar_SetOf__UByte_iterator(handle)
    while foobar_SetOf__UByte_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf__UByte_iterator_get(iterator_handle)))
        foobar_SetOf__UByte_iterator_increment(iterator_handle)
    }
    foobar_SetOf__UByte_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<UInt8> {
    defer {
        foobar_SetOf__UByte_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<UInt8>) -> RefHolder {
    let handle = foobar_SetOf__UByte_create_handle()
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__UByte_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<UInt8>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf__UByte_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<UInt8>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf__UByte_create_optional_handle()
    let handle = foobar_SetOf__UByte_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = moveToCType(item)
        foobar_SetOf__UByte_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<UInt8>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf__UByte_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<UInt8>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf__UByte_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<UInt8>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<UInt8>? {
    defer {
        foobar_SetOf__UByte_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]> {
    var result: Set<[Int32: Bool]> = []
    let iterator_handle = foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator(handle)
    while foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        result.insert(foobar_copyFromCType(foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_get(iterator_handle)))
        foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_SetOf_foobar_MapOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]> {
    defer {
        foobar_SetOf_foobar_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<[Int32: Bool]>) -> RefHolder {
    let handle = foobar_SetOf_foobar_MapOf__Int_To__Boolean_create_handle()
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_foobar_MapOf__Int_To__Boolean_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<[Int32: Bool]>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_foobar_MapOf__Int_To__Boolean_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<[Int32: Bool]>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_foobar_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = foobar_SetOf_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_foobar_MapOf__Int_To__Boolean_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<[Int32: Bool]>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_foobar_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<[Int32: Bool]>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<[Int32: Bool]>? {
    defer {
        foobar_SetOf_foobar_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<[Int32]> {
    var result: Set<[Int32]> = []
    let iterator_handle = foobar_SetOf_foobar_ArrayOf__Int_iterator(handle)
    while foobar_SetOf_foobar_ArrayOf__Int_iterator_is_valid(handle, iterator_handle) {
        result.insert(foobar_copyFromCType(foobar_SetOf_foobar_ArrayOf__Int_iterator_get(iterator_handle)))
        foobar_SetOf_foobar_ArrayOf__Int_iterator_increment(iterator_handle)
    }
    foobar_SetOf_foobar_ArrayOf__Int_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<[Int32]> {
    defer {
        foobar_SetOf_foobar_ArrayOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<[Int32]>) -> RefHolder {
    let handle = foobar_SetOf_foobar_ArrayOf__Int_create_handle()
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_foobar_ArrayOf__Int_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: Set<[Int32]>) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_foobar_ArrayOf__Int_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: Set<[Int32]>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_foobar_ArrayOf__Int_create_optional_handle()
    let handle = foobar_SetOf_foobar_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        let _item = foobar_moveToCType(item)
        foobar_SetOf_foobar_ArrayOf__Int_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: Set<[Int32]>?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_foobar_ArrayOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Set<[Int32]>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_foobar_ArrayOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as Set<[Int32]>
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Set<[Int32]>? {
    defer {
        foobar_SetOf_foobar_ArrayOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
