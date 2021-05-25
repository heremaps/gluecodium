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

final _testSuite = TestSuite("CppConstMethods");

class CppConstCallback implements CppConstInterface {
  @override
  String getFoo() => "FOO";

  @override
  release() {}
}

void main() {
  _testSuite.test("Cpp const method on class", () {
    final instance = CppConstClass();
    final result = instance.getFoo();

    expect(result, "foo");

    instance.release();
  });
  _testSuite.test("Cpp const method on interface", () {
    final instance = CppConstInterfaceFactory.createCppConstInterface();
    final result = instance.getFoo();

    expect(result, "foo");

    instance.release();
  });
  _testSuite.test("Cpp const method on interface in Cpp", () {
    final result = CppConstInterfaceFactory.callGetFoo(CppConstCallback());

    expect(result, "FOO");
  });
}
