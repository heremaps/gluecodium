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

import 'dart:convert';
import "dart:typed_data";
import "package:test/test.dart";
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("ListenersWithReturnValues");

class TestMessagePackage implements MessagePackage {
  @override
  String unpackMessage() => "Works";

  @override
  void release() {}
}

class TestListener implements ListenerWithReturn {
  @override
  String getMessage() => "Works";

  @override
  MessagePackage getPackedMessage() => TestMessagePackage();

  @override
  MessageBox getBoxedMessage() => MessageBox();

  @override
  ListenerWithReturn_MessageStruct getStructuredMessage() =>
    ListenerWithReturn_MessageStruct("Works");

  @override
  ListenerWithReturn_MessageEnum getEnumeratedMessage() =>
    ListenerWithReturn_MessageEnum.yes;

  @override
  List<String> getArrayedMessage() => ["Works"];

  @override
  Map<int, String> getMappedMessage() => {0: "Works"};

  @override
  Uint8List getBufferedMessage() => Uint8List.fromList(utf8.encode("Works"));

  @override
  void release() {}
}

void main() {
  ListenerWithReturn envelope;
  MessageDelivery delivery;
  setUp(() {
    envelope = TestListener();
    delivery = MessageDelivery();
  });
  tearDown(() {
    envelope.release();
    delivery.release();
  });

  _testSuite.test("String return works", () {
    final result = delivery.getMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Package return works", () {
    final result = delivery.getPackedMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Box return works", () {
    final result = delivery.getBoxedMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Struct return works", () {
    final result = delivery.getStructuredMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Struct return works", () {
    final result = delivery.getStructuredMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Enum return works", () {
    final result = delivery.getEnumeratedMessage(envelope);

    expect(result, "YES");
  });
  _testSuite.test("List return works", () {
    final result = delivery.getArrayedMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Map return works", () {
    final result = delivery.getMappedMessage(envelope);

    expect(result, "Works");
  });
  _testSuite.test("Blob return works", () {
    final result = delivery.getBufferedMessage(envelope);

    expect(result, "Works");
  });
}
