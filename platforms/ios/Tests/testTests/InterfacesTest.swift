import XCTest
import hello

class InterfacesTests: XCTestCase {

    func testSimpleInterfaceCreation() {
        let simple = InstancesFactory.createSimpleInterfaceOne()

        XCTAssertNotNil(simple)
    }

    func testNestedInterfaceCreation() {
        let complex = InstancesFactory.createNestedInterfaceOne()

        XCTAssertNotNil(complex)
    }

    func testInterfaceInstanceMethod() {
        let simple = InstancesFactory.createSimpleInterfaceOne()
        simple!.setStringValue(stringValue:"HelloSimple")

        let stringReturned = simple!.getStringValue()

        XCTAssertNotNil(stringReturned)
        XCTAssertEqual(stringReturned!, "HelloSimple")
    }

    func testInterfaceGetInterfaceMethod() {
        let simpleOne = InstancesFactory.createSimpleInterfaceOne()!
        simpleOne.setStringValue(stringValue: "Hello")
        let simpleTwo = InstancesFactory.createSimpleInterfaceOne()!
        simpleTwo.setStringValue(stringValue: "World")
        let complex = InstancesFactory.createNestedInterfaceOne()!
        complex.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: simpleTwo);

        let result = complex.getInterfaceOne();

        XCTAssertNotNil(result)
        XCTAssertEqual(result!.getStringValue()!, "Hello")
    }

    func testSetSameTypeInterfaces() {
        let simpleOne = InstancesFactory.createSimpleInterfaceOne()!
        simpleOne.setStringValue(stringValue: "Hello")
        let simpleTwo = InstancesFactory.createSimpleInterfaceOne()!
        simpleTwo.setStringValue(stringValue: "World")
        let complex = InstancesFactory.createNestedInterfaceOne()!

        complex.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: simpleTwo);

        XCTAssertEqual(complex.getInterfaceOne()!.getStringValue(), "Hello")
        XCTAssertEqual(complex.getInterfaceTwo()!.getStringValue(), "World")
    }

    func testSetSameTypeInterfaces_identicalInterface() {
        let simple = InstancesFactory.createSimpleInterfaceOne()!
        simple.setStringValue(stringValue: "Hello")
        let complex = InstancesFactory.createNestedInterfaceOne()!

        complex.setSameTypeInterfaces(interfaceOne: simple, interfaceTwo: simple);

        XCTAssertEqual(complex.getInterfaceOne()!.getStringValue(), "Hello")
        XCTAssertEqual(complex.getInterfaceTwo()!.getStringValue(), "Hello")
    }

    func testGetNestedInterface() {
        let simpleOne = InstancesFactory.createSimpleInterfaceOne()!
        let otherSimpleOne = InstancesFactory.createSimpleInterfaceOne()!
        let simpleTwo = InstancesFactory.createSimpleInterfaceTwo()!
        let complexOne = InstancesFactory.createNestedInterfaceOne()!
        let complexTwo = InstancesFactory.createNestedInterfaceTwo()!
        simpleOne.setStringValue(stringValue: "Hello")
        otherSimpleOne.setStringValue(stringValue: "World")
        simpleTwo.setStringValue(stringValue: "Foo")
        complexOne.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: otherSimpleOne);
        complexTwo.setMultipleTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: simpleTwo, nestedInterface: complexOne);

        let complexInterface = complexTwo.getNestedInterface()

        XCTAssertNotNil(complexInterface)
    }

    func testSetMultipleTypeInterface() {
        let simpleOne = InstancesFactory.createSimpleInterfaceOne()!
        let otherSimpleOne = InstancesFactory.createSimpleInterfaceOne()!
        let simpleTwo = InstancesFactory.createSimpleInterfaceTwo()!
        let complexOne = InstancesFactory.createNestedInterfaceOne()!
        let complexTwo = InstancesFactory.createNestedInterfaceTwo()!
        simpleOne.setStringValue(stringValue: "Hello")
        otherSimpleOne.setStringValue(stringValue: "World")
        simpleTwo.setStringValue(stringValue: "Foo")
        complexOne.setSameTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: otherSimpleOne);

        complexTwo.setMultipleTypeInterfaces(interfaceOne: simpleOne, interfaceTwo: simpleTwo, nestedInterface: complexOne);

        XCTAssertEqual(complexTwo.getInterfaceOne()!.getStringValue(), "Hello")
        XCTAssertEqual(complexTwo.getInterfaceTwo()!.getStringValue(), "Foo")
        let complexInterface = complexTwo.getNestedInterface()!
        XCTAssertEqual(complexInterface.getInterfaceOne()!.getStringValue(), "Hello")
        XCTAssertEqual(complexInterface.getInterfaceTwo()!.getStringValue(), "World")
    }

    static var allTests = [
        ("testSimpleInterfaceCreation", testSimpleInterfaceCreation),
        ("testNestedInterfaceCreation", testNestedInterfaceCreation),
        ("testInterfaceInstanceMethod", testInterfaceInstanceMethod),
        ("testInterfaceGetInterfaceMethod", testInterfaceGetInterfaceMethod),
        ("testSetSameTypeInterfaces", testSetSameTypeInterfaces),
        ("testSetSameTypeInterfaces_identicalInterface", testSetSameTypeInterfaces_identicalInterface),
        ("testGetNestedInterface", testGetNestedInterface),
        ("testSetMultipleTypeInterface", testSetMultipleTypeInterface),
    ]
}
