// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License")
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

class SerializationTests: XCTestCase {

    func serializableEncodeDecodeRoundTrip() {
        let nestedStruct = NestedSerializableStruct(someField: "foo")
        let byteBuffer = Data([1, 7])
        let stringList = ["bar", "baz"]
        let structList = [NestedSerializableStruct(someField: "crazy"),
                          NestedSerializableStruct(someField: "stuff")]
        let errorMap: Dictionary<Int32, String> = [0: "one", 1: "two"]

        let serializableStruct = SerializableStruct(
            boolField: true,
            byteField: 42,
            shortField: 542,
            intField: 65542,
            longField: 2147484000,
            floatField: 1.0,
            doubleField: 2.0,
            stringField: "nonsense",
            structField: nestedStruct,
            byteBufferField: byteBuffer,
            arrayField: stringList,
            structArrayField: structList,
            mapField: errorMap,
            setField: ["foo", "bar"],
            enumSetField: [FooEnum.bar],
            enumField: FooEnum.bar
        )

        let data = try! JSONEncoder().encode(serializableStruct)
        let resultStruct = try! JSONDecoder().decode(SerializableStruct.self, from: data)

        XCTAssertEqual(serializableStruct.boolField, resultStruct.boolField)
        XCTAssertEqual(serializableStruct.byteField, resultStruct.byteField)
        XCTAssertEqual(serializableStruct.shortField, resultStruct.shortField)
        XCTAssertEqual(serializableStruct.longField, resultStruct.longField)
        XCTAssertEqual(serializableStruct.floatField, resultStruct.floatField)
        XCTAssertEqual(serializableStruct.doubleField, resultStruct.doubleField)
        XCTAssertEqual(serializableStruct.stringField, resultStruct.stringField)
        XCTAssertEqual(serializableStruct.structField, resultStruct.structField)
        XCTAssertEqual(serializableStruct.byteBufferField, resultStruct.byteBufferField)
        XCTAssertEqual(serializableStruct.arrayField, resultStruct.arrayField)
        XCTAssertEqual(serializableStruct.structArrayField, resultStruct.structArrayField)
        XCTAssertEqual(serializableStruct.mapField, resultStruct.mapField)
        XCTAssertEqual(serializableStruct.setField, resultStruct.setField)
        XCTAssertEqual(serializableStruct.enumSetField, resultStruct.enumSetField)
        XCTAssertEqual(serializableStruct.enumField, resultStruct.enumField)
    }

    static var allTests = [
        ("serializableEncodeDecodeRoundTrip", serializableEncodeDecodeRoundTrip)
    ]
}
