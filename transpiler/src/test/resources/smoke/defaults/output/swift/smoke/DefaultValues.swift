//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: DefaultValues) -> RefHolder {
    return RefHolder(ref.c_instance)
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

    public struct StructWithDefaults {
        public var intField: Int32
        public var floatField: Float
        public var boolField: Bool
        public var stringField: String
        public var enumField: DefaultValues.SomeEnum

        public init(intField: Int32 = 42, floatField: Float = 3.14, boolField: Bool = true, stringField: String = "\\Jonny \"Magic\" Smith\n", enumField: DefaultValues.SomeEnum = DefaultValues.SomeEnum.barValue) {
            self.intField = intField
            self.floatField = floatField
            self.boolField = boolField
            self.stringField = stringField
            self.enumField = enumField
        }

        internal init?(cStructWithDefaults: _baseRef) {
            intField = smoke_DefaultValues_StructWithDefaults_intField_get(cStructWithDefaults)
            floatField = smoke_DefaultValues_StructWithDefaults_floatField_get(cStructWithDefaults)
            boolField = smoke_DefaultValues_StructWithDefaults_boolField_get(cStructWithDefaults)
            do {
                let stringFieldHandle = smoke_DefaultValues_StructWithDefaults_stringField_get(cStructWithDefaults)
                stringField = String(cString:std_string_data_get(stringFieldHandle))
            }
            enumField = DefaultValues.SomeEnum.init(rawValue: smoke_DefaultValues_StructWithDefaults_enumField_get(cStructWithDefaults))!
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_DefaultValues_StructWithDefaults_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cStructWithDefaults: _baseRef) -> Void {
            smoke_DefaultValues_StructWithDefaults_intField_set(cStructWithDefaults, intField)
            smoke_DefaultValues_StructWithDefaults_floatField_set(cStructWithDefaults, floatField)
            smoke_DefaultValues_StructWithDefaults_boolField_set(cStructWithDefaults, boolField)
            smoke_DefaultValues_StructWithDefaults_stringField_set(cStructWithDefaults, stringField)
            smoke_DefaultValues_StructWithDefaults_enumField_set(cStructWithDefaults, enumField.rawValue)
        }
    }

    public static func processStructWithDefaults(input: DefaultValues.StructWithDefaults) -> DefaultValues.StructWithDefaults? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_DefaultValues_StructWithDefaults_release(inputHandle)
        }
        let cResult = smoke_DefaultValues_processStructWithDefaults(inputHandle)
        defer {
            smoke_DefaultValues_StructWithDefaults_release(cResult)
        }
        return DefaultValues.StructWithDefaults(cStructWithDefaults: cResult)
    }

}
