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

import "dart:typed_data";
import "package:test/test.dart";
import "package:hello/hello.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Nullable");

void main() {
  NullableInterface instance;
  setUp(() {
    instance = NullableInterface();
  });
  tearDown(() {
    instance.release();
  });

  _testSuite.test("Struct with nullable fields defaults", () {
    final result = new NullableInterface_NullableStruct.withDefaults();

    expect(result.stringField, isNull);
    expect(result.boolField, isNull);
    expect(result.doubleField, isNull);
    expect(result.structField, isNull);
    expect(result.enumField, isNull);
    expect(result.arrayField, isNull);
    expect(result.inlineArrayField, isNull);
    expect(result.mapField, isNull);
    expect(result.blobField, isNull);
  });
  _testSuite.test("Struct with nullable fields round trip with nulls", () {
    final input = new NullableInterface_NullableStruct.withDefaults();

    final result = instance.methodWithNullableStruct(input);

    expect(result.stringField, isNull);
    expect(result.boolField, isNull);
    expect(result.doubleField, isNull);
    expect(result.structField, isNull);
    expect(result.enumField, isNull);
    expect(result.arrayField, isNull);
    expect(result.inlineArrayField, isNull);
    expect(result.mapField, isNull);
    expect(result.blobField, isNull);
  });
  _testSuite.test("Struct with nullable fields round trip with zeroes", () {
    final input = new NullableInterface_NullableStruct(
      "",
      false,
      0.0,
      NullableInterface_SomeStruct(""),
      NullableInterface_SomeEnum.off,
      [],
      [],
      {},
      Uint8List(0)
    );

    final result = instance.methodWithNullableStruct(input);

    expect(result.stringField, "");
    expect(result.boolField, isFalse);
    expect(result.doubleField, 0.0);
    expect(result.structField.stringField, "");
    expect(result.enumField, NullableInterface_SomeEnum.off);
    expect(result.arrayField, isEmpty);
    expect(result.inlineArrayField, isEmpty);
    expect(result.mapField, isEmpty);
    expect(result.blobField, isEmpty);
  });
  _testSuite.test("Struct with nullable fields round trip with non-zeroes", () {
    final input = new NullableInterface_NullableStruct(
      "Foo",
      true,
      3.14,
      NullableInterface_SomeStruct("Bar"),
      NullableInterface_SomeEnum.on,
      ["Baz"],
      ["Fizz"],
      {7: "Wheez"},
      Uint8List.fromList([42])
    );

    final result = instance.methodWithNullableStruct(input);

    expect(result.stringField, "Foo");
    expect(result.boolField, isTrue);
    expect(result.doubleField, 3.14);
    expect(result.structField.stringField, "Bar");
    expect(result.enumField, NullableInterface_SomeEnum.on);
    expect(result.arrayField, ["Baz"]);
    expect(result.inlineArrayField, ["Fizz"]);
    expect(result.mapField, {7: "Wheez"});
    expect(result.blobField, Uint8List.fromList([42]));
  });
  _testSuite.test("Nullable int struct defaults", () {
    final result = new NullableInterface_NullableIntsStruct.withDefaults();

    expect(result.int8Field, isNull);
    expect(result.int16Field, isNull);
    expect(result.int32Field, isNull);
    expect(result.int64Field, isNull);
    expect(result.uint8Field, isNull);
    expect(result.uint16Field, isNull);
    expect(result.uint32Field, isNull);
    expect(result.uint64Field, isNull);
  });
  _testSuite.test("Nullable int struct round trip with nulls", () {
    final input = new NullableInterface_NullableIntsStruct.withDefaults();

    final result = instance.methodWithNullableIntsStruct(input);

    expect(result.int8Field, isNull);
    expect(result.int16Field, isNull);
    expect(result.int32Field, isNull);
    expect(result.int64Field, isNull);
    expect(result.uint8Field, isNull);
    expect(result.uint16Field, isNull);
    expect(result.uint32Field, isNull);
    expect(result.uint64Field, isNull);
  });
  _testSuite.test("Nullable int struct round trip with zeroes", () {
    final input =
      new NullableInterface_NullableIntsStruct(0, 0, 0, 0, 0, 0, 0, 0);

    final result = instance.methodWithNullableIntsStruct(input);

    expect(result.int8Field, 0);
    expect(result.int16Field, 0);
    expect(result.int32Field, 0);
    expect(result.int64Field, 0);
    expect(result.uint8Field, 0);
    expect(result.uint16Field, 0);
    expect(result.uint32Field, 0);
    expect(result.uint64Field, 0);
  });
  _testSuite.test("Nullable int struct round trip with non-zeroes", () {
    final input = new NullableInterface_NullableIntsStruct(
        42, -71, -1337, -3735928559, 71, 1337, 2735718543, 3735928559);

    final result = instance.methodWithNullableIntsStruct(input);

    expect(result.int8Field, 42);
    expect(result.int16Field, -71);
    expect(result.int32Field, -1337);
    expect(result.int64Field, -3735928559);
    expect(result.uint8Field, 71);
    expect(result.uint16Field, 1337);
    expect(result.uint32Field, 2735718543);
    expect(result.uint64Field, 3735928559);
  });
  _testSuite.test("Nullable String round trip with null", () {
    final result = instance.methodWithString(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable String round trip with zero", () {
    final result = instance.methodWithString("");

    expect(result, "");
  });
  _testSuite.test("Nullable String round trip with non-zero", () {
    final result = instance.methodWithString("Foo");

    expect(result, "Foo");
  });
  _testSuite.test("Nullable Boolean round trip with null", () {
    final result = instance.methodWithBoolean(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Boolean round trip with zero", () {
    final result = instance.methodWithBoolean(false);

    expect(result, isFalse);
  });
  _testSuite.test("Nullable Boolean round trip with non-zero", () {
    final result = instance.methodWithBoolean(true);

    expect(result, true);
  });
  _testSuite.test("Nullable Double round trip with null", () {
    final result = instance.methodWithDouble(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Double round trip with zero", () {
    final result = instance.methodWithDouble(0.0);

    expect(result, 0.0);
  });
  _testSuite.test("Nullable Double round trip with non-zero", () {
    final result = instance.methodWithDouble(3.14);

    expect(result, 3.14);
  });
  _testSuite.test("Nullable Int round trip with null", () {
    final result = instance.methodWithInt(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Int round trip with zero", () {
    final result = instance.methodWithInt(0);

    expect(result, 0);
  });
  _testSuite.test("Nullable Int round trip with non-zero", () {
    final result = instance.methodWithInt(42);

    expect(result, 42);
  });
  _testSuite.test("Nullable Struct round trip with null", () {
    final result = instance.methodWithSomeStruct(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Struct round trip with zero", () {
    final result =
        instance.methodWithSomeStruct(NullableInterface_SomeStruct(""));

    expect(result.stringField, "");
  });
  _testSuite.test("Nullable Struct round trip with non-zero", () {
    final result =
        instance.methodWithSomeStruct(NullableInterface_SomeStruct("Foo"));

    expect(result.stringField, "Foo");
  });
  _testSuite.test("Nullable Enum round trip with null", () {
    final result = instance.methodWithSomeEnum(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Enum round trip with zero", () {
    final result = instance.methodWithSomeEnum(NullableInterface_SomeEnum.off);

    expect(result, NullableInterface_SomeEnum.off);
  });
  _testSuite.test("Nullable Enum round trip with non-zero", () {
    final result = instance.methodWithSomeEnum(NullableInterface_SomeEnum.on);

    expect(result, NullableInterface_SomeEnum.on);
  });
  _testSuite.test("Nullable List round trip with null", () {
    final result = instance.methodWithSomeArray(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable List round trip with zero", () {
    final result = instance.methodWithSomeArray([]);

    expect(result, isEmpty);
  });
  _testSuite.test("Nullable List round trip with non-zero", () {
    final result = instance.methodWithSomeArray(["Foo"]);

    expect(result, ["Foo"]);
  });
  _testSuite.test("Nullable Map round trip with null", () {
    final result = instance.methodWithSomeMap(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Map round trip with zero", () {
    final result = instance.methodWithSomeMap({});

    expect(result, isEmpty);
  });
  _testSuite.test("Nullable Map round trip with non-zero", () {
    final result = instance.methodWithSomeMap({7: "Foo"});

    expect(result, {7: "Foo"});
  });
}
