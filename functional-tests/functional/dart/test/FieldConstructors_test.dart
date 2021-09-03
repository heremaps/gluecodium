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

final _testSuite = TestSuite("FieldConstuctors");

void main() {
  _testSuite.test("With partial defaults 2", () {
    final result = FieldConstructorsPartialDefaults.withTrue(7, "foo");

    expect(result.stringField, "foo");
    expect(result.intField, 7);
    expect(result.boolField, true);
  });
  _testSuite.test("With partial defaults 3", () {
    final result = FieldConstructorsPartialDefaults(false, 7, "foo");

    expect(result.stringField, "foo");
    expect(result.intField, 7);
    expect(result.boolField, false);
  });
  _testSuite.test("With all defaults 0", () {
    final result = FieldConstructorsAllDefaults.withAll();

    expect(result.stringField, "nonsense");
    expect(result.intField, 42);
    expect(result.boolField, true);
  });
  _testSuite.test("With all defaults 1", () {
    final result = FieldConstructorsAllDefaults.withTrueNonsense(7);

    expect(result.stringField, "nonsense");
    expect(result.intField, 7);
    expect(result.boolField, true);
  });
  _testSuite.test("Immutable no clash", () {
    final result = ImmutableStructNoClash("foo", 7, false);

    expect(result.stringField, "foo");
    expect(result.intField, 7);
    expect(result.boolField, false);
  });
  _testSuite.test("Immutable with clash", () {
    final result = ImmutableStructWithClash(false, 7, "foo");

    expect(result.stringField, "foo");
    expect(result.intField, 7);
    expect(result.boolField, false);
  });
}
