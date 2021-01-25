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

final _testSuite = TestSuite("Defaults");

void main() {
  _testSuite.test("Check defaults", () {
    final result = new DefaultsStructWithDefaults.withDefaults();

    expect(result.intField, 42);
    expect(result.uintField, 4294967295);
    expect(result.floatField, 3.14);
    expect(result.boolField, true);
    expect(result.stringField, "some string");
    expect(result.enumField, DefaultsSomeEnum.barValue);
  });
  _testSuite.test("Check defaults immutable", () {
    final result =
        new DefaultsImmutableStructWithDefaults.withDefaults(77, true);

    expect(result.intField, 42);
    expect(result.uintField, 77);
    expect(result.floatField, 3.14);
    expect(result.boolField, true);
    expect(result.stringField, "some string");
    expect(result.enumField, DefaultsSomeEnum.barValue);
  });
  _testSuite.test("Check special defaults", () {
    final result = new DefaultsStructWithSpecialDefaults.withDefaults();

    expect(result.floatNanField, isNaN);
    expect(result.floatInfinityField, double.infinity);
    expect(result.floatNegativeInfinityField, double.negativeInfinity);
    expect(result.doubleNanField, isNaN);
    expect(result.doubleInfinityField, double.infinity);
    expect(result.doubleNegativeInfinityField, double.negativeInfinity);
  });
  _testSuite.test("Check empty defaults", () {
    final result = new DefaultsStructWithEmptyDefaults.withDefaults();

    expect(result.intsField, isEmpty);
    expect(result.floatsField, isEmpty);
    expect(result.mapField, isEmpty);
    expect(result.structField.stringField, "some string");
    expect(result.setTypeField, isEmpty);
  });
  _testSuite.test("Check initializer defaults", () {
    final result = new DefaultsStructWithInitializerDefaults.withDefaults();

    expect(result.intsField, [4, -2, 42]);
    expect(result.floatsField, [3.14, double.negativeInfinity]);
    expect(result.mapField, {1: "foo", 42: "bar"});
    expect(result.structField.enumField, DefaultsExternalEnum.oneValue);
    expect(result.setTypeField, {"foo", "bar"});
  });
  _testSuite.test("Check StructWithSomeDefaults short ctor", () {
    final result = StructWithSomeDefaults("foobar");

    expect(result.intField, 42);
    expect(result.stringField, "foobar");
  });
  _testSuite.test("Check StructWithSomeDefaults long ctor", () {
    final result = StructWithSomeDefaults("foobar", 13);

    expect(result.intField, 13);
    expect(result.stringField, "foobar");
  });
  _testSuite.test("Check StructWithAllDefaults parameterless ctor", () {
    final result = StructWithAllDefaults();

    expect(result.intField, 42);
    expect(result.stringField, "\\Jonny \"Magic\" Smith\n");
  });
  _testSuite.test("Check StructWithAllDefaults short ctor", () {
    final result = StructWithAllDefaults(13);

    expect(result.intField, 13);
    expect(result.stringField, "\\Jonny \"Magic\" Smith\n");
  });
  _testSuite.test("Check StructWithAllDefaults long ctor", () {
    final result = StructWithAllDefaults(13, "foobar");

    expect(result.intField, 13);
    expect(result.stringField, "foobar");
  });
  _testSuite.test("Check positional enumerator defaults", () {
    final result = StructWithEnums();

    expect(result.firstField, SomethingEnum.reallyFirst);
    expect(result.explicitField, SomethingEnum.explicit);
    expect(result.lastField, SomethingEnum.last);
    expect(StructWithEnums.firstConstant, SomethingEnum.reallyFirst);
  });
}
