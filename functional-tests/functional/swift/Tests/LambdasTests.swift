// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2024 HERE Europe B.V.
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
import functional

class LambdasTests: XCTestCase {

    func testCppLambdaInSwift() {
        let result = Lambdas.getConcatenator(delimiter: ">.<")("foo", "bar")

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testSwiftLambdaInCpp() {
        let delimiter = ">.<"
        let concatenator = { (str1: String, str2: String) in str1+delimiter+str2 }
        let result = Lambdas.concatenate(string1: "foo", string2: "bar", concatenator: concatenator)

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testCapturingRoundtrip() {
        let concatenator = { (str1: String, str2: String) in str1+str2 }
        let tricatenator =
            Lambdas.composeConcatenators(concatenator1: concatenator, concatenator2: concatenator)
        let result = tricatenator("foo", ">.<", "bar")

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testConcatenateList() {
        let concatenator = { (str1: String, str2: String) in str1+str2 }
        let result = Lambdas.concatenateList(strings: ["foo", ">.<", "bar"],
                                             concatenators: [concatenator, concatenator])

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testCppLambdaInSwiftInStruct() {
        let result = Lambdas.getConcatenatorInStruct(delimiter: ">.<").concatenator("foo", "bar")

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testSwiftLambdaInCppInStruct() {
        let delimiter = ">.<"
        let concatenator = { (str1: String, str2: String) in str1+delimiter+str2 }
        let holder = Lambdas.LambdaHolder(concatenator: concatenator)
        let result = Lambdas.concatenateInStruct(string1: "foo", string2: "bar", concatenator: holder)

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testNullableCppLambdaInSwift() {
        let result = Lambdas.getConcatenatorOrNull(delimiter: ">.<")!("foo", "bar")

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testNullCppLambdaInSwift() {
        let result = Lambdas.getConcatenatorOrNull(delimiter: nil)

        XCTAssertNil(result)
    }

    func testNullableSwiftLambdaInCpp() {
        let delimiter = ">.<"
        let concatenator = { (str1: String, str2: String) in str1+delimiter+str2 }
        let result = Lambdas.concatenateOrNot(string1: "foo", string2: "bar", concatenator: concatenator)

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testNullableSwiftLambdaInCppWithNil() {
        let result = Lambdas.concatenateOrNot(string1: "foo", string2: "bar", concatenator: nil)

        XCTAssertNil(result)
    }

    func testGetSetLambdaProperty() {
        Lambdas.realConcatenator = Lambdas.getConcatenator(delimiter: ">.<")
        let result = Lambdas.realConcatenator("foo", "bar")

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testCppNullableLambdaInSwiftWithValue() {
        let result = Lambdas.getNullableConfuser()("foo")

        XCTAssertEqual(result!(), "foo")
    }

    func testCppNullableLambdaInSwiftWithNil() {
        let result = Lambdas.getNullableConfuser()(nil)

        XCTAssertNil(result)
    }

    func testSwiftNullableLambdaInCppWithValue() {
        let confuser = { (str1: String?) in str1 != nil ? { str1! } : nil }
        let result = Lambdas.applyNullableConfuser(confuser: confuser, value: "foo")

        XCTAssertEqual(result!(), "foo")
    }

    func testSwiftNullableLambdaInCppWithNil() {
        let confuser = { (str1: String?) in str1 != nil ? { str1! } : nil }
        let result = Lambdas.applyNullableConfuser(confuser: confuser, value: nil)

        XCTAssertNil(result)
    }

    func testCallingSwiftLambdaFromCppForLambdaDefinedInStruct() {
        let callback = { (arg: String?) in return arg }
        let result = StructWithLambda.invokeCallback(callback: callback)

        XCTAssertEqual(result, "some callback argument");
    }

    static var allTests = [
        ("testCppLambdaInSwift", testCppLambdaInSwift),
        ("testSwiftLambdaInCpp", testSwiftLambdaInCpp),
        ("testCapturingRoundtrip", testCapturingRoundtrip),
        ("testConcatenateList", testConcatenateList),
        ("testCppLambdaInSwiftInStruct", testCppLambdaInSwiftInStruct),
        ("testSwiftLambdaInCppInStruct", testSwiftLambdaInCppInStruct),
        ("testNullableCppLambdaInSwift", testNullableCppLambdaInSwift),
        ("testNullCppLambdaInSwift", testNullCppLambdaInSwift),
        ("testNullableSwiftLambdaInCpp", testNullableSwiftLambdaInCpp),
        ("testNullableSwiftLambdaInCppWithNil", testNullableSwiftLambdaInCppWithNil),
        ("testGetSetLambdaProperty", testGetSetLambdaProperty),
        ("testCppNullableLambdaInSwiftWithValue", testCppNullableLambdaInSwiftWithValue),
        ("testCppNullableLambdaInSwiftWithNil", testCppNullableLambdaInSwiftWithNil),
        ("testSwiftNullableLambdaInCppWithValue", testSwiftNullableLambdaInCppWithValue),
        ("testSwiftNullableLambdaInCppWithNil", testSwiftNullableLambdaInCppWithNil),
        ("testCallingSwiftLambdaFromCppForLambdaDefinedInStruct", testCallingSwiftLambdaFromCppForLambdaDefinedInStruct)
    ]
}
