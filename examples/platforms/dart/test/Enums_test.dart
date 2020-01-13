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
import "package:hello/hello.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Enums");

void main() {
  _testSuite.test("Flip enum to zero", () {
    final errorEnum = Enums_InternalError.errorFatal;

    final result = Enums.flipEnumValue(errorEnum);

    expect(result, equals(Enums_InternalError.errorNone));
  });
  _testSuite.test("Flip enum from zero", () {
    final errorEnum = Enums_InternalError.errorNone;

    final result = Enums.flipEnumValue(errorEnum);

    expect(result, equals(Enums_InternalError.errorFatal));
  });
  _testSuite.test("Extract enum from struct to zero", () {
    final input = Enums_ErrorStruct(Enums_InternalError.errorFatal, "");

    final result = Enums.extractEnumFromStruct(input);

    expect(result, equals(Enums_InternalError.errorNone));
  });
  _testSuite.test("Extract enum from struct from zero", () {
    final input = Enums_ErrorStruct(Enums_InternalError.errorNone, "");

    final result = Enums.extractEnumFromStruct(input);

    expect(result, equals(Enums_InternalError.errorFatal));
  });
  _testSuite.test("Create struct with enum inside to zero", () {
    final result = Enums.createStructWithEnumInside(Enums_InternalError.errorFatal, "");

    expect(result.type, equals(Enums_InternalError.errorNone));
  });
  _testSuite.test("Create struct with enum inside from zero", () {
    final result = Enums.createStructWithEnumInside(Enums_InternalError.errorNone, "");

    expect(result.type, equals(Enums_InternalError.errorFatal));
  });
}
