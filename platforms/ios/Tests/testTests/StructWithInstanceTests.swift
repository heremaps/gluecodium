import XCTest
import hello

class StructWithInstanceTests: XCTestCase {

    func testAssignInstanceToStruct() {
        let simpleOne = hello.InstanceInStruct.SelfHolder(mySelf: hello.InstanceInStruct.create())
        simpleOne.mySelf?.setStringValue(stringValue: "Hello")

        XCTAssertEqual(simpleOne.mySelf?.getStringValue(), "Hello")
    }

    func testCopyInstanceInStruct() {
        let a = hello.InstanceInStruct.SelfHolder(mySelf: hello.InstanceInStruct.create())
        do {
           let b = a
           b.mySelf?.setStringValue(stringValue: "Hello")
        }
        XCTAssertEqual(a.mySelf?.getStringValue(), "Hello")
    }

    func testCopyInstanceInStructFromMethod() {
        let a = hello.InstanceInStruct.createInStruct()!
        do {
           let b = a
           b.mySelf?.setStringValue(stringValue: "Hello")
        }
        XCTAssertEqual(a.mySelf?.getStringValue(), "Hello")
    }

    func testNullInstanceInStruct() {
        let emptyStruct = hello.InstanceInStruct.createNullInStruct()
        XCTAssertNotNil(emptyStruct)
        XCTAssertNil(emptyStruct?.mySelf)
    }

    func testInstanceInNotNullStruct() {
        let structNotNull = hello.InstanceInStruct.createInNotNullStruct()
        XCTAssertNotNil(structNotNull)
        XCTAssertNotNil(structNotNull!.mySelf)
    }

    func testNullInstanceInNotNullStruct() {
        let emptyStruct = hello.InstanceInStruct.createInEmptyNotNullStruct()
        XCTAssertNil(emptyStruct)
    }

    static var allTests = [
        ("testAssignInstanceToStruct", testAssignInstanceToStruct),
        ("testCopyInstanceInStruct", testCopyInstanceInStruct),
        ("testCopyInstanceInStructFromMethod", testCopyInstanceInStructFromMethod),
        ("testNullInstanceInStruct", testNullInstanceInStruct),
        ("testInstanceInNotNullStruct", testInstanceInNotNullStruct),
        ("testNullInstanceInNotNullStruct", testNullInstanceInNotNullStruct)
    ]
}
