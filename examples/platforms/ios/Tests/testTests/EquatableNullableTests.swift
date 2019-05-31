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

class EquatableNullableTests: XCTestCase {

    let mainStruct = EquatableNullableTests.createEquatableNullableStruct()

    func testStructEquals() {
        let otherStruct = EquatableNullableTests.createEquatableNullableStruct()

        XCTAssertEqual(otherStruct, mainStruct)
    }

    func testStructNotEqualsBooleanField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.boolField = !otherStruct.boolField!

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsIntField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.intField! += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsUintField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.uintField! += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsFloatField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.floatField! += 1

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsStringField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.stringField! += "foo"

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsStructField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.structField!.fooField += "bar"

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsEnumField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.enumField = .foo

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsMapField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.mapField![2] = "foo"

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructNotEqualsArrayField() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.arrayField = ["one", "two", "foo"]

        XCTAssertNotEqual(mainStruct, otherStruct)
    }

    func testStructEqualsCpp() {
        let otherStruct = EquatableNullableTests.createEquatableNullableStruct()

        XCTAssertTrue(EquatableInterface.areEqual(lhs: otherStruct, rhs: mainStruct))
        XCTAssertTrue(EquatableInterface.haveSameHash(lhs: otherStruct, rhs: mainStruct))
    }

    func testStructEqualsCppWithNulls() {
        XCTAssertTrue(EquatableInterface.areEqual(lhs: EquatableNullableStruct(),
                                                  rhs: EquatableNullableStruct()))
        XCTAssertTrue(EquatableInterface.haveSameHash(lhs: EquatableNullableStruct(),
                                                      rhs: EquatableNullableStruct()))
    }

    func testStructNotEqualsCpp() {
        var otherStruct = EquatableNullableTests.createEquatableNullableStruct()
        otherStruct.arrayField!.append("foo")

        XCTAssertFalse(EquatableInterface.areEqual(lhs: otherStruct, rhs: mainStruct))
        XCTAssertFalse(EquatableInterface.haveSameHash(lhs: otherStruct, rhs: mainStruct))
    }

    static func createEquatableNullableStruct() -> EquatableNullableStruct {
        return EquatableNullableStruct(boolField: true, intField: -42, uintField: 6542,
            floatField: 1.0, stringField: "nonsense",
            structField: NestedEquatableStruct(fooField: "foo"), enumField: .bar,
            mapField: [0: "one", 1: "two"], arrayField: ["one", "two"])
    }

    static var allTests = [
        ("testStructEquals", testStructEquals),
        ("testStructNotEqualsBooleanField", testStructNotEqualsBooleanField),
        ("testStructNotEqualsIntField", testStructNotEqualsIntField),
        ("testStructNotEqualsUintField", testStructNotEqualsUintField),
        ("testStructNotEqualsFloatField", testStructNotEqualsFloatField),
        ("testStructNotEqualsStringField", testStructNotEqualsStringField),
        ("testStructNotEqualsStructField", testStructNotEqualsStructField),
        ("testStructNotEqualsEnumField", testStructNotEqualsBooleanField),
        ("testStructNotEqualsMapField", testStructNotEqualsMapField),
        ("testStructNotEqualsArrayField", testStructNotEqualsArrayField),
        ("testStructEqualsCpp", testStructEqualsCpp),
        ("testStructEqualsCppWithNulls", testStructEqualsCppWithNulls),
        ("testStructNotEqualsCpp", testStructNotEqualsCpp)
    ]
}
