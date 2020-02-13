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

final _testSuite = TestSuite("EquatableStructs");

EquatableStruct createEquatableStruct() {
  return EquatableStruct(
      true, 65542, 2147484000, 1.0, 2.0, "nonsense",
      new NestedEquatableStruct("foo"),
      new NestedImmutableStruct.withDefaults(),
      SomeSomeEnum.bar, {0: "one"}, ["two"]
  );
}

void main() {
  EquatableStruct struct;
  setUp(() {
    struct = createEquatableStruct();
  });

  _testSuite.test("Equatable struct equals to self", () {
    final result = struct == struct;

    expect(result, isTrue);
  });
  _testSuite.test("Equatable struct equals", () {
    final otherStruct = createEquatableStruct();

    final result = struct == otherStruct;

    expect(result, isTrue);
  });
  _testSuite.test("Equatable struct not equals Boolean field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.boolField = false;

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals Int field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.intField += 1;

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals Double field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.doubleField += 1.0;

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals String field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.stringField += "foo";

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals Struct field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.structField.fooField += "bar";

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals Enum field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.enumField = SomeSomeEnum.foo;

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals List field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.arrayField.add("three");

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
  _testSuite.test("Equatable struct not equals Map field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.mapField.addAll({42: "four"});

    final result = struct == otherStruct;

    expect(result, isFalse);
  });
}
