import XCTest
import hello

class StaticFloatDoubleMethodsTests: XCTestCase {
    func testPassFloat() {
        XCTAssertEqualWithAccuracy(
            StaticFloatDoubleMethods.returnIncrementedFloat(inputNumber: 3.14),
            4.14,
            accuracy: 1e-6)
    }

    func testPassFloatInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: Float.infinity),
            Float.infinity)
    }

    func testPassFloatNegativeInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: -Float.infinity),
            -Float.infinity)
    }

    func testPassFloatNaN() {
        XCTAssert(StaticFloatDoubleMethods.returnFloat(inputNumber: Float.nan).isNaN)
    }

    func testPassMaximumFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: Float.greatestFiniteMagnitude),
            Float.greatestFiniteMagnitude)
    }

    func testPassMinimumFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnFloat(inputNumber: Float.leastNonzeroMagnitude),
            Float.leastNonzeroMagnitude)
    }

    func testPassDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnIncrementedDouble(inputNumber: 2.72),
            3.72)
    }

    func testPassDoubleInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: Double.infinity),
            Double.infinity)
    }

    func testPassDoubleNegativeInfinity() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: -Double.infinity),
            -Double.infinity)
    }

    func testPassDoubleNaN() {
        XCTAssert(StaticFloatDoubleMethods.returnDouble(inputNumber: Double.nan).isNaN)
    }

    func testPassMaximumDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: Double.greatestFiniteMagnitude),
            Double.greatestFiniteMagnitude)
    }

    func testPassMinimumDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.returnDouble(inputNumber: Double.leastNonzeroMagnitude),
            Double.leastNonzeroMagnitude)
    }

    func testPassTwoFloat() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.sumTwoFloats(inputNumber1: 2, inputNumber2: 0.5),
            2.5)
    }

    func testPassTwoDouble() {
        XCTAssertEqual(
            StaticFloatDoubleMethods.sumTwoDoubles(inputNumber1: 2, inputNumber2: 0.5),
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
        ("testPassTwoDouble", testPassTwoDouble)
    ]
}
