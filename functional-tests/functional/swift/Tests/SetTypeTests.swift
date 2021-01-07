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

class SetTypeTests: XCTestCase {

    func testEmptyStringSetRoundTrip() {
        let stringSet: Set<String> = []

        let result = SetType.stringSetRoundTrip(input: stringSet)

        XCTAssertTrue(result.isEmpty)
    }

    func testStringSetRoundTrip() {
        let stringSet: Set<String> = ["foo"]

        let result = SetType.stringSetRoundTrip(input: stringSet)

        XCTAssertEqual(result, stringSet)
    }

    func testEmptyEnumSetRoundTrip() {
        let enumSet: Set<SetType.SomeEnum> = []

        let result = SetType.enumSetRoundTrip(input: enumSet)

        XCTAssertTrue(result.isEmpty)
    }

    func testEnumSetRoundTrip() {
        let enumSet: Set<SetType.SomeEnum> = [.on]

        let result = SetType.enumSetRoundTrip(input: enumSet)

        XCTAssertEqual(result, enumSet)
    }

    func testNullNullableSetRoundTrip() {
        let intSet: Set<Int32>? = nil

        let result = SetType.nullableIntSetRoundTrip(input: intSet)

        XCTAssertNil(result)
    }

    func testEmptyNullableSetRoundTrip() {
        let intSet: Set<Int32> = []

        let result = SetType.nullableIntSetRoundTrip(input: intSet)

        XCTAssertNotNil(result)
        XCTAssertTrue(result!.isEmpty)
    }

    func testNullableSetRoundTrip() {
        let intSet: Set<Int32> = [42]

        let result = SetType.nullableIntSetRoundTrip(input: intSet)

        XCTAssertEqual(result, intSet)
    }

    func testStructSetRoundTrip() {
        let input: SetType.StructSet = [SetType.EquatableStruct(id: "foo")]

        let result = SetType.structSetRoundTrip(input: input)

        XCTAssertEqual(result, input)
    }

    func testClassSetRoundTrip() {
        let input: SetType.ClassSet = [SomeEquatableClass(id: "foo")]

        let result = SetType.classSetRoundTrip(input: input)

        XCTAssertEqual(result, input)
    }

    func testPointerEquatableSetRoundTrip() {
        let input: SetType.PointerEquatableSet = [SomePointerEquatableClass(id: "foo")]

        let result = SetType.pointerEquatableSetRoundTrip(input: input)

        XCTAssertEqual(result, input)
    }

    static var allTests = [
        ("testEmptyStringSetRoundTrip", testEmptyStringSetRoundTrip),
        ("testStringSetRoundTrip", testStringSetRoundTrip),
        ("testEmptyEnumSetRoundTrip", testEmptyEnumSetRoundTrip),
        ("testEnumSetRoundTrip", testEnumSetRoundTrip),
        ("testNullNullableSetRoundTrip", testNullNullableSetRoundTrip),
        ("testEmptyNullableSetRoundTrip", testEmptyNullableSetRoundTrip),
        ("testNullableSetRoundTrip", testNullableSetRoundTrip),
        ("testStructSetRoundTrip", testStructSetRoundTrip),
        ("testClassSetRoundTrip", testClassSetRoundTrip),
        ("testPointerEquatableSetRoundTrip", testPointerEquatableSetRoundTrip)
    ]
}
