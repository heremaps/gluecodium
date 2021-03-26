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

import "package:test/test.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("InterfaceWithStatic");

class InterfaceWithStaticImpl extends InterfaceWithStatic {
  @override
  String regularFunction() => "buzz1";

  @override
  String regularProperty = "buzz2";
}

void main() {
  _testSuite.test("Call static function", () {
    final result = InterfaceWithStatic.staticFunction();

    expect(result, "bar1");
  });
  _testSuite.test("Call static property getter", () {
    final result = InterfaceWithStatic.staticProperty;

    expect(result, "bar2");
  });
  _testSuite.test("Call static property setter", () {
    InterfaceWithStatic.staticProperty = "wizz1";
    final result = InterfaceWithStatic.staticProperty;
    UseInterfaceWithStatic.resetStaticValue();

    expect(result, "wizz1");
  });
  _testSuite.test("Call static function on proxy", () {
    final instance = InterfaceWithStaticImpl();

    final result = UseInterfaceWithStatic.invokeStaticFunction(instance);

    expect(result, "bar1");
  });
  _testSuite.test("Call static property getter on proxy", () {
    final instance = InterfaceWithStaticImpl();

    final result = UseInterfaceWithStatic.invokeStaticGetter(instance);

    expect(result, "bar2");
  });
  _testSuite.test("Call static property setter on proxy", () {
    final instance = InterfaceWithStaticImpl();

    UseInterfaceWithStatic.invokeStaticSetter(instance, "wizz2");
    final result = UseInterfaceWithStatic.invokeStaticGetterDirectly();
    UseInterfaceWithStatic.resetStaticValue();

    expect(result, "wizz2");
  });
}
