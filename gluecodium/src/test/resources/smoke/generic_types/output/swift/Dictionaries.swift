import Foundation
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Float: Double] {
    var swiftDict: [Float: Double] = [:]
    let iterator_handle = foobar_MapOf__Float_To__Double_iterator(handle)
    while foobar_MapOf__Float_To__Double_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Float_To__Double_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__Float_To__Double_iterator_value(iterator_handle)) as Double
        foobar_MapOf__Float_To__Double_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Float_To__Double_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Float: Double] {
    defer {
        foobar_MapOf__Float_To__Double_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Float: Double]) -> RefHolder {
    let c_handle = foobar_MapOf__Float_To__Double_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Float_To__Double_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Float: Double]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Float_To__Double_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Float: Double]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Float_To__Double_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Float: Double]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Float: Double]? {
    defer {
        foobar_MapOf__Float_To__Double_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Float: Double]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Float_To__Double_create_optional_handle()
    let handle = foobar_MapOf__Float_To__Double_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Float_To__Double_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Float: Double]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Float_To__Double_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
    var swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool] = [:]
    let iterator_handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator(handle)
    while foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_value(iterator_handle)) as Bool
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
    defer {
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]) -> RefHolder {
    let c_handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalEnum: Bool]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool]? {
    defer {
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool] {
    var swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool] = [:]
    let iterator_handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator(handle)
    while foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_value(iterator_handle)) as Bool
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool] {
    defer {
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> RefHolder {
    let c_handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.SomeEnum: Bool]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool]? {
    defer {
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.SomeEnum: Bool]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: Bool] {
    var swiftDict: [Int32: Bool] = [:]
    let iterator_handle = foobar_MapOf__Int_To__Boolean_iterator(handle)
    while foobar_MapOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__Int_To__Boolean_iterator_value(iterator_handle)) as Bool
        foobar_MapOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: Bool] {
    defer {
        foobar_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: Bool]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: Bool]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: Bool]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: Bool]? {
    defer {
        foobar_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: Bool]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: DummyClass] {
    var swiftDict: [Int32: DummyClass] = [:]
    let iterator_handle = foobar_MapOf__Int_To_smoke_DummyClass_iterator(handle)
    while foobar_MapOf__Int_To_smoke_DummyClass_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_smoke_DummyClass_iterator_key(iterator_handle))] =
            DummyClass_moveFromCType(foobar_MapOf__Int_To_smoke_DummyClass_iterator_value(iterator_handle)) as DummyClass
        foobar_MapOf__Int_To_smoke_DummyClass_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_smoke_DummyClass_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: DummyClass] {
    defer {
        foobar_MapOf__Int_To_smoke_DummyClass_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: DummyClass]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_smoke_DummyClass_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_DummyClass_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: DummyClass]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_smoke_DummyClass_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: DummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_smoke_DummyClass_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: DummyClass]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: DummyClass]? {
    defer {
        foobar_MapOf__Int_To_smoke_DummyClass_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: DummyClass]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_smoke_DummyClass_create_optional_handle()
    let handle = foobar_MapOf__Int_To_smoke_DummyClass_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_DummyClass_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: DummyClass]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_smoke_DummyClass_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: DummyInterface] {
    var swiftDict: [Int32: DummyInterface] = [:]
    let iterator_handle = foobar_MapOf__Int_To_smoke_DummyInterface_iterator(handle)
    while foobar_MapOf__Int_To_smoke_DummyInterface_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_smoke_DummyInterface_iterator_key(iterator_handle))] =
            DummyInterface_moveFromCType(foobar_MapOf__Int_To_smoke_DummyInterface_iterator_value(iterator_handle)) as DummyInterface
        foobar_MapOf__Int_To_smoke_DummyInterface_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_smoke_DummyInterface_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: DummyInterface] {
    defer {
        foobar_MapOf__Int_To_smoke_DummyInterface_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: DummyInterface]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_smoke_DummyInterface_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_DummyInterface_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: DummyInterface]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_smoke_DummyInterface_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: DummyInterface]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_smoke_DummyInterface_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: DummyInterface]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: DummyInterface]? {
    defer {
        foobar_MapOf__Int_To_smoke_DummyInterface_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: DummyInterface]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_smoke_DummyInterface_create_optional_handle()
    let handle = foobar_MapOf__Int_To_smoke_DummyInterface_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_DummyInterface_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: DummyInterface]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_smoke_DummyInterface_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
    var swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum] = [:]
    let iterator_handle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle)
    while foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.ExternalEnum
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
    defer {
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: GenericTypesWithCompoundTypes.ExternalEnum]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum]? {
    defer {
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle()
    let handle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum] {
    var swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum] = [:]
    let iterator_handle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle)
    while foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.SomeEnum
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum] {
    defer {
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: GenericTypesWithCompoundTypes.SomeEnum]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum]? {
    defer {
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle()
    let handle = foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>] {
    var swiftDict: [Int32: Set<Int32>] = [:]
    let iterator_handle = foobar_MapOf__Int_To_foobar_SetOf__Int_iterator(handle)
    while foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_key(iterator_handle))] =
            foobar_moveFromCType(foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_value(iterator_handle)) as Set<Int32>
        foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_foobar_SetOf__Int_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>] {
    defer {
        foobar_MapOf__Int_To_foobar_SetOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: Set<Int32>]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_foobar_SetOf__Int_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf__Int_To_foobar_SetOf__Int_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: Set<Int32>]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_foobar_SetOf__Int_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_foobar_SetOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: Set<Int32>]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>]? {
    defer {
        foobar_MapOf__Int_To_foobar_SetOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: Set<Int32>]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_foobar_SetOf__Int_create_optional_handle()
    let handle = foobar_MapOf__Int_To_foobar_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf__Int_To_foobar_SetOf__Int_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: Set<Int32>]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_foobar_SetOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]] {
    var swiftDict: [Int32: [Int32: Bool]] = [:]
    let iterator_handle = foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator(handle)
    while foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            foobar_moveFromCType(foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_value(iterator_handle)) as [Int32: Bool]
        foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]] {
    defer {
        foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: [Int32: Bool]]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: [Int32: Bool]]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: [Int32: Bool]]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]]? {
    defer {
        foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: [Int32: Bool]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: [Int32: Bool]]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_foobar_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: [Int32]] {
    var swiftDict: [Int32: [Int32]] = [:]
    let iterator_handle = foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator(handle)
    while foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_key(iterator_handle))] =
            foobar_moveFromCType(foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_value(iterator_handle)) as [Int32]
        foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_increment(iterator_handle)
    }
    foobar_MapOf__Int_To_foobar_ArrayOf__Int_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: [Int32]] {
    defer {
        foobar_MapOf__Int_To_foobar_ArrayOf__Int_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: [Int32]]) -> RefHolder {
    let c_handle = foobar_MapOf__Int_To_foobar_ArrayOf__Int_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf__Int_To_foobar_ArrayOf__Int_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Int32: [Int32]]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__Int_To_foobar_ArrayOf__Int_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Int32: [Int32]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__Int_To_foobar_ArrayOf__Int_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Int32: [Int32]]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Int32: [Int32]]? {
    defer {
        foobar_MapOf__Int_To_foobar_ArrayOf__Int_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Int32: [Int32]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__Int_To_foobar_ArrayOf__Int_create_optional_handle()
    let handle = foobar_MapOf__Int_To_foobar_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = foobar_moveToCType(value)
        foobar_MapOf__Int_To_foobar_ArrayOf__Int_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Int32: [Int32]]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__Int_To_foobar_ArrayOf__Int_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool] {
    var swiftDict: [Set<Int32>: Bool] = [:]
    let iterator_handle = foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator(handle)
    while foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[foobar_moveFromCType(foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_value(iterator_handle)) as Bool
        foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf_foobar_SetOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool] {
    defer {
        foobar_MapOf_foobar_SetOf__Int_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Set<Int32>: Bool]) -> RefHolder {
    let c_handle = foobar_MapOf_foobar_SetOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_foobar_SetOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [Set<Int32>: Bool]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_foobar_SetOf__Int_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_foobar_SetOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [Set<Int32>: Bool]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool]? {
    defer {
        foobar_MapOf_foobar_SetOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [Set<Int32>: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_foobar_SetOf__Int_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf_foobar_SetOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_foobar_SetOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [Set<Int32>: Bool]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_foobar_SetOf__Int_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct] {
    var swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct] = [:]
    let iterator_handle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(handle)
    while foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.BasicStruct
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(iterator_handle)
    }
    foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct] {
    defer {
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    let c_handle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [String: GenericTypesWithCompoundTypes.BasicStruct]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct]? {
    defer {
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle()
    let handle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [String: GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
    var swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct] = [:]
    let iterator_handle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(handle)
    while foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.ExternalStruct
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(iterator_handle)
    }
    foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
    defer {
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    let c_handle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [String: GenericTypesWithCompoundTypes.ExternalStruct]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct]? {
    defer {
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle()
    let handle = foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [String: GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String: String] {
    var swiftDict: [String: String] = [:]
    let iterator_handle = foobar_MapOf__String_To__String_iterator(handle)
    while foobar_MapOf__String_To__String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__String_To__String_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__String_To__String_iterator_value(iterator_handle)) as String
        foobar_MapOf__String_To__String_iterator_increment(iterator_handle)
    }
    foobar_MapOf__String_To__String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String: String] {
    defer {
        foobar_MapOf__String_To__String_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [String: String]) -> RefHolder {
    let c_handle = foobar_MapOf__String_To__String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To__String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [String: String]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__String_To__String_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [String: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__String_To__String_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [String: String]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [String: String]? {
    defer {
        foobar_MapOf__String_To__String_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [String: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__String_To__String_create_optional_handle()
    let handle = foobar_MapOf__String_To__String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__String_To__String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [String: String]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__String_To__String_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [UInt8: String] {
    var swiftDict: [UInt8: String] = [:]
    let iterator_handle = foobar_MapOf__UByte_To__String_iterator(handle)
    while foobar_MapOf__UByte_To__String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(foobar_MapOf__UByte_To__String_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf__UByte_To__String_iterator_value(iterator_handle)) as String
        foobar_MapOf__UByte_To__String_iterator_increment(iterator_handle)
    }
    foobar_MapOf__UByte_To__String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [UInt8: String] {
    defer {
        foobar_MapOf__UByte_To__String_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [UInt8: String]) -> RefHolder {
    let c_handle = foobar_MapOf__UByte_To__String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__UByte_To__String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [UInt8: String]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf__UByte_To__String_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [UInt8: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf__UByte_To__String_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [UInt8: String]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [UInt8: String]? {
    defer {
        foobar_MapOf__UByte_To__String_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [UInt8: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf__UByte_To__String_create_optional_handle()
    let handle = foobar_MapOf__UByte_To__String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf__UByte_To__String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [UInt8: String]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf__UByte_To__String_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool] {
    var swiftDict: [[Int32: Bool]: Bool] = [:]
    let iterator_handle = foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator(handle)
    while foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[foobar_moveFromCType(foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_value(iterator_handle)) as Bool
        foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool] {
    defer {
        foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [[Int32: Bool]: Bool]) -> RefHolder {
    let c_handle = foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [[Int32: Bool]: Bool]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [[Int32: Bool]: Bool]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool]? {
    defer {
        foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [[Int32: Bool]: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [[Int32: Bool]: Bool]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_foobar_MapOf__Int_To__Boolean_To__Boolean_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32]: Bool] {
    var swiftDict: [[Int32]: Bool] = [:]
    let iterator_handle = foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator(handle)
    while foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[foobar_moveFromCType(foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_value(iterator_handle)) as Bool
        foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32]: Bool] {
    defer {
        foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [[Int32]: Bool]) -> RefHolder {
    let c_handle = foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func foobar_moveToCType(_ swiftDict: [[Int32]: Bool]) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftDict).ref, release: foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> [[Int32]: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return foobar_copyFromCType(unwrappedHandle) as [[Int32]: Bool]
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> [[Int32]: Bool]? {
    defer {
        foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftDict: [[Int32]: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_create_optional_handle()
    let handle = foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = foobar_moveToCType(key)
        let c_value = moveToCType(value)
        foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func foobar_moveToCType(_ swiftType: [[Int32]: Bool]?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: foobar_MapOf_foobar_ArrayOf__Int_To__Boolean_release_optional_handle)
}
