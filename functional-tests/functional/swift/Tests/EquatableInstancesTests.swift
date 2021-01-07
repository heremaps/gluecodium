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

class EquatableInstancesTests: XCTestCase {
    func testDifferentInstancesArePointerUnequal() {
        let one = PointerEquatableClass.createNew()
        let other = PointerEquatableClass.createNew()
        XCTAssertNotEqual(one, other)
        XCTAssertNotEqual(hash(one), hash(other))
    }

    func testSameInstancesArePointerEqual() {
        let one = PointerEquatableClass.createNew()
        let other = PointerEquatableClass.returnLast()
        XCTAssertEqual(one, other)
        XCTAssertEqual(hash(one), hash(other))
    }

    func testUnequalInstancesAreUnequal() {
        let one = EquatableClass(name: "one")
        let other = EquatableClass(name: "other")
        XCTAssertNotEqual(one, other)
        XCTAssertNotEqual(hash(one), hash(other))
    }

    func testEqualInstancesAreEqual() {
        let one = EquatableClass(name: "one")
        let other = EquatableClass(name: "one")
        XCTAssertEqual(one, other)
        XCTAssertEqual(hash(one), hash(other))
    }

    func testEqualInstancesInStruct() {
        let one = EquatableClass(name: "one")
        let other = EquatableClass(name: "one")
        let uninteresting = PointerEquatableClass.createNew()
        let oneStruct = PointerEquatableClass.EquatableStruct(equatable: one, pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableClass.EquatableStruct(equatable: other, pointerEquatable: uninteresting)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertTrue(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testUnequalInstancesInStruct() {
        let one = EquatableClass(name: "one")
        let other = EquatableClass(name: "other")
        let uninteresting = PointerEquatableClass.createNew()
        let oneStruct = PointerEquatableClass.EquatableStruct(equatable: one, pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableClass.EquatableStruct(equatable: other, pointerEquatable: uninteresting)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertFalse(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testPointerUnequalInstancesInStruct() {
        let one = PointerEquatableClass.createNew()
        let other = PointerEquatableClass.createNew()
        let uninteresting = EquatableClass(name: "same for both")
        let oneStruct = PointerEquatableClass.EquatableStruct(equatable: uninteresting, pointerEquatable: one)
        let otherStruct = PointerEquatableClass.EquatableStruct(equatable: uninteresting, pointerEquatable: other)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertFalse(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testPointerEqualInstancesInStruct() {
        let one = PointerEquatableClass.createNew()
        let other = PointerEquatableClass.returnLast()
        let uninteresting = EquatableClass(name: "same for both")
        let oneStruct = PointerEquatableClass.EquatableStruct(equatable: uninteresting, pointerEquatable: one)
        let otherStruct = PointerEquatableClass.EquatableStruct(equatable: uninteresting, pointerEquatable: other)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertTrue(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalEqualInstancesInStruct() {
        let one = EquatableClass(name: "one")
        let other = EquatableClass(name: "one")
        let uninteresting = PointerEquatableClass.createNew()
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertTrue(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalUnequalInstancesInStruct() {
        let one = EquatableClass(name: "one")
        let other = EquatableClass(name: "other")
        let uninteresting = PointerEquatableClass.createNew()
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertFalse(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalPointerUnequalInstancesInStruct() {
        let one = PointerEquatableClass.createNew()
        let other = PointerEquatableClass.createNew()
        let uninteresting = EquatableClass(name: "same for both")
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertFalse(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testOptionalPointerEqualInstancesInStruct() {
        let one = PointerEquatableClass.createNew()
        let other = PointerEquatableClass.returnLast()
        let uninteresting = EquatableClass(name: "same for both")
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertTrue(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilEqualInstancesInStruct() {
        let one: EquatableClass? = nil
        let other: EquatableClass? = nil
        let uninteresting = PointerEquatableClass.createNew()
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertTrue(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilUnequalInstancesInStruct() {
        let one: EquatableClass? = nil
        let other = EquatableClass(name: "one")
        let uninteresting = PointerEquatableClass.createNew()
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: one,
                                                                          pointerEquatable: uninteresting)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: other,
                                                                            pointerEquatable: uninteresting)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertFalse(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilPointerUnequalInstancesInStruct() {
        let one: PointerEquatableClass? = nil
        let other = PointerEquatableClass.createNew()
        let uninteresting = EquatableClass(name: "same for both")
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertNotEqual(oneStruct, otherStruct)
        XCTAssertFalse(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertFalse(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertNotEqual(hash(oneStruct), hash(otherStruct))
    }

    func testNilPointerEqualInstancesInStruct() {
        let one: PointerEquatableClass? = nil
        let other: PointerEquatableClass? = nil
        let uninteresting = EquatableClass(name: "same for both")
        let oneStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                          pointerEquatable: one)
        let otherStruct = PointerEquatableClass.OptionalEquatableStruct(equatable: uninteresting,
                                                                            pointerEquatable: other)

        XCTAssertEqual(oneStruct, otherStruct)
        XCTAssertTrue(PointerEquatableClass.areEqual(one: oneStruct, other: otherStruct))
        XCTAssertTrue(PointerEquatableClass.haveSameHash(one: oneStruct, other: otherStruct))
        XCTAssertEqual(hash(oneStruct), hash(otherStruct))
    }

    func testInterfacesAreEqual() {
        let one = EquatableInterfaceFactory.createEquatableInterface(name: "one")
        let other = EquatableInterfaceFactory.createEquatableInterface(name: "one")

        XCTAssertTrue(one == other)
    }

    func testInterfacesAreUnequal() {
        let one = EquatableInterfaceFactory.createEquatableInterface(name: "one")
        let other = EquatableInterfaceFactory.createEquatableInterface(name: "other")

        XCTAssertFalse(one == other)
    }

    class EquatableInterfaceFoo: EquatableInterface {
        init(name: String) {
            self.name = name
        }
        let name: String
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
        ("testNilPointerUnequalInstancesInStruct", testNilPointerUnequalInstancesInStruct),
        ("testInterfacesAreEqual", testInterfacesAreEqual),
        ("testInterfacesAreUnequal", testInterfacesAreUnequal)
    ]
}
