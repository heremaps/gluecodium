//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public typealias ErrorCodeToMessageMap = [Int32: String]
public enum SomeEnum : UInt32 {
    case foo
    case bar
}
internal func copyFromCType(_ cValue: UInt32) -> SomeEnum {
    return SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> SomeEnum {
    return copyFromCType(cValue)
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
    internal init(cHandle: _baseRef) {
        boolField = moveFromCType(smoke_Equatable_EquatableStruct_boolField_get(cHandle))
        intField = moveFromCType(smoke_Equatable_EquatableStruct_intField_get(cHandle))
        longField = moveFromCType(smoke_Equatable_EquatableStruct_longField_get(cHandle))
        floatField = moveFromCType(smoke_Equatable_EquatableStruct_floatField_get(cHandle))
        doubleField = moveFromCType(smoke_Equatable_EquatableStruct_doubleField_get(cHandle))
        stringField = moveFromCType(smoke_Equatable_EquatableStruct_stringField_get(cHandle))
        structField = moveFromCType(smoke_Equatable_EquatableStruct_structField_get(cHandle))
        enumField = moveFromCType(smoke_Equatable_EquatableStruct_enumField_get(cHandle))
        arrayField = moveFromCType(smoke_Equatable_EquatableStruct_arrayField_get(cHandle))
        mapField = moveFromCType(smoke_Equatable_EquatableStruct_mapField_get(cHandle))
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
internal func copyFromCType(_ handle: _baseRef) -> EquatableStruct {
    return EquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableStruct {
    defer {
        smoke_Equatable_EquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct NestedEquatableStruct: Equatable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init(cHandle: _baseRef) {
        fooField = moveFromCType(smoke_Equatable_NestedEquatableStruct_fooField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let fooField_handle = fooField
        return smoke_Equatable_NestedEquatableStruct_create_handle(fooField_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> NestedEquatableStruct {
    return NestedEquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> NestedEquatableStruct {
    defer {
        smoke_Equatable_NestedEquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
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