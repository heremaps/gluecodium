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
import "package:hello/hello.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Exceptions");

void main() {
  _testSuite.test("methodWithError() throws", () {
    Errors_InternalException exception = null;

    try {
      Errors.methodWithError(true);
    } on Errors_InternalException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error, Errors_InternalErrorCode.crashed);
  });
  _testSuite.test("methodWithError() does not throw", () {
    Errors_InternalException exception = null;

    try {
      Errors.methodWithError(false);
    } on Errors_InternalException catch(e) {
      exception = e;
    }

    expect(exception, isNull);
  });
  _testSuite.test("methodWithErrorAndString() throws", () {
    String result = null;
    AdditionalErrors_ExternalException exception = null;

    try {
      result = Errors.methodWithErrorAndString(true);
    } on AdditionalErrors_ExternalException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception, isNotNull);
    expect(exception.error, AdditionalErrors_ExternalErrorCode.failed);
  });
  _testSuite.test("methodWithErrorAndString() does not throw", () {
    String result = null;
    AdditionalErrors_ExternalException exception = null;

    try {
      result = Errors.methodWithErrorAndString(false);
    } on AdditionalErrors_ExternalException catch(e) {
      exception = e;
    }

    expect(result, "SUCCEEDED");
    expect(exception, isNull);
  });
  _testSuite.test("methodWithExternalError() throws", () {
    Errors_ExternalException exception = null;

    try {
      Errors.methodWithExternalError(true);
    } on Errors_ExternalException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error, Errors_ExternalErrorCode.boom);
  });
  _testSuite.test("methodWithExternalError() does not throw", () {
    Errors_ExternalException exception = null;

    try {
      Errors.methodWithExternalError(false);
    } on Errors_ExternalException catch(e) {
      exception = e;
    }

    expect(exception, isNull);
  });
  _testSuite.test("methodWithPayloadError() throws", () {
    WithPayloadException exception = null;

    try {
      Errors.methodWithPayloadError(true);
    } on WithPayloadException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error.errorCode, 42);
    expect(exception.error.message, "foo error");
  });
  _testSuite.test("methodWithPayloadError() does not throw", () {
    WithPayloadException exception = null;

    try {
      Errors.methodWithPayloadError(false);
    } on WithPayloadException catch(e) {
      exception = e;
    }

    expect(exception, isNull);
  });
  _testSuite.test("methodWithPayloadErrorAndReturnValue() throws", () {
    String result = null;
    WithPayloadException exception = null;

    try {
      result = Errors.methodWithPayloadErrorAndReturnValue(true);
    } on WithPayloadException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception, isNotNull);
    expect(exception.error.errorCode, 42);
    expect(exception.error.message, "foo error");
  });
  _testSuite.test("methodWithPayloadErrorAndReturnValue() does not throw", () {
    String result = null;
    WithPayloadException exception = null;

    try {
      result = Errors.methodWithPayloadErrorAndReturnValue(false);
    } on WithPayloadException catch(e) {
      exception = e;
    }

    expect(result, "bar value");
    expect(exception, isNull);
  });
}
