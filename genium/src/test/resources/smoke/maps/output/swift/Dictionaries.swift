internal func copyFromCType(_ handle: _baseRef) -> Maps.ErrorCodeToMessageMap {
    var swiftDict: Maps.ErrorCodeToMessageMap = [:]
    let iterator_handle = smoke_Maps_ErrorCodeToMessageMap_iterator(handle)
    while smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_ErrorCodeToMessageMap_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_ErrorCodeToMessageMap_iterator_value(iterator_handle)) as String
        smoke_Maps_ErrorCodeToMessageMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_ErrorCodeToMessageMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.ErrorCodeToMessageMap {
    defer {
        smoke_Maps_ErrorCodeToMessageMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.ErrorCodeToMessageMap) -> RefHolder {
    let c_handle = smoke_Maps_ErrorCodeToMessageMap_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_ErrorCodeToMessageMap_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.ErrorCodeToMessageMap) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_ErrorCodeToMessageMap_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.ErrorCodeToMessageMap? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_ErrorCodeToMessageMap_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.ErrorCodeToMessageMap
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.ErrorCodeToMessageMap? {
    defer {
        smoke_Maps_ErrorCodeToMessageMap_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.ErrorCodeToMessageMap?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.ErrorCodeToMessageMap?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_ErrorCodeToMessageMap_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.TypeDefToNumber {
    var swiftDict: Maps.TypeDefToNumber = [:]
    let iterator_handle = smoke_Maps_TypeDefToNumber_iterator(handle)
    while smoke_Maps_TypeDefToNumber_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_TypeDefToNumber_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_TypeDefToNumber_iterator_value(iterator_handle)) as UInt8
        smoke_Maps_TypeDefToNumber_iterator_increment(iterator_handle)
    }
    smoke_Maps_TypeDefToNumber_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.TypeDefToNumber {
    defer {
        smoke_Maps_TypeDefToNumber_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.TypeDefToNumber) -> RefHolder {
    let c_handle = smoke_Maps_TypeDefToNumber_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_TypeDefToNumber_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.TypeDefToNumber) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_TypeDefToNumber_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.TypeDefToNumber? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_TypeDefToNumber_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.TypeDefToNumber
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.TypeDefToNumber? {
    defer {
        smoke_Maps_TypeDefToNumber_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.TypeDefToNumber?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.TypeDefToNumber?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_TypeDefToNumber_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.StringToArray {
    var swiftDict: Maps.StringToArray = [:]
    let iterator_handle = smoke_Maps_StringToArray_iterator(handle)
    while smoke_Maps_StringToArray_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_StringToArray_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_StringToArray_iterator_value(iterator_handle)) as Maps.ArrayOfInts
        smoke_Maps_StringToArray_iterator_increment(iterator_handle)
    }
    smoke_Maps_StringToArray_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.StringToArray {
    defer {
        smoke_Maps_StringToArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.StringToArray) -> RefHolder {
    let c_handle = smoke_Maps_StringToArray_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_StringToArray_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.StringToArray) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_StringToArray_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.StringToArray? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_StringToArray_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.StringToArray
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.StringToArray? {
    defer {
        smoke_Maps_StringToArray_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.StringToArray?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.StringToArray?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_StringToArray_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NumberToStruct {
    var swiftDict: Maps.NumberToStruct = [:]
    let iterator_handle = smoke_Maps_NumberToStruct_iterator(handle)
    while smoke_Maps_NumberToStruct_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NumberToStruct_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_NumberToStruct_iterator_value(iterator_handle)) as Maps.SomeStruct
        smoke_Maps_NumberToStruct_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NumberToStruct {
    defer {
        smoke_Maps_NumberToStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NumberToStruct) -> RefHolder {
    let c_handle = smoke_Maps_NumberToStruct_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToStruct_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.NumberToStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NumberToStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NumberToStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NumberToStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.NumberToStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NumberToStruct? {
    defer {
        smoke_Maps_NumberToStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NumberToStruct?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.NumberToStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NumberToStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NumberToInstance {
    var swiftDict: Maps.NumberToInstance = [:]
    let iterator_handle = smoke_Maps_NumberToInstance_iterator(handle)
    while smoke_Maps_NumberToInstance_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NumberToInstance_iterator_key(iterator_handle))] =
            MapsInstancemoveFromCType(smoke_Maps_NumberToInstance_iterator_value(iterator_handle)) as MapsInstance
        smoke_Maps_NumberToInstance_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToInstance_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NumberToInstance {
    defer {
        smoke_Maps_NumberToInstance_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NumberToInstance) -> RefHolder {
    let c_handle = smoke_Maps_NumberToInstance_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToInstance_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.NumberToInstance) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NumberToInstance_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NumberToInstance? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NumberToInstance_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.NumberToInstance
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NumberToInstance? {
    defer {
        smoke_Maps_NumberToInstance_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NumberToInstance?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.NumberToInstance?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NumberToInstance_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NumberToTypeDef {
    var swiftDict: Maps.NumberToTypeDef = [:]
    let iterator_handle = smoke_Maps_NumberToTypeDef_iterator(handle)
    while smoke_Maps_NumberToTypeDef_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NumberToTypeDef_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_NumberToTypeDef_iterator_value(iterator_handle)) as Maps.SomeId
        smoke_Maps_NumberToTypeDef_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToTypeDef_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NumberToTypeDef {
    defer {
        smoke_Maps_NumberToTypeDef_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NumberToTypeDef) -> RefHolder {
    let c_handle = smoke_Maps_NumberToTypeDef_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NumberToTypeDef_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.NumberToTypeDef) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NumberToTypeDef_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NumberToTypeDef? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NumberToTypeDef_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.NumberToTypeDef
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NumberToTypeDef? {
    defer {
        smoke_Maps_NumberToTypeDef_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NumberToTypeDef?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.NumberToTypeDef?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NumberToTypeDef_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NestedMap {
    var swiftDict: Maps.NestedMap = [:]
    let iterator_handle = smoke_Maps_NestedMap_iterator(handle)
    while smoke_Maps_NestedMap_iterator_is_valid(handle, iterator_handle) {
        swiftDict[moveFromCType(smoke_Maps_NestedMap_iterator_key(iterator_handle))] =
            moveFromCType(smoke_Maps_NestedMap_iterator_value(iterator_handle)) as Maps.NumberToStruct
        smoke_Maps_NestedMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_NestedMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NestedMap {
    defer {
        smoke_Maps_NestedMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NestedMap) -> RefHolder {
    let c_handle = smoke_Maps_NestedMap_create_handle()
    for (key, value) in swiftDict {
        let c_key = moveToCType(key)
        let c_value = moveToCType(value)
        smoke_Maps_NestedMap_put(c_handle, c_key.ref, c_value.ref)
    }
    return RefHolder(c_handle)
}
internal func moveToCType(_ swiftDict: Maps.NestedMap) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftDict).ref, release: smoke_Maps_NestedMap_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.NestedMap? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_NestedMap_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as Maps.NestedMap
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.NestedMap? {
    defer {
        smoke_Maps_NestedMap_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftDict: Maps.NestedMap?) -> RefHolder {
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
internal func moveToCType(_ swiftType: Maps.NestedMap?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_NestedMap_release_optional_handle)
}
