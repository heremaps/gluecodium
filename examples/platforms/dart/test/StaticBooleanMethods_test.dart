// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

final _testSuite = TestSuite("StaticBooleanMethods");

void main() {
  _testSuite.test("Return inverted Boolean false", () {
    final input = false;

    final result = StaticBooleanMethods.returnInvertedBoolean(input);

    expect(result, equals(true));
  });
  _testSuite.test("Return inverted Boolean true", () {
    final input = true;

    final result = StaticBooleanMethods.returnInvertedBoolean(input);

    expect(result, equals(false));
  });
  _testSuite.test("Return 'and' Boolean true false", () {
    final input1 = true;
    final input2 = false;

    final result = StaticBooleanMethods.returnAndBoolean(input1, input2);

    expect(result, equals(false));
  });
  _testSuite.test("Return 'and' Boolean true true", () {
    final input1 = true;
    final input2 = true;

    final result = StaticBooleanMethods.returnAndBoolean(input1, input2);

    expect(result, equals(true));
  });
}
