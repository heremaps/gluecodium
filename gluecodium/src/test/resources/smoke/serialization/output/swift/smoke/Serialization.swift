//
//
import Foundation
public typealias NestedStructArray = [NestedSerializableStruct]
public typealias ErrorCodeToMessageMap = [Int32: String]
public enum SomeEnum : UInt32, CaseIterable, Codable {
    case foo
    case bar = 7
}
internal func foobar_copyToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> SomeEnum {
    return SomeEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> SomeEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
public struct SerializableStruct: Codable {
    public var boolField: Bool
    public var byteField: Int8
    public var shortField: Int16
    public var intField: Int32
    public var longField: UInt32
    public var floatField: Float
    public var doubleField: Double
    public var stringField: String
    public var structField: NestedSerializableStruct
    public var byteBufferField: Data
    public var arrayField: [String]
    public var structArrayField: NestedStructArray
    public var mapField: ErrorCodeToMessageMap
    public var setField: Set<String>
    public var enumSetField: Set<SomeEnum>
    public var enumField: SomeEnum
    public init(boolField: Bool, byteField: Int8, shortField: Int16, intField: Int32, longField: UInt32, floatField: Float, doubleField: Double, stringField: String, structField: NestedSerializableStruct, byteBufferField: Data, arrayField: [String], structArrayField: NestedStructArray, mapField: ErrorCodeToMessageMap, setField: Set<String>, enumSetField: Set<SomeEnum>, enumField: SomeEnum) {
        self.boolField = boolField
        self.byteField = byteField
        self.shortField = shortField
        self.intField = intField
        self.longField = longField
        self.floatField = floatField
        self.doubleField = doubleField
        self.stringField = stringField
        self.structField = structField
        self.byteBufferField = byteBufferField
        self.arrayField = arrayField
        self.structArrayField = structArrayField
        self.mapField = mapField
        self.setField = setField
        self.enumSetField = enumSetField
        self.enumField = enumField
    }
    internal init(cHandle: _baseRef) {
        boolField = moveFromCType(smoke_Serialization_SerializableStruct_boolField_get(cHandle))
        byteField = moveFromCType(smoke_Serialization_SerializableStruct_byteField_get(cHandle))
        shortField = moveFromCType(smoke_Serialization_SerializableStruct_shortField_get(cHandle))
        intField = moveFromCType(smoke_Serialization_SerializableStruct_intField_get(cHandle))
        longField = moveFromCType(smoke_Serialization_SerializableStruct_longField_get(cHandle))
        floatField = moveFromCType(smoke_Serialization_SerializableStruct_floatField_get(cHandle))
        doubleField = moveFromCType(smoke_Serialization_SerializableStruct_doubleField_get(cHandle))
        stringField = moveFromCType(smoke_Serialization_SerializableStruct_stringField_get(cHandle))
        structField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_structField_get(cHandle))
        byteBufferField = moveFromCType(smoke_Serialization_SerializableStruct_byteBufferField_get(cHandle))
        arrayField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_arrayField_get(cHandle))
        structArrayField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_structArrayField_get(cHandle))
        mapField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_mapField_get(cHandle))
        setField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_setField_get(cHandle))
        enumSetField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_enumSetField_get(cHandle))
        enumField = foobar_moveFromCType(smoke_Serialization_SerializableStruct_enumField_get(cHandle))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> SerializableStruct {
    return SerializableStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> SerializableStruct {
    defer {
        smoke_Serialization_SerializableStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: SerializableStruct) -> RefHolder {
    let c_boolField = moveToCType(swiftType.boolField)
    let c_byteField = moveToCType(swiftType.byteField)
    let c_shortField = moveToCType(swiftType.shortField)
    let c_intField = moveToCType(swiftType.intField)
    let c_longField = moveToCType(swiftType.longField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = foobar_moveToCType(swiftType.structField)
    let c_byteBufferField = moveToCType(swiftType.byteBufferField)
    let c_arrayField = foobar_moveToCType(swiftType.arrayField)
    let c_structArrayField = foobar_moveToCType(swiftType.structArrayField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    let c_setField = foobar_moveToCType(swiftType.setField)
    let c_enumSetField = foobar_moveToCType(swiftType.enumSetField)
    let c_enumField = foobar_moveToCType(swiftType.enumField)
    return RefHolder(smoke_Serialization_SerializableStruct_create_handle(c_boolField.ref, c_byteField.ref, c_shortField.ref, c_intField.ref, c_longField.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_structField.ref, c_byteBufferField.ref, c_arrayField.ref, c_structArrayField.ref, c_mapField.ref, c_setField.ref, c_enumSetField.ref, c_enumField.ref))
}
internal func foobar_moveToCType(_ swiftType: SerializableStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_Serialization_SerializableStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> SerializableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Serialization_SerializableStruct_unwrap_optional_handle(handle)
    return SerializableStruct(cHandle: unwrappedHandle) as SerializableStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> SerializableStruct? {
    defer {
        smoke_Serialization_SerializableStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: SerializableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_boolField = moveToCType(swiftType.boolField)
    let c_byteField = moveToCType(swiftType.byteField)
    let c_shortField = moveToCType(swiftType.shortField)
    let c_intField = moveToCType(swiftType.intField)
    let c_longField = moveToCType(swiftType.longField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_structField = foobar_moveToCType(swiftType.structField)
    let c_byteBufferField = moveToCType(swiftType.byteBufferField)
    let c_arrayField = foobar_moveToCType(swiftType.arrayField)
    let c_structArrayField = foobar_moveToCType(swiftType.structArrayField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    let c_setField = foobar_moveToCType(swiftType.setField)
    let c_enumSetField = foobar_moveToCType(swiftType.enumSetField)
    let c_enumField = foobar_moveToCType(swiftType.enumField)
    return RefHolder(smoke_Serialization_SerializableStruct_create_optional_handle(c_boolField.ref, c_byteField.ref, c_shortField.ref, c_intField.ref, c_longField.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_structField.ref, c_byteBufferField.ref, c_arrayField.ref, c_structArrayField.ref, c_mapField.ref, c_setField.ref, c_enumSetField.ref, c_enumField.ref))
}
internal func foobar_moveToCType(_ swiftType: SerializableStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_Serialization_SerializableStruct_release_optional_handle)
}
public struct NestedSerializableStruct: Codable {
    public var someField: String
    public init(someField: String) {
        self.someField = someField
    }
    internal init(cHandle: _baseRef) {
        someField = moveFromCType(smoke_Serialization_NestedSerializableStruct_someField_get(cHandle))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> NestedSerializableStruct {
    return NestedSerializableStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> NestedSerializableStruct {
    defer {
        smoke_Serialization_NestedSerializableStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: NestedSerializableStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_Serialization_NestedSerializableStruct_create_handle(c_someField.ref))
}
internal func foobar_moveToCType(_ swiftType: NestedSerializableStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_Serialization_NestedSerializableStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> NestedSerializableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Serialization_NestedSerializableStruct_unwrap_optional_handle(handle)
    return NestedSerializableStruct(cHandle: unwrappedHandle) as NestedSerializableStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> NestedSerializableStruct? {
    defer {
        smoke_Serialization_NestedSerializableStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: NestedSerializableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_Serialization_NestedSerializableStruct_create_optional_handle(c_someField.ref))
}
internal func foobar_moveToCType(_ swiftType: NestedSerializableStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_Serialization_NestedSerializableStruct_release_optional_handle)
}
