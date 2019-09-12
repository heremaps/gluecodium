import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [Float: Double] {
    var swiftDict: [Float: Double] = [:]
    let iterator_handle = MapOf_Float_To_Double_iterator(handle)
    while MapOf_Float_To_Double_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Float_To_Double_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Float_To_Double_iterator_value(iterator_handle)) as Double
        MapOf_Float_To_Double_iterator_increment(iterator_handle)
    }
    MapOf_Float_To_Double_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Float: Double] {
    defer {
        MapOf_Float_To_Double_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Float: Double]) -> RefHolder {
    let c_handle = MapOf_Float_To_Double_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Float_To_Double_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Float: Double]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Float_To_Double_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Float: Double]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Float_To_Double_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Float: Double]
}
internal func moveFromCType(_ handle: _baseRef) -> [Float: Double]? {
    defer {
        MapOf_Float_To_Double_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Float: Double]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Float_To_Double_create_optional_handle()
    let handle = MapOf_Float_To_Double_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Float_To_Double_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Float: Double]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Float_To_Double_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
    var swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool] = [:]
    let iterator_handle = MapOf_ExternalEnum_To_Boolean_iterator(handle)
    while MapOf_ExternalEnum_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_ExternalEnum_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_ExternalEnum_To_Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_ExternalEnum_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_ExternalEnum_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
    defer {
        MapOf_ExternalEnum_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]) -> RefHolder {
    let c_handle = MapOf_ExternalEnum_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_ExternalEnum_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_ExternalEnum_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_ExternalEnum_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalEnum: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool]? {
    defer {
        MapOf_ExternalEnum_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_ExternalEnum_To_Boolean_create_optional_handle()
    let handle = MapOf_ExternalEnum_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_ExternalEnum_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalEnum: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_ExternalEnum_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool] {
    var swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool] = [:]
    let iterator_handle = MapOf_SomeEnum_To_Boolean_iterator(handle)
    while MapOf_SomeEnum_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_SomeEnum_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_SomeEnum_To_Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_SomeEnum_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_SomeEnum_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool] {
    defer {
        MapOf_SomeEnum_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> RefHolder {
    let c_handle = MapOf_SomeEnum_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_SomeEnum_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_SomeEnum_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_SomeEnum_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.SomeEnum: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum: Bool]? {
    defer {
        MapOf_SomeEnum_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [GenericTypesWithCompoundTypes.SomeEnum: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_SomeEnum_To_Boolean_create_optional_handle()
    let handle = MapOf_SomeEnum_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_SomeEnum_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.SomeEnum: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_SomeEnum_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Bool] {
    var swiftDict: [Int32: Bool] = [:]
    let iterator_handle = MapOf_Int_To_Boolean_iterator(handle)
    while MapOf_Int_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Int_To_Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_Int_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Bool] {
    defer {
        MapOf_Int_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Bool]) -> RefHolder {
    let c_handle = MapOf_Int_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Bool]? {
    defer {
        MapOf_Int_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_Boolean_create_optional_handle()
    let handle = MapOf_Int_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyClass] {
    var swiftDict: [Int32: DummyClass] = [:]
    let iterator_handle = MapOf_Int_To_DummyClass_iterator(handle)
    while MapOf_Int_To_DummyClass_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_DummyClass_iterator_key(iterator_handle))] =
            DummyClass_moveFromCType(MapOf_Int_To_DummyClass_iterator_value(iterator_handle)) as DummyClass
        MapOf_Int_To_DummyClass_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_DummyClass_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyClass] {
    defer {
        MapOf_Int_To_DummyClass_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyClass]) -> RefHolder {
    let c_handle = MapOf_Int_To_DummyClass_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_DummyClass_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: DummyClass]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_DummyClass_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_DummyClass_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: DummyClass]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyClass]? {
    defer {
        MapOf_Int_To_DummyClass_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyClass]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_DummyClass_create_optional_handle()
    let handle = MapOf_Int_To_DummyClass_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_DummyClass_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: DummyClass]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_DummyClass_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyInterface] {
    var swiftDict: [Int32: DummyInterface] = [:]
    let iterator_handle = MapOf_Int_To_DummyInterface_iterator(handle)
    while MapOf_Int_To_DummyInterface_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_DummyInterface_iterator_key(iterator_handle))] =
            DummyInterface_moveFromCType(MapOf_Int_To_DummyInterface_iterator_value(iterator_handle)) as DummyInterface
        MapOf_Int_To_DummyInterface_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_DummyInterface_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyInterface] {
    defer {
        MapOf_Int_To_DummyInterface_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyInterface]) -> RefHolder {
    let c_handle = MapOf_Int_To_DummyInterface_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_DummyInterface_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: DummyInterface]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_DummyInterface_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: DummyInterface]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_DummyInterface_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: DummyInterface]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: DummyInterface]? {
    defer {
        MapOf_Int_To_DummyInterface_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: DummyInterface]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_DummyInterface_create_optional_handle()
    let handle = MapOf_Int_To_DummyInterface_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_DummyInterface_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: DummyInterface]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_DummyInterface_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
    var swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum] = [:]
    let iterator_handle = MapOf_Int_To_ExternalEnum_iterator(handle)
    while MapOf_Int_To_ExternalEnum_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_ExternalEnum_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Int_To_ExternalEnum_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.ExternalEnum
        MapOf_Int_To_ExternalEnum_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_ExternalEnum_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
    defer {
        MapOf_Int_To_ExternalEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    let c_handle = MapOf_Int_To_ExternalEnum_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_ExternalEnum_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_ExternalEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_ExternalEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: GenericTypesWithCompoundTypes.ExternalEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum]? {
    defer {
        MapOf_Int_To_ExternalEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_ExternalEnum_create_optional_handle()
    let handle = MapOf_Int_To_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_ExternalEnum_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_ExternalEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum] {
    var swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum] = [:]
    let iterator_handle = MapOf_Int_To_SomeEnum_iterator(handle)
    while MapOf_Int_To_SomeEnum_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_SomeEnum_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Int_To_SomeEnum_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.SomeEnum
        MapOf_Int_To_SomeEnum_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_SomeEnum_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum] {
    defer {
        MapOf_Int_To_SomeEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    let c_handle = MapOf_Int_To_SomeEnum_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_SomeEnum_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_SomeEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_SomeEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: GenericTypesWithCompoundTypes.SomeEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: GenericTypesWithCompoundTypes.SomeEnum]? {
    defer {
        MapOf_Int_To_SomeEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_SomeEnum_create_optional_handle()
    let handle = MapOf_Int_To_SomeEnum_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_SomeEnum_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_SomeEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]] {
    var swiftDict: [Int32: [Int32: Bool]] = [:]
    let iterator_handle = MapOf_Int_To_MapOf_Int_To_Boolean_iterator(handle)
    while MapOf_Int_To_MapOf_Int_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_MapOf_Int_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Int_To_MapOf_Int_To_Boolean_iterator_value(iterator_handle)) as [Int32: Bool]
        MapOf_Int_To_MapOf_Int_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_MapOf_Int_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]] {
    defer {
        MapOf_Int_To_MapOf_Int_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32: Bool]]) -> RefHolder {
    let c_handle = MapOf_Int_To_MapOf_Int_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_MapOf_Int_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: [Int32: Bool]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_MapOf_Int_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_MapOf_Int_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: [Int32: Bool]]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32: Bool]]? {
    defer {
        MapOf_Int_To_MapOf_Int_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32: Bool]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_MapOf_Int_To_Boolean_create_optional_handle()
    let handle = MapOf_Int_To_MapOf_Int_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_MapOf_Int_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: [Int32: Bool]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_MapOf_Int_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>] {
    var swiftDict: [Int32: Set<Int32>] = [:]
    let iterator_handle = MapOf_Int_To_SetOf_Int_iterator(handle)
    while MapOf_Int_To_SetOf_Int_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_SetOf_Int_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Int_To_SetOf_Int_iterator_value(iterator_handle)) as Set<Int32>
        MapOf_Int_To_SetOf_Int_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_SetOf_Int_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>] {
    defer {
        MapOf_Int_To_SetOf_Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Set<Int32>]) -> RefHolder {
    let c_handle = MapOf_Int_To_SetOf_Int_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_SetOf_Int_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: Set<Int32>]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_SetOf_Int_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_SetOf_Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: Set<Int32>]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: Set<Int32>]? {
    defer {
        MapOf_Int_To_SetOf_Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: Set<Int32>]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_SetOf_Int_create_optional_handle()
    let handle = MapOf_Int_To_SetOf_Int_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_SetOf_Int_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: Set<Int32>]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_SetOf_Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32]] {
    var swiftDict: [Int32: [Int32]] = [:]
    let iterator_handle = MapOf_Int_To_ArrayOf_Int_iterator(handle)
    while MapOf_Int_To_ArrayOf_Int_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_Int_To_ArrayOf_Int_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_Int_To_ArrayOf_Int_iterator_value(iterator_handle)) as [Int32]
        MapOf_Int_To_ArrayOf_Int_iterator_increment(iterator_handle)
    }
    MapOf_Int_To_ArrayOf_Int_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32]] {
    defer {
        MapOf_Int_To_ArrayOf_Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32]]) -> RefHolder {
    let c_handle = MapOf_Int_To_ArrayOf_Int_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_ArrayOf_Int_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: [Int32]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_Int_To_ArrayOf_Int_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: [Int32]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_Int_To_ArrayOf_Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: [Int32]]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: [Int32]]? {
    defer {
        MapOf_Int_To_ArrayOf_Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: [Int32]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_Int_To_ArrayOf_Int_create_optional_handle()
    let handle = MapOf_Int_To_ArrayOf_Int_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_Int_To_ArrayOf_Int_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: [Int32]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_Int_To_ArrayOf_Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct] {
    var swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct] = [:]
    let iterator_handle = MapOf_String_To_BasicStruct_iterator(handle)
    while MapOf_String_To_BasicStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_String_To_BasicStruct_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_String_To_BasicStruct_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.BasicStruct
        MapOf_String_To_BasicStruct_iterator_increment(iterator_handle)
    }
    MapOf_String_To_BasicStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct] {
    defer {
        MapOf_String_To_BasicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    let c_handle = MapOf_String_To_BasicStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_String_To_BasicStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_String_To_BasicStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_String_To_BasicStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: GenericTypesWithCompoundTypes.BasicStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.BasicStruct]? {
    defer {
        MapOf_String_To_BasicStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_String_To_BasicStruct_create_optional_handle()
    let handle = MapOf_String_To_BasicStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_String_To_BasicStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_String_To_BasicStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
    var swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct] = [:]
    let iterator_handle = MapOf_String_To_ExternalStruct_iterator(handle)
    while MapOf_String_To_ExternalStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_String_To_ExternalStruct_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_String_To_ExternalStruct_iterator_value(iterator_handle)) as GenericTypesWithCompoundTypes.ExternalStruct
        MapOf_String_To_ExternalStruct_iterator_increment(iterator_handle)
    }
    MapOf_String_To_ExternalStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
    defer {
        MapOf_String_To_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    let c_handle = MapOf_String_To_ExternalStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_String_To_ExternalStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_String_To_ExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_String_To_ExternalStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: GenericTypesWithCompoundTypes.ExternalStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: GenericTypesWithCompoundTypes.ExternalStruct]? {
    defer {
        MapOf_String_To_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_String_To_ExternalStruct_create_optional_handle()
    let handle = MapOf_String_To_ExternalStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_String_To_ExternalStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_String_To_ExternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: String] {
    var swiftDict: [String: String] = [:]
    let iterator_handle = MapOf_String_To_String_iterator(handle)
    while MapOf_String_To_String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_String_To_String_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_String_To_String_iterator_value(iterator_handle)) as String
        MapOf_String_To_String_iterator_increment(iterator_handle)
    }
    MapOf_String_To_String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: String] {
    defer {
        MapOf_String_To_String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: String]) -> RefHolder {
    let c_handle = MapOf_String_To_String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_String_To_String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_String_To_String_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_String_To_String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: String]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: String]? {
    defer {
        MapOf_String_To_String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_String_To_String_create_optional_handle()
    let handle = MapOf_String_To_String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_String_To_String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_String_To_String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: String] {
    var swiftDict: [UInt8: String] = [:]
    let iterator_handle = MapOf_UByte_To_String_iterator(handle)
    while MapOf_UByte_To_String_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_UByte_To_String_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_UByte_To_String_iterator_value(iterator_handle)) as String
        MapOf_UByte_To_String_iterator_increment(iterator_handle)
    }
    MapOf_UByte_To_String_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: String] {
    defer {
        MapOf_UByte_To_String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: String]) -> RefHolder {
    let c_handle = MapOf_UByte_To_String_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_UByte_To_String_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [UInt8: String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_UByte_To_String_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_UByte_To_String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8: String]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: String]? {
    defer {
        MapOf_UByte_To_String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_UByte_To_String_create_optional_handle()
    let handle = MapOf_UByte_To_String_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_UByte_To_String_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8: String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_UByte_To_String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool] {
    var swiftDict: [[Int32: Bool]: Bool] = [:]
    let iterator_handle = MapOf_MapOf_Int_To_Boolean_To_Boolean_iterator(handle)
    while MapOf_MapOf_Int_To_Boolean_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_MapOf_Int_To_Boolean_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_MapOf_Int_To_Boolean_To_Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_MapOf_Int_To_Boolean_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_MapOf_Int_To_Boolean_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool] {
    defer {
        MapOf_MapOf_Int_To_Boolean_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32: Bool]: Bool]) -> RefHolder {
    let c_handle = MapOf_MapOf_Int_To_Boolean_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_MapOf_Int_To_Boolean_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [[Int32: Bool]: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_MapOf_Int_To_Boolean_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_MapOf_Int_To_Boolean_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[Int32: Bool]: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]: Bool]? {
    defer {
        MapOf_MapOf_Int_To_Boolean_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32: Bool]: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_MapOf_Int_To_Boolean_To_Boolean_create_optional_handle()
    let handle = MapOf_MapOf_Int_To_Boolean_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_MapOf_Int_To_Boolean_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[Int32: Bool]: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_MapOf_Int_To_Boolean_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool] {
    var swiftDict: [Set<Int32>: Bool] = [:]
    let iterator_handle = MapOf_SetOf_Int_To_Boolean_iterator(handle)
    while MapOf_SetOf_Int_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_SetOf_Int_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_SetOf_Int_To_Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_SetOf_Int_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_SetOf_Int_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool] {
    defer {
        MapOf_SetOf_Int_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Set<Int32>: Bool]) -> RefHolder {
    let c_handle = MapOf_SetOf_Int_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_SetOf_Int_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Set<Int32>: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_SetOf_Int_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_SetOf_Int_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Set<Int32>: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [Set<Int32>: Bool]? {
    defer {
        MapOf_SetOf_Int_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Set<Int32>: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_SetOf_Int_To_Boolean_create_optional_handle()
    let handle = MapOf_SetOf_Int_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_SetOf_Int_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Set<Int32>: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_SetOf_Int_To_Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32]: Bool] {
    var swiftDict: [[Int32]: Bool] = [:]
    let iterator_handle = MapOf_ArrayOf_Int_To_Boolean_iterator(handle)
    while MapOf_ArrayOf_Int_To_Boolean_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(MapOf_ArrayOf_Int_To_Boolean_iterator_key(iterator_handle))] =
            moveFromCType(MapOf_ArrayOf_Int_To_Boolean_iterator_value(iterator_handle)) as Bool
        MapOf_ArrayOf_Int_To_Boolean_iterator_increment(iterator_handle)
    }
    MapOf_ArrayOf_Int_To_Boolean_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32]: Bool] {
    defer {
        MapOf_ArrayOf_Int_To_Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32]: Bool]) -> RefHolder {
    let c_handle = MapOf_ArrayOf_Int_To_Boolean_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_ArrayOf_Int_To_Boolean_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [[Int32]: Bool]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: MapOf_ArrayOf_Int_To_Boolean_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32]: Bool]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = MapOf_ArrayOf_Int_To_Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[Int32]: Bool]
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32]: Bool]? {
    defer {
        MapOf_ArrayOf_Int_To_Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [[Int32]: Bool]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = MapOf_ArrayOf_Int_To_Boolean_create_optional_handle()
    let handle = MapOf_ArrayOf_Int_To_Boolean_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        MapOf_ArrayOf_Int_To_Boolean_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[Int32]: Bool]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: MapOf_ArrayOf_Int_To_Boolean_release_optional_handle)
}
