// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

class HelloWorldInstancesTests: XCTestCase {

    func testInstanceCreation() {
        let simple = HelloWorldFactory.createSimple()
        XCTAssertNotNil(simple)
    }

    func testInstanceMethod() {
        let simple = HelloWorldFactory.createSimple()
        simple!.setStringValue(stringValue: "HelloSimple")
        let stringReturned = simple!.getStringValue()!
        XCTAssertEqual(stringReturned, "HelloSimple")
    }

    func testNestedInstances() {
        let simple = HelloWorldFactory.createSimple()
        simple?.setStringValue(stringValue: "Hello")
        XCTAssertNotNil(simple)
        let complex = HelloWorldFactory.createNested(simpleInstanceRef: simple!)
        XCTAssertNotNil(complex)
        XCTAssertEqual(complex?.getInstantiable()?.getStringValue(), "Hello")
    }

    func testInvalidInstance() {
        let instance = InstancesFactory.createNestedInstantiableOne()
        let invalid = instance!.getInstanceOne()
        XCTAssertNil(invalid)
    }

    static var allTests = [
        ("testInstanceCreation", testInstanceCreation),
        ("testInstanceMethod", testInstanceMethod),
        ("testNestedInstances", testNestedInstances),
        ("testInvalidInstance", testInvalidInstance)
    ]
}
