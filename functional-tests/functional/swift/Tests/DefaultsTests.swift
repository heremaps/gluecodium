// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

import XCTest
import functional

class DefaultsTests: XCTestCase {

    func testGetDefault() {
      let result = Defaults.getDefault()

      let expectedStruct = Defaults.StructWithDefaults()
      XCTAssertEqual(result.intField, expectedStruct.intField)
      XCTAssertEqual(result.uintField, expectedStruct.uintField)
      XCTAssertEqual(result.floatField, expectedStruct.floatField)
      XCTAssertEqual(result.boolField, expectedStruct.boolField)
      XCTAssertEqual(result.stringField, expectedStruct.stringField)
      XCTAssertEqual(result.enumField, expectedStruct.enumField)
    }

    func testWithAllButOneDefaultFields() {
        let almostDefaultStruct = Defaults.StructWithDefaults(intField: 1)
        let defaultStruct = Defaults.StructWithDefaults()

        XCTAssertNotEqual(almostDefaultStruct.intField, defaultStruct.intField)
        XCTAssertEqual(almostDefaultStruct.uintField, defaultStruct.uintField)
        XCTAssertEqual(almostDefaultStruct.floatField, defaultStruct.floatField)
        XCTAssertEqual(almostDefaultStruct.boolField, defaultStruct.boolField)
        XCTAssertEqual(almostDefaultStruct.stringField, defaultStruct.stringField)
        XCTAssertEqual(almostDefaultStruct.enumField, defaultStruct.enumField)
    }

    func testCheckDefaultTrue() {
      let defaultStruct = Defaults.StructWithDefaults()

      let result = Defaults.checkDefault(input: defaultStruct)

      XCTAssertTrue(result)
    }

    func testCheckDefaultFalse() {
      let nonDefaultStruct = Defaults.StructWithDefaults(intField: 1)

      let result = Defaults.checkDefault(input: nonDefaultStruct)

      XCTAssertFalse(result)
    }

    func testGetImmutableDefault() {
      let result = Defaults.getImmutableDefault()

      let expectedStruct = Defaults.ImmutableStructWithDefaults(uintField: 0, boolField: false)
      XCTAssertEqual(result.intField, expectedStruct.intField)
      XCTAssertEqual(result.floatField, expectedStruct.floatField)
      XCTAssertEqual(result.stringField, expectedStruct.stringField)
      XCTAssertEqual(result.enumField, expectedStruct.enumField)
    }

    func testSwiftSpecialDefaults() {
      let special = Defaults.StructWithSpecialDefaults()

      XCTAssertTrue(Defaults.isNan(value: special.floatNanField))
      XCTAssertTrue(Defaults.isInfinity(value: special.floatInfinityField))
      XCTAssertTrue(Defaults.isInfinity(value: special.floatNegativeInfinityField))
      XCTAssertTrue(Defaults.isNan(value: special.doubleNanField))
      XCTAssertTrue(Defaults.isInfinity(value: special.doubleInfinityField))
      XCTAssertTrue(Defaults.isInfinity(value: special.doubleNegativeInfinityField))
    }

    func testCppSpecialDefaults() {
      let special = Defaults.createSpecial()

      XCTAssertTrue(special.floatNanField.isNaN)
      XCTAssertTrue(special.floatInfinityField.isInfinite)
      XCTAssertTrue(special.floatNegativeInfinityField.isInfinite)
      XCTAssertTrue(special.floatNegativeInfinityField < 0)
      XCTAssertTrue(special.doubleNanField.isNaN)
      XCTAssertTrue(special.doubleInfinityField.isInfinite)
      XCTAssertTrue(special.doubleNegativeInfinityField.isInfinite)
      XCTAssertTrue(special.doubleNegativeInfinityField < 0)
    }

    func testSwiftEmptyDefaults() {
      let result = Defaults.StructWithEmptyDefaults()

      XCTAssertTrue(result.intsField.isEmpty)
      XCTAssertTrue(result.floatsField.isEmpty)
      XCTAssertTrue(result.mapField.isEmpty)
      XCTAssertEqual(result.structField, Defaults.StructWithDefaults())
      XCTAssertTrue(result.setTypeField.isEmpty)
    }

    func testCppEmptyDefaults() {
      let result = Defaults.getEmptyDefaults()

      XCTAssertTrue(result.intsField.isEmpty)
      XCTAssertTrue(result.floatsField.isEmpty)
      XCTAssertTrue(result.mapField.isEmpty)
      XCTAssertEqual(result.structField, Defaults.StructWithDefaults())
      XCTAssertTrue(result.setTypeField.isEmpty)
    }

    func testSwiftInitializerDefaults() {
      let result = Defaults.StructWithInitializerDefaults()

      XCTAssertEqual(result.intsField, [4, -2, 42])
      XCTAssertEqual(result.floatsField, [3.14, -Float.infinity])
      XCTAssertEqual(result.structField.enumField, Defaults.ExternalEnum.oneValue)
      XCTAssertEqual(result.setTypeField, ["foo", "bar"])
      XCTAssertEqual(result.mapField, [1: "foo", 42: "bar"])
    }

    func testCppInitializerDefaults() {
      let result = Defaults.getInitializerDefaults()

      XCTAssertEqual(result.intsField, [4, -2, 42])
      XCTAssertEqual(result.floatsField, [3.14, -Float.infinity])
      XCTAssertEqual(result.structField.enumField, Defaults.ExternalEnum.oneValue)
      XCTAssertEqual(result.setTypeField, ["foo", "bar"])
      XCTAssertEqual(result.mapField, [1: "foo", 42: "bar"])
    }

    func testPositionalEnumeratorDefaults() {
      let result = StructWithEnums()

      XCTAssertEqual(result.firstField, SomethingEnum.reallyFirst)
      XCTAssertEqual(result.explicitField, SomethingEnum.explicit)
      XCTAssertEqual(result.lastField, SomethingEnum.last)
      XCTAssertEqual(StructWithEnums.firstConstant, SomethingEnum.reallyFirst)
    }

    func testConstantDefaults() {
      let result = ConstantDefaults()

      XCTAssertEqual(result.field1.intField, 42)
      XCTAssertEqual(result.field2.intField, -2)
    }

    func testDefaultsOfNullableFieldOfImmutableStruct() {
      // Case 1: struct without explicit field constructor.
      let first = Defaults.ImmutableStructWithNullableFieldUsingImmutableStruct()

      XCTAssertNotNil(first.someField1)
      XCTAssertEqual(42, first.someField1?.intField)

      // Case 2: struct with explicit field constructor.
      let second = Defaults.ImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct(
          someField: 123,
          anotherField: 456
      )

      XCTAssertNotNil(second.someField1)
      XCTAssertEqual(42, second.someField1?.intField)
    }

    static var allTests = [
        ("testGetDefault", testGetDefault),
        ("testWithAllButOneDefaultFields", testWithAllButOneDefaultFields),
        ("testCheckDefaultTrue", testCheckDefaultTrue),
        ("testCheckDefaultFalse", testCheckDefaultFalse),
        ("testGetImmutableDefault", testGetImmutableDefault),
        ("testSwiftSpecialDefaults", testSwiftSpecialDefaults),
        ("testCppSpecialDefaults", testCppSpecialDefaults),
        ("testSwiftEmptyDefaults", testSwiftEmptyDefaults),
        ("testCppEmptyDefaults", testCppEmptyDefaults),
        ("testSwiftInitializerDefaults", testSwiftInitializerDefaults),
        ("testCppInitializerDefaults", testCppInitializerDefaults),
        ("testPositionalEnumeratorDefaults", testPositionalEnumeratorDefaults),
        ("testConstantDefaults", testConstantDefaults),
        ("testDefaultsOfNullableFieldOfImmutableStruct", testDefaultsOfNullableFieldOfImmutableStruct)
    ]
}
