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
import hello

class NullableListenersTests: XCTestCase {
    class NullableListenerImpl: NullableListener {
        var arrayAttribute: [String]?

        func methodWithDouble(input: Double?) -> Double? {
            return input
        }
    }

    let nullableInterface = NullableInterface()

    func testNullableMethodListenerRoundtripWithNull() {
        let listener = NullableListenerImpl()
        let value: Double? = nil

        let result = NullableInterface.nullableListenerMethodRoundTrip(listener: listener, input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableMethodListenerRoundtripWithNonNull() {
        let listener = NullableListenerImpl()
        let value: Double? = 3.14

        let result = NullableInterface.nullableListenerMethodRoundTrip(listener: listener, input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableAttributeListenerRoundtripWithNull() {
        let listener = NullableListenerImpl()
        let value: [String]? = nil

        let result = NullableInterface.nullableListenerAttributeRoundTrip(listener: listener, input: value)

        XCTAssertEqual(result, value)
    }

    func testNullableAttributeListenerRoundtripWithNonNull() {
        let listener = NullableListenerImpl()
        let value: [String]? = []

        let result = NullableInterface.nullableListenerAttributeRoundTrip(listener: listener, input: value)

        XCTAssertEqual(result, value)
    }

    static var allTests = [
        ("testNullableMethodListenerRoundtripWithNull", testNullableMethodListenerRoundtripWithNull),
        ("testNullableMethodListenerRoundtripWithNonNull", testNullableMethodListenerRoundtripWithNonNull),
        ("testNullableAttributeListenerRoundtripWithNull", testNullableAttributeListenerRoundtripWithNull),
        ("testNullableAttributeListenerRoundtripWithNonNull", testNullableAttributeListenerRoundtripWithNonNull)
    ]
}
