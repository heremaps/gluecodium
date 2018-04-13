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

        internal init?(cStructWithDefaults: _baseRef) {
            intField = examples_DefaultValues_StructWithDefaults_intField_get(cStructWithDefaults)
            floatField = examples_DefaultValues_StructWithDefaults_floatField_get(cStructWithDefaults)
            boolField = examples_DefaultValues_StructWithDefaults_boolField_get(cStructWithDefaults)
            do {
                let stringFieldHandle = examples_DefaultValues_StructWithDefaults_stringField_get(cStructWithDefaults)
                defer {
                    std_string_release(stringFieldHandle)
                }
                stringField = String(cString: std_string_data_get(stringFieldHandle))
            }
            enumField = DefaultValues.SomeEnum.init(rawValue: examples_DefaultValues_StructWithDefaults_enumField_get(cStructWithDefaults))!
        }

        internal func convertToCType() -> _baseRef {
            let result = examples_DefaultValues_StructWithDefaults_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cStructWithDefaults: _baseRef) -> Void {
            examples_DefaultValues_StructWithDefaults_intField_set(cStructWithDefaults, intField)
            examples_DefaultValues_StructWithDefaults_floatField_set(cStructWithDefaults, floatField)
            examples_DefaultValues_StructWithDefaults_boolField_set(cStructWithDefaults, boolField)
            examples_DefaultValues_StructWithDefaults_stringField_set(cStructWithDefaults, stringField)
            examples_DefaultValues_StructWithDefaults_enumField_set(cStructWithDefaults, enumField.rawValue)
        }
    }

}

extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
