import XCTest
import hello

class InheritanceTests: XCTestCase {

    func testCreateChildClassInstance() {
        let instance = ChildClass.createChildClass()

        XCTAssertEqual(instance?.getName(), "Johnny")
        XCTAssertEqual(instance?.luckyNumber, 7)
    }

    func testCastChildClassInstanceToParent() {
        let instance: ParentInterface? = ChildClass.createChildClass()?.castToParent()

        XCTAssertEqual(instance?.getName(), "Johnny")
        XCTAssertEqual(instance?.luckyNumber, 7)
    }

    func testCreateGrandchildClassInstance() {
        let instance = GrandchildClass.createGrandchildClass()

        XCTAssertEqual(instance?.getName(), "John F. Kimberly")
        XCTAssertEqual(instance?.luckyNumber, 42)
    }

    func testCastGrandchildClassInstanceToParent() {
        let instance: ParentInterface? = GrandchildClass.createGrandchildClass()?.castToParent()

        XCTAssertEqual(instance?.getName(), "John F. Kimberly")
        XCTAssertEqual(instance?.luckyNumber, 42)
    }

    func testNativeCastChildClassInstanceToParent() {
        let instance: ParentInterface = ChildClass.createChildClass()!

        XCTAssertEqual(instance.getName(), "Johnny")
        XCTAssertEqual(instance.luckyNumber, 7)
    }

    func testNativeCastGrandchildClassInstanceToChildClass() {
        let instance: ChildClass = GrandchildClass.createGrandchildClass()!

        XCTAssertEqual(instance.getName(), "John F. Kimberly")
        XCTAssertEqual(instance.luckyNumber, 42)
    }

    func testNativeCastGrandchildClassInstanceToParent() {
        let instance: ParentInterface = GrandchildClass.createGrandchildClass()!

        XCTAssertEqual(instance.getName(), "John F. Kimberly")
        XCTAssertEqual(instance.luckyNumber, 42)
    }

    func testChildClassDoesNotCrash() {
        let instance = GrandchildClass.createGrandchildClass()!
        instance.doSomething(value: "Foo")
    }

    static var allTests = [
        ("testCreateChildClassInstance", testCreateChildClassInstance),
        ("testCastChildClassInstanceToParent", testCastChildClassInstanceToParent),
        ("testCreateGrandchildClassInstance", testCreateGrandchildClassInstance),
        ("testCastGrandchildClassInstanceToParent", testCastGrandchildClassInstanceToParent),
        ("testNativeCastChildClassInstanceToParent", testNativeCastChildClassInstanceToParent),
        ("testNativeCastGrandchildClassInstanceToChildClass", testNativeCastGrandchildClassInstanceToChildClass),
        ("testNativeCastGrandchildClassInstanceToParent", testNativeCastGrandchildClassInstanceToParent),
        ("testChildClassDoesNotCrash", testChildClassDoesNotCrash)
    ]
}
