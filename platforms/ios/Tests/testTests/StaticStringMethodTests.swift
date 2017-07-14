import XCTest
@testable import test

class StaticStringMethodsTests: XCTestCase {
    func passEmptyString() {
        XCTAssertEqual(StaticStringMethodsTest.returnInputString(inputString: ""), "")
    }

    func testTwoStringParameters() {
        XCTAssertEqual(StaticStringMethodsTest.concatenateStrings(inputString1: "This is", inputString2: " the end"),
           "This is the end")
    }

    func testTwoStringParametersOneEmpty() {
        XCTAssertEqual(StaticStringMethodsTest.concatenateStrings(inputString1: "Yesterday", inputString2: ""),
           "Yesterday")
    }

    func testStringReturnString() {
        XCTAssertEqual(StaticStringMethodsTest.returnHelloString(), "hello")
    }

    func testEmptyReturnString() {
        XCTAssertEqual(StaticStringMethodsTest.returnEmpty(), "")
    }

    static var allTests = [
        ("passEmptyString", passEmptyString),
        ("testTwoStringParameters", testTwoStringParameters),
        ("testTwoStringParametersOneEmpty", testTwoStringParametersOneEmpty),
        ("testStringReturnString", testStringReturnString),
        ("testEmptyReturnString", testEmptyReturnString),
    ]
}
