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

final _testSuite = TestSuite("Defaults");

void main() {
  _testSuite.test("Check defaults", () {
    final result = new Defaults_StructWithDefaults.withDefaults();

    expect(result.intField, 42);
    expect(result.uintField, 4294967295);
    expect(result.floatField, 3.14);
    expect(result.boolField, true);
    expect(result.stringField, "some string");
    expect(result.enumField, Defaults_SomeEnum.barValue);
  });
  _testSuite.test("Check defaults immutable", () {
    final result =
        new Defaults_ImmutableStructWithDefaults.withDefaults(77, true);

    expect(result.intField, 42);
    expect(result.uintField, 77);
    expect(result.floatField, 3.14);
    expect(result.boolField, true);
    expect(result.stringField, "some string");
    expect(result.enumField, Defaults_SomeEnum.barValue);
  });
  _testSuite.test("Check special defaults", () {
    final result = new Defaults_StructWithSpecialDefaults.withDefaults();

    expect(result.floatNanField, isNaN);
    expect(result.floatInfinityField, double.infinity);
    expect(result.floatNegativeInfinityField, double.negativeInfinity);
    expect(result.doubleNanField, isNaN);
    expect(result.doubleInfinityField, double.infinity);
    expect(result.doubleNegativeInfinityField, double.negativeInfinity);
  });
  _testSuite.test("Check empty defaults", () {
    final result = new Defaults_StructWithEmptyDefaults.withDefaults();

    expect(result.intsField, isEmpty);
    expect(result.floatsField, isEmpty);
    expect(result.mapField, isEmpty);
    expect(result.structField.stringField, "some string");
    expect(result.setTypeField, isEmpty);
  });
  _testSuite.test("Check initializer defaults", () {
    final result = new Defaults_StructWithInitializerDefaults.withDefaults();

    expect(result.intsField, [4, -2, 42]);
    expect(result.floatsField, [3.14, double.negativeInfinity]);
    expect(result.mapField, {1: "foo", 42: "bar"});
    expect(result.structField.enumField, Defaults_ExternalEnum.oneValue);
    expect(result.setTypeField, {"foo", "bar"});
  });
}
