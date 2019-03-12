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

class ConstantsTests: XCTestCase {

    func testIntConstantFromTypeCollection() {
        let result = UseTypeCollectionConstants.getIntConstant()

        XCTAssertEqual(Constants.intConstant, result)
    }

    func testUintConstantFromTypeCollection() {
        let result = UseTypeCollectionConstants.getUintConstant()

        XCTAssertEqual(Constants.uintConstant, result)
    }

    func testFloatConstantFromTypeCollection() {
        let result = UseTypeCollectionConstants.getFloatConstant()

        XCTAssertEqual(Constants.floatConstant, result)
    }

    func testDoubleConstantFromTypeCollection() {
        let result = UseTypeCollectionConstants.getDoubleConstant()

        XCTAssertEqual(Constants.doubleConstant, result)
    }

    func testStringConstantFromTypeCollection() {
        let result = UseTypeCollectionConstants.getStringConstant()

        XCTAssertEqual(Constants.stringConstant, result)
    }

    func testEnumConstantFromTypeCollection() {
        let result = UseTypeCollectionConstants.getEnumConstant()

        XCTAssertEqual(Constants.enumConstant, result)
    }

    func testIntConstantFromInterface() {
        let result = UseInterfaceConstants.getIntConstant()

        XCTAssertEqual(ConstantsInterface.intConstant, result)
    }

    func testUintConstantFromInterface() {
        let result = UseInterfaceConstants.getUintConstant()

        XCTAssertEqual(ConstantsInterface.uintConstant, result)
    }

    func testFloatConstantFromInterface() {
        let result = UseInterfaceConstants.getFloatConstant()

        XCTAssertEqual(ConstantsInterface.floatConstant, result)
    }

    func testDoubleConstantFromInterface() {
        let result = UseInterfaceConstants.getDoubleConstant()

        XCTAssertEqual(ConstantsInterface.doubleConstant, result)
    }

    func testStringConstantFromInterface() {
        let result = UseInterfaceConstants.getStringConstant()

        XCTAssertEqual(ConstantsInterface.stringConstant, result)
    }

    func testEnumConstantFromInterface() {
        let result = UseInterfaceConstants.getEnumConstant()

        XCTAssertEqual(ConstantsInterface.enumConstant, result)
    }

    static var allTests = [
        ("testIntConstantFromTypeCollection", testIntConstantFromTypeCollection),
        ("testUintConstantFromTypeCollection", testUintConstantFromTypeCollection),
        ("testFloatConstantFromTypeCollection", testFloatConstantFromTypeCollection),
        ("testDoubleConstantFromTypeCollection", testDoubleConstantFromTypeCollection),
        ("testStringConstantFromTypeCollection", testStringConstantFromTypeCollection),
        ("testEnumConstantFromTypeCollection", testEnumConstantFromTypeCollection),
        ("testIntConstantFromInterface", testIntConstantFromInterface),
        ("testUintConstantFromInterface", testUintConstantFromInterface),
        ("testFloatConstantFromInterface", testFloatConstantFromInterface),
        ("testDoubleConstantFromInterface", testDoubleConstantFromInterface),
        ("testStringConstantFromInterface", testStringConstantFromInterface),
        ("testEnumConstantFromInterface", testEnumConstantFromInterface)
    ]
}
