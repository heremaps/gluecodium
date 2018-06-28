// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

class EquatableTests: XCTestCase {

    let mainStruct = EquatableTests.createEquatableStruct()

    func testStructEquals() {
        let otherStruct = EquatableTests.createEquatableStruct()

        XCTAssertEqual(otherStruct, mainStruct)
    }

    func testStructNotEqualsBooleanField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.boolField = !otherStruct.boolField

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsIntField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.intField += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsLongField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.longField += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsFloatField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.floatField += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsDoubleField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.doubleField += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsStringField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.stringField += "foo"

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsStructField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.structField.fooField += "bar"

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsEnumField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.enumField = .foo

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsMapField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.mapField[2] = "foo"

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsArrayField() {
        var otherStruct = EquatableTests.createEquatableStruct()
        otherStruct.arrayField = CollectionOf<String>(["one", "two", "foo"])

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    static func createEquatableStruct() -> EquatableStruct {

        return EquatableStruct(boolField: true, intField: 65542, longField: 2147484000,
            floatField: 1.0, doubleField: 2.0, stringField: "nonsense",
            structField: NestedEquatableStruct(fooField: "foo"), enumField: .bar,
            mapField: [0: "one", 1: "two"], arrayField: CollectionOf<String>(["one", "two"]))
    }

    static var allTests = [
        ("testStructEquals", testStructEquals),
        ("testStructNotEqualsBooleanField", testStructNotEqualsBooleanField),
        ("testStructNotEqualsIntField", testStructNotEqualsIntField),
        ("testStructNotEqualsLongField", testStructNotEqualsLongField),
        ("testStructNotEqualsFloatField", testStructNotEqualsFloatField),
        ("testStructNotEqualsDoubleField", testStructNotEqualsDoubleField),
        ("testStructNotEqualsStringField", testStructNotEqualsStringField),
        ("testStructNotEqualsStructField", testStructNotEqualsStructField),
        ("testStructNotEqualsEnumField", testStructNotEqualsBooleanField),
        ("testStructNotEqualsMapField", testStructNotEqualsMapField),
        ("testStructNotEqualsArrayField", testStructNotEqualsArrayField)
    ]
}
