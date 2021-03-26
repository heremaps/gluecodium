// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

class InterfaceWithStaticTests: XCTestCase {

    class InterfaceWithStaticImpl: InterfaceWithStatic {
        private var foo: String = "buzz2"
        private static var bar: String = "nonsense2"

        public func regularFunction() -> String {
            return "buzz1"
        }

        public var regularProperty: String {
            get { return foo }
            set { foo = newValue }
        }

        public static func staticFunction() -> String {
            return "nonsense1"
        }

        public static var staticProperty: String {
            get { return bar }
            set { bar = newValue }
        }
    }

    func testStaticFunction() {
        let result = type(of: UseInterfaceWithStatic.createInterfaceWithStatic()).staticFunction()

        XCTAssertEqual(result, "bar1")
    }

    func testStaticPropertyGetter() {
        let result = type(of: UseInterfaceWithStatic.createInterfaceWithStatic()).staticProperty

        XCTAssertEqual(result, "bar2")
    }

    func testStaticPropertySetter() {
        type(of: UseInterfaceWithStatic.createInterfaceWithStatic()).staticProperty = "wizz1"
        let result = type(of: UseInterfaceWithStatic.createInterfaceWithStatic()).staticProperty
        UseInterfaceWithStatic.resetStaticValue()

        XCTAssertEqual(result, "wizz1")
    }

    func testStaticFunctionOnProxy() {
        let instance = InterfaceWithStaticImpl()

        let result = UseInterfaceWithStatic.invokeStaticFunction(instance: instance)

        XCTAssertEqual(result, "bar1")
    }

    func testStaticPropertyGetterOnProxy() {
        let instance = InterfaceWithStaticImpl()

        let result = UseInterfaceWithStatic.invokeStaticGetter(instance: instance)

        XCTAssertEqual(result, "bar2")
    }

    func testStaticPropertySetterOnProxy() {
        let instance = InterfaceWithStaticImpl()

        UseInterfaceWithStatic.invokeStaticSetter(instance: instance, value: "wizz2")
        let result = UseInterfaceWithStatic.invokeStaticGetter()
        UseInterfaceWithStatic.resetStaticValue()

        XCTAssertEqual(result, "wizz2")
    }


    static var allTests = [
        ("testStaticFunction", testStaticFunction),
        ("testStaticPropertyGetter", testStaticPropertyGetter),
        ("testStaticPropertySetter", testStaticPropertySetter),
        ("testStaticFunctionOnProxy", testStaticFunctionOnProxy),
        ("testStaticPropertyGetterOnProxy", testStaticPropertyGetterOnProxy),
        ("testStaticPropertySetterOnProxy", testStaticPropertySetterOnProxy)
    ]
}
