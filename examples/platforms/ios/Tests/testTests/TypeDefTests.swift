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

class TypeDefTests: XCTestCase {
    func testTypedefReferences() {
        let structTypeDef =  StaticTypedef.NestedStructTypedef(exampleString: "Test")
        let structMirror = Mirror(reflecting: structTypeDef)
        XCTAssertTrue(structMirror.displayStyle == .struct)
        XCTAssertTrue(structMirror.subjectType == StaticTypedef.ExampleStruct.self)
    }

    func testTypedefInMethod() {
        let returnValue = StaticTypedef.returnIntTypedef(input: 2)
        let returnMirror = Mirror(reflecting: returnValue)
        XCTAssertEqual(returnValue, 3)
        XCTAssertTrue(returnMirror.subjectType == StaticTypedef.IntTypedef.self)
    }

    func testNestedTypedefInMethod() {
        let nestedArgument: StaticTypedef.NestedIntTypedef = 4
        let returnValue = StaticTypedef.returnNestedIntTypedef(input: nestedArgument)
        let returnMirror = Mirror(reflecting: returnValue)
        XCTAssertEqual(returnValue, 5)
        XCTAssertTrue(returnMirror.subjectType == StaticTypedef.NestedIntTypedef.self)
    }

    func testNestedStructInMethod() {
        let nestedArgument: StaticTypedef.NestedStructTypedef = StaticTypedef.ExampleStruct(exampleString: "Test4")
        let returnValue = StaticTypedef.returnNestedStructTypedef(input: nestedArgument)
        let returnMirror = Mirror(reflecting: returnValue!)
        XCTAssertEqual(returnValue?.exampleString, Optional("Hello Test4"))
        XCTAssertTrue(returnMirror.subjectType == StaticTypedef.ExampleStruct.self)
    }

    func testTypeDefDefinedOutsideClass() {
        let typeCollectionTypeDef: PointTypedef = Point(x: 1.0, y: 1.0)
        let returnValue = StaticTypedef.returnTypedefPointFromTypeCollection(input: typeCollectionTypeDef)
        let returnMirror = Mirror(reflecting: returnValue!)
        XCTAssertEqual(returnValue?.x, Optional(1.0))
        XCTAssertEqual(returnValue?.y, Optional(1.0))
        XCTAssertTrue(returnMirror.subjectType == Point.self)
    }

    func testStringTypedef() {
        let typedef: StaticTypedef.StringTypedef = "Test"
        let stringTypeDef =  StaticTypedef.returnStringTypedef(input: typedef)!
        let stringMirror = Mirror(reflecting: stringTypeDef)
        XCTAssertEqual(stringTypeDef, "Hello Test")
        XCTAssertTrue(stringMirror.subjectType == String.self)
    }

    func testBufferTypedef() {
        let typedef: StaticTypedef.ByteArrayTypedef = "Test".data(using: .utf8)!
        let dataTypeDef =  StaticTypedef.returnByteBufferTypedef(input: typedef)
        let dataMirror = Mirror(reflecting: dataTypeDef)
        XCTAssertEqual(String(data: dataTypeDef, encoding: String.Encoding.utf8), "tseT")
        XCTAssertTrue(dataMirror.subjectType == Data.self)
    }

    static var allTests = [
        ("testTypedefReferences", testTypedefReferences),
        ("testTypedefInMethod", testTypedefInMethod),
        ("testNestedTypedefInMethod", testNestedTypedefInMethod),
        ("testNestedStructInMethod", testNestedStructInMethod),
        ("testTypeDefDefinedOutsideClass", testTypeDefDefinedOutsideClass),
        ("testStringTypedef", testStringTypedef),
        ("testBufferTypedef", testBufferTypedef)
    ]
}
