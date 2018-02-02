import XCTest
import hello

class InheritanceTests: XCTestCase {
    class MyParentListener: ParentListener {
        var called = false
        func listen() {
            called = true
        }
    }

    class MyChildListener: ChildListener {
        var called = false
        func listen() {
            called = true
        }
    }

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

    func testTalkToParent() {
        let parent = MyParentListener()
        Talker.talkToParent(listener: parent)
        XCTAssertTrue(parent.called)
    }

    func testTalkToChild() {
        let child = MyChildListener()
        Talker.talkToChild(listener: child)
        XCTAssertTrue(child.called)
    }

    func testTalkToChildAsParent() {
        let child = MyChildListener()
        Talker.talkToParent(listener: child)
        XCTAssertTrue(child.called)
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
        ("testChildClassDoesNotCrash", testChildClassDoesNotCrash),
        ("testTalkToParent", testTalkToParent),
        ("testTalkToChild", testTalkToChild),
        ("testTalkToChildAsParent", testTalkToChildAsParent)
    ]
}
