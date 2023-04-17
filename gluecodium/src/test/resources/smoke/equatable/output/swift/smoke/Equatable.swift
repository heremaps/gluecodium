//
//
import Foundation
public struct Equatable {
    public enum SomeEnum : UInt32, CaseIterable, Codable {
        case foo
        case bar
    }
    public typealias ErrorCodeToMessageMap = [Int32: String]
    public struct EquatableStruct: Hashable {
        public var boolField: Bool
        public var intField: Int32
        public var longField: Int64
        public var floatField: Float
        public var doubleField: Double
        public var stringField: String
        public var structField: Equatable.NestedEquatableStruct
        public var enumField: Equatable.SomeEnum
        public var arrayField: [String]
        public var mapField: Equatable.ErrorCodeToMessageMap
        public init(boolField: Bool, intField: Int32, longField: Int64, floatField: Float, doubleField: Double, stringField: String, structField: Equatable.NestedEquatableStruct, enumField: Equatable.SomeEnum, arrayField: [String], mapField: Equatable.ErrorCodeToMessageMap) {
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
            arrayField = foobar_moveFromCType(smoke_Equatable_EquatableStruct_arrayField_get(cHandle))
            mapField = foobar_moveFromCType(smoke_Equatable_EquatableStruct_mapField_get(cHandle))
        }
    }
    public struct EquatableNullableStruct: Hashable {
        public var boolField: Bool?
        public var intField: Int32?
        public var uintField: UInt16?
        public var floatField: Float?
        public var stringField: String?
        public var structField: Equatable.NestedEquatableStruct?
        public var enumField: Equatable.SomeEnum?
        public var arrayField: [String]?
        public var mapField: Equatable.ErrorCodeToMessageMap?
        public init(boolField: Bool? = nil, intField: Int32? = nil, uintField: UInt16? = nil, floatField: Float? = nil, stringField: String? = nil, structField: Equatable.NestedEquatableStruct? = nil, enumField: Equatable.SomeEnum? = nil, arrayField: [String]? = nil, mapField: Equatable.ErrorCodeToMessageMap? = nil) {
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
            arrayField = foobar_moveFromCType(smoke_Equatable_EquatableNullableStruct_arrayField_get(cHandle))
            mapField = foobar_moveFromCType(smoke_Equatable_EquatableNullableStruct_mapField_get(cHandle))
        }
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
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.EquatableStruct {
    return Equatable.EquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.EquatableStruct {
    defer {
        smoke_Equatable_EquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Equatable.EquatableStruct) -> RefHolder {
    let c_boolField = moveToCType(swiftType.boolField)
    let c_intField = moveToCType(swiftType.intField)
    let c_longField = moveToCType(swiftType.longField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = foobar_moveToCType(swiftType.arrayField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableStruct_create_handle(c_boolField.ref, c_intField.ref, c_longField.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: Equatable.EquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.EquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Equatable_EquatableStruct_unwrap_optional_handle(handle)
    return Equatable.EquatableStruct(cHandle: unwrappedHandle) as Equatable.EquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.EquatableStruct? {
    defer {
        smoke_Equatable_EquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Equatable.EquatableStruct?) -> RefHolder {
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
    let c_arrayField = foobar_moveToCType(swiftType.arrayField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableStruct_create_optional_handle(c_boolField.ref, c_intField.ref, c_longField.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: Equatable.EquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.EquatableNullableStruct {
    return Equatable.EquatableNullableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.EquatableNullableStruct {
    defer {
        smoke_Equatable_EquatableNullableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Equatable.EquatableNullableStruct) -> RefHolder {
    let c_boolField = moveToCType(swiftType.boolField)
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = foobar_moveToCType(swiftType.arrayField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableNullableStruct_create_handle(c_boolField.ref, c_intField.ref, c_uintField.ref, c_floatField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: Equatable.EquatableNullableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableNullableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.EquatableNullableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Equatable_EquatableNullableStruct_unwrap_optional_handle(handle)
    return Equatable.EquatableNullableStruct(cHandle: unwrappedHandle) as Equatable.EquatableNullableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.EquatableNullableStruct? {
    defer {
        smoke_Equatable_EquatableNullableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Equatable.EquatableNullableStruct?) -> RefHolder {
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
    let c_arrayField = foobar_moveToCType(swiftType.arrayField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    return RefHolder(smoke_Equatable_EquatableNullableStruct_create_optional_handle(c_boolField.ref, c_intField.ref, c_uintField.ref, c_floatField.ref, c_stringField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: Equatable.EquatableNullableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_EquatableNullableStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.NestedEquatableStruct {
    return Equatable.NestedEquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.NestedEquatableStruct {
    defer {
        smoke_Equatable_NestedEquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Equatable.NestedEquatableStruct) -> RefHolder {
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_Equatable_NestedEquatableStruct_create_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: Equatable.NestedEquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_NestedEquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.NestedEquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Equatable_NestedEquatableStruct_unwrap_optional_handle(handle)
    return Equatable.NestedEquatableStruct(cHandle: unwrappedHandle) as Equatable.NestedEquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.NestedEquatableStruct? {
    defer {
        smoke_Equatable_NestedEquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Equatable.NestedEquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_Equatable_NestedEquatableStruct_create_optional_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: Equatable.NestedEquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Equatable_NestedEquatableStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Equatable.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Equatable.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Equatable.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Equatable.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Equatable.SomeEnum {
    return Equatable.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Equatable.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Equatable.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return Equatable.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Equatable.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
