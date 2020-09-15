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
import hello

class PlatformNamesTests: XCTestCase {
    class TestListener: bazListener {
        var callResult = "failed"
        public func BazMethod(_ BazParameter: String) { callResult = BazParameter }
    }

    class PlatformNamesEngineImpl: PlatformNamesEngine {
        var listener: bazListener? = nil

        public func addFooBarListener(listener: bazListener) { self.listener = listener }

        public func notify() { listener?.BazMethod("nonsense") }
    }

    func testRenamedCallbackNotifiedDirectly() {
        let listener = TestListener()

        PlatformNamesNotifier.notifyDirectly(listener: listener)

        XCTAssertEqual(listener.callResult, "42")
    }

    func testRenamedCallbackNotifiedIndirectly() {
        PlatformNamesNotifier.setFactory(factory: { () -> PlatformNamesEngine in
            return PlatformNamesEngineImpl();
        })

        let listener = TestListener()
        let engine = PlatformNamesNotifier.getEngine()
        engine.addFooBarListener(listener: listener)
        engine.notify()

        XCTAssertEqual(listener.callResult, "nonsense")
    }

    static var allTests = [
        ("testRenamedCallbackNotifiedDirectly", testRenamedCallbackNotifiedDirectly),
        ("testRenamedCallbackNotifiedIndirectly", testRenamedCallbackNotifiedIndirectly)
    ]
}
