import XCTest
import hello

class PlainDataStructuresFromTypeCollectionTests: XCTestCase {
    func testReturnStruct() {
        if let point = PlainDataStructuresFromTypeCollection.createPoint(x: 1.2, y: 3.4) {
            XCTAssertEqual(point.x, 1.2)
            XCTAssertEqual(point.y, 3.4)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testCreatePassAndReturnStruct() {
        let point = Point(x: 5.6, y: 7.8)
        if let swappedPoint = PlainDataStructuresFromTypeCollection.swapPointCoordinates(input: point) {
            XCTAssertEqual(swappedPoint.x, 7.8)
            XCTAssertEqual(swappedPoint.y, 5.6)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testReturnNestedStruct() {
        let begin = Point(x: 1, y: 2)
        let end = Point(x: 3, y: 4)
        if let line = PlainDataStructuresFromTypeCollection.createLine(pointA: begin, pointB: end) {
            XCTAssertEqual(line.a.x, begin.x)
            XCTAssertEqual(line.a.y, begin.y)
            XCTAssertEqual(line.b.x, end.x)
            XCTAssertEqual(line.b.y, end.y)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    func testAllBasicTypesCanBePassedInStruct() {
        let allTypes = AllTypesStruct(
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
            stringField: "You",
            booleanField: true,
            bytesField: Data(bytes: [1, 2, 3]),
            pointField: Point(x: 13, y: 14))
        if let result = PlainDataStructuresFromTypeCollection.modifyAllTypesStruct(input: allTypes) {
            XCTAssertEqual(result.int8Field, 1)
            XCTAssertEqual(result.uint8Field, 2)
            XCTAssertEqual(result.int16Field, 3)
            XCTAssertEqual(result.uint16Field, 4)
            XCTAssertEqual(result.int32Field, 5)
            XCTAssertEqual(result.uint32Field, 6)
            XCTAssertEqual(result.int64Field, 7)
            XCTAssertEqual(result.uint64Field, 8)
            XCTAssertEqual(result.floatField, 9)
            XCTAssertEqual(result.doubleField, 10)
            XCTAssertEqual(result.stringField, "Hello You")
            XCTAssertEqual(result.booleanField, false)
            XCTAssertEqual(result.bytesField, Data(bytes: [3, 2, 1]))
            XCTAssertEqual(result.pointField.x, 14)
            XCTAssertEqual(result.pointField.y, 13)
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
