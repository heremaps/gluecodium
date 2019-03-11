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

class DefaultsTests: XCTestCase {

    func testGetDefault() {
      let result = Defaults.getDefault()!

      let expectedStruct = Defaults.StructWithDefaults()
      XCTAssertEqual(result.intField, expectedStruct.intField)
      XCTAssertEqual(result.floatField, expectedStruct.floatField)
      XCTAssertEqual(result.boolField, expectedStruct.boolField)
      XCTAssertEqual(result.stringField, expectedStruct.stringField)
      XCTAssertEqual(result.enumField, expectedStruct.enumField)
    }

    func testWithAllButOneDefaultFields() {
        let almostDefaultStruct = Defaults.StructWithDefaults(intField: 1)
        let defaultStruct = Defaults.StructWithDefaults()

        XCTAssertNotEqual(almostDefaultStruct.intField, defaultStruct.intField)
        XCTAssertEqual(almostDefaultStruct.floatField, defaultStruct.floatField)
        XCTAssertEqual(almostDefaultStruct.boolField, defaultStruct.boolField)
        XCTAssertEqual(almostDefaultStruct.stringField, defaultStruct.stringField)
        XCTAssertEqual(almostDefaultStruct.enumField, defaultStruct.enumField)
    }

    func testCheckDefaultTrue() {
      let defaultStruct = Defaults.StructWithDefaults()

      let result = Defaults.checkDefault(input: defaultStruct)

      XCTAssertTrue(result)
    }

    func testCheckDefaultFalse() {
      let nonDefaultStruct = Defaults.StructWithDefaults(intField: 1)

      let result = Defaults.checkDefault(input: nonDefaultStruct)

      XCTAssertFalse(result)
    }

    static var allTests = [
        ("testGetDefault", testGetDefault),
        ("testWithAllButOneDefaultFields", testWithAllButOneDefaultFields),
        ("testCheckDefaultTrue", testCheckDefaultTrue),
        ("testCheckDefaultFalse", testCheckDefaultFalse)
    ]
}
