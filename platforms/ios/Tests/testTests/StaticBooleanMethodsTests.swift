import XCTest
@testable import test

class StaticBooleanMethodsTests: XCTestCase {
    func testPassOneBool() {
        XCTAssertEqual(StaticBooleanMethods.returnInvertedBoolean(input: true), false)
        XCTAssertEqual(StaticBooleanMethods.returnInvertedBoolean(input: false), true)
    }

    func testPassTwoBool() {
        XCTAssertEqual(StaticBooleanMethods.returnAndBoolean(input1: true, input2: true), true)
    }

    static var allTests = [
        ("testInvertBool", testPassOneBool),
        ("testPassTwoBool", testPassTwoBool)
    ]
}
