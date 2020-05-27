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

class MultiListenerTests: XCTestCase {

    class MultiReceiver: ReceiverA, ReceiverB {
        var log: [String] = []

        public func receiveA(message: String) {
            log.append("ReceiverA: received from Sender: " + message)
        }

        public func receiveB(message: String) {
            log.append("ReceiverB: received from Sender: " + message)
        }
    }

    func testMultiSender() {
        let mySender = MultiSender()
        let myMultiReceiver = MultiReceiver()

        mySender.addReceiverA(receiver: myMultiReceiver)
        mySender.addReceiverB(receiver: myMultiReceiver)

        mySender.notifyAReceivers()
        mySender.notifyBReceivers()

        XCTAssertEqual(2, myMultiReceiver.log.count)
        XCTAssertEqual("ReceiverA: received from Sender: Sent from A", myMultiReceiver.log[0])
        XCTAssertEqual("ReceiverB: received from Sender: Sent from B", myMultiReceiver.log[1])
    }

    static var allTests = [
        ("testMultiSender", testMultiSender)
    ]
}
