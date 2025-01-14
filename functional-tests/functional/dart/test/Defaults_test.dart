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

import 'dart:typed_data';
import "package:test/test.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Defaults");

void main() {
  _testSuite.test("Check defaults", () {
    final result = new DefaultsStructWithDefaults();

    expect(result.intField, 42);
    expect(result.uintField, 4294967295);
    expect(result.floatField, 3.14);
    expect(result.boolField, true);
    expect(result.stringField, "some string");
    expect(result.enumField, DefaultsSomeEnum.barValue);
  });
  _testSuite.test("Check defaults immutable", () {
    final result = new DefaultsImmutableStructWithDefaults.withDefaults(77, true);

    expect(result.intField, 42);
    expect(result.uintField, 77);
    expect(result.floatField, 3.14);
    expect(result.boolField, true);
    expect(result.stringField, "some string");
    expect(result.enumField, DefaultsSomeEnum.barValue);
  });
  _testSuite.test("Check special defaults", () {
    final result = new DefaultsStructWithSpecialDefaults();

    expect(result.floatNanField, isNaN);
    expect(result.floatInfinityField, double.infinity);
    expect(result.floatNegativeInfinityField, double.negativeInfinity);
    expect(result.doubleNanField, isNaN);
    expect(result.doubleInfinityField, double.infinity);
    expect(result.doubleNegativeInfinityField, double.negativeInfinity);
  });
  _testSuite.test("Check empty defaults", () {
    final result = new DefaultsStructWithEmptyDefaults();

    expect(result.intsField, isEmpty);
    expect(result.floatsField, isEmpty);
    expect(result.mapField, isEmpty);
    expect(result.structField.stringField, "some string");
    expect(result.setTypeField, isEmpty);
  });
  _testSuite.test("Check initializer defaults", () {
    final result = new DefaultsStructWithInitializerDefaults();

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
  _testSuite.test("Check positional defaults for non-const constructible types", () {
    // Case 1: all defaults.
    final first = PosDefaultStructWithCustomStructsFields();
    expect(first.nonConstCtorField0.intField, 42);
    expect(first.nonConstCtorField1.someField1.intField, 42);
    expect(first.nonConstCtorField2.stringField, "Some string");
    expect(first.nonConstCtorField3.nullableListField, null);
    expect(first.nonConstCtorField5, Uint8List.fromList([]));
    expect(first.nonConstCtorField6, Uint8List.fromList([222, 173, 190, 239]));
    expect(first.nonConstCtorField7, null);

    // Case 2: custom values.
    final second = PosDefaultStructWithCustomStructsFields(
      // Fields with const constructors.
      AnotherImmutableStructWithDefaults.withDefaults(),
      null,
      [],
      null,
      0,
      0.0,
      null,
      null,
      // Fields without const constructor.
      StructWithAllDefaults(21, "ABC"),
      PosDefaultStructWithFieldUsingImmutableStruct(),
      SomeMutableCustomStructWithDefaults(21, "Another string", [7, 7, 7]),
      StructWithNullableCollectionDefaults(),
      StructWithAllDefaults(44, "DEF"),
      Uint8List.fromList([1, 2, 3]),
      Uint8List.fromList([4, 5, 6]),
      Uint8List.fromList([7, 8, 9])
    );

    expect(second.nonConstCtorField0.intField, 21);
    expect(second.nonConstCtorField1.someField1.intField, 42);
    expect(second.nonConstCtorField2.stringField, "Another string");
    expect(second.nonConstCtorField3.nullableListField, null);
    expect(second.nonConstCtorField4?.stringField, "DEF");
    expect(second.nonConstCtorField5, Uint8List.fromList([1, 2, 3]));
    expect(second.nonConstCtorField6, Uint8List.fromList([4, 5, 6]));
    expect(second.nonConstCtorField7, Uint8List.fromList([7, 8, 9]));
  });
  _testSuite.test("Check positional enumerator defaults", () {
    final result = StructWithEnums();

    expect(result.firstField, SomethingEnum.reallyFirst);
    expect(result.explicitField, SomethingEnum.explicit);
    expect(result.lastField, SomethingEnum.last);
    expect(StructWithEnums.firstConstant, SomethingEnum.reallyFirst);
  });
  _testSuite.test("Check constant defaults", () {
    final result = ConstantDefaults();

    expect(result.field1.intField, 42);
    expect(result.field2.intField, -2);
  });
  _testSuite.test("Check defaults of nullable field of immutable struct", () {
      // Case 1: struct without explicit field constructor.
      final first = DefaultsImmutableStructWithNullableFieldUsingImmutableStruct.withDefaults();
      expect(first.someField1?.intField, 42);

      // Case 2: struct with explicit field constructor.
      final second = DefaultsImmutableStructWithFieldConstructorAndNullableFieldUsingImmutableStruct.withIntegers(123, 456);
      expect(second.someField1?.intField, 42);
  });
}
