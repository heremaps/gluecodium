// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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
import "package:hello/hello.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("PlainDataStructuresImmutable");

void main() {
  _testSuite.test("All types immutable struct round trip", () {
    final input = PlainDataStructuresImmutable_AllTypesImmutableStruct(-1, 2, -3, 4, -5,
        6, -7, 8, -9, 10, "foo", true, PlainDataStructuresImmutable_Point(-11, 12));

    final result = PlainDataStructuresImmutable.immutableStructRoundTrip(input);

    expect(result.int8Field, equals(-1));
    expect(result.uint8Field, equals(2));
    expect(result.int16Field, equals(-3));
    expect(result.uint16Field, equals(4));
    expect(result.int32Field, equals(-5));
    expect(result.uint32Field, equals(6));
    expect(result.int64Field, equals(-7));
    expect(result.uint64Field, equals(8));
    expect(result.floatField, equals(-9));
    expect(result.doubleField, equals(10));
    expect(result.stringField, equals("foo"));
    expect(result.booleanField, equals(true));
    expect(result.pointField.x, equals(-11));
    expect(result.pointField.y, equals(12));
  });
  _testSuite.test("Nested immutable struct round trip", () {
    final input = PlainDataStructuresImmutable_NestingImmutableStruct(
        PlainDataStructuresImmutable_AllTypesImmutableStruct(
            -1, 2, -3, 4, -5, 6, -7, 8, -9, 10, "foo", true,
            PlainDataStructuresImmutable_Point(-11, 12)
        )
    );

    final result = PlainDataStructuresImmutable.nestingImmutableStructRoundTrip(input);

    expect(result.structField.int8Field, equals(-1));
    expect(result.structField.uint8Field, equals(2));
    expect(result.structField.int16Field, equals(-3));
    expect(result.structField.uint16Field, equals(4));
    expect(result.structField.int32Field, equals(-5));
    expect(result.structField.uint32Field, equals(6));
    expect(result.structField.int64Field, equals(-7));
    expect(result.structField.uint64Field, equals(8));
    expect(result.structField.floatField, equals(-9));
    expect(result.structField.doubleField, equals(10));
    expect(result.structField.stringField, equals("foo"));
    expect(result.structField.booleanField, equals(true));
    expect(result.structField.pointField.x, equals(-11));
    expect(result.structField.pointField.y, equals(12));
  });
  _testSuite.test("Immutable struct with accessprs round trip", () {
    final input =
        PlainDataStructuresImmutable_ImmutableStructWithCppAccessors("foo");

    final result = PlainDataStructuresImmutable.immutableStructWithAccessorsRoundTrip(input);

    expect(result.stringField, equals("foo"));
  });
}
