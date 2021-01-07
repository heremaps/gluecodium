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
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("PlainDataStructuresFromTypeCollection");

void main() {
  _testSuite.test("Return simple data structure", () {
    final result = PlainDataStructuresFromTypeCollection.createPoint(1.0, 2.0);

    expect(result.x, equals(1.0));
    expect(result.y, equals(2.0));
  });
  _testSuite.test("Manipulate simple data structure", () {
    final input = Point(1.0, 2.0);

    final result = PlainDataStructuresFromTypeCollection.swapPointCoordinates(input);

    expect(result.x, equals(2.0));
    expect(result.y, equals(1.0));
  });
  _testSuite.test("Create nested data structure with multiple params", () {
    final input1 = Point(1.0, 2.0);
    final input2 = Point(3.0, 4.0);

    final result = PlainDataStructuresFromTypeCollection.createLine(input1, input2);

    expect(result.a.x, equals(1.0));
    expect(result.a.y, equals(2.0));
    expect(result.b.x, equals(3.0));
    expect(result.b.y, equals(4.0));
  });
  _testSuite.test("All types non-zeros round trip", () {
    final input = AllTypesStruct(-1, 2, -3, 4, -5,
        6, -7, 8, -9, 10, "foo", true, Point(-11, 12));

    final result = PlainDataStructuresFromTypeCollection.modifyAllTypesStruct(input);

    expect(result.int8Field, equals(0));
    expect(result.uint8Field, equals(3));
    expect(result.int16Field, equals(-2));
    expect(result.uint16Field, equals(5));
    expect(result.int32Field, equals(-4));
    expect(result.uint32Field, equals(7));
    expect(result.int64Field, equals(-6));
    expect(result.uint64Field, equals(9));
    expect(result.floatField, equals(-8));
    expect(result.doubleField, equals(11));
    expect(result.stringField, equals("Hello foo"));
    expect(result.booleanField, equals(false));
    expect(result.pointField.x, equals(12));
    expect(result.pointField.y, equals(-11));
  });
}
