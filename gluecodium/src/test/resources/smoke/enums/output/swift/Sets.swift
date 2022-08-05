//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> EnumOptionSet {
    var result: EnumOptionSet = []
    let iterator_handle = foobar_SetOf_smoke_EnumOptionSet_iterator(handle)
    while foobar_SetOf_smoke_EnumOptionSet_iterator_is_valid(handle, iterator_handle) {
        result.insert(copyFromCType(foobar_SetOf_smoke_EnumOptionSet_iterator_get(iterator_handle)))
        foobar_SetOf_smoke_EnumOptionSet_iterator_increment(iterator_handle)
    }
    foobar_SetOf_smoke_EnumOptionSet_iterator_release_handle(iterator_handle)
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> EnumOptionSet {
    defer {
        foobar_SetOf_smoke_EnumOptionSet_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftSet: EnumOptionSet) -> RefHolder {
    let handle = foobar_SetOf_smoke_EnumOptionSet_create_handle()
    for item in EnumOptionSet.allCases.filter({ swiftSet.contains($0) }) {
        let _item = moveToCType(item)
        foobar_SetOf_smoke_EnumOptionSet_insert(handle, _item.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftSet: EnumOptionSet) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftSet).ref, release: foobar_SetOf_smoke_EnumOptionSet_release_handle)
}
internal func foobar_copyToCType(_ swiftSet: EnumOptionSet?) -> RefHolder {
    guard let swiftSet = swiftSet else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_SetOf_smoke_EnumOptionSet_create_optional_handle()
    let handle = foobar_SetOf_smoke_EnumOptionSet_unwrap_optional_handle(optionalHandle)
    for item in EnumOptionSet.allCases.filter({ swiftSet.contains($0) }) {
        let _item = moveToCType(item)
        foobar_SetOf_smoke_EnumOptionSet_insert(handle, _item.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: EnumOptionSet?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_SetOf_smoke_EnumOptionSet_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> EnumOptionSet? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_SetOf_smoke_EnumOptionSet_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as EnumOptionSet
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> EnumOptionSet? {
    defer {
        foobar_SetOf_smoke_EnumOptionSet_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
