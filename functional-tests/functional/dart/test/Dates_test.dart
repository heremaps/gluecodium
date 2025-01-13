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
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Dates");

void main() {
  _testSuite.test("Date property round trip", () {
    final input = DateTime.now().toUtc();

    Dates.dateAttribute = input;
    final result = Dates.dateAttribute;

    expect(result, input);
  });
  _testSuite.test("Date method round trip", () {
    final input = DateTime.utc(1971, 3, 5, 7, 9, 11);

    final result = Dates.increaseDate(input);

    expect(result.year, 1971);
    expect(result.month, 3);
    expect(result.day, 6);
    expect(result.hour, 8);
    expect(result.minute, 10);
    expect(result.second, 12);
  });
  _testSuite.test("Nullable Date null round trip", () {
    final result = Dates.increaseDateMaybe(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Date non-null round trip", () {
    final input = DateTime.utc(1971, 3, 5, 7, 9, 11);

    final result = Dates.increaseDateMaybe(input);

    expect(result?.year, 1971);
    expect(result?.month, 3);
    expect(result?.day, 6);
    expect(result?.hour, 8);
    expect(result?.minute, 10);
    expect(result?.second, 12);
  });
  _testSuite.test("Date steady method round trip", () {
    final input = DateTime.utc(1971, 3, 5, 7, 9, 11);

    final result = DatesSteady.increaseDate(input);

    expect(result.year, 1971);
    expect(result.month, 3);
    expect(result.day, 6);
    expect(result.hour, 8);
    expect(result.minute, 10);
    expect(result.second, 12);
  });
  _testSuite.test("Nullable Date steady null round trip", () {
    final result = DatesSteady.increaseDateMaybe(null);

    expect(result, isNull);
  });
  _testSuite.test("Nullable Date steady non-null round trip", () {
    final input = DateTime.utc(1971, 3, 5, 7, 9, 11);

    final result = DatesSteady.increaseDateMaybe(input);

    expect(result?.year, 1971);
    expect(result?.month, 3);
    expect(result?.day, 6);
    expect(result?.hour, 8);
    expect(result?.minute, 10);
    expect(result?.second, 12);
  });
  _testSuite.test("Date literal CET", () {
    final defaults = DateDefaults();

    final result = defaults.dateTime.toUtc();

    // Date was specified in UTC+2 as: "2022-02-04T11:15:17+02:00"
    expect(result.year, 2022);
    expect(result.month, 2);
    expect(result.day, 4);
    expect(result.hour, 9);
    expect(result.minute, 15);
    expect(result.second, 17);
  });
  _testSuite.test("Date literal UTC", () {
    final defaults = DateDefaults();

    final result = defaults.dateTimeUtc.toUtc();

    // Date was specified in UTC as: "2022-02-04T09:15:17Z"
    expect(result.year, 2022);
    expect(result.month, 2);
    expect(result.day, 4);
    expect(result.hour, 9);
    expect(result.minute, 15);
    expect(result.second, 17);
  });
  _testSuite.test("Date literal before epoch", () {
    final defaults = DateDefaults();

    final result = defaults.beforeEpoch.toUtc();

    // Date was specified in UTC as: "1922-02-04T09:15:17Z"
    expect(result.year, 1922);
    expect(result.month, 2);
    expect(result.day, 4);
    expect(result.hour, 9);
    expect(result.minute, 15);
    expect(result.second, 17);
  });
  _testSuite.test("Date literal from C++", () {
    final defaults = DateDefaults.getCppDefaults();

    final result = defaults.dateTimeUtc.toUtc();

    // Date was specified in UTC as: "2022-02-04T09:15:17Z"
    expect(result.year, 2022);
    expect(result.month, 2);
    expect(result.day, 4);
    expect(result.hour, 9);
    expect(result.minute, 15);
    expect(result.second, 17);
  });
}
