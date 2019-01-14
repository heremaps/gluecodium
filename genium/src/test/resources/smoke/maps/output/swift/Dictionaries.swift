func copyFromCType(_ handle: _baseRef) -> [Int32: String] {
    var swiftDict: [Int32: String] = [:]
    let iterator_handle = smoke_Maps_ErrorCodeToMessageMap_iterator(handle)
    while smoke_Maps_ErrorCodeToMessageMap_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_ErrorCodeToMessageMap_iterator_key(iterator_handle)
        let swift_key: Int32 = moveFromCType(c_key)
        let c_value = smoke_Maps_ErrorCodeToMessageMap_iterator_value(iterator_handle)
        let swift_value: String = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_ErrorCodeToMessageMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_ErrorCodeToMessageMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [Int32: String] {
    defer {
        smoke_Maps_ErrorCodeToMessageMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
func copyFromCType(_ handle: _baseRef) -> [String: CollectionOf<Int32>] {
    var swiftDict: [String: CollectionOf<Int32>] = [:]
    let iterator_handle = smoke_Maps_StringToArray_iterator(handle)
    while smoke_Maps_StringToArray_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_StringToArray_iterator_key(iterator_handle)
        let swift_key: String = moveFromCType(c_key)
        let c_value = smoke_Maps_StringToArray_iterator_value(iterator_handle)
        let swift_value: CollectionOf<Int32> = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_StringToArray_iterator_increment(iterator_handle)
    }
    smoke_Maps_StringToArray_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [String: CollectionOf<Int32>] {
    defer {
        smoke_Maps_StringToArray_release_handle(handle)
    }
    return copyFromCType(handle)
}
func copyFromCType(_ handle: _baseRef) -> [Maps.SomeId: UInt8] {
    var swiftDict: [Maps.SomeId: UInt8] = [:]
    let iterator_handle = smoke_Maps_TypeDefToNumber_iterator(handle)
    while smoke_Maps_TypeDefToNumber_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_TypeDefToNumber_iterator_key(iterator_handle)
        let swift_key: Maps.SomeId = moveFromCType(c_key)
        let c_value = smoke_Maps_TypeDefToNumber_iterator_value(iterator_handle)
        let swift_value: UInt8 = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_TypeDefToNumber_iterator_increment(iterator_handle)
    }
    smoke_Maps_TypeDefToNumber_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [Maps.SomeId: UInt8] {
    defer {
        smoke_Maps_TypeDefToNumber_release_handle(handle)
    }
    return copyFromCType(handle)
}
func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeStruct] {
    var swiftDict: [UInt8: Maps.SomeStruct] = [:]
    let iterator_handle = smoke_Maps_NumberToStruct_iterator(handle)
    while smoke_Maps_NumberToStruct_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_NumberToStruct_iterator_key(iterator_handle)
        let swift_key: UInt8 = moveFromCType(c_key)
        let c_value = smoke_Maps_NumberToStruct_iterator_value(iterator_handle)
        let swift_value: Maps.SomeStruct = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToStruct_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToStruct_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeStruct] {
    defer {
        smoke_Maps_NumberToStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
func copyFromCType(_ handle: _baseRef) -> [UInt8: MapsInstance] {
    var swiftDict: [UInt8: MapsInstance] = [:]
    let iterator_handle = smoke_Maps_NumberToInstance_iterator(handle)
    while smoke_Maps_NumberToInstance_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_NumberToInstance_iterator_key(iterator_handle)
        let swift_key: UInt8 = moveFromCType(c_key)
        let c_value = smoke_Maps_NumberToInstance_iterator_value(iterator_handle)
        let swift_value: MapsInstance = MapsInstancemoveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToInstance_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToInstance_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [UInt8: MapsInstance] {
    defer {
        smoke_Maps_NumberToInstance_release_handle(handle)
    }
    return copyFromCType(handle)
}
func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.NumberToStruct] {
    var swiftDict: [UInt8: Maps.NumberToStruct] = [:]
    let iterator_handle = smoke_Maps_NestedMap_iterator(handle)
    while smoke_Maps_NestedMap_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_NestedMap_iterator_key(iterator_handle)
        let swift_key: UInt8 = moveFromCType(c_key)
        let c_value = smoke_Maps_NestedMap_iterator_value(iterator_handle)
        let swift_value: Maps.NumberToStruct = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NestedMap_iterator_increment(iterator_handle)
    }
    smoke_Maps_NestedMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.NumberToStruct] {
    defer {
        smoke_Maps_NestedMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
func copyFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeId] {
    var swiftDict: [UInt8: Maps.SomeId] = [:]
    let iterator_handle = smoke_Maps_NumberToTypeDef_iterator(handle)
    while smoke_Maps_NumberToTypeDef_iterator_is_valid(handle, iterator_handle) {
        let c_key = smoke_Maps_NumberToTypeDef_iterator_key(iterator_handle)
        let swift_key: UInt8 = moveFromCType(c_key)
        let c_value = smoke_Maps_NumberToTypeDef_iterator_value(iterator_handle)
        let swift_value: Maps.SomeId = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        smoke_Maps_NumberToTypeDef_iterator_increment(iterator_handle)
    }
    smoke_Maps_NumberToTypeDef_iterator_release_handle(iterator_handle)
    return swiftDict
}
func moveFromCType(_ handle: _baseRef) -> [UInt8: Maps.SomeId] {
    defer {
        smoke_Maps_NumberToTypeDef_release_handle(handle)
    }
    return copyFromCType(handle)
}