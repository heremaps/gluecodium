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

class PlainDataStructuresTests: XCTestCase {
    func testReturnStruct() {
        if let point = PlainDataStructures.createPoint(x: 1.2, y: 3.4) {
            XCTAssertEqual(point.x, 1.2)
            XCTAssertEqual(point.y, 3.4)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testCreatePassAndReturnStruct() {
        let point = PlainDataStructures.Point(x: 5.6, y: 7.8)
        if let swappedPoint = PlainDataStructures.swapPointCoordinates(input: point) {
            XCTAssertEqual(swappedPoint.x, 7.8)
            XCTAssertEqual(swappedPoint.y, 5.6)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testReturnNestedStruct() {
        let begin = PlainDataStructures.Point(x: 1, y: 2)
        let end = PlainDataStructures.Point(x: 3, y: 4)
        if let line = PlainDataStructures.createLine(pointA: begin, pointB: end) {
            XCTAssertEqual(line.a.x, begin.x)
            XCTAssertEqual(line.a.y, begin.y)
            XCTAssertEqual(line.b.x, end.x)
            XCTAssertEqual(line.b.y, end.y)
        } else {
            XCTFail("Returned struct is nil")
        }
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
            bytesField: Data(bytes: [12]),
            pointField: PlainDataStructures.Point(x: 13, y: 14))
        if let result = PlainDataStructures.returnAllTypesStruct(input: allTypes) {
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
            XCTAssertEqual(result.bytesField, Data(bytes: [12]))
            XCTAssertEqual(result.pointField.x, 13)
            XCTAssertEqual(result.pointField.y, 14)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testReturnColoredLineInherited() {
        let color = PlainDataStructures.Color(red: 1, green: 2, blue: 3)
        let point1 = PlainDataStructures.Point(x: 11, y: 12)
        let point2 = PlainDataStructures.Point(x: 13, y: 14)
        let coloredLine = PlainDataStructures.ColoredLineInherited(a: point1, b: point2, color: color)

        if let result = PlainDataStructures.returnColoredLineInherited(input: coloredLine) {
            XCTAssertEqual(result.a.x, coloredLine.a.x)
            XCTAssertEqual(result.a.y, coloredLine.a.y)
            XCTAssertEqual(result.b.x, coloredLine.b.x)
            XCTAssertEqual(result.b.y, coloredLine.b.y)
            XCTAssertEqual(result.color.red, coloredLine.color.red)
            XCTAssertEqual(result.color.green, coloredLine.color.green)
            XCTAssertEqual(result.color.blue, coloredLine.color.blue)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testConvertColoredLineInheritedToLine() {
        let color = PlainDataStructures.Color(red: 1, green: 2, blue: 3)
        let point1 = PlainDataStructures.Point(x: 11, y: 12)
        let point2 = PlainDataStructures.Point(x: 13, y: 14)
        let coloredLine = PlainDataStructures.ColoredLineInherited(a: point1, b: point2, color: color)

        let result = coloredLine.convertToLine()

        XCTAssertEqual(result.a.x, coloredLine.a.x)
        XCTAssertEqual(result.a.y, coloredLine.a.y)
        XCTAssertEqual(result.b.x, coloredLine.b.x)
        XCTAssertEqual(result.b.y, coloredLine.b.y)
    }

    func testPassColoredLineInheritedAsLine() {
        let color = PlainDataStructures.Color(red: 1, green: 2, blue: 3)
        let point1 = PlainDataStructures.Point(x: 11, y: 12)
        let point2 = PlainDataStructures.Point(x: 13, y: 14)
        let coloredLine = PlainDataStructures.ColoredLineInherited(a: point1, b: point2, color: color)

        if let result = PlainDataStructures.createColoredLine(line: coloredLine.convertToLine(), color: color) {
            XCTAssertEqual(result.line.a.x, coloredLine.a.x)
            XCTAssertEqual(result.line.a.y, coloredLine.a.y)
            XCTAssertEqual(result.line.b.x, coloredLine.b.x)
            XCTAssertEqual(result.line.b.y, coloredLine.b.y)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testAssignInstanceToNativeInheritedStruct() {
        let native = hello.InstanceInStruct.ExtendedSelfHolder(
            mySelf: hello.InstanceInStruct.create(), additionalField: "SIMPLE")
        native.mySelf?.setStringValue(stringValue: "Hello")

        XCTAssertEqual(native.mySelf?.getStringValue(), "Hello")
        XCTAssertEqual(native.additionalField, "SIMPLE")
    }

    func testInheritedStructWithInstance() {
        let fromBaseApi = hello.InstanceInStruct.createInInheritedStruct()!
        fromBaseApi.mySelf?.setStringValue(stringValue: "Hello")

        XCTAssertEqual(fromBaseApi.mySelf?.getStringValue(), "Hello")
        XCTAssertEqual(fromBaseApi.additionalField, "CREATED")
    }

    func testCastingInheritedStructWithInstance() {
        let fromBaseApi = hello.InstanceInStruct.createInInheritedStruct()!
        let base = fromBaseApi.convertToSelfHolder()
        base.mySelf?.setStringValue(stringValue: "Hello")

        XCTAssertEqual(fromBaseApi.mySelf?.getStringValue(), "Hello")
    }

    static var allTests = [
        ("testReturnStruct", testReturnStruct),
        ("testCreatePassAndReturnStruct", testCreatePassAndReturnStruct),
        ("testReturnNestedStruct", testReturnNestedStruct),
        ("testAllBasicTypesCanBePassedInStruct", testAllBasicTypesCanBePassedInStruct),
        ("testReturnColoredLineInherited", testReturnColoredLineInherited),
        ("testConvertColoredLineInheritedToLine", testConvertColoredLineInheritedToLine),
        ("testPassColoredLineInheritedAsLine", testPassColoredLineInheritedAsLine),
        ("testAssignInstanceToNativeInheritedStruct", testAssignInstanceToNativeInheritedStruct),
        ("testInheritedStructWithInstance", testInheritedStructWithInstance),
        ("testCastingInheritedStructWithInstance", testCastingInheritedStructWithInstance)
    ]
}
