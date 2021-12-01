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

final _testSuite = TestSuite("SkipElement");

// Compile-time check that SkipTagsInDart contains exactly one method.
class SkipTagsInDartImpl implements SkipTagsInDart {
  @override
  void dontSkipTagged() {}
}

void main() {
  _testSuite.test("AutoTagRoundTrip", () {
    final value = SkipEnumeratorAutoTag.three;

    final result = UseSkipEnumerator.autoTagRoundTrip(value);

    expect(result, value);
  });
  _testSuite.test("ExplicitTagRoundTrip", () {
    final value = SkipEnumeratorExplicitTag.three;

    final result = UseSkipEnumerator.explicitTagRoundTrip(value);

    expect(result, value);
  });
}
