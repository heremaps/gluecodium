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

import "dart:typed_data";
import "package:test/test.dart";
import "package:functional/test.dart";
import "package:functional/src/test/internal_class_with_static_property.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Properties");

void main() {
  late Attributes attributes;
  setUp(() {
    attributes = Attributes();
  });
  tearDown(() {
    attributes.release();
  });

  _testSuite.test("Primitive type Property round trip", () {
    attributes.builtInTypeAttribute = 42;

    final result = attributes.builtInTypeAttribute;

    expect(result, equals(42));
  });
  _testSuite.test("Primitive type readonly Property", () {
    final result = attributes.readonlyAttribute;

    final epsilon = 0.000001;
    expect(result, inInclusiveRange(3.14 - epsilon, 3.14 + epsilon));
  });
  _testSuite.test("Struct type Property round trip", () {
    attributes.structAttribute = AttributesExampleStruct(2.71, []);

    final result = attributes.structAttribute;

    expect(result.value, equals(2.71));
  });
  _testSuite.test("Static Property round trip", () {
    Attributes.staticAttribute = "foo";

    final result = Attributes.staticAttribute;

    expect(result, equals("foo"));
  });
  _testSuite.test("List type Property round trip", () {
    attributes.arrayAttribute = ["foo", "bar"];

    final result = attributes.arrayAttribute;

    expect(result, equals(["foo", "bar"]));
  });
  _testSuite.test("Cached property", () {
    final instance = CachedProperties();

    expect(instance.callCount, 0);

    final result1 = instance.cachedProperty;
    final result2 = instance.cachedProperty;

    expect(instance.callCount, 1);
    expect(result1, equals(["foo", "bar"]));

    instance.release();
  });
  _testSuite.test("Static cached property", () {
    expect(CachedProperties.staticCallCount, 0);

    final result1 = CachedProperties.staticCachedProperty;
    final result2 = CachedProperties.staticCachedProperty;

    expect(CachedProperties.staticCallCount, 1);
    expect(result1, Uint8List.fromList([0, 1, 2]));
  });
  _testSuite.test("Static internal property", () {
    final result = InternalClassWithStaticProperty.internalfooBar;

    expect(result, "foo");
  });
  _testSuite.test("Property in a nested class", () {
    final geometry = VenueGeometry();
    final internalAddress = geometry.internalAddress;
    final result = internalAddress?.longAddress;

    expect(result, "foobar");

    geometry.release();
    internalAddress?.release();
  });
}
