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

final _testSuite = TestSuite("EquatableClasses");

void main() {
  _testSuite.test("Pointer equatable class equals to self", () {
    final one = PointerEquatableClass.createNew();

    final result = one == one;

    expect(result, isTrue);

    one.release();
  });
  _testSuite.test("Pointer equatable class not equals to other", () {
    final one = PointerEquatableClass.createNew();
    final other = PointerEquatableClass.createNew();

    final result = one == other;

    expect(result, isFalse);

    one.release();
    other.release();
  });
  _testSuite.test("Pointer equatable class equals to self from other source", () {
    final one = PointerEquatableClass.createNew();
    final other = PointerEquatableClass.returnLast();

    final result = one == other;

    expect(result, isTrue);

    one.release();
    other.release();
  });
  _testSuite.test("Equatable class equals to self", () {
    final one = EquatableClass("one");

    final result = one == one;

    expect(result, isTrue);

    one.release();
  });
  _testSuite.test("Equatable class equals", () {
    final one = EquatableClass("one");
    final other = EquatableClass("one");

    final result = one == other;

    expect(result, isTrue);

    one.release();
    other.release();
  });
  _testSuite.test("Equatable class not equals", () {
    final one = EquatableClass("one");
    final other = EquatableClass("two");

    final result = one == other;

    expect(result, isFalse);

    one.release();
    other.release();
  });
  _testSuite.test("Equatable interface equals", () {
    final one = EquatableInterfaceFactory.createEquatableInterface("one");
    final other = EquatableInterfaceFactory.createEquatableInterface("one");

    final result = one == other;

    expect(result, isTrue);

    one.release();
    other.release();
  });
  _testSuite.test("Equatable interface not equals", () {
    final one = EquatableInterfaceFactory.createEquatableInterface("one");
    final other = EquatableInterfaceFactory.createEquatableInterface("two");

    final result = one == other;

    expect(result, isFalse);

    one.release();
    other.release();
  });
}
