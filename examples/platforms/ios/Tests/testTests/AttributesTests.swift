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

class AttributesTests: XCTestCase {
    let attributes: Attributes = Attributes()

    func testBuiltInTypeAttribute() {
      attributes.builtInTypeAttribute = 42

      XCTAssertEqual(42, attributes.builtInTypeAttribute)
    }

    func testReadonlyAttribute() {
      XCTAssertEqual(3.14, attributes.readonlyAttribute, accuracy: 1e-6)
    }

    func testStructAttribute() {
      let expectedStruct = Attributes.ExampleStruct(value: 2.71, intValue: [])

      attributes.structAttribute = expectedStruct
      let actualStruct = attributes.structAttribute

      XCTAssertEqual(expectedStruct.value, actualStruct.value, accuracy: 1e-6)
    }

    func testStructArrayLiteralAttribute() {
      var expectedStruct = Attributes.ExampleStruct(value: 2.71, intValue: [])
      expectedStruct.intValue = [1, 2, 3, 4]
      XCTAssertEqual(expectedStruct.intValue, [1, 2, 3, 4])
    }

    func testStaticAttribute() {
      Attributes.staticAttribute = "fooBar"

      XCTAssertEqual("fooBar", Attributes.staticAttribute)
    }

    func testCachedProperty() {
      let instance = CachedProperties()

      XCTAssertEqual(0, instance.callCount)

      let result1 = instance.cachedProperty
      let result2 = instance.cachedProperty

      XCTAssertEqual(1, instance.callCount)
      XCTAssertEqual(["foo", "bar"], result1)
    }

    func testStaticCachedProperty() {
      XCTAssertEqual(0, CachedProperties.staticCallCount)

      let result1 = CachedProperties.staticCachedProperty
      let result2 = CachedProperties.staticCachedProperty

      XCTAssertEqual(1, CachedProperties.staticCallCount)
      XCTAssertEqual(Data([0, 1, 2]), result1)
    }

    static var allTests = [
        ("testBuiltInTypeAttribute", testBuiltInTypeAttribute),
        ("testReadonlyAttribute", testReadonlyAttribute),
        ("testStructAttribute", testStructAttribute),
        ("testStructArrayLiteralAttribute", testStructArrayLiteralAttribute),
        ("testStaticAttribute", testStaticAttribute),
        ("testCachedProperty", testCachedProperty),
        ("testStaticCachedProperty", testStaticCachedProperty)
    ]
}
