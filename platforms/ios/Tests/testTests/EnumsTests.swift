import XCTest
@testable import test

class EnumsTests: XCTestCase {
    func testFlipEnumValue() {
      XCTAssertEqual(
        Enums.flipEnumValue(input: Enums.InternalError.error_none),
        Enums.InternalError.error_fatal)
      XCTAssertEqual(
        Enums.flipEnumValue(input: Enums.InternalError.error_fatal),
        Enums.InternalError.error_none)
    }

    func testExtractEnumFromStruct() {
      XCTAssertEqual(
        Enums.extractEnumFromStruct(input: Enums.ErrorStruct(
          type: Enums.InternalError.error_none,
          message: "MESSAGE")),
        Enums.InternalError.error_fatal)
      XCTAssertEqual(
        Enums.extractEnumFromStruct(input: Enums.ErrorStruct(
          type: Enums.InternalError.error_fatal,
          message: "MESSAGE")),
        Enums.InternalError.error_none)
    }

    func testCreateStructWithEnumInside() {
        if let result = Enums.createStructWithEnumInside(
          type: Enums.InternalError.error_none,
          message: "MESSAGE") {
            XCTAssertEqual(result.type, Enums.InternalError.error_fatal)
        } else {
            XCTFail("Returned struct is nil")
        }
        if let result = Enums.createStructWithEnumInside(
          type: Enums.InternalError.error_fatal,
          message: "MESSAGE") {
            XCTAssertEqual(result.type, Enums.InternalError.error_none)
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
