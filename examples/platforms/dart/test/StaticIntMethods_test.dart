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
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("StaticIntMethods");

void main() {
  _testSuite.test("Return next number Int8", () {
    final input = 115;

    final result = StaticIntMethods.returnNextNumberInt8(input);

    expect(result, equals(116));
  });
  _testSuite.test("Sum two numbers Int8", () {
    final input1 = 50;
    final input2 = 60;

    final result = StaticIntMethods.sumTwoNumbersInt8(input1, input2);

    expect(result, equals(110));
  });
  _testSuite.test("Return next number Uint8", () {
    final input = 200;

    final result = StaticIntMethods.returnNextNumberUint8(input);

    expect(result, equals(201));
  });
  _testSuite.test("Sum two numbers Uint8", () {
    final input1 = 160;
    final input2 = 80;

    final result = StaticIntMethods.sumTwoNumbersUint8(input1, input2);

    expect(result, equals(240));
  });
  _testSuite.test("Return next number Int16", () {
    final input = 2000;

    final result = StaticIntMethods.returnNextNumberInt16(input);

    expect(result, equals(2001));
  });
  _testSuite.test("Sum two numbers Int16", () {
    final input1 = 1600;
    final input2 = 800;

    final result = StaticIntMethods.sumTwoNumbersInt16(input1, input2);

    expect(result, equals(2400));
  });
  _testSuite.test("Return next number Uint16", () {
    final input = 40000;

    final result = StaticIntMethods.returnNextNumberUint16(input);

    expect(result, equals(40001));
  });
  _testSuite.test("Sum two numbers Uint16", () {
    final input1 = 16000;
    final input2 = 8000;

    final result = StaticIntMethods.sumTwoNumbersUint16(input1, input2);

    expect(result, equals(24000));
  });
  _testSuite.test("Return next number Int32", () {
    final input = 80000;

    final result = StaticIntMethods.returnNextNumberInt32(input);

    expect(result, equals(80001));
  });
  _testSuite.test("Sum two numbers Int32", () {
    final input1 = 160000;
    final input2 = 80000;

    final result = StaticIntMethods.sumTwoNumbersInt32(input1, input2);

    expect(result, equals(240000));
  });
  _testSuite.test("Return next number Uint32", () {
    final input = 2000000000;

    final result = StaticIntMethods.returnNextNumberUint32(input);

    expect(result, equals(2000000001));
  });
  _testSuite.test("Sum two numbers Uint32", () {
    final input1 = 2000000000;
    final input2 = 2000000001;

    final result = StaticIntMethods.sumTwoNumbersUint32(input1, input2);

    expect(result, equals(4000000001));
  });
  _testSuite.test("Return next number Int64", () {
    final input = 5000000000;

    final result = StaticIntMethods.returnNextNumberInt64(input);

    expect(result, equals(5000000001));
  });
  _testSuite.test("Sum two numbers Int64", () {
    final input1 = 5000000000;
    final input2 = 7000000000;

    final result = StaticIntMethods.sumTwoNumbersInt64(input1, input2);

    expect(result, equals(12000000000));
  });
  _testSuite.test("Return next number Uint64", () {
    final input = 2000000000;

    final result = StaticIntMethods.returnNextNumberUint64(input);

    expect(result, equals(2000000001));
  });
  _testSuite.test("Sum two numbers Uint64", () {
    final input1 = 5000000000;
    final input2 = 7000000000;

    final result = StaticIntMethods.sumTwoNumbersUint64(input1, input2);

    expect(result, equals(12000000000));
  });
}
