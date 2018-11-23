//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

public typealias ErrorCodeToMessageMap = [Int32: String]
public enum SomeEnum : UInt32 {
    case foo
    case bar
}

public struct EquatableStruct: Equatable {
    public var boolField: Bool
    public var intField: Int32
    public var longField: Int64
    public var floatField: Float
    public var doubleField: Double
    public var stringField: String
    public var structField: NestedEquatableStruct
    public var enumField: SomeEnum
    public var arrayField: CollectionOf<String>
    public var mapField: ErrorCodeToMessageMap
    public init(boolField: Bool, intField: Int32, longField: Int64, floatField: Float, doubleField: Double, stringField: String, structField: NestedEquatableStruct, enumField: SomeEnum, arrayField: CollectionOf<String>, mapField: ErrorCodeToMessageMap) {
        self.boolField = boolField
        self.intField = intField
        self.longField = longField
        self.floatField = floatField
        self.doubleField = doubleField
        self.stringField = stringField
        self.structField = structField
        self.enumField = enumField
        self.arrayField = arrayField
        self.mapField = mapField
    }
    internal init(cEquatableStruct: _baseRef) {
        boolField = smoke_Equatable_EquatableStruct_boolField_get(cEquatableStruct)
        intField = smoke_Equatable_EquatableStruct_intField_get(cEquatableStruct)
        longField = smoke_Equatable_EquatableStruct_longField_get(cEquatableStruct)
        floatField = smoke_Equatable_EquatableStruct_floatField_get(cEquatableStruct)
        doubleField = smoke_Equatable_EquatableStruct_doubleField_get(cEquatableStruct)
        do {
            let stringField_handle = smoke_Equatable_EquatableStruct_stringField_get(cEquatableStruct)
            defer {
                std_string_release_handle(stringField_handle)
            }
            stringField = String(cString: std_string_data_get(stringField_handle))
        }
        do {
            let structField_handle = smoke_Equatable_EquatableStruct_structField_get(cEquatableStruct)
            defer {
                smoke_Equatable_NestedEquatableStruct_release_handle(structField_handle)
            }
            structField = NestedEquatableStruct(cNestedEquatableStruct: structField_handle)
        }
        enumField = SomeEnum.init(rawValue: smoke_Equatable_EquatableStruct_enumField_get(cEquatableStruct))!
        arrayField = StringList(smoke_Equatable_EquatableStruct_arrayField_get(cEquatableStruct))
        do {
            let mapField_handle = smoke_Equatable_EquatableStruct_mapField_get(cEquatableStruct)
            defer {
                smoke_Equatable_ErrorCodeToMessageMap_release_handle(mapField_handle)
            }
            mapField = convertErrorCodeToMessageMapFromCType(mapField_handle)
        }
    }
    internal func convertToCType() -> _baseRef {
        let boolField_handle = boolField
        let intField_handle = intField
        let longField_handle = longField
        let floatField_handle = floatField
        let doubleField_handle = doubleField
        let stringField_handle = stringField
        let structField_handle = structField.convertToCType()
        defer {
            smoke_Equatable_NestedEquatableStruct_release_handle(structField_handle)
        }
        let enumField_handle = enumField.rawValue
        let arrayField_conversion = arrayField.c_conversion()
        defer {
          arrayField_conversion.cleanup()
        }
        let arrayField_handle = arrayField_conversion.c_type
        let mapField_handle = convertErrorCodeToMessageMapToCType(mapField)
        defer {
          smoke_Equatable_ErrorCodeToMessageMap_release_handle(mapField_handle)
        }
        return smoke_Equatable_EquatableStruct_create_handle(boolField_handle, intField_handle, longField_handle, floatField_handle, doubleField_handle, stringField_handle, structField_handle, enumField_handle, arrayField_handle, mapField_handle)
    }
}

public struct NestedEquatableStruct: Equatable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init(cNestedEquatableStruct: _baseRef) {
        do {
            let fooField_handle = smoke_Equatable_NestedEquatableStruct_fooField_get(cNestedEquatableStruct)
            defer {
                std_string_release_handle(fooField_handle)
            }
            fooField = String(cString: std_string_data_get(fooField_handle))
        }
    }
    internal func convertToCType() -> _baseRef {
        let fooField_handle = fooField
        return smoke_Equatable_NestedEquatableStruct_create_handle(fooField_handle)
    }
}

func convertErrorCodeToMessageMapToCType(_ swiftDict: ErrorCodeToMessageMap) -> _baseRef {
    let c_handle = smoke_Equatable_ErrorCodeToMessageMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release_handle(c_value)
        }
        smoke_Equatable_ErrorCodeToMessageMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertErrorCodeToMessageMapFromCType(_ c_handle: _baseRef) -> ErrorCodeToMessageMap {
    var swiftDict: ErrorCodeToMessageMap = [:]
    let iterator_handle = smoke_Equatable_ErrorCodeToMessageMap_iterator(c_handle)
    while smoke_Equatable_ErrorCodeToMessageMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Equatable_ErrorCodeToMessageMap_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Equatable_ErrorCodeToMessageMap_iterator_value(iterator_handle)
        defer {
            std_string_release_handle(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Equatable_ErrorCodeToMessageMap_iterator_increment(iterator_handle)
    }
    smoke_Equatable_ErrorCodeToMessageMap_iterator_release_handle(iterator_handle)
    return swiftDict
}