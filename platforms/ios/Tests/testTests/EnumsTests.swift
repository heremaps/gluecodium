import XCTest
@testable import test

class EnumsTests: XCTestCase {
    func testFlipEnumValue() {
      XCTAssertEqual(
        Enums.flipEnumValue(input: Enums.InternalError.errorNone),
        Enums.InternalError.errorFatal)
      XCTAssertEqual(
        Enums.flipEnumValue(input: Enums.InternalError.errorFatal),
        Enums.InternalError.errorNone)
    }

    func testExtractEnumFromStruct() {
      XCTAssertEqual(
        Enums.extractEnumFromStruct(input: Enums.ErrorStruct(
          type: Enums.InternalError.errorNone,
          message: "MESSAGE")),
        Enums.InternalError.errorFatal)
      XCTAssertEqual(
        Enums.extractEnumFromStruct(input: Enums.ErrorStruct(
          type: Enums.InternalError.errorFatal,
          message: "MESSAGE")),
        Enums.InternalError.errorNone)
    }

    func testCreateStructWithEnumInside() {
        if let result = Enums.createStructWithEnumInside(
          type: Enums.InternalError.errorNone,
          message: "MESSAGE") {
            XCTAssertEqual(result.type, Enums.InternalError.errorFatal)
        } else {
            XCTFail("Returned struct is nil")
        }
        if let result = Enums.createStructWithEnumInside(
          type: Enums.InternalError.errorFatal,
          message: "MESSAGE") {
            XCTAssertEqual(result.type, Enums.InternalError.errorNone)
        } else {
            XCTFail("Returned struct is nil")
        }
    }

    static var allTests = [
        ("testFlipEnumValue", testFlipEnumValue),
        ("testExtractEnumFromStruct", testExtractEnumFromStruct),
        ("testCreateStructWithEnumInside", testCreateStructWithEnumInside)
    ]
}
