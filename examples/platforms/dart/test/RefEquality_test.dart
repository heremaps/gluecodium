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

final _testSuite = TestSuite("RefEquality");

void main() {
  _testSuite.test("Ref equality preserved for a class", () {
    final instance1 = DummyFactory.getDummyClassSingleton();
    final instance2 = DummyFactory.getDummyClassSingleton();

    final result = instance1 == instance2;

    expect(result, isTrue);

    instance1.release();
    instance2.release();
  });
  _testSuite.test("Ref inequality preserved for a class", () {
    final instance1 = DummyFactory.getDummyClassSingleton();
    final instance2 = DummyFactory.createDummyClass();

    final result = instance1 == instance2;

    expect(result, isFalse);

    instance1.release();
    instance2.release();
  });
  _testSuite.test("Ref equality preserved for an interface", () {
    final instance1 = DummyFactory.getDummyInterfaceSingleton();
    final instance2 = DummyFactory.getDummyInterfaceSingleton();

    final result = instance1 == instance2;

    expect(result, isTrue);

    instance1.release();
    instance2.release();
  });
  _testSuite.test("Ref inequality preserved for an interface", () {
    final instance1 = DummyFactory.getDummyInterfaceSingleton();
    final instance2 = DummyFactory.createDummyInterface();

    final result = instance1 == instance2;

    expect(result, isFalse);

    instance1.release();
    instance2.release();
  });
  _testSuite.test("Ref equality preserved for a class constructor", () {
    final instance1 = DummyClass();
    final instance2 = DummyClass.dummyClassRoundTrip(instance1);

    final result = instance1 == instance2;

    expect(result, isTrue);

    instance1.release();
    instance2.release();
  });
  _testSuite.test("Ref inequality preserved for a class constructor", () {
    final instance1 = DummyClass();
    final instance2 = DummyClass();

    final result = instance1 == instance2;

    expect(result, isFalse);

    instance1.release();
    instance2.release();
  });
  _testSuite.test("Ref equality preserved for a class in a list", () {
    final list = [DummyClass()];
    final result = DummyClass.dummyClassListRoundTrip(list);

    expect(list.first == result.first, isTrue);

    list.first.release();
    result.first.release();
  });
}
