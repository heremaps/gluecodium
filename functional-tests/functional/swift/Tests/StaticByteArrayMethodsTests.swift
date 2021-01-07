// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

import XCTest
import Foundation
import functional

class StaticByteArrayMethodsTests: XCTestCase {
    func testPassByteBuffer() {
        let input = Data([12, 37, 99])
        let expected = Data([99, 37, 12])
        XCTAssertEqual(
            StaticByteArrayMethods.returnReverseByteBuffer(inputBuffer: input),
            expected)
    }

    func testPassTwoByteBuffers() {
        let input1 = Data([0, 8, 15])
        let input2 = Data([47, 11])
        let expected = Data([0, 8, 15, 47, 11])
        XCTAssertEqual(
            StaticByteArrayMethods.concatenateByteBuffers(input1: input1, input2: input2),
            expected)
    }

    func testReverseBlobInStruct() {
        let input = StaticByteArrayMethods.StructWithBlob(blob: "InputBytes".data(using: .ascii)!)
        XCTAssertEqual(
            StaticByteArrayMethods.reverseBlobInStruct(input: input).blob,
            "setyBtupnI".data(using: .ascii)!)
    }

    func testReverseEmptyBlobInStruct() {
        let input = StaticByteArrayMethods.StructWithBlob(blob: Data())
        XCTAssertEqual(
            StaticByteArrayMethods.reverseBlobInStruct(input: input).blob,
            input.blob)
    }

    static var allTests = [
        ("testPassByteBuffer", testPassByteBuffer),
        ("testPassTwoByteBuffers", testPassTwoByteBuffers),
        ("testReverseBlobInStruct", testReverseBlobInStruct),
        ("testReverseEmptyBlobInStruct", testReverseEmptyBlobInStruct)
    ]
}
