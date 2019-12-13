import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [Float: Double] {
    var swiftDict: [Float: Double] = [:]
    let iterator_handle = MapOf__Float_To__Double_iterator(handle)
    while MapOf__Float_To__Double_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Float_To__Double_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Float_To__Double_iterator_value(iterator_handle)) as Double
        MapOf__Float_To__Double_iterator_increment(iterator_handle)
    }
    MapOf__Float_To__Double_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Float: Double] {
    defer {
        MapOf__Float_To__Double_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Float: Double]) -> RefHolder {
    let c_handle = MapOf__Float_To__Double_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Float_To__Double_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Float: Double]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Float_To__Double_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Float: Double]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Float_To__Double_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Float: Double]
}
internal func moveFromCType(_ handle: _baseRef) -> [Float: Double]? {
    defer {
        MapOf__Float_To__Double_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Float: Double]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Float_To__Double_create_optional_handle()
    let handle = MapOf__Float_To__Double_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Float_To__Double_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Float: Double]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Float_To__Double_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
    var swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool] = [:]
    let iterator_handle = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator(handle)
    while MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
    defer {
        MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]) -> RefHolder {
    let c_handle = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalEnum: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool]? {
    defer {
        MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_create_optional_handle()
    let handle = MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool] {
    var swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool] = [:]
    let iterator_handle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator(handle)
    while MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool] {
    defer {
        MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> RefHolder {
    let c_handle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.SomeEnum: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool]? {
    defer {
        MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_create_optional_handle()
    let handle = MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.SomeEnum: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Bool] {
    var swiftDict: [Int32: Bool] = [:]
    let iterator_handle = MapOf__Int_To__Boolean_iterator(handle)
    while MapOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Int_To__Boolean_iterator_value(iterator_handle)) as Bool
        MapOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Bool] {
    defer {
        MapOf__Int_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Bool]) -> RefHolder {
    let c_handle = MapOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Bool]? {
    defer {
        MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To__Boolean_create_optional_handle()
    let handle = MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyClass] {
    var swiftDict: [Int32: DummyClass] = [:]
    let iterator_handle = MapOf__Int_To_smoke_DummyClass_iterator(handle)
    while MapOf__Int_To_smoke_DummyClass_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_smoke_DummyClass_iterator_key(iterator_handle))] =
            DummyClass_moveFromCType(MapOf__Int_To_smoke_DummyClass_iterator_value(iterator_handle)) as DummyClass
        MapOf__Int_To_smoke_DummyClass_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_smoke_DummyClass_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyClass] {
    defer {
        MapOf__Int_To_smoke_DummyClass_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyClass]) -> RefHolder {
    let c_handle = MapOf__Int_To_smoke_DummyClass_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_DummyClass_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: DummyClass]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_smoke_DummyClass_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_smoke_DummyClass_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: DummyClass]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyClass]? {
    defer {
        MapOf__Int_To_smoke_DummyClass_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyClass]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_smoke_DummyClass_create_optional_handle()
    let handle = MapOf__Int_To_smoke_DummyClass_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_DummyClass_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: DummyClass]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_smoke_DummyClass_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyInterface] {
    var swiftDict: [Int32: DummyInterface] = [:]
    let iterator_handle = MapOf__Int_To_smoke_DummyInterface_iterator(handle)
    while MapOf__Int_To_smoke_DummyInterface_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_smoke_DummyInterface_iterator_key(iterator_handle))] =
            DummyInterface_moveFromCType(MapOf__Int_To_smoke_DummyInterface_iterator_value(iterator_handle)) as DummyInterface
        MapOf__Int_To_smoke_DummyInterface_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_smoke_DummyInterface_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyInterface] {
    defer {
        MapOf__Int_To_smoke_DummyInterface_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyInterface]) -> RefHolder {
    let c_handle = MapOf__Int_To_smoke_DummyInterface_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_DummyInterface_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: DummyInterface]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_smoke_DummyInterface_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyInterface]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_smoke_DummyInterface_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: DummyInterface]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyInterface]? {
    defer {
        MapOf__Int_To_smoke_DummyInterface_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyInterface]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_smoke_DummyInterface_create_optional_handle()
    let handle = MapOf__Int_To_smoke_DummyInterface_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_DummyInterface_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: DummyInterface]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_smoke_DummyInterface_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
    var swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum] = [:]
    let iterator_handle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle)
    while MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.ExternalEnum
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
    defer {
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    let c_handle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: GenericTypesWithCompoundTypes.ExternalEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum]? {
    defer {
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle()
    let handle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum] {
    var swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum] = [:]
    let iterator_handle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle)
    while MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.SomeEnum
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum] {
    defer {
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    let c_handle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: GenericTypesWithCompoundTypes.SomeEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum]? {
    defer {
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle()
    let handle = MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]] {
    var swiftDict: [Int32: [Int32: Bool]] = [:]
    let iterator_handle = MapOf__Int_To_MapOf__Int_To__Boolean_iterator(handle)
    while MapOf__Int_To_MapOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_MapOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Int_To_MapOf__Int_To__Boolean_iterator_value(iterator_handle)) as [Int32: Bool]
        MapOf__Int_To_MapOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_MapOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]] {
    defer {
        MapOf__Int_To_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32: Bool]]) -> RefHolder {
    let c_handle = MapOf__Int_To_MapOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_MapOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: [Int32: Bool]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_MapOf__Int_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: [Int32: Bool]]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]]? {
    defer {
        MapOf__Int_To_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32: Bool]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = MapOf__Int_To_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_MapOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: [Int32: Bool]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>] {
    var swiftDict: [Int32: Set<Int32>] = [:]
    let iterator_handle = MapOf__Int_To_SetOf__Int_iterator(handle)
    while MapOf__Int_To_SetOf__Int_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_SetOf__Int_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Int_To_SetOf__Int_iterator_value(iterator_handle)) as Set<Int32>
        MapOf__Int_To_SetOf__Int_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_SetOf__Int_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>] {
    defer {
        MapOf__Int_To_SetOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Set<Int32>]) -> RefHolder {
    let c_handle = MapOf__Int_To_SetOf__Int_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_SetOf__Int_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: Set<Int32>]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_SetOf__Int_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_SetOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: Set<Int32>]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>]? {
    defer {
        MapOf__Int_To_SetOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Set<Int32>]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_SetOf__Int_create_optional_handle()
    let handle = MapOf__Int_To_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_SetOf__Int_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: Set<Int32>]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_SetOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32]] {
    var swiftDict: [Int32: [Int32]] = [:]
    let iterator_handle = MapOf__Int_To_ArrayOf__Int_iterator(handle)
    while MapOf__Int_To_ArrayOf__Int_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__Int_To_ArrayOf__Int_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__Int_To_ArrayOf__Int_iterator_value(iterator_handle)) as [Int32]
        MapOf__Int_To_ArrayOf__Int_iterator_increment(iterator_handle)
    }
    MapOf__Int_To_ArrayOf__Int_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32]] {
    defer {
        MapOf__Int_To_ArrayOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32]]) -> RefHolder {
    let c_handle = MapOf__Int_To_ArrayOf__Int_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_ArrayOf__Int_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: [Int32]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__Int_To_ArrayOf__Int_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__Int_To_ArrayOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: [Int32]]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32]]? {
    defer {
        MapOf__Int_To_ArrayOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__Int_To_ArrayOf__Int_create_optional_handle()
    let handle = MapOf__Int_To_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__Int_To_ArrayOf__Int_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: [Int32]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__Int_To_ArrayOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct] {
    var swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct] = [:]
    let iterator_handle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(handle)
    while MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.BasicStruct
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(iterator_handle)
    }
    MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct] {
    defer {
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    let c_handle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: GenericTypesWithCompoundTypes.BasicStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct]? {
    defer {
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle()
    let handle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__String_To_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
    var swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct] = [:]
    let iterator_handle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(handle)
    while MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.ExternalStruct
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(iterator_handle)
    }
    MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
    defer {
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    let c_handle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: GenericTypesWithCompoundTypes.ExternalStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct]? {
    defer {
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle()
    let handle = MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__String_To_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: String] {
    var swiftDict: [String: String] = [:]
    let iterator_handle = MapOf__String_To__String_iterator(handle)
    while MapOf__String_To__String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__String_To__String_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__String_To__String_iterator_value(iterator_handle)) as String
        MapOf__String_To__String_iterator_increment(iterator_handle)
    }
    MapOf__String_To__String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: String] {
    defer {
        MapOf__String_To__String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: String]) -> RefHolder {
    let c_handle = MapOf__String_To__String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__String_To__String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__String_To__String_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__String_To__String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: String]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: String]? {
    defer {
        MapOf__String_To__String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__String_To__String_create_optional_handle()
    let handle = MapOf__String_To__String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__String_To__String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__String_To__String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: String] {
    var swiftDict: [UInt8: String] = [:]
    let iterator_handle = MapOf__UByte_To__String_iterator(handle)
    while MapOf__UByte_To__String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf__UByte_To__String_iterator_key(iterator_handle))] =
            moveFromCType(MapOf__UByte_To__String_iterator_value(iterator_handle)) as String
        MapOf__UByte_To__String_iterator_increment(iterator_handle)
    }
    MapOf__UByte_To__String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: String] {
    defer {
        MapOf__UByte_To__String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: String]) -> RefHolder {
    let c_handle = MapOf__UByte_To__String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__UByte_To__String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [UInt8: String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf__UByte_To__String_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf__UByte_To__String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8: String]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: String]? {
    defer {
        MapOf__UByte_To__String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf__UByte_To__String_create_optional_handle()
    let handle = MapOf__UByte_To__String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf__UByte_To__String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8: String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf__UByte_To__String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool] {
    var swiftDict: [[Int32: Bool]: Bool] = [:]
    let iterator_handle = MapOf_MapOf__Int_To__Boolean_To__Boolean_iterator(handle)
    while MapOf_MapOf__Int_To__Boolean_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_MapOf__Int_To__Boolean_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_MapOf__Int_To__Boolean_To__Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_MapOf__Int_To__Boolean_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf_MapOf__Int_To__Boolean_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool] {
    defer {
        MapOf_MapOf__Int_To__Boolean_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32: Bool]: Bool]) -> RefHolder {
    let c_handle = MapOf_MapOf__Int_To__Boolean_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_MapOf__Int_To__Boolean_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [[Int32: Bool]: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_MapOf__Int_To__Boolean_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_MapOf__Int_To__Boolean_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[Int32: Bool]: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool]? {
    defer {
        MapOf_MapOf__Int_To__Boolean_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32: Bool]: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_MapOf__Int_To__Boolean_To__Boolean_create_optional_handle()
    let handle = MapOf_MapOf__Int_To__Boolean_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_MapOf__Int_To__Boolean_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[Int32: Bool]: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_MapOf__Int_To__Boolean_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool] {
    var swiftDict: [Set<Int32>: Bool] = [:]
    let iterator_handle = MapOf_SetOf__Int_To__Boolean_iterator(handle)
    while MapOf_SetOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_SetOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_SetOf__Int_To__Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_SetOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf_SetOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool] {
    defer {
        MapOf_SetOf__Int_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Set<Int32>: Bool]) -> RefHolder {
    let c_handle = MapOf_SetOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_SetOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Set<Int32>: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_SetOf__Int_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_SetOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Set<Int32>: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool]? {
    defer {
        MapOf_SetOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Set<Int32>: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_SetOf__Int_To__Boolean_create_optional_handle()
    let handle = MapOf_SetOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_SetOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Set<Int32>: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_SetOf__Int_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32]: Bool] {
    var swiftDict: [[Int32]: Bool] = [:]
    let iterator_handle = MapOf_ArrayOf__Int_To__Boolean_iterator(handle)
    while MapOf_ArrayOf__Int_To__Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_ArrayOf__Int_To__Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_ArrayOf__Int_To__Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_ArrayOf__Int_To__Boolean_iterator_increment(iterator_handle)
    }
    MapOf_ArrayOf__Int_To__Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32]: Bool] {
    defer {
        MapOf_ArrayOf__Int_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32]: Bool]) -> RefHolder {
    let c_handle = MapOf_ArrayOf__Int_To__Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_ArrayOf__Int_To__Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [[Int32]: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_ArrayOf__Int_To__Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32]: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_ArrayOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[Int32]: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32]: Bool]? {
    defer {
        MapOf_ArrayOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32]: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_ArrayOf__Int_To__Boolean_create_optional_handle()
    let handle = MapOf_ArrayOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_ArrayOf__Int_To__Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[Int32]: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_ArrayOf__Int_To__Boolean_release_optional_handle)
}