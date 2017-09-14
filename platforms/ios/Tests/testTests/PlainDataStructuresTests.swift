import XCTest
@testable import test

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

    static var allTests = [
        ("testReturnStruct", testReturnStruct),
        ("testCreatePassAndReturnStruct", testCreatePassAndReturnStruct),
        ("testReturnNestedStruct", testReturnNestedStruct),
        ("testAllBasicTypesCanBePassedInStruct", testAllBasicTypesCanBePassedInStruct)
    ]
}
