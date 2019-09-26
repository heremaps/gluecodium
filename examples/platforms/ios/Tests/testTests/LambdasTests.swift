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
import hello

class LambdasTests: XCTestCase {

    func testCppLambdaInJava() {
        let result = Lambdas.getConcatenator(delimiter: ">.<")("foo", "bar")

        XCTAssertEqual(result, "foo>.<bar")
    }

    func testJavaLambdaInCpp() {
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

    static var allTests = [
        ("testCppLambdaInJava", testCppLambdaInJava),
        ("testJavaLambdaInCpp", testJavaLambdaInCpp),
        ("testCapturingRoundtrip", testCapturingRoundtrip)
    ]
}
