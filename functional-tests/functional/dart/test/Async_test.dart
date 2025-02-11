// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2022 HERE Europe B.V.
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
import "package:functional/abc.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Async");

void main() async {
  _testSuite.test("Async void", () async {
    await expectLater(AsyncClass().asyncVoid(false), completes);
  });
  _testSuite.test("Async throwing void no error", () async {
    await expectLater(AsyncClass().asyncVoidThrows(false), completes);
  });
  _testSuite.test("Async throwing void with error", () async {
    await expectLater(AsyncClass().asyncVoidThrows(true), throwsA(isA<AsyncException>()));
  });
  _testSuite.test("Async int", () async {
    await expectLater(AsyncClass().asyncInt(false), completion(42));
  });
  _testSuite.test("Async throwing int no error", () async {
    await expectLater(AsyncClass().asyncIntThrows(false), completion(42));
  });
  _testSuite.test("Async throwing int with error", () async {
    await expectLater(AsyncClass().asyncIntThrows(true), throwsA(isA<AsyncException>()));
  });
  _testSuite.test("Async static", () async {
    await expectLater(AsyncClass.asyncStatic(false), completes);
  });
}
