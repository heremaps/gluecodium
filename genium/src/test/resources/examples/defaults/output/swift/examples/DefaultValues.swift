//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: DefaultValues?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
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
        examples_DefaultValues_release(c_instance)
    }
    public enum SomeEnum : UInt32 {

        case fooValue

        case barValue
    }

    public struct StructWithDefaults {
        public var intField: Int32
        public var floatField: Float
        public var boolField: Bool
        public var stringField: String
        public var enumField: DefaultValues.SomeEnum

        public init(intField: Int32 = 42, floatField: Float = 3.14, boolField: Bool = true, stringField: String = "some string", enumField: DefaultValues.SomeEnum = DefaultValues.SomeEnum.barValue) {
            self.intField = intField
            self.floatField = floatField
            self.boolField = boolField
            self.stringField = stringField
            self.enumField = enumField
        }

        internal init(cStructWithDefaults: _baseRef) {
            intField = examples_DefaultValues_StructWithDefaults_intField_get(cStructWithDefaults)
            floatField = examples_DefaultValues_StructWithDefaults_floatField_get(cStructWithDefaults)
            boolField = examples_DefaultValues_StructWithDefaults_boolField_get(cStructWithDefaults)
            do {
                let stringField_handle = examples_DefaultValues_StructWithDefaults_stringField_get(cStructWithDefaults)
                defer {
                    std_string_release(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
            enumField = DefaultValues.SomeEnum.init(rawValue: examples_DefaultValues_StructWithDefaults_enumField_get(cStructWithDefaults))!
        }

        internal func convertToCType() -> _baseRef {
            let intField_handle = intField
            let floatField_handle = floatField
            let boolField_handle = boolField
            let stringField_handle = stringField
            let enumField_handle = enumField.rawValue
            return examples_DefaultValues_StructWithDefaults_create(intField_handle, floatField_handle, boolField_handle, stringField_handle, enumField_handle)
        }
    }

}

extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
