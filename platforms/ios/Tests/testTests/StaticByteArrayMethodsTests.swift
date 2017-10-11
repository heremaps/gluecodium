import XCTest
import Foundation
import hello

class StaticByteArrayMethodsTests: XCTestCase {
    func testPassByteBuffer() {
        let input = Data(bytes: [12, 37, 99])
        let expected = Data(bytes: [99, 37, 12])
        XCTAssertEqual(
            StaticByteArrayMethods.returnReverseByteBuffer(inputBuffer: input),
            expected)
    }

    func testPassTwoByteBuffers() {
        let input1 = Data(bytes: [0, 8, 15])
        let input2 = Data(bytes: [47, 11])
        let expected = Data(bytes: [0, 8, 15, 47, 11])
        XCTAssertEqual(
            StaticByteArrayMethods.concatenateByteBuffers(input1: input1, input2: input2),
            expected)
    }

    static var allTests = [
        ("testPassByteBuffer", testPassByteBuffer),
        ("testPassTwoByteBuffers", testPassTwoByteBuffers)
    ]
}
