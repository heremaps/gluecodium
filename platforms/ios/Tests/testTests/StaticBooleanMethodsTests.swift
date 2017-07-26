import XCTest
@testable import test

class StaticBooleanMethodsTests: XCTestCase {
    func testPassOneBool() {
        XCTAssertEqual(StaticBooleanMethodsTest.returnInvertedBoolean(input: true), false)
        XCTAssertEqual(StaticBooleanMethodsTest.returnInvertedBoolean(input: false), true)
    }

    func testPassTwoBool() {
        XCTAssertEqual(StaticBooleanMethodsTest.returnAndBoolean(input1: true, input2: true), true)
    }

    static var allTests = [
        ("testInvertBool", testPassOneBool),
        ("testPassTwoBool", testPassTwoBool),
    ]
}
