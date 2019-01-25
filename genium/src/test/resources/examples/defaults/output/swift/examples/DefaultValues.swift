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
    public enum SomeEnum : UInt32, CaseIterable {
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
            intField = moveFromCType(examples_DefaultValues_StructWithDefaults_intField_get(cHandle))
            floatField = moveFromCType(examples_DefaultValues_StructWithDefaults_floatField_get(cHandle))
            boolField = moveFromCType(examples_DefaultValues_StructWithDefaults_boolField_get(cHandle))
            stringField = moveFromCType(examples_DefaultValues_StructWithDefaults_stringField_get(cHandle))
            enumField = moveFromCType(examples_DefaultValues_StructWithDefaults_enumField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_intField = moveToCType(intField)
            let c_floatField = moveToCType(floatField)
            let c_boolField = moveToCType(boolField)
            let c_stringField = moveToCType(stringField)
            let c_enumField = moveToCType(enumField)
            return examples_DefaultValues_StructWithDefaults_create_handle(c_intField.ref, c_floatField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref)
        }
    }
}
extension DefaultValues: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func DefaultValuescopyFromCType(_ handle: _baseRef) -> DefaultValues {
    return DefaultValues(cDefaultValues: examples_DefaultValues_copy_handle(handle))
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
        examples_DefaultValues_StructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DefaultValues.StructWithDefaults) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: DefaultValues.StructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_DefaultValues_StructWithDefaults_release_handle)
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