import XCTest
import hello

class StructWithInstanceTests: XCTestCase {

   func testAssignInstanceToStruct() {
        let simpleOne = hello.InstanceInStruct.SelfHolder(mySelf: hello.InstanceInStruct.create()!)
        simpleOne.mySelf.setStringValue(stringValue: "Hello")

        XCTAssertEqual(simpleOne.mySelf.getStringValue(), "Hello")
    }

    static var allTests = [
        ("testAssignInstanceToStruct", testAssignInstanceToStruct)
    ]
}
