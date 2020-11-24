//
//
import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> [AnotherDummyClass] {
    var result: [AnotherDummyClass] = []
    let count = foobar_ArrayOf_smoke_AnotherDummyClass_count(handle)
    for idx in 0..<count {
        result.append(AnotherDummyClass_copyFromCType(foobar_ArrayOf_smoke_AnotherDummyClass_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [AnotherDummyClass] {
    defer {
        foobar_ArrayOf_smoke_AnotherDummyClass_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [AnotherDummyClass]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_AnotherDummyClass_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_AnotherDummyClass_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [AnotherDummyClass]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_AnotherDummyClass_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [AnotherDummyClass]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_AnotherDummyClass_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_AnotherDummyClass_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_AnotherDummyClass_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [AnotherDummyClass]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_AnotherDummyClass_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [AnotherDummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_AnotherDummyClass_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [AnotherDummyClass]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [AnotherDummyClass]? {
    defer {
        foobar_ArrayOf_smoke_AnotherDummyClass_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [AuxStruct] {
    var result: [AuxStruct] = []
    let count = foobar_ArrayOf_smoke_AuxStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_smoke_AuxStruct_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [AuxStruct] {
    defer {
        foobar_ArrayOf_smoke_AuxStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [AuxStruct]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_AuxStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_AuxStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [AuxStruct]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_AuxStruct_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [AuxStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_AuxStruct_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_AuxStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_AuxStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [AuxStruct]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_AuxStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [AuxStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_AuxStruct_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [AuxStruct]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [AuxStruct]? {
    defer {
        foobar_ArrayOf_smoke_AuxStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [DummyClass] {
    var result: [DummyClass] = []
    let count = foobar_ArrayOf_smoke_DummyClass_count(handle)
    for idx in 0..<count {
        result.append(DummyClass_copyFromCType(foobar_ArrayOf_smoke_DummyClass_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [DummyClass] {
    defer {
        foobar_ArrayOf_smoke_DummyClass_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [DummyClass]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_DummyClass_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_DummyClass_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [DummyClass]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_DummyClass_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [DummyClass]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_DummyClass_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_DummyClass_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_DummyClass_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [DummyClass]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_DummyClass_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [DummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_DummyClass_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [DummyClass]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [DummyClass]? {
    defer {
        foobar_ArrayOf_smoke_DummyClass_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [DummyInterface] {
    var result: [DummyInterface] = []
    let count = foobar_ArrayOf_smoke_DummyInterface_count(handle)
    for idx in 0..<count {
        result.append(DummyInterface_copyFromCType(foobar_ArrayOf_smoke_DummyInterface_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [DummyInterface] {
    defer {
        foobar_ArrayOf_smoke_DummyInterface_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [DummyInterface]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_DummyInterface_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_DummyInterface_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [DummyInterface]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_DummyInterface_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [DummyInterface]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_DummyInterface_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_DummyInterface_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_DummyInterface_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [DummyInterface]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_DummyInterface_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [DummyInterface]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_DummyInterface_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [DummyInterface]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [DummyInterface]? {
    defer {
        foobar_ArrayOf_smoke_DummyInterface_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Float] {
    var result: [Float] = []
    let count = foobar_ArrayOf__Float_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Float_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Float] {
    defer {
        foobar_ArrayOf__Float_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [Float]) -> RefHolder {
    let handle = foobar_ArrayOf__Float_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf__Float_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [Float]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf__Float_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [Float]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Float_create_optional_handle()
    let handle = foobar_ArrayOf__Float_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf__Float_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Float]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf__Float_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Float]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Float_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Float]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Float]? {
    defer {
        foobar_ArrayOf__Float_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct] {
    var result: [GenericTypesWithCompoundTypes.BasicStruct] = []
    let count = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct] {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.BasicStruct]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct]? {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum] {
    var result: [GenericTypesWithCompoundTypes.ExternalEnum] = []
    let count = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum] {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalEnum]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum]? {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct] {
    var result: [GenericTypesWithCompoundTypes.ExternalStruct] = []
    let count = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct] {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalStruct]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct]? {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum] {
    var result: [GenericTypesWithCompoundTypes.SomeEnum] = []
    let count = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum] {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.SomeEnum]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum]? {
    defer {
        foobar_ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32] {
    var result: [Int32] = []
    let count = foobar_ArrayOf__Int_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__Int_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32] {
    defer {
        foobar_ArrayOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [Int32]) -> RefHolder {
    let handle = foobar_ArrayOf__Int_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf__Int_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [Int32]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf__Int_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [Int32]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__Int_create_optional_handle()
    let handle = foobar_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf__Int_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32]? {
    defer {
        foobar_ArrayOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Set<Int32>] {
    var result: [Set<Int32>] = []
    let count = foobar_ArrayOf_foobar_SetOf__Int_count(handle)
    for idx in 0..<count {
        result.append(foobar_copyFromCType(foobar_ArrayOf_foobar_SetOf__Int_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Set<Int32>] {
    defer {
        foobar_ArrayOf_foobar_SetOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [Set<Int32>]) -> RefHolder {
    let handle = foobar_ArrayOf_foobar_SetOf__Int_create_handle()
    for item in swiftArray {
        let value = foobar_moveToCType(item)
        foobar_ArrayOf_foobar_SetOf__Int_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [Set<Int32>]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_foobar_SetOf__Int_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [Set<Int32>]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_foobar_SetOf__Int_create_optional_handle()
    let handle = foobar_ArrayOf_foobar_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_foobar_SetOf__Int_append(handle, foobar_moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Set<Int32>]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_foobar_SetOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Set<Int32>]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_foobar_SetOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Set<Int32>]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Set<Int32>]? {
    defer {
        foobar_ArrayOf_foobar_SetOf__Int_release_optional_handle(handle)
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
        let value = moveToCType(item)
        foobar_ArrayOf__String_append(handle, value.ref)
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
        foobar_ArrayOf__String_append(handle, moveToCType(item).ref)
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
internal func foobar_copyFromCType(_ handle: _baseRef) -> [UInt8] {
    var result: [UInt8] = []
    let count = foobar_ArrayOf__UByte_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(foobar_ArrayOf__UByte_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [UInt8] {
    defer {
        foobar_ArrayOf__UByte_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [UInt8]) -> RefHolder {
    let handle = foobar_ArrayOf__UByte_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf__UByte_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [UInt8]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf__UByte_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [UInt8]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf__UByte_create_optional_handle()
    let handle = foobar_ArrayOf__UByte_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf__UByte_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [UInt8]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf__UByte_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [UInt8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf__UByte_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [UInt8]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [UInt8]? {
    defer {
        foobar_ArrayOf__UByte_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [YetAnotherDummyClass] {
    var result: [YetAnotherDummyClass] = []
    let count = foobar_ArrayOf_smoke_YetAnotherDummyClass_count(handle)
    for idx in 0..<count {
        result.append(YetAnotherDummyClass_copyFromCType(foobar_ArrayOf_smoke_YetAnotherDummyClass_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [YetAnotherDummyClass] {
    defer {
        foobar_ArrayOf_smoke_YetAnotherDummyClass_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [YetAnotherDummyClass]) -> RefHolder {
    let handle = foobar_ArrayOf_smoke_YetAnotherDummyClass_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        foobar_ArrayOf_smoke_YetAnotherDummyClass_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [YetAnotherDummyClass]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_smoke_YetAnotherDummyClass_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [YetAnotherDummyClass]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_smoke_YetAnotherDummyClass_create_optional_handle()
    let handle = foobar_ArrayOf_smoke_YetAnotherDummyClass_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_smoke_YetAnotherDummyClass_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [YetAnotherDummyClass]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_smoke_YetAnotherDummyClass_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [YetAnotherDummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_smoke_YetAnotherDummyClass_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [YetAnotherDummyClass]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [YetAnotherDummyClass]? {
    defer {
        foobar_ArrayOf_smoke_YetAnotherDummyClass_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]] {
    var result: [[Int32: Bool]] = []
    let count = foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_count(handle)
    for idx in 0..<count {
        result.append(foobar_copyFromCType(foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]] {
    defer {
        foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [[Int32: Bool]]) -> RefHolder {
    let handle = foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_create_handle()
    for item in swiftArray {
        let value = foobar_moveToCType(item)
        foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [[Int32: Bool]]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [[Int32: Bool]]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_append(handle, foobar_moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [[Int32: Bool]]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [[Int32: Bool]]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]]? {
    defer {
        foobar_ArrayOf_foobar_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32]] {
    var result: [[Int32]] = []
    let count = foobar_ArrayOf_foobar_ArrayOf__Int_count(handle)
    for idx in 0..<count {
        result.append(foobar_copyFromCType(foobar_ArrayOf_foobar_ArrayOf__Int_get(handle, idx)))
    }
    return result
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32]] {
    defer {
        foobar_ArrayOf_foobar_ArrayOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftArray: [[Int32]]) -> RefHolder {
    let handle = foobar_ArrayOf_foobar_ArrayOf__Int_create_handle()
    for item in swiftArray {
        let value = foobar_moveToCType(item)
        foobar_ArrayOf_foobar_ArrayOf__Int_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftArray: [[Int32]]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftArray).ref, release: foobar_ArrayOf_foobar_ArrayOf__Int_release_handle)
}
internal func foobar_copyToCType(_ swiftArray: [[Int32]]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_ArrayOf_foobar_ArrayOf__Int_create_optional_handle()
    let handle = foobar_ArrayOf_foobar_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        foobar_ArrayOf_foobar_ArrayOf__Int_append(handle, foobar_moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [[Int32]]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_ArrayOf_foobar_ArrayOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_ArrayOf_foobar_ArrayOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [[Int32]]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32]]? {
    defer {
        foobar_ArrayOf_foobar_ArrayOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
