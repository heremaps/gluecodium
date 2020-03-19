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
import "package:hello/another.dart";
import "package:hello/test.dart";
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

  @override
  void release() {}
}

class ThrowingListener implements ErrorsInInterface {
  String _message = "Doesn't work";

  @override
  String getMessage() {
    throw AdditionalErrors_ExternalException(AdditionalErrors_ExternalErrorCode.failed);
  }

  @override
  void setMessage(String value) {
    throw AdditionalErrors_ExternalException(AdditionalErrors_ExternalErrorCode.failed);
  }

  @override
  String getMessageWithPayload() {
    return ""; // TODO: #140 throw with payload
  }

  @override
  void setMessageWithPayload(String value) {
    // TODO: #140 throw with payload
  }

  @override
  void release() {}
}

void main() {
  ErrorMessenger messenger;
  setUp(() {
    messenger = ErrorMessenger();
  });
  tearDown(() {
    messenger.release();
  });

  _testSuite.test("String round trip works", () {
    final ErrorsInInterface listener = TestListener();

    messenger.setMessage(listener, "Works");
    final result = messenger.getMessage(listener);

    expect(result, "Works");
  });
  _testSuite.test("getMessage() error rethrown", () {
    AdditionalErrors_ExternalException exception = null;
    final ErrorsInInterface listener = ThrowingListener();

    try {
      messenger.getMessage(listener);
    } on AdditionalErrors_ExternalException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error, AdditionalErrors_ExternalErrorCode.failed);

    listener.release();
  });
  _testSuite.test("setMessage() error rethrown", () {
    AdditionalErrors_ExternalException exception = null;
    final ErrorsInInterface listener = ThrowingListener();

    try {
      messenger.setMessage(listener, "Foo");
    } on AdditionalErrors_ExternalException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error, AdditionalErrors_ExternalErrorCode.failed);

    listener.release();
  });
  // TODO: #140 test throwing with payload
}
