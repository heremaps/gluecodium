import XCTest
import hello

class ListenersReturnValuesTests: XCTestCase {
    func testStringReturn() {
        class TestListener: ListenerWithReturn {
            public func getMessage() -> String? {
                return "Works"
            }
        }

        let envelope = TestListener()
        let delivery = MessageDelivery.createMe()!
        XCTAssertEqual("Works", delivery.getMessage(envelope: envelope)!)
    }

    static var allTests = [
        ("testStringReturn", testStringReturn)
    ]
}
