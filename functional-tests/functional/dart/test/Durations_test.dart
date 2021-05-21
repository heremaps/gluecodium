// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

final _testSuite = TestSuite("Durations");

void main() {
  _testSuite.test("Duration<Seconds> round trip", () {
    final duration = Duration(seconds: 42);

    final result = DurationSeconds.increaseDuration(duration);

    expect(result.inMicroseconds, 43000000);
  });
  _testSuite.test("Duration<Seconds> round trip rounded down", () {
    final duration = Duration(seconds: 42, milliseconds: 42);

    final result = DurationSeconds.increaseDuration(duration);

    expect(result.inMicroseconds, 43000000);
  });
  _testSuite.test("Duration<Seconds> round trip rounded up", () {
    final duration = Duration(seconds: 42, milliseconds: 840);

    final result = DurationSeconds.increaseDuration(duration);

    expect(result.inMicroseconds, 44000000);
  });
  _testSuite.test("Duration<Seconds> nullable round trip", () {
    final duration = Duration(seconds: 42);

    final result = DurationSeconds.increaseDurationMaybe(duration);

    expect(result?.inMicroseconds, 43000000);
  });
  _testSuite.test("Duration<Seconds> nullable round trip null", () {
    final result = DurationSeconds.increaseDurationMaybe(null);

    expect(result, isNull);
  });
  _testSuite.test("Duration<Seconds> struct round trip", () {
    final duration = DurationSecondsDurationStruct(Duration(seconds: 42));

    final result = DurationSeconds.durationStructRoundTrip(duration);

    expect(result.durationField.inMicroseconds, 42000000);
  });
  _testSuite.test("Duration<Milliseconds> round trip", () {
    final duration = Duration(seconds: 42, milliseconds: 42);

    final result = DurationMilliseconds.increaseDuration(duration);

    expect(result.inMicroseconds, 43042000);
  });
  _testSuite.test("Duration<Milliseconds> round trip rounded down", () {
    final duration = Duration(seconds: 42, milliseconds: 42, microseconds: 71);

    final result = DurationMilliseconds.increaseDuration(duration);

    expect(result.inMicroseconds, 43042000);
  });
  _testSuite.test("Duration<Milliseconds> round trip rounded up", () {
    final duration = Duration(seconds: 42, milliseconds: 42, microseconds: 710);

    final result = DurationMilliseconds.increaseDuration(duration);

    expect(result.inMicroseconds, 43043000);
  });
  _testSuite.test("Duration<Milliseconds> nullable round trip", () {
    final duration = Duration(seconds: 42, milliseconds: 42);

    final result = DurationMilliseconds.increaseDurationMaybe(duration);

    expect(result?.inMicroseconds, 43042000);
  });
  _testSuite.test("Duration<Milliseconds> nullable round trip null", () {
    final result = DurationMilliseconds.increaseDurationMaybe(null);

    expect(result, isNull);
  });
  _testSuite.test("Duration<Milliseconds> struct round trip", () {
    final duration =
        DurationMillisecondsDurationStruct(Duration(seconds: 42, milliseconds: 42));

    final result = DurationMilliseconds.durationStructRoundTrip(duration);

    expect(result.durationField.inMicroseconds, 42042000);
  });
}
