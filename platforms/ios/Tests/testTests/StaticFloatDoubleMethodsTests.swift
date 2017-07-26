import XCTest
@testable import test

class StaticFloatDoubleMethodsTests: XCTestCase {
    func testPassFloat() {
        XCTAssertEqualWithAccuracy(
            StaticFloatDoubleMethodsTest.returnIncrementedFloat(inputNumber: 3.14),
            4.14,
            accuracy: 1e-6)
    }

    func testPassFloatInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnFloat(inputNumber: Float.infinity),
            Float.infinity)
    }

    func testPassFloatNegativeInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnFloat(inputNumber: -Float.infinity),
            -Float.infinity)
    }

    func testPassFloatNaN() {
        XCTAssert(StaticFloatDoubleMethodsTest.returnFloat(inputNumber: Float.nan).isNaN)
    }

    func testPassMaximumFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnFloat(inputNumber: Float.greatestFiniteMagnitude),
            Float.greatestFiniteMagnitude)
    }

    func testPassMinimumFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnFloat(inputNumber: Float.leastNonzeroMagnitude),
            Float.leastNonzeroMagnitude)
    }

    func testPassDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnIncrementedDouble(inputNumber: 2.72),
            3.72)
    }

    func testPassDoubleInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnDouble(inputNumber: Double.infinity),
            Double.infinity)
    }

    func testPassDoubleNegativeInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnDouble(inputNumber: -Double.infinity),
            -Double.infinity)
    }

    func testPassDoubleNaN() {
        XCTAssert(StaticFloatDoubleMethodsTest.returnDouble(inputNumber: Double.nan).isNaN)
    }

    func testPassMaximumDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnDouble(inputNumber: Double.greatestFiniteMagnitude),
            Double.greatestFiniteMagnitude)
    }

    func testPassMinimumDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.returnDouble(inputNumber: Double.leastNonzeroMagnitude),
            Double.leastNonzeroMagnitude)
    }

    func testPassTwoFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.sumTwoFloats(inputNumber1: 2, inputNumber2: 0.5),
            2.5)
    }

    func testPassTwoDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethodsTest.sumTwoDoubles(inputNumber1: 2, inputNumber2: 0.5),
            2.5)
    }

    static var allTests = [
        ("testPassFloat", testPassFloat),
        ("testPassFloatInfinity", testPassFloatInfinity),
        ("testPassFloatNegativeInfinity", testPassFloatNegativeInfinity),
        ("testPassFloatNaN", testPassFloatNaN),
        ("testPassMaximumFloat", testPassMaximumFloat),
        ("testPassMinimumFloat", testPassMinimumFloat),
        ("testPassDouble", testPassDouble),
        ("testPassDoubleInfinity", testPassDoubleInfinity),
        ("testPassDoubleNegativeInfinity", testPassDoubleNegativeInfinity),
        ("testPassDoubleNaN", testPassDoubleNaN),
        ("testPassMaximumDouble", testPassMaximumDouble),
        ("testPassMinimumDouble", testPassMinimumDouble),
        ("testPassTwoFloat", testPassTwoFloat),
        ("testPassTwoDouble", testPassTwoDouble),
    ]
}
