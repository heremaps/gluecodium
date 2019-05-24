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

class EquatableInstancesTests: XCTestCase {
    func testDifferentInstancesArePointerUnequal() {
        let one = PointerEquatableInterface.createNew()
        let other = PointerEquatableInterface.createNew()
        XCTAssertNotEqual(one, other)
        XCTAssertNotEqual(hash(one), hash(other))
    }

    func testSameInstancesArePointerEqual() {
        let one = PointerEquatableInterface.createNew()
        let other = PointerEquatableInterface.returnLast()
        XCTAssertEqual(one, other)
        XCTAssertEqual(hash(one), hash(other))
    }

    func testUnequalInstancesAreUnequal() {
        let one = EquatableInterface(name: "one")
        let other = EquatableInterface(name: "other")
        XCTAssertNotEqual(one, other)
        XCTAssertNotEqual(hash(one), hash(other))
    }

    func testEqualInstancesAreEqual() {
        let one = EquatableInterface(name: "one")
        let other = EquatableInterface(name: "one")
        XCTAssertEqual(one, other)
        XCTAssertEqual(hash(one), hash(other))
    }

    func testEqualInstancesInStruct() {
        let one = EquatableInterface(name: "one")
        let other = EquatableInterface(name: "one")
        let uninteresting = PointerEquatableInterface.createNew()
        let oneStruct = PointerEquatableInterface.EquatableStruct(equatable: one, pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableInterface.EquatableStruct(equatable: other, pointerEquatable: uninteresting)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testUnequalInstancesInStruct() {
        let one = EquatableInterface(name: "one")
        let other = EquatableInterface(name: "other")
        let uninteresting = PointerEquatableInterface.createNew()
        let oneStruct = PointerEquatableInterface.EquatableStruct(equatable: one, pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableInterface.EquatableStruct(equatable: other, pointerEquatable: uninteresting)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testPointerUnequalInstancesInStruct() {
        let one = PointerEquatableInterface.createNew()
        let other = PointerEquatableInterface.createNew()
        let uninteresting = EquatableInterface(name: "same for both")
        let oneStruct = PointerEquatableInterface.EquatableStruct(equatable: uninteresting, pointerEquatable: one)
        let otherStruct = PointerEquatableInterface.EquatableStruct(equatable: uninteresting, pointerEquatable: other)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testPointerEqualInstancesInStruct() {
        let one = PointerEquatableInterface.createNew()
        let other = PointerEquatableInterface.returnLast()
        let uninteresting = EquatableInterface(name: "same for both")
        let oneStruct = PointerEquatableInterface.EquatableStruct(equatable: uninteresting, pointerEquatable: one)
        let otherStruct = PointerEquatableInterface.EquatableStruct(equatable: uninteresting, pointerEquatable: other)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalEqualInstancesInStruct() {
        let one = EquatableInterface(name: "one")
        let other = EquatableInterface(name: "one")
        let uninteresting = PointerEquatableInterface.createNew()
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalUnequalInstancesInStruct() {
        let one = EquatableInterface(name: "one")
        let other = EquatableInterface(name: "other")
        let uninteresting = PointerEquatableInterface.createNew()
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalPointerUnequalInstancesInStruct() {
        let one = PointerEquatableInterface.createNew()
        let other = PointerEquatableInterface.createNew()
        let uninteresting = EquatableInterface(name: "same for both")
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalPointerEqualInstancesInStruct() {
        let one = PointerEquatableInterface.createNew()
        let other = PointerEquatableInterface.returnLast()
        let uninteresting = EquatableInterface(name: "same for both")
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilEqualInstancesInStruct() {
        let one: EquatableInterface? = nil
        let other: EquatableInterface? = nil
        let uninteresting = PointerEquatableInterface.createNew()
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilUnequalInstancesInStruct() {
        let one: EquatableInterface? = nil
        let other = EquatableInterface(name: "one")
        let uninteresting = PointerEquatableInterface.createNew()
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilPointerUnequalInstancesInStruct() {
        let one: PointerEquatableInterface? = nil
        let other = PointerEquatableInterface.createNew()
        let uninteresting = EquatableInterface(name: "same for both")
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilPointerEqualInstancesInStruct() {
        let one: PointerEquatableInterface? = nil
        let other: PointerEquatableInterface? = nil
        let uninteresting = EquatableInterface(name: "same for both")
        let oneStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableInterface.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableInterface.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func hash<H>(_ value: H) -> Int where H: Hashable {
        var hasher = Hasher()
        value.hash(into: &hasher)
        return hasher.finalize()
    }

    static var allTests = [
        ("testDifferentInstancesArePointerUnequal", testDifferentInstancesArePointerUnequal),
        ("testSameInstancesArePointerEqual", testSameInstancesArePointerEqual),
        ("testUnequalInstancesAreUnequal", testUnequalInstancesAreUnequal),
        ("testEqualInstancesAreEqual", testEqualInstancesAreEqual),
        ("testUnequalInstancesInStruct", testUnequalInstancesInStruct),
        ("testEqualInstancesInStruct", testEqualInstancesInStruct),
        ("testPointerEqualInstancesInStruct", testPointerEqualInstancesInStruct),
        ("testPointerUnequalInstancesInStruct", testPointerUnequalInstancesInStruct),
        ("testOptionalUnequalInstancesInStruct", testOptionalUnequalInstancesInStruct),
        ("testOptionalEqualInstancesInStruct", testOptionalEqualInstancesInStruct),
        ("testOptionalPointerEqualInstancesInStruct", testOptionalPointerEqualInstancesInStruct),
        ("testOptionalPointerUnequalInstancesInStruct", testOptionalPointerUnequalInstancesInStruct),
        ("testNilUnequalInstancesInStruct", testNilUnequalInstancesInStruct),
        ("testNilEqualInstancesInStruct", testNilEqualInstancesInStruct),
        ("testNilPointerEqualInstancesInStruct", testNilPointerEqualInstancesInStruct),
        ("testNilPointerUnequalInstancesInStruct", testNilPointerUnequalInstancesInStruct)
    ]
}
