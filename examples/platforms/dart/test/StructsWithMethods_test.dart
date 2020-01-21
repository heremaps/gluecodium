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

final _testSuite = TestSuite("StructsWithMethods");

void main() {
  final vector = Vector.create(1, 2);
  final vector3 = StructsWithMethodsInterface_Vector3.create(1, 2, 3);

  _testSuite.test("Vector distance to self", () {
    final result = vector.distanceTo(vector);

    expect(result, 0.0);
  });
  _testSuite.test("Vector distance to other", () {
    final input = Vector.create(-3, -4);

    final result = vector.distanceTo(input);

    final epsilon = 0.001;
    expect(result, inInclusiveRange(7.211 - epsilon, 7.211 + epsilon));
  });
  _testSuite.test("Vector add self", () {
    final result = vector.add(vector);

    expect(result.x, 2.0);
    expect(result.y, 4.0);
  });
  _testSuite.test("Vector add other", () {
    final input = Vector.create(-3, -7);

    final result = vector.add(input);

    expect(result.x, -2.0);
    expect(result.y, -5.0);
  });
  _testSuite.test("Vector validate passes", () {
    final result = Vector.validate(1, 2);

    expect(result, isTrue);
  });
  _testSuite.test("Vector validate fails", () {
    final result = Vector.validate(1, double.nan);

    expect(result, isFalse);
  });
  _testSuite.test("Vector copy constructor does not throw", () {
    Vector result = null;
    ValidationException exception = null;

    try {
      result = new Vector.createCopy(vector);
    } on ValidationException catch(e) {
      exception = e;
    }

    expect(result.x, 1);
    expect(result.y, 2);
    expect(exception, isNull);
  });
  _testSuite.test("Vector copy constructor throws", () {
    Vector result = null;
    ValidationException exception = null;

    try {
      result = new Vector.createCopy(new Vector.create(1, double.nan));
    } on ValidationException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception, isNotNull);
    expect(exception.error, ValidationErrorCode.validationFailed);
  });
  _testSuite.test("Vector3 distance to self", () {
    final result = vector3.distanceTo(vector3);

    expect(result, 0.0);
  });
  _testSuite.test("Vector3 distance to other", () {
    final input = StructsWithMethodsInterface_Vector3.create(-4, -5, 6);

    final result = vector3.distanceTo(input);

    final epsilon = 0.001;
    expect(result, inInclusiveRange(9.110 - epsilon, 9.110 + epsilon));
  });
  _testSuite.test("Vector3 add self", () {
    final result = vector3.add(vector3);

    expect(result.x, 2.0);
    expect(result.y, 4.0);
    expect(result.z, 6.0);
  });
  _testSuite.test("Vector3 add other", () {
    final input = StructsWithMethodsInterface_Vector3.create(-4, -7, -10);

    final result = vector3.add(input);

    expect(result.x, -3.0);
    expect(result.y, -5.0);
    expect(result.z, -7.0);
  });
  _testSuite.test("Vector3 validate passes", () {
    final result = StructsWithMethodsInterface_Vector3.validate(1, 2, 3);

    expect(result, isTrue);
  });
  _testSuite.test("Vector3 validate fails", () {
    final result =
      StructsWithMethodsInterface_Vector3.validate(1, double.nan, 3);

    expect(result, isFalse);
  });
  _testSuite.test("Vector3 copy constructor does not throw", () {
    StructsWithMethodsInterface_Vector3 result = null;
    ValidationException exception = null;

    try {
      result = new StructsWithMethodsInterface_Vector3.createCopy(vector3);
    } on ValidationException catch(e) {
      exception = e;
    }

    expect(result.x, 1);
    expect(result.y, 2);
    expect(result.z, 3);
    expect(exception, isNull);
  });
  _testSuite.test("Vector3 copy constructor throws", () {
    StructsWithMethodsInterface_Vector3 result = null;
    ValidationException exception = null;

    try {
      result = new StructsWithMethodsInterface_Vector3.createCopy(
          new StructsWithMethodsInterface_Vector3.create(1, double.nan, 3)
      );
    } on ValidationException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception, isNotNull);
    expect(exception.error, ValidationErrorCode.validationFailed);
  });
}
