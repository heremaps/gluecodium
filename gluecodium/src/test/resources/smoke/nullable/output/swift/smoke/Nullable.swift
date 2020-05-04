//
//
import Foundation
public class Nullable {
    public typealias SomeArray = [String]
    public typealias SomeMap = [Int64: String]
    public var stringProperty: String? {
        get {
            return moveFromCType(smoke_Nullable_stringProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_stringProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var isBoolProperty: Bool? {
        get {
            return moveFromCType(smoke_Nullable_boolProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_boolProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var doubleProperty: Double? {
        get {
            return moveFromCType(smoke_Nullable_doubleProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_doubleProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var intProperty: Int64? {
        get {
            return moveFromCType(smoke_Nullable_intProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_intProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var structProperty: Nullable.SomeStruct? {
        get {
            return moveFromCType(smoke_Nullable_structProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_structProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var enumProperty: Nullable.SomeEnum? {
        get {
            return moveFromCType(smoke_Nullable_enumProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_enumProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var arrayProperty: Nullable.SomeArray? {
        get {
            return moveFromCType(smoke_Nullable_arrayProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_arrayProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var inlineArrayProperty: [String]? {
        get {
            return moveFromCType(smoke_Nullable_inlineArrayProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_inlineArrayProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var mapProperty: Nullable.SomeMap? {
        get {
            return moveFromCType(smoke_Nullable_mapProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_mapProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var instanceProperty: SomeInterface? {
        get {
            return SomeInterface_moveFromCType(smoke_Nullable_instanceProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Nullable_instanceProperty_set(self.c_instance, c_newValue.ref))
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
        smoke_Nullable_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Nullable_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable, Codable {
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
    }
    public struct NullableStruct {
        public var stringField: String?
        public var boolField: Bool?
        public var doubleField: Double?
        public var structField: Nullable.SomeStruct?
        public var enumField: Nullable.SomeEnum?
        public var arrayField: Nullable.SomeArray?
        public var inlineArrayField: [String]?
        public var mapField: Nullable.SomeMap?
        public var instanceField: SomeInterface?
        public init(stringField: String? = nil, boolField: Bool? = nil, doubleField: Double? = nil, structField: Nullable.SomeStruct? = nil, enumField: Nullable.SomeEnum? = nil, arrayField: Nullable.SomeArray? = nil, inlineArrayField: [String]? = nil, mapField: Nullable.SomeMap? = nil, instanceField: SomeInterface? = nil) {
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
            instanceField = SomeInterface_moveFromCType(smoke_Nullable_NullableStruct_instanceField_get(cHandle))
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
    public func methodWithSomeArray(input: Nullable.SomeArray?) -> Nullable.SomeArray? {
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
        return SomeInterface_moveFromCType(smoke_Nullable_methodWithInstance(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: Nullable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Nullable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Nullable_release_handle)
        : RefHolder(handle_copy)
}
extension Nullable: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Nullable_copyFromCType(_ handle: _baseRef) -> Nullable {
    if let swift_pointer = smoke_Nullable_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Nullable {
        return re_constructed
    }
    let result = Nullable(cNullable: smoke_Nullable_copy_handle(handle))
    smoke_Nullable_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Nullable_moveFromCType(_ handle: _baseRef) -> Nullable {
    if let swift_pointer = smoke_Nullable_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Nullable {
        return re_constructed
    }
    let result = Nullable(cNullable: handle)
    smoke_Nullable_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Nullable_copyFromCType(_ handle: _baseRef) -> Nullable? {
    guard handle != 0 else {
        return nil
    }
    return Nullable_moveFromCType(handle) as Nullable
}
internal func Nullable_moveFromCType(_ handle: _baseRef) -> Nullable? {
    guard handle != 0 else {
        return nil
    }
    return Nullable_moveFromCType(handle) as Nullable
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
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_Nullable_SomeStruct_create_handle(c_stringField.ref))
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
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_Nullable_SomeStruct_create_optional_handle(c_stringField.ref))
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
    let c_stringField = moveToCType(swiftType.stringField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = moveToCType(swiftType.arrayField)
    let c_inlineArrayField = moveToCType(swiftType.inlineArrayField)
    let c_mapField = moveToCType(swiftType.mapField)
    let c_instanceField = moveToCType(swiftType.instanceField)
    return RefHolder(smoke_Nullable_NullableStruct_create_handle(c_stringField.ref, c_boolField.ref, c_doubleField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_inlineArrayField.ref, c_mapField.ref, c_instanceField.ref))
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
    let c_stringField = moveToCType(swiftType.stringField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_structField = moveToCType(swiftType.structField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_arrayField = moveToCType(swiftType.arrayField)
    let c_inlineArrayField = moveToCType(swiftType.inlineArrayField)
    let c_mapField = moveToCType(swiftType.mapField)
    let c_instanceField = moveToCType(swiftType.instanceField)
    return RefHolder(smoke_Nullable_NullableStruct_create_optional_handle(c_stringField.ref, c_boolField.ref, c_doubleField.ref, c_structField.ref, c_enumField.ref, c_arrayField.ref, c_inlineArrayField.ref, c_mapField.ref, c_instanceField.ref))
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
    let c_int8Field = moveToCType(swiftType.int8Field)
    let c_int16Field = moveToCType(swiftType.int16Field)
    let c_int32Field = moveToCType(swiftType.int32Field)
    let c_int64Field = moveToCType(swiftType.int64Field)
    let c_uint8Field = moveToCType(swiftType.uint8Field)
    let c_uint16Field = moveToCType(swiftType.uint16Field)
    let c_uint32Field = moveToCType(swiftType.uint32Field)
    let c_uint64Field = moveToCType(swiftType.uint64Field)
    return RefHolder(smoke_Nullable_NullableIntsStruct_create_handle(c_int8Field.ref, c_int16Field.ref, c_int32Field.ref, c_int64Field.ref, c_uint8Field.ref, c_uint16Field.ref, c_uint32Field.ref, c_uint64Field.ref))
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
    let c_int8Field = moveToCType(swiftType.int8Field)
    let c_int16Field = moveToCType(swiftType.int16Field)
    let c_int32Field = moveToCType(swiftType.int32Field)
    let c_int64Field = moveToCType(swiftType.int64Field)
    let c_uint8Field = moveToCType(swiftType.uint8Field)
    let c_uint16Field = moveToCType(swiftType.uint16Field)
    let c_uint32Field = moveToCType(swiftType.uint32Field)
    let c_uint64Field = moveToCType(swiftType.uint64Field)
    return RefHolder(smoke_Nullable_NullableIntsStruct_create_optional_handle(c_int8Field.ref, c_int16Field.ref, c_int32Field.ref, c_int64Field.ref, c_uint8Field.ref, c_uint16Field.ref, c_uint32Field.ref, c_uint64Field.ref))
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
