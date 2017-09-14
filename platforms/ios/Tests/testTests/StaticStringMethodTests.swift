import XCTest
@testable import test

class StaticStringMethodsTests: XCTestCase {
    func testPassEmptyString() {
        XCTAssertEqual(StaticStringMethods.returnInputString(inputString: ""), "")
    }

    func testTwoStringParameters() {
        XCTAssertEqual(
            StaticStringMethods.concatenateStrings(
                inputString1: "This is",
                inputString2: " the end"),
            "This is the end")
    }

    func testTwoStringParametersOneEmpty() {
        XCTAssertEqual(
            StaticStringMethods.concatenateStrings(inputString1: "Yesterday", inputString2: ""),
            "Yesterday")
    }

    func testStringReturnString() {
        XCTAssertEqual(StaticStringMethods.returnHelloString(), "hello")
    }

    func testEmptyReturnString() {
        XCTAssertEqual(StaticStringMethods.returnEmpty(), "")
    }

    static var allTests = [
        ("testPassEmptyString", testPassEmptyString),
        ("testTwoStringParameters", testTwoStringParameters),
        ("testTwoStringParametersOneEmpty", testTwoStringParametersOneEmpty),
        ("testStringReturnString", testStringReturnString),
        ("testEmptyReturnString", testEmptyReturnString)
    ]
}
