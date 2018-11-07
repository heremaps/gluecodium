//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: DefaultValues?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class DefaultValues {
    let c_instance : _baseRef
    public init?(cDefaultValues: _baseRef) {
        guard cDefaultValues != 0 else {
            return nil
        }
        c_instance = cDefaultValues
    }
    deinit {
        smoke_DefaultValues_release(c_instance)
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
                    std_string_release(stringField_handle)
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
            return smoke_DefaultValues_StructWithDefaults_create(intField_handle, uintField_handle, floatField_handle, boolField_handle, stringField_handle, enumField_handle, externalEnumField_handle)
        }
    }
    public static func processStructWithDefaults(input: DefaultValues.StructWithDefaults) -> DefaultValues.StructWithDefaults {
        let input_handle = input.convertToCType()
        defer {
            smoke_DefaultValues_StructWithDefaults_release(input_handle)
        }
        let cResult = smoke_DefaultValues_processStructWithDefaults(input_handle)
        defer {
            smoke_DefaultValues_StructWithDefaults_release(cResult)
        }
        return DefaultValues.StructWithDefaults(cStructWithDefaults: cResult)
    }
}
extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
