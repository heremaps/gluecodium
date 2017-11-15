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
        XCTAssertFalse(ArrayMethodOverloads.isBoolean(input: ["a", "b"]))
    }

    func testPassArrayOfInts() {
        XCTAssertFalse(ArrayMethodOverloads.isBoolean(input: [11, 42]))
    }

    static var allTests = [
        ("testPassBool", testPassBool),
        ("testPassInt", testPassInt),
        ("testPassArrayOfStrings", testPassArrayOfStrings),
        ("testPassArrayOfInts", testPassArrayOfInts)
    ]
}
