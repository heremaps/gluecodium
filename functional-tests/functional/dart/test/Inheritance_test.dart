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

import 'dart:ffi';
import "package:test/test.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Inheritance");

// Prototype class, which will be injected to 'DerivedClassWithStaticMethods'.
class MockDerivedClassWithStaticMethods extends DerivedClassWithStaticMethods$Impl {
    MockDerivedClassWithStaticMethods(Pointer<Void> handle) : super(handle);

    @override
    int getRandomInt() => 37;

    @override
    double getRandomDouble() => 33.33;
}

void main() {
  _testSuite.test("Create child class instance", () {
    final ChildClass result = ChildClass.createChildClass();

    expect(result.getName(), "Johnny");
    expect(result.luckyNumber, 7);
  });
  _testSuite.test("Cast child class instance to parent", () {
    final ParentInterface result = ChildClass.createChildClass();

    expect(result.getName(), "Johnny");
    expect(result.luckyNumber, 7);
  });
  _testSuite.test("Create grandchild class instance", () {
    final GrandchildClass result = GrandchildClass.createGrandchildClass();

    expect(result.getName(), "John F. Kimberly");
    expect(result.luckyNumber, 42);
  });
  _testSuite.test("Cast grandchild class instance to grandparent", () {
    final ParentInterface result = GrandchildClass.createGrandchildClass();

    expect(result.getName(), "John F. Kimberly");
    expect(result.luckyNumber, 42);
  });
  _testSuite.test("Type information is preserved for interface inheriting from interface", () {
    final RootInterface result = InheritanceTestHelper.createChildAsRootInterface();

    expect(result, isA<ChildInterface>());
  });
  _testSuite.test("Type information is preserved for class inheriting from interface", () {
    final ChildInterface result = InheritanceTestHelper.createConcreteChildAsChildInterface();

    expect(result, isA<ConcreteChild>());
  });
  _testSuite.test("Type information is preserved for class inheriting from class", () {
    final ConcreteChild result = InheritanceTestHelper.createGrandchildClassAsChildClass();

    expect(result, isA<ConcreteGrandChild>());
  });
  _testSuite.test("Class using \$HiddenImpl properly executes function calls and allows mocking", () {
      // Call functions.
      final BaseClassWithStaticMethods baseObj = BaseClassWithStaticMethods();
      expect(baseObj.nonstaticGetInt(), 14);
      expect(BaseClassWithStaticMethods.getRandomInt(), 7);

      final DerivedClassWithStaticMethods derivedObj = DerivedClassWithStaticMethods();
      expect(derivedObj.nonstaticGetInt(), 21);
      expect(derivedObj.nonstaticGetDouble(), closeTo(21.21, 0.000001));
      expect(DerivedClassWithStaticMethods.getRandomDouble(), closeTo(77.77, 0.000001));

      // Mock-ability of static functions from Base and Derived.
      BaseClassWithStaticMethods.$prototype = MockDerivedClassWithStaticMethods(Pointer<Void>.fromAddress(0));
      expect(baseObj.nonstaticGetInt(), 14);
      expect(BaseClassWithStaticMethods.getRandomInt(), 37);

      DerivedClassWithStaticMethods.$prototype = MockDerivedClassWithStaticMethods(Pointer<Void>.fromAddress(0));
      expect(derivedObj.nonstaticGetInt(), 21);
      expect(derivedObj.nonstaticGetDouble(), closeTo(21.21, 0.000001));
      expect(DerivedClassWithStaticMethods.getRandomDouble(), closeTo(33.33, 0.000001));
  });
}
