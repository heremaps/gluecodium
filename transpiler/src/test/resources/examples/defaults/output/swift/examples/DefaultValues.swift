//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: DefaultValues) -> RefHolder<examples_DefaultValuesRef> {
    return RefHolder<examples_DefaultValuesRef>(ref.c_instance)
}

public class DefaultValues {
    let c_instance : examples_DefaultValuesRef

    public required init?(cDefaultValues: examples_DefaultValuesRef) {
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

        internal init?(cStructWithDefaults: examples_DefaultValues_StructWithDefaultsRef) {
            intField = examples_DefaultValues_StructWithDefaults_intField_get(cStructWithDefaults)
            floatField = examples_DefaultValues_StructWithDefaults_floatField_get(cStructWithDefaults)
            boolField = examples_DefaultValues_StructWithDefaults_boolField_get(cStructWithDefaults)
            do {
                let stringFieldHandle = examples_DefaultValues_StructWithDefaults_stringField_get(cStructWithDefaults)
                stringField = String(cString:std_string_data_get(stringFieldHandle))
            }
            enumField = DefaultValues.SomeEnum.init(rawValue: examples_DefaultValues_StructWithDefaults_enumField_get(cStructWithDefaults))!
        }

        internal func convertToCType() -> examples_DefaultValues_StructWithDefaultsRef {
            let result = examples_DefaultValues_StructWithDefaults_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cStructWithDefaults: examples_DefaultValues_StructWithDefaultsRef) -> Void {
            examples_DefaultValues_StructWithDefaults_intField_set(cStructWithDefaults, intField)
            examples_DefaultValues_StructWithDefaults_floatField_set(cStructWithDefaults, floatField)
            examples_DefaultValues_StructWithDefaults_boolField_set(cStructWithDefaults, boolField)
            examples_DefaultValues_StructWithDefaults_stringField_set(cStructWithDefaults, stringField)
            examples_DefaultValues_StructWithDefaults_enumField_set(cStructWithDefaults, enumField.rawValue)
        }
    }
}