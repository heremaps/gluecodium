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

final _testSuite = TestSuite("ExternalTypes");

void main() {
  _testSuite.test("Use external struct", () {
    final externalStruct =
      ExternalStruct("foo", "bar", [7, 11], AnotherExternalStruct(42));
    final input = UseExternalTypes_StructWithExternalTypes(
        externalStruct, ExternalEnum.bar);

    final result = UseExternalTypes.extractExternalStruct(input);

    expect(result.stringField, equals("foo"));
    expect(result.externalStringField, equals("bar"));
    expect(result.externalArrayField, equals([7, 11]));
    expect(result.externalStructField.intField, equals(42));
  });
  _testSuite.test("Use external enum", () {
    final externalStruct =
      ExternalStruct("foo", "bar", [7, 11], AnotherExternalStruct(42));
    final input = UseExternalTypes_StructWithExternalTypes(
        externalStruct, ExternalEnum.bar);

    final result = UseExternalTypes.extractExternalEnum(input);

    expect(result, equals(ExternalEnum.bar));
  });
}
