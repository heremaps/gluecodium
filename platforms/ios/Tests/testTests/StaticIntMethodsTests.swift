import XCTest
@testable import test

class StaticIntMethodsTests: XCTestCase {
    func testPassMinimumInt8() {
        XCTAssertEqual(StaticIntMethodsTest.returnNextNumberINT8(inputNumber: Int8.min), Int8.min + 1)
    }

    func testPassMinimumInt16() {
        XCTAssertEqual(StaticIntMethodsTest.returnNextNumberINT16(inputNumber: Int16.min), Int16.min + 1)
    }

    func testPassMinimumInt32() {
        XCTAssertEqual(StaticIntMethodsTest.returnNextNumberINT32(inputNumber: Int32.min), Int32.min + 1)
    }

    func testPassMinimumInt64() {
        XCTAssertEqual(StaticIntMethodsTest.returnNextNumberINT64(inputNumber: Int64.min), Int64.min + 1)
    }

    func testPassTwoInt8() {
        XCTAssertEqual(StaticIntMethodsTest.sumTwoNumbersINT8(inputNumber1: -1, inputNumber2: 2), 1)
    }

    func testPassTwoUInt32() {
        XCTAssertEqual(StaticIntMethodsTest.sumTwoNumbersUINT32(inputNumber1: 123, inputNumber2: 456), 579)
    }

    func testReturnInt8() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeINT8(), 2)
    }

    func testReturnUInt8() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeUINT8(), 131)
    }

    func testReturnInt16() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeINT16(), 257)
    }

    func testReturnUInt16() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeUINT16(), 32771)
    }

    func testReturnInt32() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeINT32(), 65537)
    }

    func testReturnUInt32() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeUINT32(), 2_147_483_659)
    }

    func testReturnInt64() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeINT64(), 4_294_967_311)
    }

    func testReturnUInt64() {
        XCTAssertEqual(StaticIntMethodsTest.returnPrimeUINT64(), 4_294_967_311)
    }

    static var allTests = [
        ("testPassMinimumInt8", testPassMinimumInt8),
        ("testPassMinimumInt16", testPassMinimumInt16),
        ("testPassMinimumInt32", testPassMinimumInt32),
        ("testPassMinimumInt64", testPassMinimumInt64),
        ("testPassTwoInt8", testPassTwoInt8),
        ("testPassTwoUInt32", testPassTwoUInt32),
        ("testReturnInt8", testReturnInt8),
        ("testReturnUInt8", testReturnUInt8),
        ("testReturnInt16", testReturnInt16),
        ("testReturnUInt16", testReturnUInt16),
        ("testReturnInt32", testReturnInt32),
        ("testReturnUInt32", testReturnUInt32),
        ("testReturnInt64", testReturnInt64),
        ("testReturnUInt64", testReturnUInt64),
    ]
}
