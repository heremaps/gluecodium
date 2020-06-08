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

import "package:intl/intl.dart";
import "package:intl/locale.dart";
import "package:test/test.dart";
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Locales");

void main() {
  _testSuite.test("Locale method round trip", () {
    final input = Locale.parse(Intl.systemLocale);

    final result = Locales.localeRoundTrip(input);

    expect(result, input);
  });
  _testSuite.test("Locale method round trip stip tag", () {
    final input = Locale.parse(Intl.systemLocale);

    final result = Locales.localeRoundTripStripTag(input);

    expect(result, input);
  });
  _testSuite.test("Locale property round trip", () {
    final input = Locale.parse(Intl.systemLocale);

    Locales.localeProperty = input;
    final result = Locales.localeProperty;

    expect(result, input);
  });
  _testSuite.test("Nullable Locale null round trip", () {
    final result = Locales.localeRoundTripNullable(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Locale non-null round trip", () {
    final input = Locale.parse(Intl.systemLocale);

    final result = Locales.localeRoundTripNullable(input);

    expect(result, input);
  });
  _testSuite.test("Locale with malformed tag", () {
    expect(() => Locales.localeWithMalformedTag, throwsFormatException);
  });
  _testSuite.test("Locale with malformed language", () {
    expect(() => Locales.localeWithMalformedLanguage, throwsFormatException);
  });
  _testSuite.test("Locale with malformed country", () {
    expect(() => Locales.localeWithMalformedCountry, throwsFormatException);
  });
  _testSuite.test("Locale with malformed script", () {
    expect(() => Locales.localeWithMalformedScript, throwsFormatException);
  });
}
