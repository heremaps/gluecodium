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
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Lists");

void main() {
  _testSuite.test("Reverse String list", () {
    final input = ["foo", "bar"];

    final result = Arrays.reverseStringArray(input);

    expect(result, equals(["bar", "foo"]));
  });
  _testSuite.test("Reverse Int8 list", () {
    final input = [-42, 31];

    final result = Arrays.reverseInt8Array(input);

    expect(result, equals([31, -42]));
  });
  _testSuite.test("Reverse Int16 list", () {
    final input = [-314, 420];

    final result = Arrays.reverseInt16Array(input);

    expect(result, equals([420, -314]));
  });
  _testSuite.test("Reverse Int32 list", () {
    final input = [-33333, 42000];

    final result = Arrays.reverseInt32Array(input);

    expect(result, equals([42000, -33333]));
  });
  _testSuite.test("Reverse Int64 list", () {
    final input = [-3147483647, 4200000000];

    final result = Arrays.reverseInt64Array(input);

    expect(result, equals([4200000000, -3147483647]));
  });
  _testSuite.test("Reverse Uint8 list", () {
    final input = [42, 31];

    final result = Arrays.reverseUint8Array(input);

    expect(result, equals([31, 42]));
  });
  _testSuite.test("Reverse Uint16 list", () {
    final input = [314, 420];

    final result = Arrays.reverseUint16Array(input);

    expect(result, equals([420, 314]));
  });
  _testSuite.test("Reverse Uint32 list", () {
    final input = [33333, 42000];

    final result = Arrays.reverseUint32Array(input);

    expect(result, equals([42000, 33333]));
  });
  _testSuite.test("Reverse Uint64 list", () {
    final input = [3147483647, 4200000000];

    final result = Arrays.reverseUint64Array(input);

    expect(result, equals([4200000000, 3147483647]));
  });
  _testSuite.test("Reverse Float list", () {
    final input = [-4.2, 3.1];

    final result = Arrays.reverseFloatArray(input);

    final epsilon = 0.000001;
    expect(result[0], inInclusiveRange(3.1 - epsilon, 3.1 + epsilon));
    expect(result[1], inInclusiveRange(-4.2 - epsilon, -4.2 + epsilon));
  });
  _testSuite.test("Reverse Double list", () {
    final input = [-4.2, 3.1];

    final result = Arrays.reverseDoubleArray(input);

    expect(result, equals([3.1, -4.2]));
  });
  _testSuite.test("Reverse Boolean list", () {
    final input = [true, true, false];

    final result = Arrays.reverseBoolArray(input);

    expect(result, equals([false, true, true]));
  });
  _testSuite.test("Reverse Struct list", () {
    final input = [ArraysBasicStruct(-4.2), ArraysBasicStruct(3.1)];

    final result = Arrays.reverseStructArray(input);

    expect(result[0].value, equals(3.1));
    expect(result[1].value, equals(-4.2));
  });
  _testSuite.test("Reverse Maps list", () {
    final input = [<int, String>{}, {42: "foo"}];

    final result = Arrays.reverseMapsArray(input);

    expect(result, equals([{42: "foo"}, <int, String>{}]));
  });
  _testSuite.test("Reverse list of Maps with lists", () {
    final input = [<int, List<String>>{}, {42: ["foo"]}];

    final result = Arrays.reverseArrayMapsArray(input);

    expect(result, equals([{42: ["foo"]}, <int, List<String>>{}]));
  });
  _testSuite.test("Reverse Instance list", () {
    final instance1 = InstancesFactory.createSimpleInstantiableOne();
    final instance2 = InstancesFactory.createSimpleInstantiableOne();
    instance1.setStringValue("foo");
    instance2.setStringValue("bar");
    final input = [instance1, instance2];

    final result = Arrays.reverseImplicitInstancesArray(input);

    expect(result[0].getStringValue(), equals("bar"));
    expect(result[1].getStringValue(), equals("foo"));

    instance1.release();
    instance2.release();
    result[0].release();
    result[1].release();
  });
  _testSuite.test("Reverse nested Primitive list", () {
    final input = [[-4.2, 3.1], [2.81, -1.41]];

    final result = Arrays.reverseNestedPrimitiveArray(input);

    expect(result, equals([[-1.41, 2.81], [3.1, -4.2]]));
  });
  _testSuite.test("Reverse list of Aliases", () {
    final input = ["foo", "bar"];

    final result = Arrays.reverseArrayOfAliases(input);

    expect(result, equals(["bar", "foo"]));
  });
}
