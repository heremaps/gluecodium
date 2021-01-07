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
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("StaticStringMethods");

void main() {
  _testSuite.test("Return input string", () {
    final inputString = "Foo";

    final result = StaticStringMethods.returnInputString(inputString);

    expect(result, equals(inputString));
  });
  _testSuite.test("Concatenate strings", () {
    final inputString1 = "Functional";
    final inputString2 = "World";

    final result = StaticStringMethods.concatenateStrings(inputString1, inputString2);

    expect(result, equals(inputString1 + inputString2));
  });
  _testSuite.test("Return 'hello' string", () {
    final result = StaticStringMethods.returnHelloString();

    expect(result, equals("hello"));
  });
  _testSuite.test("Return empty string", () {
    final result = StaticStringMethods.returnEmpty();

    expect(result, equals(""));
  });
  _testSuite.test("String ref", () {
    final result = CppRefReturnType.stringRef();

    expect(result, "nonsense");
  });
  _testSuite.test("String property", () {
    final result = CppRefReturnType.stringProperty;

    expect(result, "nonsense");
  });
}
