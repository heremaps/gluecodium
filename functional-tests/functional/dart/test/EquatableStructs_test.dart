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

final _testSuite = TestSuite("EquatableStructs");

EquatableEquatableStruct createEquatableStruct() {
  return EquatableEquatableStruct(
      true, 65542, 2147484000, 1.0, 2.0, "nonsense",
      new EquatableNestedEquatableStruct("foo"),
      EquatableSomeSomeEnum.bar, {0: "one"}, ["two"]
  );
}

void main() {
  late EquatableEquatableStruct struct;
  setUp(() {
    struct = createEquatableStruct();
  });

  _testSuite.test("Equatable struct equals to self", () {
    expect(struct == struct, isTrue);
    expect(struct.hashCode == struct.hashCode, isTrue);
  });
  _testSuite.test("Equatable struct equals", () {
    final otherStruct = createEquatableStruct();

    expect(struct == otherStruct, isTrue);
    expect(struct.hashCode == otherStruct.hashCode, isTrue);
  });
  _testSuite.test("Equatable struct not equals Boolean field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.boolField = false;

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals Int field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.intField += 1;

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals Double field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.doubleField += 1.0;

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals String field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.stringField += "foo";

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals Struct field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.structField.fooField += "bar";

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals Enum field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.enumField = EquatableSomeSomeEnum.foo;

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals List field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.arrayField.add("three");

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
  _testSuite.test("Equatable struct not equals Map field", () {
    final otherStruct = createEquatableStruct();
    otherStruct.mapField.addAll({42: "four"});

    expect(struct == otherStruct, isFalse);
    expect(struct.hashCode == otherStruct.hashCode, isFalse);
  });
}
