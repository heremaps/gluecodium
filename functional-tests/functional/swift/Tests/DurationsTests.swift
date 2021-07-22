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

import XCTest
import functional

class DurationsTests: XCTestCase {

    func testDurationSecondsRoundTrip() {
        let result = DurationSeconds.increaseDuration(input: 42.0)
        XCTAssertEqual(result, 43.0, accuracy: 1e-6)
    }

    func testDurationSecondsRoundTripRoundedDown() {
        let result = DurationSeconds.increaseDuration(input: 42.042)
        XCTAssertEqual(result, 43.0, accuracy: 1e-6)
    }

    func testDurationSecondsRoundTripRoundedUp() {
        let result = DurationSeconds.increaseDuration(input: 42.84)
        XCTAssertEqual(result, 44.0, accuracy: 1e-6)
    }

    func testNullableDurationSecondsRoundTrip() {
        let result = DurationSeconds.increaseDurationMaybe(input: 42.0)
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 43.0, accuracy: 1e-6)
    }

    func testNullableDurationSecondsRoundTripNil() {
        let result = DurationSeconds.increaseDurationMaybe(input: nil)
        XCTAssertNil(result)
    }

    func testDurationSecondsStructRoundTrip() {
        let value = DurationSeconds.DurationStruct(durationField: 42.0)
        let result = DurationSeconds.durationStructRoundTrip(input: value)
        XCTAssertEqual(result.durationField, 42.0, accuracy: 1e-6)
    }

    func testDurationMillisecondsRoundTrip() {
        let result = DurationMilliseconds.increaseDuration(input: 42.042)
        XCTAssertEqual(result, 43.042, accuracy: 1e-6)
    }

    func testDurationMillisecondsRoundTripRoundedDown() {
        let result = DurationMilliseconds.increaseDuration(input: 42.042071)
        XCTAssertEqual(result, 43.042, accuracy: 1e-6)
    }

    func testDurationMillisecondsRoundTripRoundedUp() {
        let result = DurationMilliseconds.increaseDuration(input: 42.04271)
        XCTAssertEqual(result, 43.043, accuracy: 1e-6)
    }

    func testNullableDurationMillisecondsRoundTrip() {
        let result = DurationMilliseconds.increaseDurationMaybe(input: 42.042)
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 43.042, accuracy: 1e-6)
    }

    func testNullableDurationMillisecondsRoundTripNil() {
        let result = DurationMilliseconds.increaseDurationMaybe(input: nil)
        XCTAssertNil(result)
    }

    func testDurationMillisecondsStructRoundTrip() {
        let value = DurationMilliseconds.DurationStruct(durationField: 42.042)
        let result = DurationMilliseconds.durationStructRoundTrip(input: value)
        XCTAssertEqual(result.durationField, 42.042, accuracy: 1e-6)
    }

    static var allTests = [
        ("testDurationSecondsRoundTrip", testDurationSecondsRoundTrip),
        ("testDurationSecondsRoundTripRoundedDown", testDurationSecondsRoundTripRoundedDown),
        ("testDurationSecondsRoundTripRoundedUp", testDurationSecondsRoundTripRoundedUp),
        ("testNullableDurationSecondsRoundTrip", testNullableDurationSecondsRoundTrip),
        ("testNullableDurationSecondsRoundTripNil", testNullableDurationSecondsRoundTripNil),
        ("testDurationSecondsStructRoundTrip", testDurationSecondsStructRoundTrip),
        ("testDurationMillisecondsRoundTrip", testDurationMillisecondsRoundTrip),
        ("testDurationMillisecondsRoundTripRoundedDown", testDurationMillisecondsRoundTripRoundedDown),
        ("testDurationMillisecondsRoundTripRoundedUp", testDurationMillisecondsRoundTripRoundedUp),
        ("testNullableDurationMillisecondsRoundTrip", testNullableDurationMillisecondsRoundTrip),
        ("testNullableDurationMillisecondsRoundTripNil", testNullableDurationMillisecondsRoundTripNil),
        ("testDurationMillisecondsStructRoundTrip", testDurationMillisecondsStructRoundTrip)
    ]
}
