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
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Sets");

void main() {
  _testSuite.test("Empty String set round trip", () {
    final input = <String>{};

    final result = SetType.stringSetRoundTrip(input);

    expect(result, isEmpty);
  });
  _testSuite.test("String set round trip", () {
    final input = <String>{"foo"};

    final result = SetType.stringSetRoundTrip(input);

    expect(result, equals(input));
  });
  _testSuite.test("Empty Enum set round trip", () {
    final input = <SetTypeSomeEnum>{};

    final result = SetType.enumSetRoundTrip(input);

    expect(result, isEmpty);
  });
  _testSuite.test("Enum set round trip", () {
    final input = <SetTypeSomeEnum>{SetTypeSomeEnum.on};

    final result = SetType.enumSetRoundTrip(input);

    expect(result, equals(input));
  });
  // TODO: #60 test sets of nullable types
  // TODO: #67 test sets of equatable structs and classes
}
