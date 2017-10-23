import XCTest
import hello

class MethodOverloadsTests: XCTestCase {
    func testPassBool() {
        XCTAssertTrue(MethodOverloads.isBoolean(input: true))
    }

    func testPassInt() {
        XCTAssertFalse(MethodOverloads.isBoolean(input: 8))
    }

    static var allTests = [
        ("testPassBool", testPassBool),
        ("testPassInt", testPassInt)
    ]
}
