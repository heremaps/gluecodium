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

import 'dart:convert';
import "dart:typed_data";
import "package:test/test.dart";
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Lambdas");

void main() {
  _testSuite.test("Call C++ lambda in Dart", () {
    final lambda = Lambdas.getConcatenator(">.<");

    final result = lambda("foo", "bar");

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Capturing round-trip", () {
    final concatenator = (String s1, String s2) => s1 + s2;
    final lambda = Lambdas.composeConcatenators(concatenator, concatenator);

    final result = lambda("foo", ">.<", "bar");

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Call concatenate list", () {
    final concatenator = (String s1, String s2) => s1 + s2;

    final result = Lambdas.concatenateList(
        ["foo", ">.<", "bar"], [concatenator, concatenator]);

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Call C++ lambda in struct in Dart", () {
    final holder = Lambdas.getConcatenatorInStruct(">.<");

    final result = holder.concatenator("foo", "bar");

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Call Dart lambda in struct in C++", () {
    final capturedDelimiter = ">.<";
    final holder = Lambdas_LambdaHolder(
        (String s1, String s2) => s1 + capturedDelimiter + s2);

    final result = Lambdas.concatenateInStruct("foo", "bar", holder);

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Call nullable C++ lambda in Dart", () {
    final lambda = Lambdas.getConcatenatorOrNull(">.<");

    final result = lambda("foo", "bar");

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Get null C++ lambda in Dart", () {
    final lambda = Lambdas.getConcatenatorOrNull(null);

    expect(lambda, isNull);
  });
  _testSuite.test("Call nullable Dart lambda in C++", () {
    final capturedDelimiter = ">.<";
    final lambda = (String s1, String s2) => s1 + capturedDelimiter + s2;

    final result = Lambdas.concatenateOrNot("foo", "bar", lambda);

    expect(result, "foo>.<bar");
  });
  _testSuite.test("Call null Dart lambda in C++", () {
    final result = Lambdas.concatenateOrNot("foo", "bar", null);

    expect(result, isNull);
  });
  _testSuite.test("Lambda property round trip", () {
    Lambdas.realConcatenator = Lambdas.getConcatenator(">.<");
    final lambda = Lambdas.realConcatenator;

    final result = lambda("foo", "bar");

    expect(result, "foo>.<bar");

    Lambdas.resetRealConcatenator();
  });
  _testSuite.test("Call nullable C++ lambda in Dart with value", () {
    final lambda = Lambdas.getNullableConfuser();

    final result = lambda("foo");

    expect(result(), "foo");
  });
  _testSuite.test("Call nullable C++ lambda in Dart with null", () {
    final lambda = Lambdas.getNullableConfuser();

    final result = lambda(null);

    expect(result, isNull);
  });
  _testSuite.test("Call nullable Dart lambda in C++ with value", () {
    final lambda = (String s1) => s1 != null ? () => s1 : null;

    final result = Lambdas.applyNullableConfuser(lambda, "foo");

    expect(result(), "foo");
  });
  _testSuite.test("Call nullable Dart lambda in C++ with null", () {
    final lambda = (String s1) => s1 != null ? () => s1 : null;

    final result = Lambdas.applyNullableConfuser(lambda, null);

    expect(result, isNull);
  });
}
