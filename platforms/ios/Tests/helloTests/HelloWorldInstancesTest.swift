import XCTest
import hello

class HelloWorldInstancesTests: XCTestCase {

    func testInstanceCreation() {
        let simple = HelloWorldFactory.createSimple()
        XCTAssertNotNil(simple)
    }

    func testInstanceMethod() {
        let simple = HelloWorldFactory.createSimple()
        simple!.setStringValue(stringValue:"HelloSimple")
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

    static var allTests = [
        ("testInstanceCreation", testInstanceCreation),
        ("testInstanceMethod", testInstanceMethod),
        ("testNestedInstances", testNestedInstances)
    ]
}
