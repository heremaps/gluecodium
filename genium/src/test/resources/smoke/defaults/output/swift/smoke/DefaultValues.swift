//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: DefaultValues?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DefaultValues_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DefaultValues_release_handle)
        : RefHolder(handle_copy)
}
public class DefaultValues {
    let c_instance : _baseRef
    init(cDefaultValues: _baseRef) {
        guard cDefaultValues != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDefaultValues
    }
    deinit {
        smoke_DefaultValues_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable {
        case fooValue
        case barValue
    }
    public enum ExternalEnum : UInt32, CaseIterable {
        case oneValue
        case anotherValue
    }
    public struct StructWithDefaults {
        public var intField: Int32
        public var uintField: UInt32
        public var floatField: Float
        public var boolField: Bool
        public var stringField: String
        public var enumField: DefaultValues.SomeEnum
        public var externalEnumField: DefaultValues.ExternalEnum
        public init(intField: Int32 = 42, uintField: UInt32 = 4294967295, floatField: Float = 3.14, boolField: Bool = true, stringField: String = "\\Jonny \"Magic\" Smith\n", enumField: DefaultValues.SomeEnum = DefaultValues.SomeEnum.barValue, externalEnumField: DefaultValues.ExternalEnum = DefaultValues.ExternalEnum.anotherValue) {
            self.intField = intField
            self.uintField = uintField
            self.floatField = floatField
            self.boolField = boolField
            self.stringField = stringField
            self.enumField = enumField
            self.externalEnumField = externalEnumField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_DefaultValues_StructWithDefaults_intField_get(cHandle))
            uintField = moveFromCType(smoke_DefaultValues_StructWithDefaults_uintField_get(cHandle))
            floatField = moveFromCType(smoke_DefaultValues_StructWithDefaults_floatField_get(cHandle))
            boolField = moveFromCType(smoke_DefaultValues_StructWithDefaults_boolField_get(cHandle))
            stringField = moveFromCType(smoke_DefaultValues_StructWithDefaults_stringField_get(cHandle))
            enumField = moveFromCType(smoke_DefaultValues_StructWithDefaults_enumField_get(cHandle))
            externalEnumField = moveFromCType(smoke_DefaultValues_StructWithDefaults_externalEnumField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_intField = moveToCType(intField)
            let c_uintField = moveToCType(uintField)
            let c_floatField = moveToCType(floatField)
            let c_boolField = moveToCType(boolField)
            let c_stringField = moveToCType(stringField)
            let c_enumField = moveToCType(enumField)
            let c_externalEnumField = moveToCType(externalEnumField)
            return smoke_DefaultValues_StructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref, c_externalEnumField.ref)
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
        internal func convertToCType() -> _baseRef {
            let c_floatNanField = moveToCType(floatNanField)
            let c_floatInfinityField = moveToCType(floatInfinityField)
            let c_floatNegativeInfinityField = moveToCType(floatNegativeInfinityField)
            let c_doubleNanField = moveToCType(doubleNanField)
            let c_doubleInfinityField = moveToCType(doubleInfinityField)
            let c_doubleNegativeInfinityField = moveToCType(doubleNegativeInfinityField)
            return smoke_DefaultValues_StructWithSpecialDefaults_create_handle(c_floatNanField.ref, c_floatInfinityField.ref, c_floatNegativeInfinityField.ref, c_doubleNanField.ref, c_doubleInfinityField.ref, c_doubleNegativeInfinityField.ref)
        }
    }
    public static func processStructWithDefaults(input: DefaultValues.StructWithDefaults) -> DefaultValues.StructWithDefaults {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_DefaultValues_processStructWithDefaults(c_input.ref))
    }
}
extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func DefaultValuescopyFromCType(_ handle: _baseRef) -> DefaultValues {
    return DefaultValues(cDefaultValues: smoke_DefaultValues_copy_handle(handle))
}
internal func DefaultValuesmoveFromCType(_ handle: _baseRef) -> DefaultValues {
    return DefaultValues(cDefaultValues: handle)
}
internal func DefaultValuescopyFromCType(_ handle: _baseRef) -> DefaultValues? {
    guard handle != 0 else {
        return nil
    }
    return DefaultValuesmoveFromCType(handle) as DefaultValues
}
internal func DefaultValuesmoveFromCType(_ handle: _baseRef) -> DefaultValues? {
    guard handle != 0 else {
        return nil
    }
    return DefaultValuesmoveFromCType(handle) as DefaultValues
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
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithDefaults_release_handle)
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
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithSpecialDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DefaultValues_StructWithSpecialDefaults_release_handle)
}
internal func copyFromCType(_ cValue: UInt32) -> DefaultValues.SomeEnum {
    return DefaultValues.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> DefaultValues.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: DefaultValues.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: DefaultValues.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}
internal func copyFromCType(_ cValue: UInt32) -> DefaultValues.ExternalEnum {
    return DefaultValues.ExternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> DefaultValues.ExternalEnum {
    return copyFromCType(cValue)
}
internal func copyToCType(_ swiftType: DefaultValues.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftType.rawValue)
}
internal func moveToCType(_ swiftType: DefaultValues.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftType)
}