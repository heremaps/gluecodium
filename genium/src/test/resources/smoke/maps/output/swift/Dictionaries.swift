internal func copyFromCType(_ handle: _baseRef) -> [Int32: String] {
    var swiftDict: [Int32: String] = [:]
    let iterator_handle = smoke_Maps_ErrorCodeToMessageMap_iterator(handle)
    while smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_ErrorCodeToMessageMap_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_ErrorCodeToMessageMap_iterator_value(iterator_handle)) as String
        smoke_Maps_ErrorCodeToMessageMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_ErrorCodeToMessageMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: String] {
    defer {
        smoke_Maps_ErrorCodeToMessageMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: String]) -> RefHolder {
    let c_handle = smoke_Maps_ErrorCodeToMessageMap_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_ErrorCodeToMessageMap_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Int32: String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_ErrorCodeToMessageMap_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32: String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_ErrorCodeToMessageMap_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32: String]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32: String]? {
    defer {
        smoke_Maps_ErrorCodeToMessageMap_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Int32: String]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_ErrorCodeToMessageMap_create_optional_handle()
    let handle = smoke_Maps_ErrorCodeToMessageMap_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_ErrorCodeToMessageMap_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32: String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_ErrorCodeToMessageMap_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Maps.SomeId: UInt8] {
    var swiftDict: [Maps.SomeId: UInt8] = [:]
    let iterator_handle = smoke_Maps_TypeDefToNumber_iterator(handle)
    while smoke_Maps_TypeDefToNumber_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_TypeDefToNumber_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_TypeDefToNumber_iterator_value(iterator_handle)) as UInt8
        smoke_Maps_TypeDefToNumber_iterator_increment(iterator_handle)
    }
    smoke_Maps_TypeDefToNumber_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [Maps.SomeId: UInt8] {
    defer {
        smoke_Maps_TypeDefToNumber_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Maps.SomeId: UInt8]) -> RefHolder {
    let c_handle = smoke_Maps_TypeDefToNumber_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_TypeDefToNumber_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [Maps.SomeId: UInt8]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_TypeDefToNumber_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Maps.SomeId: UInt8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_TypeDefToNumber_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Maps.SomeId: UInt8]
}
internal func moveFromCType(_ handle: _baseRef) -> [Maps.SomeId: UInt8]? {
    defer {
        smoke_Maps_TypeDefToNumber_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [Maps.SomeId: UInt8]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_TypeDefToNumber_create_optional_handle()
    let handle = smoke_Maps_TypeDefToNumber_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_TypeDefToNumber_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Maps.SomeId: UInt8]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_TypeDefToNumber_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: [Int32]] {
    var swiftDict: [String: [Int32]] = [:]
    let iterator_handle = smoke_Maps_StringToArray_iterator(handle)
    while smoke_Maps_StringToArray_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_StringToArray_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_StringToArray_iterator_value(iterator_handle)) as [Int32]
        smoke_Maps_StringToArray_iterator_increment(iterator_handle)
    }
    smoke_Maps_StringToArray_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [String: [Int32]] {
    defer {
        smoke_Maps_StringToArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: [Int32]]) -> RefHolder {
    let c_handle = smoke_Maps_StringToArray_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_StringToArray_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [String: [Int32]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_StringToArray_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String: [Int32]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_StringToArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String: [Int32]]
}
internal func moveFromCType(_ handle: _baseRef) -> [String: [Int32]]? {
    defer {
        smoke_Maps_StringToArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [String: [Int32]]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_StringToArray_create_optional_handle()
    let handle = smoke_Maps_StringToArray_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_StringToArray_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String: [Int32]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_StringToArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeStruct] {
    var swiftDict: [UInt8: Maps.SomeStruct] = [:]
    let iterator_handle = smoke_Maps_NumberToStruct_iterator(handle)
    while smoke_Maps_NumberToStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NumberToStruct_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_NumberToStruct_iterator_value(iterator_handle)) as Maps.SomeStruct
        smoke_Maps_NumberToStruct_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeStruct] {
    defer {
        smoke_Maps_NumberToStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: Maps.SomeStruct]) -> RefHolder {
    let c_handle = smoke_Maps_NumberToStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [UInt8: Maps.SomeStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NumberToStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NumberToStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8: Maps.SomeStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeStruct]? {
    defer {
        smoke_Maps_NumberToStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: Maps.SomeStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_NumberToStruct_create_optional_handle()
    let handle = smoke_Maps_NumberToStruct_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToStruct_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8: Maps.SomeStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NumberToStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: MapsInstance] {
    var swiftDict: [UInt8: MapsInstance] = [:]
    let iterator_handle = smoke_Maps_NumberToInstance_iterator(handle)
    while smoke_Maps_NumberToInstance_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NumberToInstance_iterator_key(iterator_handle))] =
            MapsInstancemoveFromCType(smoke_Maps_NumberToInstance_iterator_value(iterator_handle)) as MapsInstance
        smoke_Maps_NumberToInstance_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToInstance_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: MapsInstance] {
    defer {
        smoke_Maps_NumberToInstance_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: MapsInstance]) -> RefHolder {
    let c_handle = smoke_Maps_NumberToInstance_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToInstance_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [UInt8: MapsInstance]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NumberToInstance_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: MapsInstance]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NumberToInstance_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8: MapsInstance]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: MapsInstance]? {
    defer {
        smoke_Maps_NumberToInstance_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: MapsInstance]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_NumberToInstance_create_optional_handle()
    let handle = smoke_Maps_NumberToInstance_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToInstance_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8: MapsInstance]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NumberToInstance_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.NumberToStruct] {
    var swiftDict: [UInt8: Maps.NumberToStruct] = [:]
    let iterator_handle = smoke_Maps_NestedMap_iterator(handle)
    while smoke_Maps_NestedMap_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NestedMap_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_NestedMap_iterator_value(iterator_handle)) as Maps.NumberToStruct
        smoke_Maps_NestedMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_NestedMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.NumberToStruct] {
    defer {
        smoke_Maps_NestedMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: Maps.NumberToStruct]) -> RefHolder {
    let c_handle = smoke_Maps_NestedMap_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NestedMap_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [UInt8: Maps.NumberToStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NestedMap_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.NumberToStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NestedMap_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8: Maps.NumberToStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.NumberToStruct]? {
    defer {
        smoke_Maps_NestedMap_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: Maps.NumberToStruct]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_NestedMap_create_optional_handle()
    let handle = smoke_Maps_NestedMap_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NestedMap_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8: Maps.NumberToStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NestedMap_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeId] {
    var swiftDict: [UInt8: Maps.SomeId] = [:]
    let iterator_handle = smoke_Maps_NumberToTypeDef_iterator(handle)
    while smoke_Maps_NumberToTypeDef_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NumberToTypeDef_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_NumberToTypeDef_iterator_value(iterator_handle)) as Maps.SomeId
        smoke_Maps_NumberToTypeDef_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToTypeDef_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeId] {
    defer {
        smoke_Maps_NumberToTypeDef_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: Maps.SomeId]) -> RefHolder {
    let c_handle = smoke_Maps_NumberToTypeDef_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToTypeDef_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: [UInt8: Maps.SomeId]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NumberToTypeDef_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeId]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NumberToTypeDef_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8: Maps.SomeId]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeId]? {
    defer {
        smoke_Maps_NumberToTypeDef_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: [UInt8: Maps.SomeId]?) -> RefHolder {
    guard let swiftDict = swiftDict else {
        return RefHolder(0)
    }
    let optionalHandle = smoke_Maps_NumberToTypeDef_create_optional_handle()
    let handle = smoke_Maps_NumberToTypeDef_unwrap_optional_handle(optionalHandle)
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToTypeDef_put(handle, c_key.ref, c_value.ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8: Maps.SomeId]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NumberToTypeDef_release_optional_handle)
}