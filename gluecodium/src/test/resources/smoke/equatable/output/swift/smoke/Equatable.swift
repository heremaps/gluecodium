//
//

import Foundation
public typealias ErrorCodeToMessageMap = [Int32: String]
public enum SomeEnum : UInt32, CaseIterable {
    case foo
    case bar
}
internal func copyToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> SomeEnum {
    return SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct EquatableStruct: Hashable {
    public var boolField: Bool
    public var intField: Int32
    public var longField: Int64
    public var floatField: Float
    public var doubleField: Double
    public var stringField: String
    public var structField: NestedEquatableStruct
    public var enumField: SomeEnum
    public var arrayField: [String]
    public var mapField: ErrorCodeToMessageMap
    public init(boolField: Bool, intField: Int32, longField: Int64, floatField: Float, doubleField: Double, stringField: String, structField: NestedEquatableStruct, enumField: SomeEnum, arrayField: [String], mapField: ErrorCodeToMessageMap) {
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
internal func copyToCType(_ swiftType: EquatableStruct) -> RefHolder {
    let c_boolField = moveToCType(swiftType.boolField)
    let c_intField = moveToCType(swiftType.intField)
    let c_longField = moveToCType(swiftType.longField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = moveToCType(swiftType.arrayField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableStruct_create_handle(c_boolField.ref, c_intField.ref, c_longField.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Equatable_EquatableStruct_unwrap_optional_handle(handle)
    return EquatableStruct(cHandle: unwrappedHandle) as EquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableStruct? {
    defer {
        smoke_Equatable_EquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_boolField = moveToCType(swiftType.boolField)
    let c_intField = moveToCType(swiftType.intField)
    let c_longField = moveToCType(swiftType.longField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = moveToCType(swiftType.arrayField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableStruct_create_optional_handle(c_boolField.ref, c_intField.ref, c_longField.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableStruct_release_optional_handle)
}
public struct EquatableNullableStruct: Hashable {
    public var boolField: Bool?
    public var intField: Int32?
    public var uintField: UInt16?
    public var floatField: Float?
    public var stringField: String?
    public var structField: NestedEquatableStruct?
    public var enumField: SomeEnum?
    public var arrayField: [String]?
    public var mapField: ErrorCodeToMessageMap?
    public init(boolField: Bool? = nil, intField: Int32? = nil, uintField: UInt16? = nil, floatField: Float? = nil, stringField: String? = nil, structField: NestedEquatableStruct? = nil, enumField: SomeEnum? = nil, arrayField: [String]? = nil, mapField: ErrorCodeToMessageMap? = nil) {
        self.boolField = boolField
        self.intField = intField
        self.uintField = uintField
        self.floatField = floatField
        self.stringField = stringField
        self.structField = structField
        self.enumField = enumField
        self.arrayField = arrayField
        self.mapField = mapField
    }
    internal init(cHandle: _baseRef) {
        boolField = moveFromCType(smoke_Equatable_EquatableNullableStruct_boolField_get(cHandle))
        intField = moveFromCType(smoke_Equatable_EquatableNullableStruct_intField_get(cHandle))
        uintField = moveFromCType(smoke_Equatable_EquatableNullableStruct_uintField_get(cHandle))
        floatField = moveFromCType(smoke_Equatable_EquatableNullableStruct_floatField_get(cHandle))
        stringField = moveFromCType(smoke_Equatable_EquatableNullableStruct_stringField_get(cHandle))
        structField = moveFromCType(smoke_Equatable_EquatableNullableStruct_structField_get(cHandle))
        enumField = moveFromCType(smoke_Equatable_EquatableNullableStruct_enumField_get(cHandle))
        arrayField = moveFromCType(smoke_Equatable_EquatableNullableStruct_arrayField_get(cHandle))
        mapField = moveFromCType(smoke_Equatable_EquatableNullableStruct_mapField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableNullableStruct {
    return EquatableNullableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableNullableStruct {
    defer {
        smoke_Equatable_EquatableNullableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableNullableStruct) -> RefHolder {
    let c_boolField = moveToCType(swiftType.boolField)
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = moveToCType(swiftType.arrayField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableNullableStruct_create_handle(c_boolField.ref, c_intField.ref, c_uintField.ref, c_floatField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EquatableNullableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableNullableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableNullableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Equatable_EquatableNullableStruct_unwrap_optional_handle(handle)
    return EquatableNullableStruct(cHandle: unwrappedHandle) as EquatableNullableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableNullableStruct? {
    defer {
        smoke_Equatable_EquatableNullableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableNullableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_boolField = moveToCType(swiftType.boolField)
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = moveToCType(swiftType.arrayField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableNullableStruct_create_optional_handle(c_boolField.ref, c_intField.ref, c_uintField.ref, c_floatField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EquatableNullableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableNullableStruct_release_optional_handle)
}
public struct NestedEquatableStruct: Hashable {
    public var fooField: String
    public init(fooField: String) {
        self.fooField = fooField
    }
    internal init(cHandle: _baseRef) {
        fooField = moveFromCType(smoke_Equatable_NestedEquatableStruct_fooField_get(cHandle))
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
internal func copyToCType(_ swiftType: NestedEquatableStruct) -> RefHolder {
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_Equatable_NestedEquatableStruct_create_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: NestedEquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_NestedEquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> NestedEquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Equatable_NestedEquatableStruct_unwrap_optional_handle(handle)
    return NestedEquatableStruct(cHandle: unwrappedHandle) as NestedEquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> NestedEquatableStruct? {
    defer {
        smoke_Equatable_NestedEquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: NestedEquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_Equatable_NestedEquatableStruct_create_optional_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: NestedEquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_NestedEquatableStruct_release_optional_handle)
}