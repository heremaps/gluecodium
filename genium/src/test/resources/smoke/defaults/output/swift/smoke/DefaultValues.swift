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
    init?(cDefaultValues: _baseRef) {
        guard cDefaultValues != 0 else {
            return nil
        }
        c_instance = cDefaultValues
    }
    deinit {
        smoke_DefaultValues_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32 {
        case fooValue
        case barValue
    }
    public enum ExternalEnum : UInt32 {
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
        internal init(cStructWithDefaults: _baseRef) {
            intField = smoke_DefaultValues_StructWithDefaults_intField_get(cStructWithDefaults)
            uintField = smoke_DefaultValues_StructWithDefaults_uintField_get(cStructWithDefaults)
            floatField = smoke_DefaultValues_StructWithDefaults_floatField_get(cStructWithDefaults)
            boolField = smoke_DefaultValues_StructWithDefaults_boolField_get(cStructWithDefaults)
            do {
                let stringField_handle = smoke_DefaultValues_StructWithDefaults_stringField_get(cStructWithDefaults)
                defer {
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
            enumField = DefaultValues.SomeEnum.init(rawValue: smoke_DefaultValues_StructWithDefaults_enumField_get(cStructWithDefaults))!
            externalEnumField = DefaultValues.ExternalEnum.init(rawValue: smoke_DefaultValues_StructWithDefaults_externalEnumField_get(cStructWithDefaults))!
        }
        internal func convertToCType() -> _baseRef {
            let intField_handle = intField
            let uintField_handle = uintField
            let floatField_handle = floatField
            let boolField_handle = boolField
            let stringField_handle = stringField
            let enumField_handle = enumField.rawValue
            let externalEnumField_handle = externalEnumField.rawValue
            return smoke_DefaultValues_StructWithDefaults_create_handle(intField_handle, uintField_handle, floatField_handle, boolField_handle, stringField_handle, enumField_handle, externalEnumField_handle)
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
        internal init(cStructWithSpecialDefaults: _baseRef) {
            floatNanField = smoke_DefaultValues_StructWithSpecialDefaults_floatNanField_get(cStructWithSpecialDefaults)
            floatInfinityField = smoke_DefaultValues_StructWithSpecialDefaults_floatInfinityField_get(cStructWithSpecialDefaults)
            floatNegativeInfinityField = smoke_DefaultValues_StructWithSpecialDefaults_floatNegativeInfinityField_get(cStructWithSpecialDefaults)
            doubleNanField = smoke_DefaultValues_StructWithSpecialDefaults_doubleNanField_get(cStructWithSpecialDefaults)
            doubleInfinityField = smoke_DefaultValues_StructWithSpecialDefaults_doubleInfinityField_get(cStructWithSpecialDefaults)
            doubleNegativeInfinityField = smoke_DefaultValues_StructWithSpecialDefaults_doubleNegativeInfinityField_get(cStructWithSpecialDefaults)
        }
        internal func convertToCType() -> _baseRef {
            let floatNanField_handle = floatNanField
            let floatInfinityField_handle = floatInfinityField
            let floatNegativeInfinityField_handle = floatNegativeInfinityField
            let doubleNanField_handle = doubleNanField
            let doubleInfinityField_handle = doubleInfinityField
            let doubleNegativeInfinityField_handle = doubleNegativeInfinityField
            return smoke_DefaultValues_StructWithSpecialDefaults_create_handle(floatNanField_handle, floatInfinityField_handle, floatNegativeInfinityField_handle, doubleNanField_handle, doubleInfinityField_handle, doubleNegativeInfinityField_handle)
        }
    }
    public static func processStructWithDefaults(input: DefaultValues.StructWithDefaults) -> DefaultValues.StructWithDefaults {
        let input_handle = input.convertToCType()
        defer {
            smoke_DefaultValues_StructWithDefaults_release_handle(input_handle)
        }
        let cResult = smoke_DefaultValues_processStructWithDefaults(input_handle)
        defer {
            smoke_DefaultValues_StructWithDefaults_release_handle(cResult)
        }
        return DefaultValues.StructWithDefaults(cStructWithDefaults: cResult)
    }
}
extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
