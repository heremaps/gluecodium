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

class StaticIntMethodsTests: XCTestCase {
    func testPassMinimumInt8() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt8(inputNumber: Int8.min),
            Int8.min + 1)
    }

    func testPassMinimumInt16() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt16(inputNumber: Int16.min),
            Int16.min + 1)
    }

    func testPassMinimumInt32() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt32(inputNumber: Int32.min),
            Int32.min + 1)
    }

    func testPassMinimumInt64() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt64(inputNumber: Int64.min),
            Int64.min + 1)
    }

    func testPassMaximumInt8() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt8(inputNumber: Int8.max - 1),
            Int8.max)
    }

    func testPassMaximumInt16() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt16(inputNumber: Int16.max - 1),
            Int16.max)
    }

    func testPassMaximumInt32() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt32(inputNumber: Int32.max - 1),
            Int32.max)
    }

    func testPassMaximumInt64() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberInt64(inputNumber: Int64.max - 1),
            Int64.max)
    }

    func testPassTwoInt8() {
        XCTAssertEqual(
            StaticIntMethods.sumTwoNumbersInt8(inputNumber1: -1, inputNumber2: 2),
            1)
    }

    func testPassTwoUint32() {
        XCTAssertEqual(
            StaticIntMethods.sumTwoNumbersUint32(inputNumber1: 123, inputNumber2: 456),
            579)
    }

    func testReturnInt8() {
        XCTAssertEqual(StaticIntMethods.returnPrimeInt8(), 2)
    }

    func testReturnUint8() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUint8(), 131)
    }

    func testReturnInt16() {
        XCTAssertEqual(StaticIntMethods.returnPrimeInt16(), 257)
    }

    func testReturnUint16() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUint16(), 32771)
    }

    func testReturnInt32() {
        XCTAssertEqual(StaticIntMethods.returnPrimeInt32(), 65537)
    }

    func testReturnUint32() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUint32(), 2_147_483_659)
    }

    func testReturnInt64() {
        XCTAssertEqual(StaticIntMethods.returnPrimeInt64(), 4_294_967_311)
    }

    func testReturnUint64() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUint64(), 4_294_967_311)
    }

    static var allTests = [
        ("testPassMinimumInt8", testPassMinimumInt8),
        ("testPassMinimumInt16", testPassMinimumInt16),
        ("testPassMinimumInt32", testPassMinimumInt32),
        ("testPassMinimumInt64", testPassMinimumInt64),
        ("testPassMaximumInt8", testPassMaximumInt8),
        ("testPassMaximumInt16", testPassMaximumInt16),
        ("testPassMaximumInt32", testPassMaximumInt32),
        ("testPassMaximumInt64", testPassMaximumInt64),
        ("testPassTwoInt8", testPassTwoInt8),
        ("testPassTwoUint32", testPassTwoUint32),
        ("testReturnInt8", testReturnInt8),
        ("testReturnUint8", testReturnUint8),
        ("testReturnInt16", testReturnInt16),
        ("testReturnUint16", testReturnUint16),
        ("testReturnInt32", testReturnInt32),
        ("testReturnUint32", testReturnUint32),
        ("testReturnInt64", testReturnInt64),
        ("testReturnUint64", testReturnUint64)
    ]
}
