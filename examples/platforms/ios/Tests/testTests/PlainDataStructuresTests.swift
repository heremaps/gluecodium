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

class PlainDataStructuresTests: XCTestCase {
    func testReturnStruct() {
        let point = PlainDataStructures.createPoint(x: 1.2, y: 3.4)
        XCTAssertEqual(point.x, 1.2)
        XCTAssertEqual(point.y, 3.4)
    }

    func testCreatePassAndReturnStruct() {
        let point = PlainDataStructures.Point(x: 5.6, y: 7.8)
        let swappedPoint = PlainDataStructures.swapPointCoordinates(input: point)
        XCTAssertEqual(swappedPoint.x, 7.8)
        XCTAssertEqual(swappedPoint.y, 5.6)
    }

    func testReturnNestedStruct() {
        let begin = PlainDataStructures.Point(x: 1, y: 2)
        let end = PlainDataStructures.Point(x: 3, y: 4)
        let line = PlainDataStructures.createLine(pointA: begin, pointB: end)
        XCTAssertEqual(line.a.x, begin.x)
        XCTAssertEqual(line.a.y, begin.y)
        XCTAssertEqual(line.b.x, end.x)
        XCTAssertEqual(line.b.y, end.y)
    }

    func testAllBasicTypesZeroesInStruct() {
        let allTypes = PlainDataStructures.AllTypesStruct(
            int8Field: 0,
            uint8Field: 0,
            int16Field: 0,
            uint16Field: 0,
            int32Field: 0,
            uint32Field: 0,
            int64Field: 0,
            uint64Field: 0,
            floatField: 0,
            doubleField: 0,
            stringField: "",
            booleanField: false,
            bytesField: Data(),
            pointField: PlainDataStructures.Point(x: 0, y: 0))
        let result = PlainDataStructures.returnAllTypesStruct(input: allTypes)
        XCTAssertEqual(result.int8Field, 0)
        XCTAssertEqual(result.uint8Field, 0)
        XCTAssertEqual(result.int16Field, 0)
        XCTAssertEqual(result.uint16Field, 0)
        XCTAssertEqual(result.int32Field, 0)
        XCTAssertEqual(result.uint32Field, 0)
        XCTAssertEqual(result.int64Field, 0)
        XCTAssertEqual(result.uint64Field, 0)
        XCTAssertEqual(result.floatField, 0)
        XCTAssertEqual(result.doubleField, 0)
        XCTAssertEqual(result.stringField, "")
        XCTAssertEqual(result.booleanField, false)
        XCTAssertEqual(result.bytesField, Data())
        XCTAssertEqual(result.pointField.x, 0)
        XCTAssertEqual(result.pointField.y, 0)
    }

    func testAllBasicTypesCanBePassedInStruct() {
        let allTypes = PlainDataStructures.AllTypesStruct(
            int8Field: 0,
            uint8Field: 1,
            int16Field: 2,
            uint16Field: 3,
            int32Field: 4,
            uint32Field: 5,
            int64Field: 6,
            uint64Field: 7,
            floatField: 8,
            doubleField: 9,
            stringField: "10",
            booleanField: true,
            bytesField: Data([12]),
            pointField: PlainDataStructures.Point(x: 13, y: 14))
        let result = PlainDataStructures.returnAllTypesStruct(input: allTypes)
        XCTAssertEqual(result.int8Field, 0)
        XCTAssertEqual(result.uint8Field, 1)
        XCTAssertEqual(result.int16Field, 2)
        XCTAssertEqual(result.uint16Field, 3)
        XCTAssertEqual(result.int32Field, 4)
        XCTAssertEqual(result.uint32Field, 5)
        XCTAssertEqual(result.int64Field, 6)
        XCTAssertEqual(result.uint64Field, 7)
        XCTAssertEqual(result.floatField, 8)
        XCTAssertEqual(result.doubleField, 9)
        XCTAssertEqual(result.stringField, "10")
        XCTAssertEqual(result.booleanField, true)
        XCTAssertEqual(result.bytesField, Data([12]))
        XCTAssertEqual(result.pointField.x, 13)
        XCTAssertEqual(result.pointField.y, 14)
    }

    func testAllFieldsAreInitialized() {
        XCTAssertTrue(PlainDataStructures.checkAllFieldsAreInitialized())
    }

    static var allTests = [
        ("testReturnStruct", testReturnStruct),
        ("testCreatePassAndReturnStruct", testCreatePassAndReturnStruct),
        ("testReturnNestedStruct", testReturnNestedStruct),
        ("testAllBasicTypesZeroesInStruct", testAllBasicTypesZeroesInStruct),
        ("testAllBasicTypesCanBePassedInStruct", testAllBasicTypesCanBePassedInStruct),
        ("testAllFieldsAreInitialized", testAllFieldsAreInitialized)
    ]
}
