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

import "package:test/test.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("MultiListener");

class MultiReceiver implements ReceiverA, ReceiverB {
  final log = List<String>.empty(growable: true);

  @override
  void receiveA(String message) {
    log.add("ReceiverA: received from Sender: " + message);
  }

  @override
  void receiveB(String message) {
    log.add("ReceiverB: received from Sender: " + message);
  }
}

void main() {
  _testSuite.test("Multi-listener works", () {
    final mySender = MultiSender();
    final myMultiReceiver = MultiReceiver();

    mySender.addReceiverA(myMultiReceiver);
    mySender.addReceiverB(myMultiReceiver);

    mySender.notifyAReceivers();
    mySender.notifyBReceivers();

    expect(myMultiReceiver.log.length, 2);
    expect(myMultiReceiver.log[0], "ReceiverA: received from Sender: Sent from A");
    expect(myMultiReceiver.log[1], "ReceiverB: received from Sender: Sent from B");
  });
}
