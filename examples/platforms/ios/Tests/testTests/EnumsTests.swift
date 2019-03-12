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
import hello

class EnumsTests: XCTestCase {
    func testFlipEnumValue() {
      XCTAssertEqual(
        Enums.flipEnumValue(input: Enums.InternalError.errorNone),
        Enums.InternalError.errorFatal)
      XCTAssertEqual(
        Enums.flipEnumValue(input: Enums.InternalError.errorFatal),
        Enums.InternalError.errorNone)
    }

    func testExtractEnumFromStruct() {
      XCTAssertEqual(
        Enums.extractEnumFromStruct(input: Enums.ErrorStruct(
          type: Enums.InternalError.errorNone,
          message: "MESSAGE")),
        Enums.InternalError.errorFatal)
      XCTAssertEqual(
        Enums.extractEnumFromStruct(input: Enums.ErrorStruct(
          type: Enums.InternalError.errorFatal,
          message: "MESSAGE")),
        Enums.InternalError.errorNone)
    }

    func testCreateStructWithEnumInside() {
        var result = Enums.createStructWithEnumInside(
          type: Enums.InternalError.errorNone,
          message: "MESSAGE")
        XCTAssertEqual(result.type, Enums.InternalError.errorFatal)
        result = Enums.createStructWithEnumInside(
          type: Enums.InternalError.errorFatal,
          message: "MESSAGE")
        XCTAssertEqual(result.type, Enums.InternalError.errorNone)
    }

    static var allTests = [
        ("testFlipEnumValue", testFlipEnumValue),
        ("testExtractEnumFromStruct", testExtractEnumFromStruct),
        ("testCreateStructWithEnumInside", testCreateStructWithEnumInside)
    ]
}
