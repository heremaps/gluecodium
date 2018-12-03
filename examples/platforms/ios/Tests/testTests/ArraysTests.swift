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

class ArraysTests: XCTestCase {

    func testArrayString() {
        let stringArray: [String] = ["Hello", "test", "world"]
        let result = Arrays.reverseStringArray(input: stringArray)
        for (index, string) in result.enumerated() {
            XCTAssertEqual(string, stringArray[2-index])
        }
    }

    func testArrayInt16Inline() {
        let intArray: [Int16] = [1, 2, 3]
        let result = Arrays.reverseArrayInline(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayInt16() {
        let intArray: [Int16] = [1, 2, 3]
        let result = Arrays.reverseInt16Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayUInt8() {
        let intArray: [UInt8] = [1, 2, 3]
        let result = Arrays.reverseUint8Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayInt8() {
        let intArray: [Int8] = [1, 2, 3]
        let result = Arrays.reverseInt8Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayInt32() {
        let intArray: [Int32] = [1, 2, 3]
        let result = Arrays.reverseInt32Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayUInt32() {
        let intArray: [UInt32] = [1, 2, 3]
        let result = Arrays.reverseUint32Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayInt64() {
        let intArray: [Int64] = [1, 2, 3]
        let result = Arrays.reverseInt64Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayUInt64() {
        let intArray: [UInt64] = [1, 2, 3]
        let result = Arrays.reverseUint64Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index])
        }
    }

    func testArrayFloat() {
        let floatArray: [Float] = [1.0, 2.2, 3.4]
        let result = Arrays.reverseFloatArray(input: floatArray)
        for (index, floatValue) in result.enumerated() {
            XCTAssertEqual(floatValue, floatArray[2-index])
        }
    }

    func testArrayDouble() {
        let doubleArray: [Double] = [1.0, 2.2, 3.4]
        let result = Arrays.reverseDoubleArray(input: doubleArray)
        for (index, doubleValue) in result.enumerated() {
            XCTAssertEqual(doubleValue, doubleArray[2-index])
        }
    }

    func testArrayBool() {
        let boolArray: [Bool] = [true, false, true]
        let result = Arrays.reverseBoolArray(input: boolArray)
        for (index, boolValue) in result.enumerated() {
            XCTAssertEqual(boolValue, boolArray[2-index])
        }
    }

    func testArrayStruct() {
        let structArray: [Arrays.BasicStruct] = [Arrays.BasicStruct(value: 3.2),
                                                  Arrays.BasicStruct(value: 2.2),
                                                  Arrays.BasicStruct(value: 1.2)]
        let result = Arrays.reverseStructArray(input: structArray)
        for (index, structValue) in result.enumerated() {
            //TODO: Implement Equatable protocol by default. (APIGEN-870)
            XCTAssertEqual(structValue.value, structArray[2-index].value)
        }
    }

    func testArrayExplicitInstances() {
        let instance1 = InstancesFactory.createSimpleInstantiableOne()!
        instance1.setStringValue(stringValue: "Hello")
        let instance2 = InstancesFactory.createSimpleInstantiableOne()!
        instance2.setStringValue(stringValue: "World")
        let instance3 = InstancesFactory.createSimpleInstantiableOne()!
        instance3.setStringValue(stringValue: "Test")

        let instanceArray: [SimpleInstantiableOne] = [instance1, instance2, instance3]
        let result = Arrays.reverseExplicitInstancesArray(input: instanceArray)
        for (index, instanceValue) in result.enumerated() {
            XCTAssertEqual(instanceValue.getStringValue(), instanceArray[2-index].getStringValue())
        }
    }

    func testArrayImplicitInstances() {
        let instance1 = InstancesFactory.createSimpleInstantiableOne()!
        instance1.setStringValue(stringValue: "Hello")
        let instance2 = InstancesFactory.createSimpleInstantiableOne()!
        instance2.setStringValue(stringValue: "World")
        let instance3 = InstancesFactory.createSimpleInstantiableOne()!
        instance3.setStringValue(stringValue: "Test")

        let instanceArray: [SimpleInstantiableOne] = [instance1, instance2, instance3]
        let result = Arrays.reverseImplicitInstancesArray(input: instanceArray)
        for (index, instanceValue) in result.enumerated() {
            XCTAssertEqual(instanceValue.getStringValue(), instanceArray[2-index].getStringValue())
        }
    }

    func testNestedPrimitives() {
        let nested: [[Double]] = [[1, 2, 3], [3, 4, 5], [5, 6, 7]]
        let result = Arrays.reverseNestedPrimitiveArray(input: nested)
        for (indexArray, subarray) in result.enumerated() {
            for (indexElement, doubleValue) in subarray.enumerated() {
                XCTAssertEqual(doubleValue, nested[2-indexArray][2-indexElement])
            }
        }
    }

    func testNestedStructArray() {
        let structArray: [Arrays.BasicStruct] = [Arrays.BasicStruct(value: 3.2),
                                                  Arrays.BasicStruct(value: 2.2),
                                                  Arrays.BasicStruct(value: 1.2)]
        let structArray2: [Arrays.BasicStruct] = [Arrays.BasicStruct(value: 4.2),
                                                   Arrays.BasicStruct(value: 5.2),
                                                   Arrays.BasicStruct(value: 6.2)]
        let nested = [structArray, structArray2]
        let result = Arrays.reverseNestedStructArray(input: nested)
        for (indexArray, subarray) in result.enumerated() {
            for (indexElement, structValue) in subarray.enumerated() {
                XCTAssertEqual(structValue.value, nested[1-indexArray][2-indexElement].value)
            }
        }
    }

    func testMergeArraysOfStructsWithArrays() {
        let fancyArray: [Arrays.FancyStruct] = [getFancyStruct([1, 2]), getFancyStruct([2, 4])]
        let fancyArray2: [Arrays.FancyStruct] = [getFancyStruct([3, 6]), getFancyStruct([4, 7])]

        let result = Arrays.mergeArraysOfStructsWithArrays(inlineFancyArray: fancyArray, fancyArray: fancyArray2)
        for (index, fancyStructValue) in result.enumerated() {
            let value: UInt8 =  (4 - UInt8(index))
            XCTAssertEqual(fancyStructValue.numbers.first!, value)
        }
    }

    func testArrayOfAliases() {
        let stringArray: [String] = ["Hello", "test", "world"]
        let result = Arrays.reverseArrayOfAliases(input: stringArray)
        for (index, string) in result.enumerated() {
            XCTAssertEqual(string, stringArray[2-index])
        }
    }

    func testArrayLiteralCreation() {
        let collectionFromArray: CollectionOf<String> = ["foo", "bar"]
        let arrayMirror = Mirror(reflecting: collectionFromArray)
        XCTAssertTrue(arrayMirror.subjectType == CollectionOf<String>.self)
    }

    func getFancyStruct(_ values: [UInt8]) -> Arrays.FancyStruct {
        let numbersArray: [UInt8] = values
        let numbers =  CollectionOf<UInt8>(numbersArray)
        let instance1 = InstancesFactory.createSimpleInstantiableOne()!
        instance1.setStringValue(stringValue: "Hello")
        let instance2 = InstancesFactory.createSimpleInstantiableOne()!
        instance2.setStringValue(stringValue: "World")
        let instance3 = InstancesFactory.createSimpleInstantiableOne()!
        instance3.setStringValue(stringValue: "Test")
        return Arrays.FancyStruct(messages: ["Hello", "Test"],
                                  numbers: numbers,
                                  instances: [instance1, instance2, instance3])
    }

    func testEnumsArray() {
        let enumArray: [Arrays.ArrayEnum] = [.enumOne, .enumTwo, .enumThree]
        let result = Arrays.reverseEnumsArray(input: enumArray)
        for (indexArray, enumValue) in result.enumerated() {
            XCTAssertEqual(enumValue, enumArray[2-indexArray])
        }
    }

    func testOtherEnumsArray() {
        let enumArray: [Arrays.SomeOtherEnum] = [.on, .off]
        let result = Arrays.reverseOtherEnumsArray(input: enumArray)
        for (indexArray, enumValue) in result.enumerated() {
            XCTAssertEqual(enumValue, enumArray[1-indexArray])
        }
    }

    func testArrayInStructOutlivesStruct() {
        var messages: CollectionOf<String>
        do {
            let fancyStruct = Arrays.createFancyStruct()
            messages = fancyStruct.messages
        }
        XCTAssertEqual(messages[0], "Hello")
        XCTAssertEqual(messages[1], "World")
    }

    func testArrayOfMaps() {
        let inputArray: [Arrays.NumberToIdMap] = [[1: "Hello"], [2: "test", 3: "world"]]

        let resultArray = Arrays.reverseMapsArray(input: inputArray)

        XCTAssertEqual(resultArray.count, 2)
        XCTAssertEqual(resultArray[0], inputArray[1])
        XCTAssertEqual(resultArray[1], inputArray[0])
    }

    static var allTests = [
        ("testArrayString", testArrayString),
        ("testArrayInt8", testArrayInt8),
        ("testArrayUInt8", testArrayUInt8),
        ("testArrayInt16", testArrayInt16),
        ("testArrayInt16Inline", testArrayInt16Inline),
        ("testArrayInt32", testArrayInt32),
        ("testArrayUInt32", testArrayUInt32),
        ("testArrayInt64", testArrayInt64),
        ("testArrayUInt64", testArrayUInt64),
        ("testArrayFloat", testArrayFloat),
        ("testArrayDouble", testArrayDouble),
        ("testArrayBool", testArrayBool),
        ("testArrayStruct", testArrayStruct),
        ("testArrayExplicitInstances", testArrayExplicitInstances),
        ("testArrayImplicitInstances", testArrayImplicitInstances),
        ("testNestedPrimitives", testNestedPrimitives),
        ("testNestedStructArray", testNestedStructArray),
        ("testMergeArraysOfStructsWithArrays", testMergeArraysOfStructsWithArrays),
        ("testEnumsArray", testEnumsArray),
        ("testOtherEnumsArray", testOtherEnumsArray),
        ("testArrayOfAliases", testArrayOfAliases),
        ("testArrayInStructOutlivesStruct", testArrayInStructOutlivesStruct),
        ("testArrayOfMaps", testArrayOfMaps),
        ("testArrayLiteralCreation", testArrayLiteralCreation)
        ]
}
