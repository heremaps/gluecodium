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

final _testSuite = TestSuite("StaticFloatDoubleMethods");

void main() {
  _testSuite.test("Return incremented float", () {
    final input = 1.5;

    final result = StaticFloatDoubleMethods.returnIncrementedFloat(input);

    expect(result, equals(2.5));
  });
  _testSuite.test("Sum two floats", () {
    final input1 = 1.5;
    final input2 = 3.5;

    final result = StaticFloatDoubleMethods.sumTwoFloats(input1, input2);

    expect(result, equals(5.0));
  });
  _testSuite.test("Float round trip: NaN", () {
    final input = double.nan;

    final result = StaticFloatDoubleMethods.returnFloat(input);

    expect(result.isNaN, isTrue);
  });
  _testSuite.test("Return incremented double", () {
    final input = 1.5;

    final result = StaticFloatDoubleMethods.returnIncrementedDouble(input);

    expect(result, equals(2.5));
  });
  _testSuite.test("Sum two doubles", () {
    final input1 = 1.5;
    final input2 = 3.5;

    final result = StaticFloatDoubleMethods.sumTwoDoubles(input1, input2);

    expect(result, equals(5.0));
  });
  _testSuite.test("Double round trip: NaN", () {
    final input = double.nan;

    final result = StaticFloatDoubleMethods.returnDouble(input);

    expect(result.isNaN, isTrue);
  });
  _testSuite.test("Double round trip: max value", () {
    final input = double.maxFinite;

    final result = StaticFloatDoubleMethods.returnDouble(input);

    expect(result, equals(double.maxFinite));
  });
  _testSuite.test("Double round trip: min value", () {
    final input = -double.maxFinite;

    final result = StaticFloatDoubleMethods.returnDouble(input);

    expect(result, equals(-double.maxFinite));
  });
}
