//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: DefaultValues?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_DefaultValues_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_DefaultValues_release_handle)
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
        examples_DefaultValues_release_handle(c_instance)
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
        internal init(cHandle: _baseRef) {
            intField = examples_DefaultValues_StructWithDefaults_intField_get(cHandle)
            floatField = examples_DefaultValues_StructWithDefaults_floatField_get(cHandle)
            boolField = examples_DefaultValues_StructWithDefaults_boolField_get(cHandle)
            do {
                let stringField_handle = examples_DefaultValues_StructWithDefaults_stringField_get(cHandle)
                defer {
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
            enumField = DefaultValues.SomeEnum.init(rawValue: examples_DefaultValues_StructWithDefaults_enumField_get(cHandle))!
        }
        internal func convertToCType() -> _baseRef {
            let intField_handle = intField
            let floatField_handle = floatField
            let boolField_handle = boolField
            let stringField_handle = stringField
            let enumField_handle = enumField.rawValue
            return examples_DefaultValues_StructWithDefaults_create_handle(intField_handle, floatField_handle, boolField_handle, stringField_handle, enumField_handle)
        }
    }
}
extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func copyFromCType(_ handle: _baseRef) -> DefaultValues.StructWithDefaults {
    return DefaultValues.StructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DefaultValues.StructWithDefaults {
    defer {
        examples_DefaultValues_StructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ cValue: UInt32) -> DefaultValues.SomeEnum {
    return DefaultValues.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> DefaultValues.SomeEnum {
    return copyFromCType(cValue)
}