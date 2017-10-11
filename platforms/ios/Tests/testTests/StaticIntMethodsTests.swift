import XCTest
import hello

class StaticIntMethodsTests: XCTestCase {
    func testPassMinimumInt8() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT8(inputNumber: Int8.min),
            Int8.min + 1)
    }

    func testPassMinimumInt16() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT16(inputNumber: Int16.min),
            Int16.min + 1)
    }

    func testPassMinimumInt32() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT32(inputNumber: Int32.min),
            Int32.min + 1)
    }

    func testPassMinimumInt64() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT64(inputNumber: Int64.min),
            Int64.min + 1)
    }

    func testPassMaximumInt8() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT8(inputNumber: Int8.max - 1),
            Int8.max)
    }

    func testPassMaximumInt16() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT16(inputNumber: Int16.max - 1),
            Int16.max)
    }

    func testPassMaximumInt32() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT32(inputNumber: Int32.max - 1),
            Int32.max)
    }

    func testPassMaximumInt64() {
        XCTAssertEqual(
            StaticIntMethods.returnNextNumberINT64(inputNumber: Int64.max - 1),
            Int64.max)
    }

    func testPassTwoInt8() {
        XCTAssertEqual(
            StaticIntMethods.sumTwoNumbersINT8(inputNumber1: -1, inputNumber2: 2),
            1)
    }

    func testPassTwoUInt32() {
        XCTAssertEqual(
            StaticIntMethods.sumTwoNumbersUINT32(inputNumber1: 123, inputNumber2: 456),
            579)
    }

    func testReturnInt8() {
        XCTAssertEqual(StaticIntMethods.returnPrimeINT8(), 2)
    }

    func testReturnUInt8() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUINT8(), 131)
    }

    func testReturnInt16() {
        XCTAssertEqual(StaticIntMethods.returnPrimeINT16(), 257)
    }

    func testReturnUInt16() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUINT16(), 32771)
    }

    func testReturnInt32() {
        XCTAssertEqual(StaticIntMethods.returnPrimeINT32(), 65537)
    }

    func testReturnUInt32() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUINT32(), 2_147_483_659)
    }

    func testReturnInt64() {
        XCTAssertEqual(StaticIntMethods.returnPrimeINT64(), 4_294_967_311)
    }

    func testReturnUInt64() {
        XCTAssertEqual(StaticIntMethods.returnPrimeUINT64(), 4_294_967_311)
    }

    static var allTests = [
        ("testPassMinimumInt8", testPassMinimumInt8),
        ("testPassMinimumInt16", testPassMinimumInt16),
        ("testPassMinimumInt32", testPassMinimumInt32),
        ("testPassMinimumInt64", testPassMinimumInt64),
        ("testPassMaximumInt8", testPassMaximumInt8),
        ("testPassMaximumInt16", testPassMaximumInt16),
        ("testPassMaximumInt32", testPassMaximumInt32),
        ("testPassMaximumInt64", testPassMaximumInt64),
        ("testPassTwoInt8", testPassTwoInt8),
        ("testPassTwoUInt32", testPassTwoUInt32),
        ("testReturnInt8", testReturnInt8),
        ("testReturnUInt8", testReturnUInt8),
        ("testReturnInt16", testReturnInt16),
        ("testReturnUInt16", testReturnUInt16),
        ("testReturnInt32", testReturnInt32),
        ("testReturnUInt32", testReturnUInt32),
        ("testReturnInt64", testReturnInt64),
        ("testReturnUInt64", testReturnUInt64)
    ]
}
