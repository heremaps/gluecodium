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

class NullableInstancesTests: XCTestCase {

    class NullableInstanceListenerImpl: NullableInstanceListener {
        public func nullableBottomUpRoundTrip(input: NullablePayload?) -> NullablePayload? {
            return input
        }

        public var nullableAttribute: NullablePayload?
    }

    func testTopDownNilRoundTrip() {
        let result = NullableStatic.nullableTopDownRoundTrip(input: nil)
        XCTAssertNil(result)
    }

    func testTopDownRoundTrip() {
        let result = NullableStatic.nullableTopDownRoundTrip(input: NullablePayload())
        XCTAssertNotNil(result)
    }

    func testBottomUpNilRoundTrip() {
        let result
            = NullableStatic.nullableBottomUpNullRoundTrip(listener: NullableInstanceListenerImpl())
        XCTAssertTrue(result)
    }

    func testBottomUpRoundTrip() {
        let result
            = NullableStatic.nullableBottomUpRoundTrip(listener: NullableInstanceListenerImpl())
        XCTAssertTrue(result)
    }

    func testBottomUpAttributeNilRoundTrip() {
        let result
            = NullableStatic.nullableBottomUpAttributeNullRoundTrip(listener: NullableInstanceListenerImpl())
        XCTAssertTrue(result)
    }

    func testBottomUpAttributeRoundTrip() {
        let result
            = NullableStatic.nullableBottomUpAttributeRoundTrip(listener: NullableInstanceListenerImpl())
        XCTAssertTrue(result)
    }

    static var allTests = [
        ("testTopDownNilRoundTrip", testTopDownNilRoundTrip),
        ("testTopDownRoundTrip", testTopDownRoundTrip),
        ("testBottomUpNilRoundTrip", testBottomUpNilRoundTrip),
        ("testBottomUpRoundTrip", testBottomUpRoundTrip),
        ("testBottomUpAttributeNilRoundTrip", testBottomUpAttributeNilRoundTrip),
        ("testBottomUpAttributeRoundTrip", testBottomUpAttributeRoundTrip)
    ]
}
