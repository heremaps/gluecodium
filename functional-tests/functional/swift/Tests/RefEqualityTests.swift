// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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

class RefEqualityTests: XCTestCase {

    func testRefEqualityPreservedForClass() {
        let instance1 = DummyFactory.getDummyClassSingleton()
        let instance2 = DummyFactory.getDummyClassSingleton()

        XCTAssertTrue(instance1 === instance2)
        XCTAssertTrue(instance1 == instance2)
    }

    func testRefInequalityPreservedForClass() {
        let instance1 = DummyFactory.getDummyClassSingleton()
        let instance2 = DummyFactory.createDummyClass()

        XCTAssertFalse(instance1 === instance2)
        XCTAssertFalse(instance1 == instance2)
    }

    func testRefEqualityPreservedForClassInSet() {
        let instance1 = DummyFactory.getDummyClassSingleton()
        let instance2 = DummyFactory.getDummyClassSingleton()
        let instanceSet: Set = [instance1, instance2]

        XCTAssertEqual(instanceSet.count, 1)
    }

    func testRefInequalityPreservedForClassInSet() {
        let instance1 = DummyFactory.getDummyClassSingleton()
        let instance2 = DummyFactory.createDummyClass()
        let instanceSet: Set = [instance1, instance2]

        XCTAssertEqual(instanceSet.count, 2)
    }

    func testRefEqualityPreservedForInterface() {
        let instance1 = DummyFactory.getDummyInterfaceSingleton()
        let instance2 = DummyFactory.getDummyInterfaceSingleton()

        XCTAssertTrue(instance1 === instance2)
    }

    func testRefInequalityPreservedForInterface() {
        let instance1 = DummyFactory.getDummyInterfaceSingleton()
        let instance2 = DummyFactory.createDummyInterface()

        XCTAssertFalse(instance1 === instance2)
    }

    func testRefEqualityPreservedForClassConstructor() {
        let instance1 = DummyClass()
        let instance2 = DummyClass.dummyClassRoundTrip(input: instance1)

        XCTAssertTrue(instance1 === instance2)
        XCTAssertTrue(instance1 == instance2)
    }

    func testRefInequalityPreservedForClassConstructor() {
        let instance1 = DummyClass()
        let instance2 = DummyClass()

        XCTAssertFalse(instance1 === instance2)
        XCTAssertFalse(instance1 == instance2)
    }

    func testRefEqualityPreservedForClassInList() {
        let list = [DummyClass()]

        let result = DummyClass.dummyClassListRoundTrip(input: list)

        XCTAssertTrue(list.first === result.first)
        XCTAssertTrue(list.first == result.first)
    }

    func testRefEqualityPreservedForChildClassAsParent() {
        let instance1 = DummyFactory.getDummyChildClassSingleton()
        let instance2 = DummyFactory.getDummyChildClassSingletonAsParent()

        XCTAssertTrue(instance1 === instance2)
        XCTAssertTrue(instance1 == instance2)
    }

    static var allTests = [
        ("testRefEqualityPreservedForClass", testRefEqualityPreservedForClass),
        ("testRefInequalityPreservedForClass", testRefInequalityPreservedForClass),
        ("testRefEqualityPreservedForClassInSet", testRefEqualityPreservedForClassInSet),
        ("testRefInequalityPreservedForClassInSet", testRefInequalityPreservedForClassInSet),
        ("testRefEqualityPreservedForInterface", testRefEqualityPreservedForInterface),
        ("testRefInequalityPreservedForInterface", testRefInequalityPreservedForInterface),
        ("testRefEqualityPreservedForClassConstructor", testRefEqualityPreservedForClassConstructor),
        ("testRefInequalityPreservedForClassConstructor", testRefInequalityPreservedForClassConstructor),
        ("testRefEqualityPreservedForClassInList", testRefEqualityPreservedForClassInList),
        ("testRefEqualityPreservedForChildClassAsParent", testRefEqualityPreservedForChildClassAsParent)
    ]
}
