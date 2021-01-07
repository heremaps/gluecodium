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

import "dart:io";
import "dart:math";
import "package:test/test.dart";
import "package:functional/external.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("ExternalTypes");

class MyDartClass extends MyClass {
  @override
  int foo() => 77;
}

void main() {
  _testSuite.test("Use external struct", () {
    final externalStruct =
      ExternalStruct("foo", "bar", [7, 11], AnotherExternalStruct(42));
    final input = UseExternalTypesStructWithExternalTypes(
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
    final input = UseExternalTypesStructWithExternalTypes(
        externalStruct, ExternalEnum.bar);

    final result = UseExternalTypes.extractExternalEnum(input);

    expect(result, equals(ExternalEnum.bar));
  });
  _testSuite.test("Use Dart external struct", () {
    final rectangle = Rectangle<int>(0, 1, 2, 3);

    final result = UseDartExternalTypes.rectangleRoundTrip(rectangle);

    expect(result, rectangle);
  });
  _testSuite.test("Use Dart external enum", () {
    final state = HttpClientResponseCompressionState.decompressed;

    final result = UseDartExternalTypes.compressionStateRoundTrip(state);

    expect(result, state);
  });
  _testSuite.test("Use Dart external Color", () {
    final color = 0x007FFF;

    final result = UseDartExternalTypes.colorRoundTrip(color);

    expect(result, color);
  });
  _testSuite.test("Use Dart external Season", () {
    final season = "spring";

    final result = UseDartExternalTypes.seasonRoundTrip(season);

    expect(result, season);
  });
  _testSuite.test("Use Dart struct with external types", () {
    final struct = DartExternalTypesStruct(
      Rectangle<int>(0, 1, 2, 3),
      HttpClientResponseCompressionState.decompressed,
      0x007FFF,
      "spring"
    );

    final result = UseDartExternalTypes.structRoundTrip(struct);

    expect(result.rectangle, struct.rectangle);
    expect(result.compressionState, struct.compressionState);
    expect(result.color, struct.color);
    expect(result.season, struct.season);
  });
  _testSuite.test("Use MyClass", () {
    final useMyClass = UseMyClass();

    final result = useMyClass.callBar(MyDartClass());

    expect(result, 77);

    useMyClass.release(); // No automatic finalizers in Dart's own FFI API yet.
  });
}
