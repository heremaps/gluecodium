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

class OptimizedListsTests: XCTestCase {

    func testOptimizedListFromMethod() {
        let result = UseOptimizedList.fetchTheBigOnes()

        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].field, "foo")
        XCTAssertEqual(result[1].field, "bar")
    }

    func testOptimizedListIteratorFromMethod() {
        var result = UseOptimizedList.fetchTheBigOnes().makeIterator()

        XCTAssertEqual(result.next()?.field, "foo")
        XCTAssertEqual(result.next()?.field, "bar")
        XCTAssertNil(result.next())
    }

    func testOptimizedListFromProperty() {
        let result = UseOptimizedList.lazyOnes

        XCTAssertEqual(result.count, 2)
        XCTAssertNotNil(result[0])
        XCTAssertNotNil(result[1])
    }

    func testOptimizedListIteratorFromProperty() {
        var result = UseOptimizedList.lazyOnes.makeIterator()

        XCTAssertNotNil(result.next())
        XCTAssertNotNil(result.next())
        XCTAssertNil(result.next())
    }

    func testOptimizedListFromStruct() {
        let result = UseOptimizedList.getStruct().structs

        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].field, "foo")
        XCTAssertEqual(result[1].field, "bar")
    }

    static var allTests = [
        ("testOptimizedListFromMethod", testOptimizedListFromMethod),
        ("testOptimizedListIteratorFromMethod", testOptimizedListIteratorFromMethod),
        ("testOptimizedListFromProperty", testOptimizedListFromProperty),
        ("testOptimizedListIteratorFromProperty", testOptimizedListIteratorFromProperty),
        ("testOptimizedListFromStruct", testOptimizedListFromStruct)
    ]
}
