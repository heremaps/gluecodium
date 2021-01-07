// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License")
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

class NullableAttributesTests: XCTestCase {
    let nullableInterface = NullableInterface()

    func testNullableStringAttributeWithNull() {
        let value: String? = nil

        nullableInterface.stringAttribute = value
        let result = nullableInterface.stringAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableStringAttributeWithNonNull() {
        let value: String? = "Foo"

        nullableInterface.stringAttribute = value
        let result = nullableInterface.stringAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableBooleanAttributeWithNull() {
        let value: Bool? = nil

        nullableInterface.isBoolAttribute = value
        let result = nullableInterface.isBoolAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableBooleanAttributeWithNonNull() {
        let value: Bool? = true

        nullableInterface.isBoolAttribute = value
        let result = nullableInterface.isBoolAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableDoubleAttributeWithNull() {
        let value: Double? = nil

        nullableInterface.doubleAttribute = value
        let result = nullableInterface.doubleAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableDoubleAttributeWithNonNull() {
        let value: Double? = 3.14

        nullableInterface.doubleAttribute = value
        let result = nullableInterface.doubleAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableIntegerAttributeWithNull() {
        let value: Int64? = nil

        nullableInterface.intAttribute = value
        let result = nullableInterface.intAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableIntegerAttributeWithNonNull() {
        let value: Int64? = 42

        nullableInterface.intAttribute = value
        let result = nullableInterface.intAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableStructAttributeWithNull() {
        let value: NullableInterface.SomeStruct? = nil

        nullableInterface.structAttribute = value
        let result = nullableInterface.structAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableStructAttributeWithNonNull() {
        let value: NullableInterface.SomeStruct? = NullableInterface.SomeStruct(stringField: "")

        nullableInterface.structAttribute = value
        let result = nullableInterface.structAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableEnumAttributeWithNull() {
        let value: NullableInterface.SomeEnum? = nil

        nullableInterface.enumAttribute = value
        let result = nullableInterface.enumAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableEnumAttributeWithNonNull() {
        let value: NullableInterface.SomeEnum? = NullableInterface.SomeEnum.on

        nullableInterface.enumAttribute = value
        let result = nullableInterface.enumAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableArrayAttributeWithNull() {
        let value: [String]? = nil

        nullableInterface.arrayAttribute = value
        let result = nullableInterface.arrayAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableArrayAttributeWithNonNull() {
        let value: [String]? = []

        nullableInterface.arrayAttribute = value
        let result = nullableInterface.arrayAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableInlineArrayAttributeWithNull() {
        let value: [String]? = nil

        nullableInterface.inlineArrayAttribute = value
        let result = nullableInterface.inlineArrayAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableInlineArrayAttributeWithNonNull() {
        let value: [String]? = []

        nullableInterface.inlineArrayAttribute = value
        let result = nullableInterface.inlineArrayAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableMapAttributeWithNull() {
        let value: [Int64: String]? = nil

        nullableInterface.mapAttribute = value
        let result = nullableInterface.mapAttribute

        XCTAssertEqual(result, value)
    }

    func testNullableMapAttributeWithNonNull() {
        let value: [Int64: String]? = [:]

        nullableInterface.mapAttribute = value
        let result = nullableInterface.mapAttribute

        XCTAssertEqual(result, value)
    }

    static var allTests = [
        ("testNullableStringAttributeWithNull", testNullableStringAttributeWithNull),
        ("testNullableStringAttributeWithNonNull", testNullableStringAttributeWithNonNull),
        ("testNullableBooleanAttributeWithNull", testNullableBooleanAttributeWithNull),
        ("testNullableBooleanAttributeWithNonNull", testNullableBooleanAttributeWithNonNull),
        ("testNullableDoubleAttributeWithNull", testNullableDoubleAttributeWithNull),
        ("testNullableDoubleAttributeWithNonNull", testNullableDoubleAttributeWithNonNull),
        ("testNullableIntegerAttributeWithNull", testNullableIntegerAttributeWithNull),
        ("testNullableIntegerAttributeWithNonNull", testNullableIntegerAttributeWithNonNull),
        ("testNullableStructAttributeWithNull", testNullableStructAttributeWithNull),
        ("testNullableStructAttributeWithNonNull", testNullableStructAttributeWithNonNull),
        ("testNullableEnumAttributeWithNull", testNullableEnumAttributeWithNull),
        ("testNullableEnumAttributeWithNonNull", testNullableEnumAttributeWithNonNull),
        ("testNullableArrayAttributeWithNull", testNullableArrayAttributeWithNull),
        ("testNullableArrayAttributeWithNonNull", testNullableArrayAttributeWithNonNull),
        ("testNullableInlineArrayAttributeWithNull", testNullableInlineArrayAttributeWithNull),
        ("testNullableInlineArrayAttributeWithNonNull", testNullableInlineArrayAttributeWithNonNull),
        ("testNullableMapAttributeWithNull", testNullableMapAttributeWithNull),
        ("testNullableMapAttributeWithNonNull", testNullableMapAttributeWithNonNull)
    ]
}
