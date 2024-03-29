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
import "package:functional/another.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("ListenersWithErrors");

class TestListener implements ErrorsInInterface {
  String _message = "Doesn't work";

  @override
  String getMessage() => _message;

  @override
  void setMessage(String value) {
    _message = value;
  }

  @override
  String getMessageWithPayload() => _message;

  @override
  void setMessageWithPayload(String value) {
    _message = value;
  }
}

class ThrowingListener implements ErrorsInInterface {
  String _message = "Doesn't work";

  @override
  String getMessage() {
    throw AdditionalErrorsExternalException(AdditionalErrorsExternalErrorCode.failed);
  }

  @override
  void setMessage(String value) {
    throw AdditionalErrorsExternalException(AdditionalErrorsExternalErrorCode.failed);
  }

  @override
  String getMessageWithPayload() {
    throw WithPayloadException(Payload(42, "foo"));
  }

  @override
  void setMessageWithPayload(String value) {
    throw WithPayloadException(Payload(42, "foo"));
  }
}

void main() {
  late ErrorMessenger messenger;
  setUp(() {
    messenger = ErrorMessenger();
  });

  _testSuite.test("String round trip works", () {
    final ErrorsInInterface listener = TestListener();

    messenger.setMessage(listener, "Works");
    final result = messenger.getMessage(listener);

    expect(result, "Works");
  });
  _testSuite.test("getMessage() error rethrown", () {
    AdditionalErrorsExternalException? exception = null;
    final ErrorsInInterface listener = ThrowingListener();

    try {
      messenger.getMessage(listener);
    } on AdditionalErrorsExternalException catch(e) {
      exception = e;
    }

    expect(exception?.error, AdditionalErrorsExternalErrorCode.failed);
  });
  _testSuite.test("setMessage() error rethrown", () {
    AdditionalErrorsExternalException? exception = null;
    final ErrorsInInterface listener = ThrowingListener();

    try {
      messenger.setMessage(listener, "Foo");
    } on AdditionalErrorsExternalException catch(e) {
      exception = e;
    }

    expect(exception?.error, AdditionalErrorsExternalErrorCode.failed);
  });
  _testSuite.test("getMessageWithPayload() error rethrown", () {
    WithPayloadException? exception = null;
    final ErrorsInInterface listener = ThrowingListener();

    try {
      messenger.getMessageWithPayload(listener);
    } on WithPayloadException catch(e) {
      exception = e;
    }

    expect(exception?.error, Payload(42, "foo"));
  });
  _testSuite.test("setMessageWithPayload() error rethrown", () {
    WithPayloadException? exception = null;
    final ErrorsInInterface listener = ThrowingListener();

    try {
      messenger.setMessageWithPayload(listener, "Foo");
    } on WithPayloadException catch(e) {
      exception = e;
    }

    expect(exception?.error, Payload(42, "foo"));
  });
}
