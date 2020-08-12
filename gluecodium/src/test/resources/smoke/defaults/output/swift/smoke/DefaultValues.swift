//
//
import Foundation
public class DefaultValues {
    public typealias LongTypedef = Int64
    public typealias BooleanTypedef = Bool
    public typealias StringTypedef = String
    public typealias EnumTypedef = DefaultValues.SomeEnum
    public typealias FloatArray = [Float]
    public typealias IdToStringMap = [UInt32: String]
    public typealias StringSet = Set<String>
    let c_instance : _baseRef
    init(cDefaultValues: _baseRef) {
        guard cDefaultValues != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDefaultValues
    }
    deinit {
        smoke_DefaultValues_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DefaultValues_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable, Codable {
        case fooValue
        case barValue
    }
    public enum ExternalEnum : UInt32, CaseIterable, Codable {
        case oneValue
        case anotherValue
    }
    public struct StructWithDefaults {
        public var intField: Int32
        public var uintField: UInt32
        public var floatField: Float
        public var doubleField: Double
        public var boolField: Bool
        public var stringField: String
        public var enumField: DefaultValues.SomeEnum
        public var externalEnumField: DefaultValues.ExternalEnum
        public init(intField: Int32 = 42, uintField: UInt32 = 4294967295, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool = true, stringField: String = "\\Jonny \"Magic\" Smith\n", enumField: DefaultValues.SomeEnum = DefaultValues.SomeEnum.barValue, externalEnumField: DefaultValues.ExternalEnum = DefaultValues.ExternalEnum.anotherValue) {
            self.intField = intField
            self.uintField = uintField
            self.floatField = floatField
            self.doubleField = doubleField
            self.boolField = boolField
            self.stringField = stringField
            self.enumField = enumField
            self.externalEnumField = externalEnumField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_DefaultValues_StructWithDefaults_intField_get(cHandle))
            uintField = moveFromCType(smoke_DefaultValues_StructWithDefaults_uintField_get(cHandle))
            floatField = moveFromCType(smoke_DefaultValues_StructWithDefaults_floatField_get(cHandle))
            doubleField = moveFromCType(smoke_DefaultValues_StructWithDefaults_doubleField_get(cHandle))
            boolField = moveFromCType(smoke_DefaultValues_StructWithDefaults_boolField_get(cHandle))
            stringField = moveFromCType(smoke_DefaultValues_StructWithDefaults_stringField_get(cHandle))
            enumField = moveFromCType(smoke_DefaultValues_StructWithDefaults_enumField_get(cHandle))
            externalEnumField = moveFromCType(smoke_DefaultValues_StructWithDefaults_externalEnumField_get(cHandle))
        }
    }
    public struct NullableStructWithDefaults {
        public var intField: Int32?
        public var uintField: UInt32?
        public var floatField: Float?
        public var boolField: Bool?
        public var stringField: String?
        public var enumField: DefaultValues.SomeEnum?
        public init(intField: Int32? = nil, uintField: UInt32? = nil, floatField: Float? = nil, boolField: Bool? = nil, stringField: String? = nil, enumField: DefaultValues.SomeEnum? = nil) {
            self.intField = intField
            self.uintField = uintField
            self.floatField = floatField
            self.boolField = boolField
            self.stringField = stringField
            self.enumField = enumField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_DefaultValues_NullableStructWithDefaults_intField_get(cHandle))
            uintField = moveFromCType(smoke_DefaultValues_NullableStructWithDefaults_uintField_get(cHandle))
            floatField = moveFromCType(smoke_DefaultValues_NullableStructWithDefaults_floatField_get(cHandle))
            boolField = moveFromCType(smoke_DefaultValues_NullableStructWithDefaults_boolField_get(cHandle))
            stringField = moveFromCType(smoke_DefaultValues_NullableStructWithDefaults_stringField_get(cHandle))
            enumField = moveFromCType(smoke_DefaultValues_NullableStructWithDefaults_enumField_get(cHandle))
        }
    }
    public struct StructWithSpecialDefaults {
        public var floatNanField: Float
        public var floatInfinityField: Float
        public var floatNegativeInfinityField: Float
        public var doubleNanField: Double
        public var doubleInfinityField: Double
        public var doubleNegativeInfinityField: Double
        public init(floatNanField: Float = Float.nan, floatInfinityField: Float = Float.infinity, floatNegativeInfinityField: Float = -Float.infinity, doubleNanField: Double = Double.nan, doubleInfinityField: Double = Double.infinity, doubleNegativeInfinityField: Double = -Double.infinity) {
            self.floatNanField = floatNanField
            self.floatInfinityField = floatInfinityField
            self.floatNegativeInfinityField = floatNegativeInfinityField
            self.doubleNanField = doubleNanField
            self.doubleInfinityField = doubleInfinityField
            self.doubleNegativeInfinityField = doubleNegativeInfinityField
        }
        internal init(cHandle: _baseRef) {
            floatNanField = moveFromCType(smoke_DefaultValues_StructWithSpecialDefaults_floatNanField_get(cHandle))
            floatInfinityField = moveFromCType(smoke_DefaultValues_StructWithSpecialDefaults_floatInfinityField_get(cHandle))
            floatNegativeInfinityField = moveFromCType(smoke_DefaultValues_StructWithSpecialDefaults_floatNegativeInfinityField_get(cHandle))
            doubleNanField = moveFromCType(smoke_DefaultValues_StructWithSpecialDefaults_doubleNanField_get(cHandle))
            doubleInfinityField = moveFromCType(smoke_DefaultValues_StructWithSpecialDefaults_doubleInfinityField_get(cHandle))
            doubleNegativeInfinityField = moveFromCType(smoke_DefaultValues_StructWithSpecialDefaults_doubleNegativeInfinityField_get(cHandle))
        }
    }
    public struct StructWithEmptyDefaults {
        public var intsField: [Int32]
        public var floatsField: DefaultValues.FloatArray
        public var mapField: DefaultValues.IdToStringMap
        public var structField: DefaultValues.StructWithDefaults
        public var setTypeField: DefaultValues.StringSet
        public init(intsField: [Int32] = [], floatsField: DefaultValues.FloatArray = [], mapField: DefaultValues.IdToStringMap = [:], structField: DefaultValues.StructWithDefaults = DefaultValues.StructWithDefaults(), setTypeField: DefaultValues.StringSet = []) {
            self.intsField = intsField
            self.floatsField = floatsField
            self.mapField = mapField
            self.structField = structField
            self.setTypeField = setTypeField
        }
        internal init(cHandle: _baseRef) {
            intsField = moveFromCType(smoke_DefaultValues_StructWithEmptyDefaults_intsField_get(cHandle))
            floatsField = moveFromCType(smoke_DefaultValues_StructWithEmptyDefaults_floatsField_get(cHandle))
            mapField = moveFromCType(smoke_DefaultValues_StructWithEmptyDefaults_mapField_get(cHandle))
            structField = moveFromCType(smoke_DefaultValues_StructWithEmptyDefaults_structField_get(cHandle))
            setTypeField = moveFromCType(smoke_DefaultValues_StructWithEmptyDefaults_setTypeField_get(cHandle))
        }
    }
    public struct StructWithTypedefDefaults {
        public var longField: DefaultValues.LongTypedef
        public var boolField: DefaultValues.BooleanTypedef
        public var stringField: DefaultValues.StringTypedef
        public var enumField: DefaultValues.EnumTypedef
        public init(longField: DefaultValues.LongTypedef = 42, boolField: DefaultValues.BooleanTypedef = true, stringField: DefaultValues.StringTypedef = "\\Jonny \"Magic\" Smith\n", enumField: DefaultValues.EnumTypedef = DefaultValues.EnumTypedef.barValue) {
            self.longField = longField
            self.boolField = boolField
            self.stringField = stringField
            self.enumField = enumField
        }
        internal init(cHandle: _baseRef) {
            longField = moveFromCType(smoke_DefaultValues_StructWithTypedefDefaults_longField_get(cHandle))
            boolField = moveFromCType(smoke_DefaultValues_StructWithTypedefDefaults_boolField_get(cHandle))
            stringField = moveFromCType(smoke_DefaultValues_StructWithTypedefDefaults_stringField_get(cHandle))
            enumField = moveFromCType(smoke_DefaultValues_StructWithTypedefDefaults_enumField_get(cHandle))
        }
    }
    public static func processStructWithDefaults(input: DefaultValues.StructWithDefaults) -> DefaultValues.StructWithDefaults {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_DefaultValues_processStructWithDefaults(c_input.ref))
    }
}
internal func getRef(_ ref: DefaultValues?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DefaultValues_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DefaultValues_release_handle)
        : RefHolder(handle_copy)
}
extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func DefaultValues_copyFromCType(_ handle: _baseRef) -> DefaultValues {
    if let swift_pointer = smoke_DefaultValues_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DefaultValues {
        return re_constructed
    }
    let result = DefaultValues(cDefaultValues: smoke_DefaultValues_copy_handle(handle))
    smoke_DefaultValues_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DefaultValues_moveFromCType(_ handle: _baseRef) -> DefaultValues {
    if let swift_pointer = smoke_DefaultValues_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DefaultValues {
        smoke_DefaultValues_release_handle(handle)
        return re_constructed
    }
    let result = DefaultValues(cDefaultValues: handle)
    smoke_DefaultValues_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DefaultValues_copyFromCType(_ handle: _baseRef) -> DefaultValues? {
    guard handle != 0 else {
        return nil
    }
    return DefaultValues_moveFromCType(handle) as DefaultValues
}
internal func DefaultValues_moveFromCType(_ handle: _baseRef) -> DefaultValues? {
    guard handle != 0 else {
        return nil
    }
    return DefaultValues_moveFromCType(handle) as DefaultValues
}
internal func copyToCType(_ swiftClass: DefaultValues) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DefaultValues) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DefaultValues?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DefaultValues?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithDefaults {
    return DefaultValues.StructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithDefaults {
    defer {
        smoke_DefaultValues_StructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithDefaults) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_externalEnumField = moveToCType(swiftType.externalEnumField)
    return RefHolder(smoke_DefaultValues_StructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref, c_externalEnumField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DefaultValues_StructWithDefaults_unwrap_optional_handle(handle)
    return DefaultValues.StructWithDefaults(cHandle: unwrappedHandle) as DefaultValues.StructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithDefaults? {
    defer {
        smoke_DefaultValues_StructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_enumField = moveToCType(swiftType.enumField)
    let c_externalEnumField = moveToCType(swiftType.externalEnumField)
    return RefHolder(smoke_DefaultValues_StructWithDefaults_create_optional_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref, c_externalEnumField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithDefaults_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.NullableStructWithDefaults {
    return DefaultValues.NullableStructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.NullableStructWithDefaults {
    defer {
        smoke_DefaultValues_NullableStructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.NullableStructWithDefaults) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_DefaultValues_NullableStructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.NullableStructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_NullableStructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.NullableStructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DefaultValues_NullableStructWithDefaults_unwrap_optional_handle(handle)
    return DefaultValues.NullableStructWithDefaults(cHandle: unwrappedHandle) as DefaultValues.NullableStructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.NullableStructWithDefaults? {
    defer {
        smoke_DefaultValues_NullableStructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.NullableStructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_DefaultValues_NullableStructWithDefaults_create_optional_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.NullableStructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_NullableStructWithDefaults_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithSpecialDefaults {
    return DefaultValues.StructWithSpecialDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithSpecialDefaults {
    defer {
        smoke_DefaultValues_StructWithSpecialDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithSpecialDefaults) -> RefHolder {
    let c_floatNanField = moveToCType(swiftType.floatNanField)
    let c_floatInfinityField = moveToCType(swiftType.floatInfinityField)
    let c_floatNegativeInfinityField = moveToCType(swiftType.floatNegativeInfinityField)
    let c_doubleNanField = moveToCType(swiftType.doubleNanField)
    let c_doubleInfinityField = moveToCType(swiftType.doubleInfinityField)
    let c_doubleNegativeInfinityField = moveToCType(swiftType.doubleNegativeInfinityField)
    return RefHolder(smoke_DefaultValues_StructWithSpecialDefaults_create_handle(c_floatNanField.ref, c_floatInfinityField.ref, c_floatNegativeInfinityField.ref, c_doubleNanField.ref, c_doubleInfinityField.ref, c_doubleNegativeInfinityField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithSpecialDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithSpecialDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithSpecialDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DefaultValues_StructWithSpecialDefaults_unwrap_optional_handle(handle)
    return DefaultValues.StructWithSpecialDefaults(cHandle: unwrappedHandle) as DefaultValues.StructWithSpecialDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithSpecialDefaults? {
    defer {
        smoke_DefaultValues_StructWithSpecialDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithSpecialDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_floatNanField = moveToCType(swiftType.floatNanField)
    let c_floatInfinityField = moveToCType(swiftType.floatInfinityField)
    let c_floatNegativeInfinityField = moveToCType(swiftType.floatNegativeInfinityField)
    let c_doubleNanField = moveToCType(swiftType.doubleNanField)
    let c_doubleInfinityField = moveToCType(swiftType.doubleInfinityField)
    let c_doubleNegativeInfinityField = moveToCType(swiftType.doubleNegativeInfinityField)
    return RefHolder(smoke_DefaultValues_StructWithSpecialDefaults_create_optional_handle(c_floatNanField.ref, c_floatInfinityField.ref, c_floatNegativeInfinityField.ref, c_doubleNanField.ref, c_doubleInfinityField.ref, c_doubleNegativeInfinityField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithSpecialDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithSpecialDefaults_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithEmptyDefaults {
    return DefaultValues.StructWithEmptyDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithEmptyDefaults {
    defer {
        smoke_DefaultValues_StructWithEmptyDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithEmptyDefaults) -> RefHolder {
    let c_intsField = moveToCType(swiftType.intsField)
    let c_floatsField = moveToCType(swiftType.floatsField)
    let c_mapField = moveToCType(swiftType.mapField)
    let c_structField = moveToCType(swiftType.structField)
    let c_setTypeField = moveToCType(swiftType.setTypeField)
    return RefHolder(smoke_DefaultValues_StructWithEmptyDefaults_create_handle(c_intsField.ref, c_floatsField.ref, c_mapField.ref, c_structField.ref, c_setTypeField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithEmptyDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithEmptyDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithEmptyDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DefaultValues_StructWithEmptyDefaults_unwrap_optional_handle(handle)
    return DefaultValues.StructWithEmptyDefaults(cHandle: unwrappedHandle) as DefaultValues.StructWithEmptyDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithEmptyDefaults? {
    defer {
        smoke_DefaultValues_StructWithEmptyDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithEmptyDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intsField = moveToCType(swiftType.intsField)
    let c_floatsField = moveToCType(swiftType.floatsField)
    let c_mapField = moveToCType(swiftType.mapField)
    let c_structField = moveToCType(swiftType.structField)
    let c_setTypeField = moveToCType(swiftType.setTypeField)
    return RefHolder(smoke_DefaultValues_StructWithEmptyDefaults_create_optional_handle(c_intsField.ref, c_floatsField.ref, c_mapField.ref, c_structField.ref, c_setTypeField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithEmptyDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithEmptyDefaults_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithTypedefDefaults {
    return DefaultValues.StructWithTypedefDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithTypedefDefaults {
    defer {
        smoke_DefaultValues_StructWithTypedefDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithTypedefDefaults) -> RefHolder {
    let c_longField = moveToCType(swiftType.longField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_DefaultValues_StructWithTypedefDefaults_create_handle(c_longField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithTypedefDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithTypedefDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithTypedefDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DefaultValues_StructWithTypedefDefaults_unwrap_optional_handle(handle)
    return DefaultValues.StructWithTypedefDefaults(cHandle: unwrappedHandle) as DefaultValues.StructWithTypedefDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithTypedefDefaults? {
    defer {
        smoke_DefaultValues_StructWithTypedefDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithTypedefDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_longField = moveToCType(swiftType.longField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_DefaultValues_StructWithTypedefDefaults_create_optional_handle(c_longField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref))
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithTypedefDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithTypedefDefaults_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: DefaultValues.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: DefaultValues.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: DefaultValues.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: DefaultValues.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> DefaultValues.SomeEnum {
    return DefaultValues.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> DefaultValues.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return DefaultValues.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftEnum: DefaultValues.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: DefaultValues.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: DefaultValues.ExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: DefaultValues.ExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> DefaultValues.ExternalEnum {
    return DefaultValues.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> DefaultValues.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.ExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return DefaultValues.ExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.ExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
