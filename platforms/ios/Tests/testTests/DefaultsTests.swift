import XCTest
import hello

class DefaultsTests: XCTestCase {

    func testGetDefault() {
      let result = Defaults.getDefault()!

      let expectedStruct = Defaults.StructWithDefaults()
      XCTAssertEqual(result.intField, expectedStruct.intField)
      XCTAssertEqual(result.floatField, expectedStruct.floatField)
      XCTAssertEqual(result.boolField, expectedStruct.boolField)
      XCTAssertEqual(result.stringField, expectedStruct.stringField)
      XCTAssertEqual(result.enumField, expectedStruct.enumField)
    }

    func testCheckDefaultTrue() {
      let defaultStruct = Defaults.StructWithDefaults()

      let result = Defaults.checkDefault(input: defaultStruct)

      XCTAssertTrue(result)
    }

    func testCheckDefaultFalse() {
      let nonDefaultStruct = Defaults.StructWithDefaults(intField: 1)

      let result = Defaults.checkDefault(input: nonDefaultStruct)

      XCTAssertFalse(result)
    }

    static var allTests = [
        ("testGetDefault", testGetDefault),
        ("testCheckDefaultTrue", testCheckDefaultTrue),
        ("testCheckDefaultFalse", testCheckDefaultFalse)
    ]
}
