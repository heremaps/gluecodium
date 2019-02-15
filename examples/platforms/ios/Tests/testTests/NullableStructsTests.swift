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

class NullableStructsTests: XCTestCase {
    let nullableInterface = NullableInterface()

    func testNullableStructConstructor() {
        let nullable = NullableInterface.NullableStruct()

        XCTAssertNil(nullable.stringField)
        XCTAssertNil(nullable.boolField)
        XCTAssertNil(nullable.doubleField)
        XCTAssertNil(nullable.structField)
        XCTAssertNil(nullable.enumField)
        XCTAssertNil(nullable.arrayField)
        XCTAssertNil(nullable.inlineArrayField)
        XCTAssertNil(nullable.mapField)
    }

    func testNullableNullStructRoundTrip() {
        let nullable = NullableInterface.NullableStruct()

        let result = nullableInterface.methodWithNullableStruct(input: nullable)

        XCTAssertNil(result.stringField)
        XCTAssertNil(result.boolField)
        XCTAssertNil(result.doubleField)
        XCTAssertNil(result.structField)
        XCTAssertNil(result.enumField)
        XCTAssertNil(result.arrayField)
        XCTAssertNil(result.inlineArrayField)
        XCTAssertNil(result.mapField)
    }

    func testNullableZeroStructRoundTrip() {
        let nullable = NullableInterface.NullableStruct(
            stringField: "",
            boolField: false,
            doubleField: 0.0,
            structField: NullableInterface.SomeStruct(stringField: ""),
            enumField: NullableInterface.SomeEnum.off,
            arrayField: [],
            inlineArrayField: [],
            mapField: [:]
        )

        let result = nullableInterface.methodWithNullableStruct(input: nullable)

        XCTAssertEqual(nullable.stringField, result.stringField)
        XCTAssertEqual(nullable.boolField, result.boolField)
        XCTAssertEqual(nullable.doubleField, result.doubleField)
        XCTAssertEqual(nullable.structField, result.structField)
        XCTAssertEqual(nullable.enumField, result.enumField)
        XCTAssertEqual(nullable.arrayField, result.arrayField)
        XCTAssertEqual(nullable.inlineArrayField, result.inlineArrayField)
        XCTAssertEqual(nullable.mapField, result.mapField)
    }

    func testNullableFilledStructRoundTrip() {
        let nullable = NullableInterface.NullableStruct(
            stringField: "Foo",
            boolField: true,
            doubleField: 3.14,
            structField: NullableInterface.SomeStruct(stringField: "Woo"),
            enumField: NullableInterface.SomeEnum.on,
            arrayField: ["Bar"],
            inlineArrayField: ["Baz"],
            mapField: [7: "Wee"])

        let result = nullableInterface.methodWithNullableStruct(input: nullable)

        XCTAssertEqual(nullable.stringField, result.stringField)
        XCTAssertEqual(nullable.boolField, result.boolField)
        XCTAssertEqual(nullable.doubleField, result.doubleField)
        XCTAssertEqual(nullable.structField, result.structField)
        XCTAssertEqual(nullable.enumField, result.enumField)
        XCTAssertEqual(nullable.arrayField, result.arrayField)
        XCTAssertEqual(nullable.inlineArrayField, result.inlineArrayField)
        XCTAssertEqual(nullable.mapField, result.mapField)
    }

    func testNullableIntsStructConstructor() {
        let nullable = NullableInterface.NullableIntsStruct()

        XCTAssertNil(nullable.int8Field)
        XCTAssertNil(nullable.int16Field)
        XCTAssertNil(nullable.int32Field)
        XCTAssertNil(nullable.int64Field)
        XCTAssertNil(nullable.uint8Field)
        XCTAssertNil(nullable.uint16Field)
        XCTAssertNil(nullable.uint32Field)
        XCTAssertNil(nullable.uint64Field)
    }

    func testNullableIntsNullStructRoundTrip() {
        let nullable = NullableInterface.NullableIntsStruct()

        let result = nullableInterface.methodWithNullableIntsStruct(input: nullable)

        XCTAssertNil(result.int8Field)
        XCTAssertNil(result.int16Field)
        XCTAssertNil(result.int32Field)
        XCTAssertNil(result.int64Field)
        XCTAssertNil(result.uint8Field)
        XCTAssertNil(result.uint16Field)
        XCTAssertNil(result.uint32Field)
        XCTAssertNil(result.uint64Field)
    }

    func testNullableIntsZeroStructRoundTrip() {
        let nullable = NullableInterface.NullableIntsStruct(
            int8Field: 0,
            int16Field: 0,
            int32Field: 0,
            int64Field: 0,
            uint8Field: 0,
            uint16Field: 0,
            uint32Field: 0,
            uint64Field: 0
        )

        let result = nullableInterface.methodWithNullableIntsStruct(input: nullable)

        XCTAssertEqual(nullable.int8Field, result.int8Field)
        XCTAssertEqual(nullable.int16Field, result.int16Field)
        XCTAssertEqual(nullable.int32Field, result.int32Field)
        XCTAssertEqual(nullable.int64Field, result.int64Field)
        XCTAssertEqual(nullable.uint8Field, result.uint8Field)
        XCTAssertEqual(nullable.uint16Field, result.uint16Field)
        XCTAssertEqual(nullable.uint32Field, result.uint32Field)
        XCTAssertEqual(nullable.uint64Field, result.uint64Field)
    }

    func testNullableIntsFilledStructRoundTrip() {
        let nullable = NullableInterface.NullableIntsStruct(
            int8Field: -42,
            int16Field: -71,
            int32Field: -1337,
            int64Field: -3735928559,
            uint8Field: 71,
            uint16Field: 1337,
            uint32Field: 2735718543,
            uint64Field: 3735928559
        )

        let result = nullableInterface.methodWithNullableIntsStruct(input: nullable)

        XCTAssertEqual(nullable.int8Field, result.int8Field)
        XCTAssertEqual(nullable.int16Field, result.int16Field)
        XCTAssertEqual(nullable.int32Field, result.int32Field)
        XCTAssertEqual(nullable.int64Field, result.int64Field)
        XCTAssertEqual(nullable.uint8Field, result.uint8Field)
        XCTAssertEqual(nullable.uint16Field, result.uint16Field)
        XCTAssertEqual(nullable.uint32Field, result.uint32Field)
        XCTAssertEqual(nullable.uint64Field, result.uint64Field)
    }

    static var allTests = [
        ("testNullableStructConstructor", testNullableStructConstructor),
        ("testNullableNullStructRoundTrip", testNullableNullStructRoundTrip),
        ("testNullableZeroStructRoundTrip", testNullableZeroStructRoundTrip),
        ("testNullableFilledStructRoundTrip", testNullableFilledStructRoundTrip),
        ("testNullableIntsStructConstructor", testNullableIntsStructConstructor),
        ("testNullableIntsNullStructRoundTrip", testNullableIntsNullStructRoundTrip),
        ("testNullableIntsZeroStructRoundTrip", testNullableIntsZeroStructRoundTrip),
        ("testNullableIntsFilledStructRoundTrip", testNullableIntsFilledStructRoundTrip)
    ]
}
