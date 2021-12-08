// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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
import "package:functional/another.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Multiple inheritance");

class MultiInterfaceImpl implements MultiInterface {
  @override
  void childFunction() { }
  @override
  String childProperty = "";

  @override
  void parentFunction() { }
  @override
  String parentProperty = "";

  @override
  String parentFunctionLight() => "dart face";
  @override
  String parentPropertyLight = "";
}

void main() {
  _testSuite.test("from C++ send upcast succeeds", () {
    final instance = MultipleInheritanceFactory.getMultiClass();

    final result = instance is NarrowInterface;

    expect(result, isTrue);
  });
  _testSuite.test("from C++ send downcast fails", () {
    final instance = MultipleInheritanceFactory.getMultiClassAsNarrow();

    final result = instance is MultiClass;

    expect(result, isFalse);
  });
  _testSuite.test("from C++ send twice equals", () {
    final instance1 = MultipleInheritanceFactory.getMultiClassSingleton();
    final instance2 = MultipleInheritanceFactory.getMultiClassSingleton();

    final result = instance1 == instance2;

    expect(result, isTrue);
  });
  _testSuite.test("from C++ round trip not equals", () {
    final instance = MultipleInheritanceFactory.getMultiClassSingleton();

    final result = MultipleInheritanceChecker.checkSingletonEquality(instance);

    expect(result, isFalse);
  });
  _testSuite.test("from C++ round trip with upcast not equals", () {
    final uncastInstance = MultipleInheritanceFactory.getMultiClass();
    final instance = uncastInstance as NarrowInterface;

    final result = MultipleInheritanceChecker.checkSingletonEquality(instance);

    expect(result, isFalse);
  });
  _testSuite.test("from Dart send upcast succeeds", () {
    final instance = MultiInterfaceImpl();

    final result = MultipleInheritanceChecker.checkIsNarrow(instance);

    expect(result, isTrue);
  });
  _testSuite.test("from Dart send downcast fails", () {
    final uncastInstance = MultiInterfaceImpl();
    final instance = uncastInstance as NarrowInterface;

    final result = MultipleInheritanceChecker.checkIsMultiInterface(instance);

    expect(result, isFalse);
  });
  _testSuite.test("from Dart send twice equals", () {
    final instance = MultiInterfaceImpl();

    final result = MultipleInheritanceChecker.checkNarrowEquality(instance, instance);

    expect(result, isTrue);
  });
  _testSuite.test("from Dart round trip equals", () {
    final uncastInstance = MultiInterfaceImpl();
    final instance = uncastInstance as NarrowInterface;

    final result = uncastInstance == MultipleInheritanceChecker.narrowRoundTrip(instance);

    expect(result, isTrue);
  });
  _testSuite.test("from Dart round trip with upcast not equals", () {
    final instance = MultiInterfaceImpl();

    final result = instance == MultipleInheritanceFactory.upcastMultiInterfaceToNarrow(instance);

    expect(result, isFalse);
  });
}
