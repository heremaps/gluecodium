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

final _testSuite = TestSuite("Maps");

void main() {
  _testSuite.test("Empty Map round trip", () {
    final input = <int, String>{};

    final result = Maps.methodWithMap(input);

    expect(result, isEmpty);
  });
  _testSuite.test("Map round trip", () {
    final input = {-31: "foo", 42: "bar"};

    final result = Maps.methodWithMap(input);

    expect(result, equals({-31: "FOO", 42: "BAR"}));
  });
  _testSuite.test("Map to List round trip", () {
    final input = {31: ["foo"], 42: ["bar"]};

    final result = Maps.methodWithMapOfArrays(input);

    expect(result, equals({31: ["FOO"], 42: ["BAR"]}));
  });
  _testSuite.test("Map to Struct round trip", () {
    final input = {31: Maps_SomeStruct("foo"), 42: Maps_SomeStruct("bar")};

    final result = Maps.methodWithMapToStruct(input);

    expect(result[31].value, equals("FOO"));
    expect(result[42].value, equals("BAR"));
  });
  _testSuite.test("Empty nested Map round trip", () {
    final input = <int, Map<int, Maps_SomeStruct>>{};

    final result = Maps.methodWithNestedMap(input);

    expect(result, isEmpty);
  });
  _testSuite.test("Nested map round trip", () {
    final input = {31: {77: Maps_SomeStruct("foo")}, 42: {199: Maps_SomeStruct("bar")}};

    final result = Maps.methodWithNestedMap(input);

    expect(result[31][77].value, equals("FOO"));
    expect(result[42][199].value, equals("BAR"));
  });
  _testSuite.test("Empty Map in Struct round trip", () {
    final input = Maps_StructWithMap({});

    final result = Maps.methodWithStructWithMap(input);

    expect(result.errorMapping, isEmpty);
  });
  _testSuite.test("Map in Struct round trip", () {
    final input = Maps_StructWithMap({31: "foo", 42: "bar"});

    final result = Maps.methodWithStructWithMap(input);

    expect(result.errorMapping, equals({31: "FOO", 42: "BAR"}));
  });
  _testSuite.test("Map with Enum keys round trip", () {
    final input = {Maps_SomeEnum.fooValue: "foo", Maps_SomeEnum.barValue: "bar"};

    final result = Maps.methodWithEnumToStringMap(input);

    expect(result, equals(
        {Maps_SomeEnum.fooValue: "FOO", Maps_SomeEnum.barValue: "BAR"}
    ));
  });
  _testSuite.test("Map with Instances round trip", () {
    final instance1 = InterfacesFactory.createSimpleInterfaceOne();
    final instance2 = InterfacesFactory.createSimpleInterfaceOne();
    instance1.setStringValue("Hello");
    instance2.setStringValue("Hello");
    final input = {"One": instance1, "Two": instance2};

    final result = Maps.methodWithMapOfInstances(input);

    expect(result["One"].getStringValue(), equals("Hello One"));
    expect(result["Two"].getStringValue(), equals("Hello Two"));

    instance1.release();
    instance2.release();
    result["One"].release();
    result["Two"].release();
  });
}
