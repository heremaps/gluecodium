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
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("ListenersWithAttributes");

class TestMessagePackage implements MessagePackage {
  @override
  String unpackMessage() => "Works";

  @override
  release() {}
}

class TestListener implements ListenerWithAttributes {
  @override
  String message = "Doesn't work";

  @override
  MessagePackage? packedMessage = null;

  @override
  MessageBox? boxedMessage = null;

  @override
  late ListenerWithReturnMessageStruct structuredMessage;

  @override
  ListenerWithReturnMessageEnum enumeratedMessage = ListenerWithReturnMessageEnum.no;

  @override
  List<String> arrayedMessage = ["Doesn't work"];

  @override
  Map<int, String> mappedMessage = {0: "Doesn't work"};

  @override
  Uint8List bufferedMessage = Uint8List.fromList(utf8.encode("Doesn't work"));

  @override
  void release() {
    packedMessage?.release();
    boxedMessage?.release();
  }
}

void main() {
  late ListenerWithAttributes envelope;
  late AttributedMessageDelivery delivery;
  setUp(() {
    envelope = TestListener();
    delivery = AttributedMessageDelivery();
  });
  tearDown(() {
    envelope.release();
    delivery.release();
  });

  _testSuite.test("String round trip works", () {
    final result = delivery.checkMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("Package round trip works", () {
    final result = delivery.checkPackedMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("Box round trip works", () {
    final result = delivery.checkBoxedMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("Struct round trip works", () {
    final result = delivery.checkStructuredMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("Enum round trip works", () {
    final result = delivery.checkEnumeratedMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("List round trip works", () {
    final result = delivery.checkArrayedMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("Map round trip works", () {
    final result = delivery.checkMappedMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
  _testSuite.test("Blob round trip works", () {
    final result = delivery.checkBufferedMessageRoundTrip(envelope);

    expect(result, isTrue);
  });
}
