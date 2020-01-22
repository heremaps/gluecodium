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

final _testSuite = TestSuite("MethodOverloads");

void main() {
  _testSuite.test("Call isBoolean() with Boolean", () {
    final result = MethodOverloads.isBoolean(false);

    expect(result, isTrue);
  });
  _testSuite.test("Call isBoolean() with Byte", () {
    final result = MethodOverloads.isBooleanByte(42);

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with String", () {
    final result = MethodOverloads.isBooleanString("nonsense");

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with Point", () {
    final result = MethodOverloads.isBooleanPoint(MethodOverloads_Point(0, 0));

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with Everything", () {
    final result = MethodOverloads.isBooleanMulti(false, 42, "nonsense", MethodOverloads_Point(0, 0));

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with String List", () {
    final result = MethodOverloads.isBooleanStringList(["nonsense", "more nonsense"]);

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with Int List", () {
    final result = MethodOverloads.isBooleanIntList([42, 255]);

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with String Set", () {
    final result = MethodOverloads.isBooleanStringSet({"nonsense", "more nonsense"});

    expect(result, isFalse);
  });
  _testSuite.test("Call isBoolean() with Int List", () {
    final result = MethodOverloads.isBooleanIntSet({42, 255});

    expect(result, isFalse);
  });
}
