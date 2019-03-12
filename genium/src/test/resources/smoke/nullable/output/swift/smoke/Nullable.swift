//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Nullable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Nullable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Nullable_release_handle)
        : RefHolder(handle_copy)
}
public class Nullable {
    public typealias SomeArray = [String]
    public typealias SomeMap = [Int64: String]
    public var stringAttribute: String? {
        get {
            return moveFromCType(smoke_Nullable_stringAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_stringAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var boolAttribute: Bool? {
        get {
            return moveFromCType(smoke_Nullable_boolAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_boolAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var doubleAttribute: Double? {
        get {
            return moveFromCType(smoke_Nullable_doubleAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_doubleAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var intAttribute: Int64? {
        get {
            return moveFromCType(smoke_Nullable_intAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_intAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var structAttribute: Nullable.SomeStruct? {
        get {
            return moveFromCType(smoke_Nullable_structAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_structAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var enumAttribute: Nullable.SomeEnum? {
        get {
            return moveFromCType(smoke_Nullable_enumAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_enumAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var arrayAttribute: [String]? {
        get {
            return moveFromCType(smoke_Nullable_arrayAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_arrayAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var inlineArrayAttribute: [String]? {
        get {
            return moveFromCType(smoke_Nullable_inlineArrayAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_inlineArrayAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var mapAttribute: Nullable.SomeMap? {
        get {
            return moveFromCType(smoke_Nullable_mapAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_mapAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var instanceAttribute: SomeInterface? {
        get {
            return SomeInterfacemoveFromCType(smoke_Nullable_instanceAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_instanceAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cNullable: _baseRef) {
        guard cNullable != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cNullable
    }
    deinit {
        smoke_Nullable_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable {
        case on
        case off
    }
    public struct SomeStruct {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_Nullable_SomeStruct_stringField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_stringField = moveToCType(stringField)
            return smoke_Nullable_SomeStruct_create_handle(c_stringField.ref)
        }
    }
    public struct NullableStruct {
        public var stringField: String?
        public var boolField: Bool?
        public var doubleField: Double?
        public var structField: Nullable.SomeStruct?
        public var enumField: Nullable.SomeEnum?
        public var arrayField: [String]?
        public var inlineArrayField: [String]?
        public var mapField: Nullable.SomeMap?
        public var instanceField: SomeInterface?
        public init(stringField: String? = nil, boolField: Bool? = nil, doubleField: Double? = nil, structField: Nullable.SomeStruct? = nil, enumField: Nullable.SomeEnum? = nil, arrayField: [String]? = nil, inlineArrayField: [String]? = nil, mapField: Nullable.SomeMap? = nil, instanceField: SomeInterface? = nil) {
            self.stringField = stringField
            self.boolField = boolField
            self.doubleField = doubleField
            self.structField = structField
            self.enumField = enumField
            self.arrayField = arrayField
            self.inlineArrayField = inlineArrayField
            self.mapField = mapField
            self.instanceField = instanceField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_Nullable_NullableStruct_stringField_get(cHandle))
            boolField = moveFromCType(smoke_Nullable_NullableStruct_boolField_get(cHandle))
            doubleField = moveFromCType(smoke_Nullable_NullableStruct_doubleField_get(cHandle))
            structField = moveFromCType(smoke_Nullable_NullableStruct_structField_get(cHandle))
            enumField = moveFromCType(smoke_Nullable_NullableStruct_enumField_get(cHandle))
            arrayField = moveFromCType(smoke_Nullable_NullableStruct_arrayField_get(cHandle))
            inlineArrayField = moveFromCType(smoke_Nullable_NullableStruct_inlineArrayField_get(cHandle))
            mapField = moveFromCType(smoke_Nullable_NullableStruct_mapField_get(cHandle))
            instanceField = SomeInterfacemoveFromCType(smoke_Nullable_NullableStruct_instanceField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_stringField = moveToCType(stringField)
            let c_boolField = moveToCType(boolField)
            let c_doubleField = moveToCType(doubleField)
            let c_structField = moveToCType(structField)
            let c_enumField = moveToCType(enumField)
            let c_arrayField = moveToCType(arrayField)
            let c_inlineArrayField = moveToCType(inlineArrayField)
            let c_mapField = moveToCType(mapField)
            let c_instanceField = moveToCType(instanceField)
            return smoke_Nullable_NullableStruct_create_handle(c_stringField.ref, c_boolField.ref, c_doubleField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_inlineArrayField.ref, c_mapField.ref, c_instanceField.ref)
        }
    }
    public struct NullableIntsStruct {
        public var int8Field: Int8?
        public var int16Field: Int16?
        public var int32Field: Int32?
        public var int64Field: Int64?
        public var uint8Field: UInt8?
        public var uint16Field: UInt16?
        public var uint32Field: UInt32?
        public var uint64Field: UInt64?
        public init(int8Field: Int8? = nil, int16Field: Int16? = nil, int32Field: Int32? = nil, int64Field: Int64? = nil, uint8Field: UInt8? = nil, uint16Field: UInt16? = nil, uint32Field: UInt32? = nil, uint64Field: UInt64? = nil) {
            self.int8Field = int8Field
            self.int16Field = int16Field
            self.int32Field = int32Field
            self.int64Field = int64Field
            self.uint8Field = uint8Field
            self.uint16Field = uint16Field
            self.uint32Field = uint32Field
            self.uint64Field = uint64Field
        }
        internal init(cHandle: _baseRef) {
            int8Field = moveFromCType(smoke_Nullable_NullableIntsStruct_int8Field_get(cHandle))
            int16Field = moveFromCType(smoke_Nullable_NullableIntsStruct_int16Field_get(cHandle))
            int32Field = moveFromCType(smoke_Nullable_NullableIntsStruct_int32Field_get(cHandle))
            int64Field = moveFromCType(smoke_Nullable_NullableIntsStruct_int64Field_get(cHandle))
            uint8Field = moveFromCType(smoke_Nullable_NullableIntsStruct_uint8Field_get(cHandle))
            uint16Field = moveFromCType(smoke_Nullable_NullableIntsStruct_uint16Field_get(cHandle))
            uint32Field = moveFromCType(smoke_Nullable_NullableIntsStruct_uint32Field_get(cHandle))
            uint64Field = moveFromCType(smoke_Nullable_NullableIntsStruct_uint64Field_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_int8Field = moveToCType(int8Field)
            let c_int16Field = moveToCType(int16Field)
            let c_int32Field = moveToCType(int32Field)
            let c_int64Field = moveToCType(int64Field)
            let c_uint8Field = moveToCType(uint8Field)
            let c_uint16Field = moveToCType(uint16Field)
            let c_uint32Field = moveToCType(uint32Field)
            let c_uint64Field = moveToCType(uint64Field)
            return smoke_Nullable_NullableIntsStruct_create_handle(c_int8Field.ref, c_int16Field.ref, c_int32Field.ref, c_int64Field.ref, c_uint8Field.ref, c_uint16Field.ref, c_uint32Field.ref, c_uint64Field.ref)
        }
    }
    public func methodWithString(input: String?) -> String? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithString(self.c_instance, c_input.ref))
    }
    public func methodWithBoolean(input: Bool?) -> Bool? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithBoolean(self.c_instance, c_input.ref))
    }
    public func methodWithDouble(input: Double?) -> Double? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithDouble(self.c_instance, c_input.ref))
    }
    public func methodWithInt(input: Int64?) -> Int64? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithInt(self.c_instance, c_input.ref))
    }
    public func methodWithSomeStruct(input: Nullable.SomeStruct?) -> Nullable.SomeStruct? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithSomeStruct(self.c_instance, c_input.ref))
    }
    public func methodWithSomeEnum(input: Nullable.SomeEnum?) -> Nullable.SomeEnum? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithSomeEnum(self.c_instance, c_input.ref))
    }
    public func methodWithSomeArray(input: [String]?) -> [String]? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithSomeArray(self.c_instance, c_input.ref))
    }
    public func methodWithInlineArray(input: [String]?) -> [String]? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithInlineArray(self.c_instance, c_input.ref))
    }
    public func methodWithSomeMap(input: Nullable.SomeMap?) -> Nullable.SomeMap? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Nullable_methodWithSomeMap(self.c_instance, c_input.ref))
    }
    public func methodWithInstance(input: SomeInterface?) -> SomeInterface? {
        let c_input = moveToCType(input)
        return SomeInterfacemoveFromCType(smoke_Nullable_methodWithInstance(self.c_instance, c_input.ref))
    }
}
extension Nullable: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func NullablecopyFromCType(_ handle: _baseRef) -> Nullable {
    return Nullable(cNullable: smoke_Nullable_copy_handle(handle))
}
internal func NullablemoveFromCType(_ handle: _baseRef) -> Nullable {
    return Nullable(cNullable: handle)
}
internal func NullablecopyFromCType(_ handle: _baseRef) -> Nullable? {
    guard handle != 0 else {
        return nil
    }
    return NullablemoveFromCType(handle) as Nullable
}
internal func NullablemoveFromCType(_ handle: _baseRef) -> Nullable? {
    guard handle != 0 else {
        return nil
    }
    return NullablemoveFromCType(handle) as Nullable
}
internal func copyToCType(_ swiftClass: Nullable) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Nullable) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Nullable?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Nullable?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.SomeStruct {
    return Nullable.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.SomeStruct {
    defer {
        smoke_Nullable_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Nullable.SomeStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Nullable.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Nullable_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Nullable_SomeStruct_unwrap_optional_handle(handle)
    return Nullable.SomeStruct(cHandle: unwrappedHandle) as Nullable.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.SomeStruct? {
    defer {
        smoke_Nullable_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Nullable.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Nullable_SomeStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Nullable.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Nullable_SomeStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.NullableStruct {
    return Nullable.NullableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.NullableStruct {
    defer {
        smoke_Nullable_NullableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Nullable.NullableStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Nullable.NullableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Nullable_NullableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.NullableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Nullable_NullableStruct_unwrap_optional_handle(handle)
    return Nullable.NullableStruct(cHandle: unwrappedHandle) as Nullable.NullableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.NullableStruct? {
    defer {
        smoke_Nullable_NullableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Nullable.NullableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Nullable_NullableStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Nullable.NullableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Nullable_NullableStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.NullableIntsStruct {
    return Nullable.NullableIntsStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.NullableIntsStruct {
    defer {
        smoke_Nullable_NullableIntsStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Nullable.NullableIntsStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Nullable.NullableIntsStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Nullable_NullableIntsStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.NullableIntsStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Nullable_NullableIntsStruct_unwrap_optional_handle(handle)
    return Nullable.NullableIntsStruct(cHandle: unwrappedHandle) as Nullable.NullableIntsStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.NullableIntsStruct? {
    defer {
        smoke_Nullable_NullableIntsStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Nullable.NullableIntsStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Nullable_NullableIntsStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Nullable.NullableIntsStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Nullable_NullableIntsStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Nullable.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Nullable.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Nullable.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Nullable.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Nullable.SomeEnum {
    return Nullable.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Nullable.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Nullable.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return Nullable.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Nullable.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
