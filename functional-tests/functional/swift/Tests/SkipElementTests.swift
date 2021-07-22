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

class SkipElementTests: XCTestCase {
    // Compile-time check that SkipTagsInSwift contains exactly one method.
    class SkipTagsInSwiftImpl: SkipTagsInSwift {
        func dontSkipTagged() {}
    }

    func testAutoTagRoundTrip() {
        let value = SkipEnumeratorAutoTag.three

        let result = UseSkipEnumerator.autoTagRoundTrip(input: value)

        XCTAssertEqual(result, value)
    }

    func testExplicitTagRoundTrip() {
        let value = SkipEnumeratorExplicitTag.three

        let result = UseSkipEnumerator.explicitTagRoundTrip(input: value)

        XCTAssertEqual(result, value)
    }

    static var allTests = [
        ("testAutoTagRoundTrip", testAutoTagRoundTrip),
        ("testExplicitTagRoundTrip", testExplicitTagRoundTrip)
    ]
}
