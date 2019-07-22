//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> Set<Int32> {
    var result: Set<Int32> = []
    let iterator_handle = smoke_SetType_IntSet_iterator(handle)
    while smoke_SetType_IntSet_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(smoke_SetType_IntSet_iterator_get(iterator_handle)))
        smoke_SetType_IntSet_iterator_increment(iterator_handle)
    }
    smoke_SetType_IntSet_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Int32> {
    defer {
        smoke_SetType_IntSet_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    let handle = smoke_SetType_IntSet_create_handle()
    for item in swiftSet {
        smoke_SetType_IntSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<Int32>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: smoke_SetType_IntSet_release_handle)
}
internal func copyToCType(_ swiftSet: Set<Int32>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_SetType_IntSet_create_optional_handle()
    let handle = smoke_SetType_IntSet_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        smoke_SetType_IntSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<Int32>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SetType_IntSet_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<Int32>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SetType_IntSet_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<Int32>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<Int32>? {
    defer {
        smoke_SetType_IntSet_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<String> {
    var result: Set<String> = []
    let iterator_handle = smoke_SetType_StringSet_iterator(handle)
    while smoke_SetType_StringSet_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(smoke_SetType_StringSet_iterator_get(iterator_handle)))
        smoke_SetType_StringSet_iterator_increment(iterator_handle)
    }
    smoke_SetType_StringSet_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<String> {
    defer {
        smoke_SetType_StringSet_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<String>) -> RefHolder {
    let handle = smoke_SetType_StringSet_create_handle()
    for item in swiftSet {
        smoke_SetType_StringSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<String>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: smoke_SetType_StringSet_release_handle)
}
internal func copyToCType(_ swiftSet: Set<String>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_SetType_StringSet_create_optional_handle()
    let handle = smoke_SetType_StringSet_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        smoke_SetType_StringSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<String>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SetType_StringSet_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<String>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SetType_StringSet_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<String>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<String>? {
    defer {
        smoke_SetType_StringSet_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<SetType.SomeEnum> {
    var result: Set<SetType.SomeEnum> = []
    let iterator_handle = smoke_SetType_EnumSet_iterator(handle)
    while smoke_SetType_EnumSet_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(smoke_SetType_EnumSet_iterator_get(iterator_handle)))
        smoke_SetType_EnumSet_iterator_increment(iterator_handle)
    }
    smoke_SetType_EnumSet_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<SetType.SomeEnum> {
    defer {
        smoke_SetType_EnumSet_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<SetType.SomeEnum>) -> RefHolder {
    let handle = smoke_SetType_EnumSet_create_handle()
    for item in swiftSet {
        smoke_SetType_EnumSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<SetType.SomeEnum>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: smoke_SetType_EnumSet_release_handle)
}
internal func copyToCType(_ swiftSet: Set<SetType.SomeEnum>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_SetType_EnumSet_create_optional_handle()
    let handle = smoke_SetType_EnumSet_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        smoke_SetType_EnumSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<SetType.SomeEnum>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SetType_EnumSet_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<SetType.SomeEnum>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SetType_EnumSet_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<SetType.SomeEnum>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<SetType.SomeEnum>? {
    defer {
        smoke_SetType_EnumSet_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<SetType.EquatableStruct> {
    var result: Set<SetType.EquatableStruct> = []
    let iterator_handle = smoke_SetType_StructSet_iterator(handle)
    while smoke_SetType_StructSet_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(smoke_SetType_StructSet_iterator_get(iterator_handle)))
        smoke_SetType_StructSet_iterator_increment(iterator_handle)
    }
    smoke_SetType_StructSet_iterator_release_handle(iterator_handle)
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> Set<SetType.EquatableStruct> {
    defer {
        smoke_SetType_StructSet_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftSet: Set<SetType.EquatableStruct>) -> RefHolder {
    let handle = smoke_SetType_StructSet_create_handle()
    for item in swiftSet {
        smoke_SetType_StructSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftSet: Set<SetType.EquatableStruct>) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftSet).ref, release: smoke_SetType_StructSet_release_handle)
}
internal func copyToCType(_ swiftSet: Set<SetType.EquatableStruct>?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_SetType_StructSet_create_optional_handle()
    let handle = smoke_SetType_StructSet_unwrap_optional_handle(optionalHandle)
    for item in swiftSet {
        smoke_SetType_StructSet_insert(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: Set<SetType.EquatableStruct>?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SetType_StructSet_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Set<SetType.EquatableStruct>? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SetType_StructSet_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Set<SetType.EquatableStruct>
}
internal func moveFromCType(_ handle: _baseRef) -> Set<SetType.EquatableStruct>? {
    defer {
        smoke_SetType_StructSet_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}