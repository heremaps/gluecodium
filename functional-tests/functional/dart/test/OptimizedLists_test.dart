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

final _testSuite = TestSuite("Optimized lists");

void main() {
  _testSuite.test("Optimized list from method", () {
    final result = UseOptimizedList.fetchTheBigOnes();

    expect(result.length, 2);
    expect(result[0].field, "foo");
    expect(result[1].field, "bar");
  });
  _testSuite.test("Optimized list iterator from method", () {
    final result = UseOptimizedList.fetchTheBigOnes();
    final iterator = result.iterator;

    expect(iterator.moveNext(), isTrue);
    expect(iterator.current.field, "foo");
    expect(iterator.moveNext(), isTrue);
    expect(iterator.current.field, "bar");
    expect(iterator.moveNext(), isFalse);
  });
  _testSuite.test("Optimized list from property", () {
    final result = UseOptimizedList.lazyOnes;

    expect(result.length, 2);
    final element1 = result[0];
    expect(element1, isNotNull);
    final element2 = result[0];
    expect(element2, isNotNull);
  });
  _testSuite.test("Optimized list iterator from property", () {
    final result = UseOptimizedList.lazyOnes;
    final iterator = result.iterator;

    expect(iterator.moveNext(), isTrue);
    final element1 = iterator.current;
    expect(element1, isNotNull);
    expect(iterator.moveNext(), isTrue);
    final element2 = iterator.current;
    expect(element2, isNotNull);
    expect(iterator.moveNext(), isFalse);
  });
  _testSuite.test("Optimized list from struct", () {
    final result = UseOptimizedList.getStruct();

    expect(result.structs.length, 2);
    expect(result.structs[0].field, "foo");
    expect(result.structs[1].field, "bar");
  });
}
