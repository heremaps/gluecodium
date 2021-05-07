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

final _testSuite = TestSuite("SimpleEquality");

void main() {
  NonEquatableClass class1;
  NonEquatableClass class2;
  NonEquatableInterface interface1;
  NonEquatableInterface interface2;

  setUp(() {
    class1 = NonEquatableFactory.createNonEquatableClass();
    class2 = NonEquatableFactory.createNonEquatableClass();
    interface1 = NonEquatableFactory.createNonEquatableInterface();
    interface2 = NonEquatableFactory.createNonEquatableInterface();
  });
  tearDown(() {
    class1.release();
    class2.release();
    interface1.release();
    interface2.release();
  });

  _testSuite.test("Simple equality for structs", () {
    final struct1 = SimpleEquatableStruct(class1, interface1, class2, interface2);
    final struct2 = SimpleEquatableStruct(class1, interface1, class2, interface2);

    expect(struct1 == struct2, isTrue);
    expect(struct1.hashCode == struct2.hashCode, isTrue);
  });
  _testSuite.test("Simple equality for structs with nulls", () {
    final struct1 = SimpleEquatableStruct(class1, interface1, null, null);
    final struct2 = SimpleEquatableStruct(class1, interface1, null, null);

    expect(struct1 == struct2, isTrue);
    expect(struct1.hashCode == struct2.hashCode, isTrue);
  });
  _testSuite.test("Simple inequality for structs", () {
    final struct1 = SimpleEquatableStruct(class1, interface1, class2, interface2);
    final struct2 = SimpleEquatableStruct(class2, interface2, class1, interface1);

    expect(struct1 == struct2, isFalse);
    expect(struct1.hashCode == struct2.hashCode, isFalse);
  });
  _testSuite.test("Simple inequality for structs with nulls", () {
    final struct1 = SimpleEquatableStruct(class1, interface1, class2, null);
    final struct2 = SimpleEquatableStruct(class1, interface1, null, interface2);

    expect(struct1 == struct2, isFalse);
    expect(struct1.hashCode == struct2.hashCode, isFalse);
  });
}
