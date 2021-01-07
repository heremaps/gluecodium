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

class StructWithInstanceTests: XCTestCase {

    func testAssignInstanceToStruct() {
        let simpleOne = InstanceInStruct.SelfHolder(mySelf: InstanceInStruct.create())
        simpleOne.mySelf.setStringValue(stringValue: "Hello")

        XCTAssertEqual(simpleOne.mySelf.getStringValue(), "Hello")
    }

    func testCopyInstanceInStruct() {
        let one = InstanceInStruct.SelfHolder(mySelf: InstanceInStruct.create())
        do {
           let other = one
           other.mySelf.setStringValue(stringValue: "Hello")
        }
        XCTAssertEqual(one.mySelf.getStringValue(), "Hello")
    }

    func testCopyInstanceInStructFromMethod() {
        let one = InstanceInStruct.createInStruct()
        do {
           let other = one
           other.mySelf.setStringValue(stringValue: "Hello")
        }
        XCTAssertEqual(one.mySelf.getStringValue(), "Hello")
    }

    func testInstanceInNotNullStruct() {
        let structNotNull = InstanceInStruct.createInNotNullStruct()
        XCTAssertNotNil(structNotNull)
        XCTAssertNotNil(structNotNull.mySelf)
    }

    static var allTests = [
        ("testAssignInstanceToStruct", testAssignInstanceToStruct),
        ("testCopyInstanceInStruct", testCopyInstanceInStruct),
        ("testCopyInstanceInStructFromMethod", testCopyInstanceInStructFromMethod),
        ("testInstanceInNotNullStruct", testInstanceInNotNullStruct)
    ]
}
