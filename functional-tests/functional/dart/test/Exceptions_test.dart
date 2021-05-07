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

final _testSuite = TestSuite("Exceptions");

void main() {
  _testSuite.test("methodWithError() throws", () {
    ErrorsInternalException exception = null;

    try {
      Errors.methodWithError(true);
    } on ErrorsInternalException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error, ErrorsInternalErrorCode.crashed);
  });
  _testSuite.test("methodWithError() does not throw", () {
    ErrorsInternalException exception = null;

    try {
      Errors.methodWithError(false);
    } on ErrorsInternalException catch(e) {
      exception = e;
    }

    expect(exception, isNull);
  });
  _testSuite.test("methodWithErrorAndString() throws", () {
    String result = null;
    AdditionalErrorsExternalException exception = null;

    try {
      result = Errors.methodWithErrorAndString(true);
    } on AdditionalErrorsExternalException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception, isNotNull);
    expect(exception.error, AdditionalErrorsExternalErrorCode.failed);
  });
  _testSuite.test("methodWithErrorAndString() does not throw", () {
    String result = null;
    AdditionalErrorsExternalException exception = null;

    try {
      result = Errors.methodWithErrorAndString(false);
    } on AdditionalErrorsExternalException catch(e) {
      exception = e;
    }

    expect(result, "SUCCEEDED");
    expect(exception, isNull);
  });
  _testSuite.test("methodWithExternalError() throws", () {
    ErrorsExternalException exception = null;

    try {
      Errors.methodWithExternalError(true);
    } on ErrorsExternalException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
    expect(exception.error, ErrorsExternalErrorCode.boom);
  });
  _testSuite.test("methodWithExternalError() does not throw", () {
    ErrorsExternalException exception = null;

    try {
      Errors.methodWithExternalError(false);
    } on ErrorsExternalException catch(e) {
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
  _testSuite.test("Throwing constructor throws", () {
    ThrowingConstructor result = null;
    ThrowingConstructorSomeException exception = null;

    try {
      result = new ThrowingConstructor(1.0);
    } on ThrowingConstructorSomeException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception, isNotNull);
    expect(exception.error, ThrowingConstructorErrorEnum.crashed);
  });
  _testSuite.test("Throwing constructor does not throw", () {
    ThrowingConstructor result = null;
    ThrowingConstructorSomeException exception = null;

    try {
      result = new ThrowingConstructor(0.0);
    } on ThrowingConstructorSomeException catch(e) {
      exception = e;
    }

    expect(result, isNotNull);
    expect(exception, isNull);

    result.release();
  });
}
