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
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Constants");

void main() {
  _testSuite.test("Int constant", () {
    final result = Constants.intConstant;

    expect(result, equals(-11));
  });
  _testSuite.test("Double constant", () {
    final result = Constants.floatConstant;

    expect(result, equals(2.71));
  });
  _testSuite.test("String constant", () {
    final result = Constants.stringConstant;

    expect(result, equals("Foo bar"));
  });
  _testSuite.test("Enum constant", () {
    final result = Constants.enumConstant;

    expect(result, equals(ConstantsStateEnum.on));
  });
  _testSuite.test("NaN constant", () {
    final result = Constants.floatNan;

    expect(result, isNaN);
  });
  _testSuite.test("Infinity constant", () {
    final result = Constants.doubleInfinity;

    expect(result, equals(double.infinity));
  });
  _testSuite.test("Negative infinity constant", () {
    final result = Constants.floatNegativeInfinity;

    expect(result, equals(double.negativeInfinity));
  });
  _testSuite.test("Constant in class", () {
    final result = ConstantsInterface.uintConstant;

    expect(result, equals(42));
  });
  _testSuite.test("Struct type constant", () {
    final result = StructConstants.structConstant;

    expect(result.stringField, equals("bar Buzz"));
    expect(result.floatField, equals(1.41));
  });
  _testSuite.test("Struct type constant, nested", () {
    final result = StructConstants.nestingStructConstant;

    expect(result.structField.stringField, equals("nonsense"));
    expect(result.structField.floatField, equals(-2.82));
  });
  _testSuite.test("List type constant", () {
    final result = CollectionConstants.listConstant;

    expect(result, ["foo", "bar"]);
  });
  _testSuite.test("Set type constant", () {
    final result = CollectionConstants.setConstant;

    expect(result, {"foo", "bar"});
  });
  _testSuite.test("Map type constant", () {
    final result = CollectionConstants.mapConstant;

    expect(result, {"foo": "bar"});
  });
  _testSuite.test("Mixed type constant", () {
    final result = CollectionConstants.mixedConstant;

    expect(result.keys.first, ["foo"]);
    expect(result.values.first, {"bar"});
  });
}
