import XCTest
import hello

class MethodOverloadsTests: XCTestCase {
    func testPassBool() {
        XCTAssertTrue(MethodOverloads.isBoolean(input: true))
    }

    func testPassInt() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: 8))
    }

    func testPassArrayOfStrings() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: ["a", "b"]))
    }

    func testPassArrayOfInts() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: [11, 42]))
    }

    static var allTests = [
        ("testPassBool", testPassBool),
        ("testPassInt", testPassInt),
        ("testPassArrayOfStrings", testPassArrayOfStrings),
        ("testPassArrayOfInts", testPassArrayOfInts)
    ]
}
