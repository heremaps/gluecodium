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

final _testSuite = TestSuite("Nesting");

void main() {
  _testSuite.test("Call static method of a class nested in a struct", () {
    final result = OuterStructInnerClass.fooBar();

    expect(result.first, 42);
  });
  _testSuite.test("Call a method throwing an exception nested in a struct", () {
    OuterStructInstantiationException exception = null;

    try {
      OuterStruct.doNothing();
    } on OuterStructInstantiationException catch(e) {
      exception = e;
    }

    expect(exception, isNotNull);
  });
}
