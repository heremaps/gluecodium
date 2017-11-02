//
//  ArraysTests.swift
//  helloTests
//
//  Created by Palmero, Antonio on 01.11.17.
//

import XCTest
import hello

class ArraysTests: XCTestCase {
    
    func testArrayString() {
        let stringArray : [String] = ["Hello", "test", "world"]
        let result = Arrays.methodWithStringArray(input: stringArray)
        for (index, string) in result.enumerated() {
            XCTAssertEqual(string, stringArray[2-index]);
        }
    }

    func testArrayInt16Inline() {
        let intArray : [Int16] = [1, 2, 3]
        let result = Arrays.methodWithArrayInline(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayInt16() {
        let intArray : [Int16] = [1, 2, 3]
        let result = Arrays.methodWithInt16Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayUInt8() {
        let intArray : [UInt8] = [1, 2, 3]
        let result = Arrays.methodWithUint8Array(input: intArray)
        for (index, intValue) in result.enumerated(){
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayInt8() {
        let intArray : [Int8] = [1, 2, 3]
        let result = Arrays.methodWithInt8Array(input: intArray)
        for (index, intValue) in result.enumerated(){
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayInt32() {
        let intArray : [Int32] = [1, 2, 3]
        let result = Arrays.methodWithInt32Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayUInt32() {
        let intArray : [UInt32] = [1, 2, 3]
        let result = Arrays.methodWithUint32Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayInt64() {
        let intArray : [Int64] = [1, 2, 3]
        let result = Arrays.methodWithInt64Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayUInt64() {
        let intArray : [UInt64] = [1, 2, 3]
        let result = Arrays.methodWithUint64Array(input: intArray)
        for (index, intValue) in result.enumerated() {
            XCTAssertEqual(intValue, intArray[2-index]);
        }
    }

    func testArrayFloat() {
        let floatArray : [Float] = [1.0, 2.2, 3.4]
        let result = Arrays.methodWithFloatArray(input: floatArray)
        for (index, floatValue) in result.enumerated() {
            XCTAssertEqual(floatValue, floatArray[2-index]);
        }
    }

    func testArrayDouble() {
        let doubleArray : [Double] = [1.0, 2.2, 3.4]
        let result = Arrays.methodWithDoubleArray(input: doubleArray)
        for (index, doubleValue) in result.enumerated() {
            XCTAssertEqual(doubleValue, doubleArray[2-index]);
        }
    }

    func testArrayBool() {
        let boolArray : [Bool] = [true, false, true]
        let result = Arrays.methodWithBoolArray(input: boolArray)
        for (index, boolValue) in result.enumerated() {
            XCTAssertEqual(boolValue, boolArray[2-index]);
        }
    }

    func testArrayStruct() {
        let structArray : [Arrays.BasicStruct] = [Arrays.BasicStruct(value: 3.2),
                                                  Arrays.BasicStruct(value:2.2),
                                                  Arrays.BasicStruct(value:1.2)]
        let result = Arrays.methodWithStructArray(input: structArray)
        for (index, structValue) in result.enumerated() {
            //TODO: Implement Equatable protocol by default. (APIGEN-870)
            XCTAssertEqual(structValue.value, structArray[2-index].value);
        }
    }

    func testArrayInstances() {
        let instance1 = InstancesFactory.createSimpleInstantiableOne()!
        instance1.setStringValue(stringValue: "Hello")
        let instance2 = InstancesFactory.createSimpleInstantiableOne()!
        instance2.setStringValue(stringValue: "World")
        let instance3 = InstancesFactory.createSimpleInstantiableOne()!
        instance3.setStringValue(stringValue: "Test")


        let instanceArray : [SimpleInstantiableOne] = [instance1, instance2, instance3]
        let result = Arrays.methodWithInstancesArray(input: instanceArray)
        for (index, instanceValue) in result.enumerated() {
            XCTAssertEqual(instanceValue.getStringValue(), instanceArray[2-index].getStringValue());
        }
    }

    func testNestedPrimitives() {
        let nested : [[Double]] = [[1,2,3],[3,4,5],[5,6,7]]
        let result = Arrays.methodWithNestedPrimitiveArray(input: nested)
        for (indexArray, subarray) in result.enumerated() {
            for (indexElement, doubleValue) in subarray.enumerated() {
                XCTAssertEqual(doubleValue, nested[2-indexArray][2-indexElement]);
            }
        }
    }

    func testNestedStructArray() {
        let structArray : [Arrays.BasicStruct] = [Arrays.BasicStruct(value: 3.2),
                                                  Arrays.BasicStruct(value:2.2),
                                                  Arrays.BasicStruct(value:1.2)]
        let structArray2 : [Arrays.BasicStruct] = [Arrays.BasicStruct(value: 4.2),
                                                   Arrays.BasicStruct(value:5.2),
                                                   Arrays.BasicStruct(value:6.2)]
        let nested = [structArray,structArray2]
        let result = Arrays.methodWithNestedStructArray(input: nested)
        for (indexArray, subarray) in result.enumerated() {
            for (indexElement, structValue) in subarray.enumerated() {
                XCTAssertEqual(structValue.value, nested[1-indexArray][2-indexElement].value);
            }
        }
    }

    func testMergeArraysOfStructsWithArrays() {
        let fancyArray : [Arrays.FancyStruct] = [getFancyStruct([1,2]), getFancyStruct([2,4])]
        let fancyArray2 : [Arrays.FancyStruct] = [getFancyStruct([3,6]), getFancyStruct([4,7])]

        let result = Arrays.mergeArraysOfStructsWithArrays(inlineFancyArray: fancyArray, fancyArray: fancyArray2)
        for (index, fancyStructValue) in result.enumerated() {
            let value : UInt8 =  (4 - UInt8(index))
            XCTAssertEqual(fancyStructValue.numbers.first!, value);
        }
    }

    func getFancyStruct(_ values: [UInt8]) -> Arrays.FancyStruct {
        let messagesString : [String]  = ["Hello", "Test"]
        let messages : CollectionOf<String> = CollectionOf<String>(messagesString)
        let numbersArray : [UInt8] = values
        let numbers =  CollectionOf<UInt8>(numbersArray)
        let instance1 = InstancesFactory.createSimpleInstantiableOne()!
        instance1.setStringValue(stringValue: "Hello")
        let instance2 = InstancesFactory.createSimpleInstantiableOne()!
        instance2.setStringValue(stringValue: "World")
        let instance3 = InstancesFactory.createSimpleInstantiableOne()!
        instance3.setStringValue(stringValue: "Test")
        let instanceArray : [SimpleInstantiableOne] = [instance1, instance2, instance3]
        let instances = CollectionOf(instanceArray)
        return Arrays.FancyStruct(messages:messages,numbers:numbers, instances:instances)
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
        ("testArrayInstances", testArrayInstances),
        ("testNestedPrimitives", testNestedPrimitives),
        ("testNestedStructArray", testNestedStructArray),
        ("testMergeArraysOfStructsWithArrays", testMergeArraysOfStructsWithArrays)
        ]
}
