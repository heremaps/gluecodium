// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

class MethodOverloadsTests: XCTestCase {
    func testPassBool() {
        XCTAssertTrue(MethodOverloads.isBoolean(input: true))
    }

    func testPassInt() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: 8))
    }

    func testPassArrayOfStrings() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: ["a", "b"]))
    }

    func testPassArrayOfInts() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: [11, 42]))
    }

    func testConstructorDoesNotThrow() {
        XCTAssertNoThrow(try ThrowingConstructor(input: 0.0))
    }

    func testConstructorThrows() {
      XCTAssertThrowsError(try ThrowingConstructor(input: 1.0)) { error in
        XCTAssertEqual(error as? ThrowingConstructor.ErrorEnum, ThrowingConstructor.ErrorEnum.crashed)
      }
    }

    static var allTests = [
        ("testPassBool", testPassBool),
        ("testPassInt", testPassInt),
        ("testPassArrayOfStrings", testPassArrayOfStrings),
        ("testPassArrayOfInts", testPassArrayOfInts),
        ("testConstructorDoesNotThrow", testConstructorDoesNotThrow),
        ("testConstructorThrows", testConstructorThrows)
    ]
}
