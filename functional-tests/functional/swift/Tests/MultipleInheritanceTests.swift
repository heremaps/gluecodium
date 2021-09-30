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

class MultipleInheritanceTests: XCTestCase {

    class MultiInterfaceImpl: MultiInterface {
        public func childFunction() { }
        public var childProperty: String = ""

        public func parentFunction() { }
        public var parentProperty: String = ""

        public func parentFunctionLight() -> String { return "swift face" }
        public var parentPropertyLight: String = ""
    }

    func testFromCppSendUpcastSucceeds() {
        let instance = MultipleInheritanceFactory.getMultiClass()

        let result = instance is NarrowInterface

        XCTAssertTrue(result)
    }

    func testFromCppSendDowncastFails() {
        let instance = MultipleInheritanceFactory.getMultiClassAsNarrow()

        let result = instance is MultiClass

        XCTAssertFalse(result)
    }

    func testFromCppSendTwiceEquals() {
        let instance1 = MultipleInheritanceFactory.getMultiClassSingleton()
        let instance2 = MultipleInheritanceFactory.getMultiClassSingleton()

        let result = instance1 === instance2

        XCTAssertTrue(result)
    }

    func testFromCppRoundTripNotEquals() {
        let instance = MultipleInheritanceFactory.getMultiClassSingleton()

        let result = MultipleInheritanceChecker.checkSingletonEquality(instance: instance)

        XCTAssertFalse(result)
    }

    func testFromCppRoundTripWithUpcastNotEquals() {
        let uncastInstance = MultipleInheritanceFactory.getMultiClass()
        let instance = uncastInstance as NarrowInterface

        let result = MultipleInheritanceChecker.checkSingletonEquality(instance: instance)

        XCTAssertFalse(result)
    }

    func testFromSwiftSendUpcastSucceeds() {
        let instance = MultiInterfaceImpl()

        let result = MultipleInheritanceChecker.checkIsNarrow(instance: instance)

        XCTAssertTrue(result)
    }

    func testFromSwiftSendDowncastFails() {
        let uncastInstance = MultiInterfaceImpl()
        let instance = uncastInstance as NarrowInterface

        let result = MultipleInheritanceChecker.checkIsMultiInterface(instance: instance)

        XCTAssertFalse(result)
    }

    func testFromSwiftSendTwiceEquals() {
        let instance = MultiInterfaceImpl()

        let result = MultipleInheritanceChecker.checkNarrowEquality(instance1: instance, instance2: instance)

        XCTAssertTrue(result)
    }

    func testFromSwiftRoundTripEquals() {
        let uncastInstance = MultiInterfaceImpl()
        let instance = uncastInstance as NarrowInterface

        let result = uncastInstance === MultipleInheritanceChecker.narrowRoundTrip(instance: instance)

        XCTAssertTrue(result)
    }

    func testFromSwiftRoundTripWithUpcastNotEquals() {
        let instance = MultiInterfaceImpl()

        let result = instance === MultipleInheritanceFactory.upcastMultiInterfaceToNarrow(instance: instance)

        XCTAssertFalse(result)
    }

    static var allTests = [
        ("testFromCppSendUpcastSucceeds", testFromCppSendUpcastSucceeds),
        ("testFromCppSendDowncastFails", testFromCppSendDowncastFails),
        ("testFromCppSendTwiceEquals", testFromCppSendTwiceEquals),
        ("testFromCppRoundTripNotEquals", testFromCppRoundTripNotEquals),
        ("testFromCppRoundTripWithUpcastNotEquals", testFromCppRoundTripWithUpcastNotEquals),
        ("testFromSwiftSendUpcastSucceeds", testFromSwiftSendUpcastSucceeds),
        ("testFromSwiftSendDowncastFails", testFromSwiftSendDowncastFails),
        ("testFromSwiftSendTwiceEquals", testFromSwiftSendTwiceEquals),
        ("testFromSwiftRoundTripEquals", testFromSwiftRoundTripEquals),
        ("testFromSwiftRoundTripWithUpcastNotEquals", testFromSwiftRoundTripWithUpcastNotEquals)
    ]
}
