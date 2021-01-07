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
import functional

class InterfacesTests: XCTestCase {

    func testInterfaceInstanceMethod() {
        let simple = InterfacesFactory.createSimpleInterfaceOne()
        simple.setStringValue(stringValue: "HelloSimple")

        let stringReturned = simple.getStringValue()

        XCTAssertEqual(stringReturned, "HelloSimple")
    }

    func testInterfaceGetInterfaceMethod() {
        let simpleOne = InterfacesFactory.createSimpleInterfaceOne()
        simpleOne.setStringValue(stringValue: "Hello")
        let simpleTwo = InterfacesFactory.createSimpleInterfaceOne()
        simpleTwo.setStringValue(stringValue: "World")
        let complex = InterfacesFactory.createNestedInterfaceOne()
        complex.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: simpleTwo)

        let result = complex.getInterfaceOne()

        XCTAssertNotNil(result)
        XCTAssertEqual(result.getStringValue(), "Hello")
    }

    func testSetSameTypeInterfaces() {
        let simpleOne = InterfacesFactory.createSimpleInterfaceOne()
        simpleOne.setStringValue(stringValue: "Hello")
        let simpleTwo = InterfacesFactory.createSimpleInterfaceOne()
        simpleTwo.setStringValue(stringValue: "World")
        let complex = InterfacesFactory.createNestedInterfaceOne()

        complex.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: simpleTwo)

        XCTAssertEqual(complex.getInterfaceOne().getStringValue(), "Hello")
        XCTAssertEqual(complex.getInterfaceTwo().getStringValue(), "World")
    }

    func testSetSameTypeInterfaces_identicalInterface() {
        let simple = InterfacesFactory.createSimpleInterfaceOne()
        simple.setStringValue(stringValue: "Hello")
        let complex = InterfacesFactory.createNestedInterfaceOne()

        complex.setSameTypeInterfaces(interfaceOne: simple, interfaceTwo: simple)

        XCTAssertEqual(complex.getInterfaceOne().getStringValue(), "Hello")
        XCTAssertEqual(complex.getInterfaceTwo().getStringValue(), "Hello")
    }

    func testGetNestedInterface() {
        let simpleOne = InterfacesFactory.createSimpleInterfaceOne()
        let otherSimpleOne = InterfacesFactory.createSimpleInterfaceOne()
        let simpleTwo = InterfacesFactory.createSimpleInterfaceTwo()
        let complexOne = InterfacesFactory.createNestedInterfaceOne()
        let complexTwo = InterfacesFactory.createNestedInterfaceTwo()
        simpleOne.setStringValue(stringValue: "Hello")
        otherSimpleOne.setStringValue(stringValue: "World")
        simpleTwo.setStringValue(stringValue: "Foo")
        complexOne.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: otherSimpleOne)
        complexTwo.setMultipleTypeInterfaces(interfaceOne: simpleOne,
                                             interfaceTwo: simpleTwo,
                                             nestedInterface: complexOne)

        let complexInterface = complexTwo.getNestedInterface()

        XCTAssertNotNil(complexInterface)
    }

    func testSetMultipleTypeInterface() {
        let simpleOne = InterfacesFactory.createSimpleInterfaceOne()
        let otherSimpleOne = InterfacesFactory.createSimpleInterfaceOne()
        let simpleTwo = InterfacesFactory.createSimpleInterfaceTwo()
        let complexOne = InterfacesFactory.createNestedInterfaceOne()
        let complexTwo = InterfacesFactory.createNestedInterfaceTwo()
        simpleOne.setStringValue(stringValue: "Hello")
        otherSimpleOne.setStringValue(stringValue: "World")
        simpleTwo.setStringValue(stringValue: "Foo")
        complexOne.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: otherSimpleOne)

        complexTwo.setMultipleTypeInterfaces(interfaceOne: simpleOne,
                                             interfaceTwo: simpleTwo,
                                             nestedInterface: complexOne)

        XCTAssertEqual(complexTwo.getInterfaceOne().getStringValue(), "Hello")
        XCTAssertEqual(complexTwo.getInterfaceTwo().getStringValue(), "Foo")
        let complexInterface = complexTwo.getNestedInterface()
        XCTAssertEqual(complexInterface.getInterfaceOne().getStringValue(), "Hello")
        XCTAssertEqual(complexInterface.getInterfaceTwo().getStringValue(), "World")
    }

    static var allTests = [
        ("testInterfaceInstanceMethod", testInterfaceInstanceMethod),
        ("testInterfaceGetInterfaceMethod", testInterfaceGetInterfaceMethod),
        ("testSetSameTypeInterfaces", testSetSameTypeInterfaces),
        ("testSetSameTypeInterfaces_identicalInterface", testSetSameTypeInterfaces_identicalInterface),
        ("testGetNestedInterface", testGetNestedInterface),
        ("testSetMultipleTypeInterface", testSetMultipleTypeInterface)
    ]
}
