// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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
import hello

class StaticFloatDoubleMethodsTests: XCTestCase {
    func testPassFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnIncrementedFloat(inputNumber: 3.14),
            4.14,
            accuracy: 1e-6)
    }

    func testPassFloatInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: Float.infinity),
            Float.infinity)
    }

    func testPassFloatNegativeInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: -Float.infinity),
            -Float.infinity)
    }

    func testPassFloatNaN() {
        XCTAssert(StaticFloatDoubleMethods.returnFloat(inputNumber: Float.nan).isNaN)
    }

    func testPassMaximumFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: Float.greatestFiniteMagnitude),
            Float.greatestFiniteMagnitude)
    }

    func testPassMinimumFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: Float.leastNonzeroMagnitude),
            Float.leastNonzeroMagnitude)
    }

    func testPassDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnIncrementedDouble(inputNumber: 2.72),
            3.72)
    }

    func testPassDoubleInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: Double.infinity),
            Double.infinity)
    }

    func testPassDoubleNegativeInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: -Double.infinity),
            -Double.infinity)
    }

    func testPassDoubleNaN() {
        XCTAssert(StaticFloatDoubleMethods.returnDouble(inputNumber: Double.nan).isNaN)
    }

    func testPassMaximumDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: Double.greatestFiniteMagnitude),
            Double.greatestFiniteMagnitude)
    }

    func testPassMinimumDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: Double.leastNonzeroMagnitude),
            Double.leastNonzeroMagnitude)
    }

    func testPassTwoFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.sumTwoFloats(inputNumber1: 2, inputNumber2: 0.5),
            2.5)
    }

    func testPassTwoDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.sumTwoDoubles(inputNumber1: 2, inputNumber2: 0.5),
            2.5)
    }

    static var allTests = [
        ("testPassFloat", testPassFloat),
        ("testPassFloatInfinity", testPassFloatInfinity),
        ("testPassFloatNegativeInfinity", testPassFloatNegativeInfinity),
        ("testPassFloatNaN", testPassFloatNaN),
        ("testPassMaximumFloat", testPassMaximumFloat),
        ("testPassMinimumFloat", testPassMinimumFloat),
        ("testPassDouble", testPassDouble),
        ("testPassDoubleInfinity", testPassDoubleInfinity),
        ("testPassDoubleNegativeInfinity", testPassDoubleNegativeInfinity),
        ("testPassDoubleNaN", testPassDoubleNaN),
        ("testPassMaximumDouble", testPassMaximumDouble),
        ("testPassMinimumDouble", testPassMinimumDouble),
        ("testPassTwoFloat", testPassTwoFloat),
        ("testPassTwoDouble", testPassTwoDouble)
    ]
}
