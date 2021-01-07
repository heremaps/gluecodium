// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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
import functional

class WeakListenersTests: XCTestCase {

    static var itHappened = false

    class ListenerImpl: ListenerInterface {
        func notify() { WeakListenersTests.itHappened = true }
        func notifyMaybe() -> Bool? { return true }
    }

    override func setUp() {
        WeakListenersTests.itHappened = false
    }

    func testWeaklingIsPushed() {
        let listener = ListenerImpl()
        let weakling = WeaklingNotifier.createWeakling()
        weakling.weakListener = listener

        WeaklingNotifier.pushNotifications(whom: weakling)

        XCTAssertTrue(WeakListenersTests.itHappened)
    }

    func testWeaklingIsIgnored() {
        var listener: ListenerInterface? = ListenerImpl()
        let weakling = WeaklingNotifier.createWeakling()
        weakling.weakListener = listener
        listener = nil

        WeaklingNotifier.pushNotifications(whom: weakling)

        XCTAssertFalse(WeakListenersTests.itHappened)
    }

    func testWeaklingIsPushedStrongly() {
        let listener = ListenerImpl()
        let weakling = WeaklingNotifier.createWeakling()
        weakling.strongListener = listener

        WeaklingNotifier.pushNotifications(whom: weakling)

        XCTAssertTrue(WeakListenersTests.itHappened)
    }

    func testWeaklingIsNotIgnored() {
        var listener: ListenerInterface? = ListenerImpl()
        let weakling = WeaklingNotifier.createWeakling()
        weakling.strongListener = listener
        listener = nil

        WeaklingNotifier.pushNotifications(whom: weakling)

        XCTAssertTrue(WeakListenersTests.itHappened)
    }

    func testWeaklingIsPushedMaybe() {
        let listener = ListenerImpl()
        let weakling = WeaklingNotifier.createWeakling()
        weakling.weakListener = listener

        let result = WeaklingNotifier.pushNotificationMaybe(whom: weakling)

        XCTAssertTrue(result!)
    }

    func testWeaklingIsIgnoredMaybe() {
        var listener: ListenerInterface? = ListenerImpl()
        let weakling = WeaklingNotifier.createWeakling()
        weakling.weakListener = listener
        listener = nil

        let result = WeaklingNotifier.pushNotificationMaybe(whom: weakling)

        XCTAssertNil(result)
    }

    static var allTests = [
        ("testWeaklingIsPushed", testWeaklingIsPushed),
        ("testWeaklingIsIgnored", testWeaklingIsIgnored),
        ("testWeaklingIsPushedStrongly", testWeaklingIsPushedStrongly),
        ("testWeaklingIsNotIgnored", testWeaklingIsNotIgnored),
        ("testWeaklingIsPushedMaybe", testWeaklingIsPushedMaybe),
        ("testWeaklingIsIgnoredMaybe", testWeaklingIsIgnoredMaybe)
    ]
}
