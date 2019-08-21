// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

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

        XCTAssertEqual(instance.getName(), "Johnny")
        XCTAssertEqual(instance.luckyNumber, 7)
    }

    func testCastChildClassInstanceToParent() {
        let instance: ParentInterface = ChildClass.createChildClass().castToParent()

        XCTAssertEqual(instance.getName(), "Johnny")
        XCTAssertEqual(instance.luckyNumber, 7)
    }

    func testCreateGrandchildClassInstance() {
        let instance = GrandchildClass.createGrandchildClass()

        XCTAssertEqual(instance.getName(), "John F. Kimberly")
        XCTAssertEqual(instance.luckyNumber, 42)
    }

    func testCastGrandchildClassInstanceToParent() {
        let instance: ParentInterface = GrandchildClass.createGrandchildClass().castToParent()

        XCTAssertEqual(instance.getName(), "John F. Kimberly")
        XCTAssertEqual(instance.luckyNumber, 42)
    }

    func testNativeCastChildClassInstanceToParent() {
        let instance: ParentInterface = ChildClass.createChildClass()

        XCTAssertEqual(instance.getName(), "Johnny")
        XCTAssertEqual(instance.luckyNumber, 7)
    }

    func testNativeCastGrandchildClassInstanceToChildClass() {
        let instance: ChildClass = GrandchildClass.createGrandchildClass()

        XCTAssertEqual(instance.getName(), "John F. Kimberly")
        XCTAssertEqual(instance.luckyNumber, 42)
    }

    func testNativeCastGrandchildClassInstanceToParent() {
        let instance: ParentInterface = GrandchildClass.createGrandchildClass()

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
        let instance = GrandchildClass.createGrandchildClass()
        instance.doSomething(value: "Foo")
    }

    func testTalkToParents() {
        let father = MyParentListener()
        let mother = MyParentListener()
        let child = MyChildListener()
        Teacher.talkToParents(parents: [father, mother, child])
        XCTAssertTrue(father.called)
        XCTAssertTrue(mother.called)
        XCTAssertTrue(child.called)
    }

    func testDoSomethingToChildClassDoesNotCrash() {
        let child = ChildClass.createChildClass()
        child.doSomethingToChildClass(input: child)
    }

    func testChildAsParentReturnsSameType() {
        let child = ChildClass.createChildClass()
        let parent = child.castToParent()

        XCTAssertTrue(parent is ChildClass)
    }

    func testCreateChildAsParentSameType() {
        let rootInterface = InheritanceTestHelper.createChildAsRootInterface()
        XCTAssertTrue(rootInterface is ChildInterface)
    }

    func testCreateConcreteChildAsChildInterfaceSameType() {
        let childInterface = InheritanceTestHelper.createConcreteChildAsChildInterface()
        XCTAssertTrue(childInterface is ConcreteChild)
    }

    func testCreateGrandchildAsChildSameType() {
        let child = InheritanceTestHelper.createGrandchildClassAsChildClass()
        let grandchild = child as? ConcreteGrandChild

        grandchild?.text = "jump"

        XCTAssertTrue(child is ConcreteGrandChild)
        XCTAssertNotNil(grandchild)
        XCTAssertEqual("jump", grandchild?.text ?? "")
    }

    // test C++ diamond inheritance
    func testCreateConjoinedChildrenAsChildInterface() {
        let childInterface = InheritanceTestHelper.createConjoinedChildrenAsChildInterface()

        XCTAssertTrue(childInterface is ConcreteChild)
        XCTAssertFalse(childInterface is AnotherConcreteChild)
    }

    // test C++ diamond inheritance
    func testCreateConjoinedChildrenAsAnotherChildInterface() {
        let childInterface = InheritanceTestHelper.createConjoinedChildrenAsAnotherChildInterface()

        XCTAssertTrue(childInterface is AnotherConcreteChild)
        XCTAssertFalse(childInterface is ConcreteChild)
    }

    // test C++ multiple unrelated inheritance
    func testCreateDisjoinedChildrenAsParentInterface() {
        let childInterface = InheritanceTestHelper.createDisjoinedChildrenAsParentInterface()

        XCTAssertTrue(childInterface is ChildClass)
    }

    // test C++ multiple unrelated inheritance
    func testCreateDisjoinedChildrenAsRootInterface() {
        let childInterface = InheritanceTestHelper.createDisjoinedChildrenAsRootInterface()

        XCTAssertTrue(childInterface is ConcreteChild)
    }

    func testFamilyListOfSubtypes() {
        let family = InheritanceTestHelper.createFamilyList()

        XCTAssertEqual(6, family.count)
        XCTAssertTrue(family[0] is ChildInterface)
        XCTAssertTrue(family[1] is ConcreteChild)
        XCTAssertTrue(family[2] is AnotherChildInterface)
        XCTAssertTrue(family[3] is AnotherConcreteChild)
        XCTAssertTrue(family[4] is ConcreteGrandChild)
        XCTAssertTrue(family[5] is AnotherConcreteGrandChild)
    }

    class SwiftChild: ChildInterface {
        var data = String()

        func rootMethod(data: String) {
            self.data = data
        }

        func getData() -> String {
            return "Swift Child data is '" + data + "'"
        }
    }

    class SwiftGrandChild: SwiftChild {
        override func getData() -> String {
            return "Swift GrandChild data is '" + data + "'"
        }
    }

    class SwiftAnotherChild: ChildInterface {
        private var data = String()

        func rootMethod(data: String) {
            self.data = data
        }

        func getData() -> String {
            return "Swift AnotherChild data is '" + data + "'"
        }
    }

    private static let DATA = "Custom data"
    typealias TestData = [(object: RootInterface, expected: String)]

    func getTestData() -> TestData {
        return [
            (SwiftChild(), "Swift Child data is 'Custom data'"),
            (SwiftGrandChild(), "Swift GrandChild data is 'Custom data'"),
            (SwiftAnotherChild(), "Swift AnotherChild data is 'Custom data'"),
            (InheritanceTestHelper.createChild(), "C++ Child data is 'Custom data'"),
            (InheritanceTestHelper.createConcreteChild(), "C++ ConcreteChild data is 'Custom data'"),
            (InheritanceTestHelper.createConcreteGrandChild(), "C++ ConcreteGrandChild data is 'Custom data'"),
            (InheritanceTestHelper.createAnotherChild(), "C++ AnotherChild data is 'Custom data'"),
            (InheritanceTestHelper.createAnotherConcreteChild(), "C++ AnotherConcreteChild data is 'Custom data'"),
            (InheritanceTestHelper.createAnotherConcreteGrandChild(),
                "C++ AnotherConcreteGrandChild data is 'Custom data'")
        ]
    }

    func testCallingListenerMethodFromCpp() {
        let testData = getTestData()
        testData.forEach { (testCase: (object: RootInterface, expected: String)) in
            let (object, expected) = testCase
            InheritanceTestHelper.callRootMethod(object: object, data: InheritanceTests.DATA)
            XCTAssertEqual(getData(object), expected)
        }
    }

    func testCallingListenerMethodFromSwift() {
        let testData = getTestData()
        testData.forEach { (testCase: (object: RootInterface, expected: String)) in
            let (object, expected) = testCase
            object.rootMethod(data: InheritanceTests.DATA)
            XCTAssertEqual(getData(object), expected)
        }
    }

    private func getData(_ object: RootInterface) -> String {
        if let object = object as? ChildInterface {
            return object.getData()
        } else if let object = object as? AnotherChildInterface {
            return object.getData()
        }
        XCTFail("Unexpected type of object: " + String(describing: type(of: object)))
        return ""
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
        ("testTalkToChildAsParent", testTalkToChildAsParent),
        ("testTalkToParents", testTalkToParents),
        ("testDoSomethingToChildClassDoesNotCrash", testDoSomethingToChildClassDoesNotCrash),
        ("testCallingListenerMethodFromCpp", testCallingListenerMethodFromCpp),
        ("testCallingListenerMethodFromSwift", testCallingListenerMethodFromSwift),
        ("testChildAsParentReturnsSameType", testChildAsParentReturnsSameType),
        ("testCreateChildAsParentSameType", testCreateChildAsParentSameType),
        ("testCreateConcreteChildAsChildInterfaceSameType", testCreateConcreteChildAsChildInterfaceSameType),
        ("testCreateGrandchildAsChildSameType", testCreateGrandchildAsChildSameType),
        ("testCreateConjoinedChildrenAsChildInterface", testCreateConjoinedChildrenAsChildInterface),
        ("testCreateConjoinedChildrenAsAnotherChildInterface", testCreateConjoinedChildrenAsAnotherChildInterface),
        ("testCreateDisjoinedChildrenAsParentInterface", testCreateDisjoinedChildrenAsParentInterface),
        ("testCreateDisjoinedChildrenAsRootInterface", testCreateDisjoinedChildrenAsRootInterface),
        ("testFamilyListOfSubtypes", testFamilyListOfSubtypes)
    ]
}
