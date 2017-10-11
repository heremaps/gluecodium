import XCTest
import hello

class HelloWorldTests: XCTestCase {
    func testHelloWorldMethod() {
        XCTAssertEqual(HelloWorld.helloWorldMethod(inputString: "Dario"), "Hello Dario")
    }

    static var allTests = [
        ("testHelloWorldMethod", testHelloWorldMethod)
    ]
}
