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
import hello

class NullableMethodArgumentsTests: XCTestCase {
    let nullableInterface = NullableInterface()

    func testNullableStringMethodWithNull() {
        let value: String? = nil

        let result = nullableInterface.methodWithString(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableStringMethodWithNonNull() {
        let value: String? = "Foo"

        let result = nullableInterface.methodWithString(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableBooleanMethodWithNull() {
        let value: Bool? = nil

        let result = nullableInterface.methodWithBoolean(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableBooleanMethodWithZero() {
        let value: Bool? = false

        let result = nullableInterface.methodWithBoolean(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableBooleanMethodWithNonNull() {
        let value: Bool? = true

        let result = nullableInterface.methodWithBoolean(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableDoubleMethodWithNull() {
        let value: Double? = nil

        let result = nullableInterface.methodWithDouble(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableDoubleMethodWithZero() {
        let value: Double? = 0.0

        let result = nullableInterface.methodWithDouble(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableDoubleMethodWithNonNull() {
        let value: Double? = 3.14

        let result = nullableInterface.methodWithDouble(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableIntegerMethodWithNull() {
        let value: Int64? = nil

        let result = nullableInterface.methodWithInt(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableIntegerMethodWithZero() {
        let value: Int64? = 0

        let result = nullableInterface.methodWithInt(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableIntegerMethodWithNonNull() {
        let value: Int64? = 42

        let result = nullableInterface.methodWithInt(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableStructMethodWithNull() {
        let value: NullableInterface.SomeStruct? = nil

        let result = nullableInterface.methodWithSomeStruct(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableStructMethodWithNonNull() {
        let value: NullableInterface.SomeStruct? = NullableInterface.SomeStruct(stringField: "")

        let result = nullableInterface.methodWithSomeStruct(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableEnumMethodWithNull() {
        let value: NullableInterface.SomeEnum? = nil

        let result = nullableInterface.methodWithSomeEnum(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableEnumMethodWithNonNull() {
        let value: NullableInterface.SomeEnum? = NullableInterface.SomeEnum.on

        let result = nullableInterface.methodWithSomeEnum(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableArrayMethodWithNull() {
        let value: [String]? = nil

        let result = nullableInterface.methodWithSomeArray(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableArrayMethodWithNonNull() {
        let value: [String]? = []

        let result = nullableInterface.methodWithSomeArray(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableInlineArrayMethodWithNull() {
        let value: [String]? = nil

        let result = nullableInterface.methodWithInlineArray(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableInlineArrayMethodWithNonNull() {
        let value: [String]? = []

        let result = nullableInterface.methodWithInlineArray(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableMapMethodWithNull() {
        let value: [Int64: String]? = nil

        let result = nullableInterface.methodWithSomeMap(input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableMapMethodWithNonNull() {
        let value: [Int64: String] = [:]

        let result = nullableInterface.methodWithSomeMap(input: value)

        XCTAssertEqual(result, value)
    }

    static var allTests = [
        ("testNullableStringMethodWithNull", testNullableStringMethodWithNull),
        ("testNullableStringMethodWithNonNull", testNullableStringMethodWithNonNull),
        ("testNullableBooleanMethodWithNull", testNullableBooleanMethodWithNull),
        ("testNullableBooleanMethodWithZero", testNullableBooleanMethodWithZero),
        ("testNullableBooleanMethodWithNonNull", testNullableBooleanMethodWithNonNull),
        ("testNullableDoubleMethodWithNull", testNullableDoubleMethodWithNull),
        ("testNullableDoubleMethodWithZero", testNullableDoubleMethodWithZero),
        ("testNullableDoubleMethodWithNonNull", testNullableDoubleMethodWithNonNull),
        ("testNullableIntegerMethodWithNull", testNullableIntegerMethodWithNull),
        ("testNullableIntegerMethodWithZero", testNullableIntegerMethodWithZero),
        ("testNullableIntegerMethodWithNonNull", testNullableIntegerMethodWithNonNull),
        ("testNullableStructMethodWithNull", testNullableStructMethodWithNull),
        ("testNullableStructMethodWithNonNull", testNullableStructMethodWithNonNull),
        ("testNullableEnumMethodWithNull", testNullableEnumMethodWithNull),
        ("testNullableEnumMethodWithNonNull", testNullableEnumMethodWithNonNull),
        ("testNullableArrayMethodWithNull", testNullableArrayMethodWithNull),
        ("testNullableArrayMethodWithNonNull", testNullableArrayMethodWithNonNull),
        ("testNullableInlineArrayMethodWithNull", testNullableInlineArrayMethodWithNull),
        ("testNullableInlineArrayMethodWithNonNull", testNullableInlineArrayMethodWithNonNull),
        ("testNullableMapMethodWithNull", testNullableMapMethodWithNull),
        ("testNullableMapMethodWithNonNull", testNullableMapMethodWithNonNull)
    ]
}
