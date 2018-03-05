import XCTest
import hello

class MapsTests: XCTestCase {

    let inputValue1 = "lowercase"
    let inputValue2 = "UPPERCASE"
    let inputValue3 = "numberZ12345"
    let outputValue1 = "LOWERCASE"
    let outputValue2 = "UPPERCASE"
    let outputValue3 = "NUMBERZ12345"

    func testMethodWithMapsEmpty() {
        let inputDict: [Int32: String] = [:]

        let resultsDict = Maps.methodWithMap(input: inputDict)

        XCTAssertEqual(resultsDict.count, 0)
    }

    func testMethodWithMapsMultipleItems() {
        let inputDict: [Int32: String] = [11: inputValue1, 42: inputValue2, 199: inputValue3]

        let resultsDict = Maps.methodWithMap(input: inputDict)

        XCTAssertEqual(resultsDict.count, 3)
        XCTAssertEqual(resultsDict[11], outputValue1)
        XCTAssertEqual(resultsDict[42], outputValue2)
        XCTAssertEqual(resultsDict[199], outputValue3)
    }

    func testMethodWithMapToStructEmpty() {
        let inputDict: [UInt8: Maps.SomeStruct] = [:]

        let resultsDict = Maps.methodWithMapToStruct(input: inputDict)

        XCTAssertEqual(resultsDict.count, 0)
    }

    func testMethodWithMapToStructMultipleItems() {
        let inputDict: [UInt8: Maps.SomeStruct] = [11: Maps.SomeStruct(value: inputValue1),
                                                   42: Maps.SomeStruct(value: inputValue2),
                                                   199: Maps.SomeStruct(value: inputValue3)]

        let resultsDict = Maps.methodWithMapToStruct(input: inputDict)

        XCTAssertEqual(resultsDict.count, 3)
        XCTAssertEqual(resultsDict[11]!.value, outputValue1)
        XCTAssertEqual(resultsDict[42]!.value, outputValue2)
        XCTAssertEqual(resultsDict[199]!.value, outputValue3)
    }

    func testMethodWithNestedMapEmpty() {
        let inputDict: [UInt8: [UInt8: Maps.SomeStruct]] = [:]

        let resultsDict = Maps.methodWithNestedMap(input: inputDict)

        XCTAssertEqual(resultsDict.count, 0)
    }

    func testMethodWithNestedMapMultipleItems() {
        let innerDict: [UInt8: Maps.SomeStruct] = [11: Maps.SomeStruct(value: inputValue1),
                                                   42: Maps.SomeStruct(value: inputValue2),
                                                   199: Maps.SomeStruct(value: inputValue3)]

        let inputDict: [UInt8: [UInt8: Maps.SomeStruct]] = [7: innerDict, 93: [:]]

        let resultsDict = Maps.methodWithNestedMap(input: inputDict)

        XCTAssertEqual(resultsDict.count, 2)
        XCTAssertEqual(resultsDict[93]!.count, 0)

        let resultsInnerDict = resultsDict[7]!
        XCTAssertEqual(resultsInnerDict.count, 3)
        XCTAssertEqual(resultsInnerDict[11]!.value, outputValue1)
        XCTAssertEqual(resultsInnerDict[42]!.value, outputValue2)
        XCTAssertEqual(resultsInnerDict[199]!.value, outputValue3)
    }

    func testMethodWithStructWithMapEmpty() {
        let inputStruct = Maps.StructWithMap(errorMapping: [:])

        let resultStruct = Maps.methodWithStructWithMap(input: inputStruct)!

        XCTAssertEqual(resultStruct.errorMapping.count, 0)
    }

    func testMethodWithStructWithMapMultipleItems() {
        let inputDict: [Int32: String] = [11: inputValue1, 42: inputValue2, 199: inputValue3]

        let inputStruct = Maps.StructWithMap(errorMapping: inputDict)

        let resultStruct = Maps.methodWithStructWithMap(input: inputStruct)!

        XCTAssertEqual(resultStruct.errorMapping.count, 3)
        XCTAssertEqual(resultStruct.errorMapping[11], outputValue1)
        XCTAssertEqual(resultStruct.errorMapping[42], outputValue2)
        XCTAssertEqual(resultStruct.errorMapping[199], outputValue3)
    }

    func testMethodWithEnumToStringEmpty() {
        let inputDict: [Maps.SomeEnum: String] = [:]

        let resultsDict = Maps.methodWithEnumToStringMap(input: inputDict)

        XCTAssertEqual(resultsDict.count, 0)
    }

    func testMethodWithEnumToStringMapMultipleItems() {
        let inputDict: [Maps.SomeEnum: String] = [Maps.SomeEnum.fooValue: inputValue1,
                                                  Maps.SomeEnum.barValue: inputValue2]

        let resultsDict = Maps.methodWithEnumToStringMap(input: inputDict)

        XCTAssertEqual(resultsDict.count, 2)
        XCTAssertEqual(resultsDict[Maps.SomeEnum.fooValue], outputValue1)
        XCTAssertEqual(resultsDict[Maps.SomeEnum.barValue], outputValue2)
    }

    func testMethodWithMapToArrayEmpty() {
        let inputDict: [UInt8: CollectionOf<String>] = [:]

        let resultsDict = Maps.methodWithMapOfArrays(input: inputDict)

        XCTAssertEqual(resultsDict.count, 0)
    }

    func testMethodWithMapToArrayMultipleItems() {
        let inputDict: [UInt8: CollectionOf<String>] = [11: CollectionOf<String>([inputValue1]),
                                                        42: CollectionOf<String>([inputValue2,
                                                                                  inputValue3])]

        let resultsDict = Maps.methodWithMapOfArrays(input: inputDict)

        XCTAssertEqual(resultsDict.count, 2)
        XCTAssertEqual(resultsDict[11]![0], outputValue1)
        XCTAssertEqual(resultsDict[42]![0], outputValue2)
        XCTAssertEqual(resultsDict[42]![1], outputValue3)
    }

    static var allTests = [
        ("testMethodWithMapsEmpty", testMethodWithMapsEmpty),
        ("testMethodWithMapsMultipleItems", testMethodWithMapsMultipleItems),
        ("testMethodWithMapToStructEmpty", testMethodWithMapToStructEmpty),
        ("testMethodWithMapToStructMultipleItems", testMethodWithMapToStructMultipleItems),
        ("testMethodWithNestedMapEmpty", testMethodWithNestedMapEmpty),
        ("testMethodWithNestedMapMultipleItems", testMethodWithNestedMapMultipleItems),
        ("testMethodWithStructWithMapEmpty", testMethodWithStructWithMapEmpty),
        ("testMethodWithStructWithMapMultipleItems", testMethodWithStructWithMapMultipleItems),
        ("testMethodWithEnumToStringEmpty", testMethodWithEnumToStringEmpty),
        ("testMethodWithEnumToStringMapMultipleItems", testMethodWithEnumToStringMapMultipleItems),
        ("testMethodWithMapToArrayEmpty", testMethodWithMapToArrayEmpty),
        ("testMethodWithMapToArrayMultipleItems", testMethodWithMapToArrayMultipleItems)
    ]
}
