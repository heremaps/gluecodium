// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

class FieldConstructorsTests: XCTestCase {

    func testPartialDefaults2() {
        let result = FieldConstructorsPartialDefaults(intField: 7, stringField: "foo")

        XCTAssertEqual(result.stringField, "foo")
        XCTAssertEqual(result.intField, 7)
        XCTAssertEqual(result.boolField, true)
    }

    func testPartialDefaults3() {
        let result = FieldConstructorsPartialDefaults(boolField: false, intField: 7, stringField: "foo")

        XCTAssertEqual(result.stringField, "foo")
        XCTAssertEqual(result.intField, 7)
        XCTAssertEqual(result.boolField, false)
    }

    func testAllDefaults0() {
        let result = FieldConstructorsAllDefaults()

        XCTAssertEqual(result.stringField, "nonsense")
        XCTAssertEqual(result.intField, 42)
        XCTAssertEqual(result.boolField, true)
    }

    func testAllDefaults1() {
        let result = FieldConstructorsAllDefaults(intField: 7)

        XCTAssertEqual(result.stringField, "nonsense")
        XCTAssertEqual(result.intField, 7)
        XCTAssertEqual(result.boolField, true)
    }

    func testImmutableNoClash() {
        let result = ImmutableStructNoClash(stringField: "foo", intField: 7, boolField: false)

        XCTAssertEqual(result.stringField, "foo")
        XCTAssertEqual(result.intField, 7)
        XCTAssertEqual(result.boolField, false)
    }

    func testImmutableWithClash() {
        let result = ImmutableStructWithClash(boolField: false, intField: 7, stringField: "foo")

        XCTAssertEqual(result.stringField, "foo")
        XCTAssertEqual(result.intField, 7)
        XCTAssertEqual(result.boolField, false)
    }

    func testLabels() {
        let result = FieldConstructorsWithLabels(stringField: "foo", value: 7, false)

        XCTAssertEqual(result.stringField, "foo")
        XCTAssertEqual(result.intField, 7)
        XCTAssertEqual(result.boolField, false)
    }

    static var allTests = [
        ("testPartialDefaults2", testPartialDefaults2),
        ("testPartialDefaults3", testPartialDefaults3),
        ("testAllDefaults0", testAllDefaults0),
        ("testAllDefaults1", testAllDefaults1),
        ("testImmutableNoClash", testImmutableNoClash),
        ("testImmutableWithClash", testImmutableWithClash),
        ("testLabels", testLabels)
    ]
}
