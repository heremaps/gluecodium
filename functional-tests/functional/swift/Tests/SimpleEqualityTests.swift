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

class SimpleEqualityTests: XCTestCase {

    let class1 = NonEquatableFactory.createNonEquatableClass()
    let class2 = NonEquatableFactory.createNonEquatableClass()
    let interface1 = NonEquatableFactory.createNonEquatableInterface()
    let interface2 = NonEquatableFactory.createNonEquatableInterface()

    func testSimpleEquality() {
        let struct1 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: class2, nullableInterfaceField: interface2)
        let struct2 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: class2, nullableInterfaceField: interface2)

        XCTAssertEqual(struct1, struct2)
        XCTAssertEqual(hash(struct1), hash(struct2))
    }

    func testSimpleEqualityWithNils() {
        let struct1 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: nil, nullableInterfaceField: nil)
        let struct2 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: nil, nullableInterfaceField: nil)

        XCTAssertEqual(struct1, struct2)
        XCTAssertEqual(hash(struct1), hash(struct2))
    }

    func testSimpleInequality() {
        let struct1 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: class2, nullableInterfaceField: interface2)
        let struct2 = SimpleEquatableStruct(classField: class2, interfaceField: interface2,
                                            nullableClassField: class1, nullableInterfaceField: interface1)

        XCTAssertNotEqual(struct1, struct2)
        XCTAssertNotEqual(hash(struct1), hash(struct2))
    }

    func testSimpleInequalityWithNils() {
        let struct1 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: class2, nullableInterfaceField: nil)
        let struct2 = SimpleEquatableStruct(classField: class1, interfaceField: interface1,
                                            nullableClassField: nil, nullableInterfaceField: interface2)

        XCTAssertNotEqual(struct1, struct2)
        XCTAssertNotEqual(hash(struct1), hash(struct2))
    }

    func hash<H>(_ value: H) -> Int where H: Hashable {
        var hasher = Hasher()
        value.hash(into: &hasher)
        return hasher.finalize()
    }

    static var allTests = [
        ("testSimpleEquality", testSimpleEquality),
        ("testSimpleEqualityWithNils", testSimpleEqualityWithNils),
        ("testSimpleInequality", testSimpleInequality),
        ("testSimpleInequalityWithNils", testSimpleInequalityWithNils)
    ]
}
