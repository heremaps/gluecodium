// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2022 HERE Europe B.V.
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

final _testSuite = TestSuite("NoCache");

class NoCacheImpl implements NoCacheInterface {
  @override
  void foo() {}
}

void main() {
  _testSuite.test("NoCache interface from C++", () {
    final instance1 = NoCacheHelper.getNoCacheInterface();
    final instance2 = NoCacheHelper.getNoCacheInterface();

    final result = identical(instance1, instance2);

    expect(result, isFalse);
  });
  _testSuite.test("NoCache interface from Dart", () {
    final instance = NoCacheImpl();

    final result = NoCacheHelper.compareNoCacheInterface(instance, instance);

    expect(result, isFalse);
  });
  _testSuite.test("NoCache class from C++", () {
    final instance1 = NoCacheHelper.getNoCacheClass();
    final instance2 = NoCacheHelper.getNoCacheClass();

    final result = identical(instance1, instance2);

    expect(result, isFalse);
  });
}
