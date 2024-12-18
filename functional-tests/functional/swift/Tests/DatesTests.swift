// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

class DatesTests: XCTestCase {

    func testDateAttributeRoundTrip() {
        let date = Date()

        Dates.dateAttribute = date
        let result = Dates.dateAttribute

        XCTAssertEqual(result.timeIntervalSince1970, date.timeIntervalSince1970, accuracy: 1e-6)
    }

    func testDateAttributeRoundTripRounding() {
        let date = Date(timeIntervalSince1970: 1556782831.41675)

        Dates.dateAttribute = date
        let result = Dates.dateAttribute

        XCTAssertEqual(result.timeIntervalSince1970, date.timeIntervalSince1970, accuracy: 1e-6)
    }

    func testDateMethodRoundTrip() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 1971, month: 3, day: 5,
                                            hour: 7, minute: 9, second: 11)

        let result = Dates.increaseDate(input: dateComponents.date!)

        XCTAssertEqual(calendar.component(.year, from: result), dateComponents.year!)
        XCTAssertEqual(calendar.component(.month, from: result), dateComponents.month!)
        XCTAssertEqual(calendar.component(.day, from: result), dateComponents.day! + 1)
        XCTAssertEqual(calendar.component(.hour, from: result), dateComponents.hour! + 1)
        XCTAssertEqual(calendar.component(.minute, from: result), dateComponents.minute! + 1)
        XCTAssertEqual(calendar.component(.second, from: result), dateComponents.second! + 1)
    }

    func testMethodNullableNullRoundTrip() {
        let result = Dates.increaseDateMaybe(input: nil)

        XCTAssertNil(result)
    }

    func testMethodNullableRoundTrip() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 1971, month: 3, day: 5,
                                            hour: 7, minute: 9, second: 11)

        let result = Dates.increaseDateMaybe(input: dateComponents.date)

        XCTAssertNotNil(result)
        XCTAssertEqual(calendar.component(.year, from: result!), dateComponents.year!)
        XCTAssertEqual(calendar.component(.month, from: result!), dateComponents.month!)
        XCTAssertEqual(calendar.component(.day, from: result!), dateComponents.day! + 1)
        XCTAssertEqual(calendar.component(.hour, from: result!), dateComponents.hour! + 1)
        XCTAssertEqual(calendar.component(.minute, from: result!), dateComponents.minute! + 1)
        XCTAssertEqual(calendar.component(.second, from: result!), dateComponents.second! + 1)
    }

    func testDatesSteadyMethodRoundTrip() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 1971, month: 3, day: 5,
                                            hour: 7, minute: 9, second: 11)

        let result = DatesSteady.increaseDate(input: dateComponents.date!)

        XCTAssertEqual(calendar.component(.year, from: result), dateComponents.year!)
        XCTAssertEqual(calendar.component(.month, from: result), dateComponents.month!)
        XCTAssertEqual(calendar.component(.day, from: result), dateComponents.day! + 1)
        XCTAssertEqual(calendar.component(.hour, from: result), dateComponents.hour! + 1)
        XCTAssertEqual(calendar.component(.minute, from: result), dateComponents.minute! + 1)
        XCTAssertEqual(calendar.component(.second, from: result), dateComponents.second! + 1)
    }

    func testDatesSteadyMethodNullableNullRoundTrip() {
        let result = DatesSteady.increaseDateMaybe(input: nil)

        XCTAssertNil(result)
    }

    func testDatesSteadyMethodNullableRoundTrip() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 1971, month: 3, day: 5,
                                            hour: 7, minute: 9, second: 11)

        let result = DatesSteady.increaseDateMaybe(input: dateComponents.date)

        XCTAssertNotNil(result)
        XCTAssertEqual(calendar.component(.year, from: result!), dateComponents.year!)
        XCTAssertEqual(calendar.component(.month, from: result!), dateComponents.month!)
        XCTAssertEqual(calendar.component(.day, from: result!), dateComponents.day! + 1)
        XCTAssertEqual(calendar.component(.hour, from: result!), dateComponents.hour! + 1)
        XCTAssertEqual(calendar.component(.minute, from: result!), dateComponents.minute! + 1)
        XCTAssertEqual(calendar.component(.second, from: result!), dateComponents.second! + 1)
    }

    func testDateDefaultsCet() {
        let utcTimeZone = TimeZone(identifier: "UTC")
        XCTAssertNotNil(utcTimeZone)

        let date = DateDefaults().dateTime
        let dateComponents =
            Calendar.current.dateComponents(in: utcTimeZone!, from: date)

        // Date was specified in UTC+2 as: "2022-02-04T11:15:17+02:00"
        XCTAssertEqual(2022, dateComponents.year!)
        XCTAssertEqual(2, dateComponents.month!)
        XCTAssertEqual(4, dateComponents.day!)
        XCTAssertEqual(9, dateComponents.hour!)
        XCTAssertEqual(15, dateComponents.minute!)
        XCTAssertEqual(17, dateComponents.second!)
    }

    func testDateDefaultsUtc() {
        let utcTimeZone = TimeZone(identifier: "UTC")
        XCTAssertNotNil(utcTimeZone)

        let date = DateDefaults().dateTimeUtc
        let dateComponents =
            Calendar.current.dateComponents(in: utcTimeZone!, from: date)

        // Date was specified in UTC as: "2022-02-04T09:15:17Z"
        XCTAssertEqual(2022, dateComponents.year!)
        XCTAssertEqual(2, dateComponents.month!)
        XCTAssertEqual(4, dateComponents.day!)
        XCTAssertEqual(9, dateComponents.hour!)
        XCTAssertEqual(15, dateComponents.minute!)
        XCTAssertEqual(17, dateComponents.second!)
    }

    func testDateDefaultsBeforeEpoch() {
        let utcTimeZone = TimeZone(identifier: "UTC")
        XCTAssertNotNil(utcTimeZone)

        let date = DateDefaults().beforeEpoch
        let dateComponents =
            Calendar.current.dateComponents(in: utcTimeZone!, from: date)

        // Date was specified in UTC as: "1922-02-04T09:15:17Z"
        XCTAssertEqual(1922, dateComponents.year!)
        XCTAssertEqual(2, dateComponents.month!)
        XCTAssertEqual(4, dateComponents.day!)
        XCTAssertEqual(9, dateComponents.hour!)
        XCTAssertEqual(15, dateComponents.minute!)
        XCTAssertEqual(17, dateComponents.second!)
    }

    func testDateDefaultsCpp() {
        let utcTimeZone = TimeZone(identifier: "UTC")
        XCTAssertNotNil(utcTimeZone)

        let date = DateDefaults.getCppDefaults().dateTimeUtc
        let dateComponents =
            Calendar.current.dateComponents(in: utcTimeZone!, from: date)

        // Date was specified in UTC as: "2022-02-04T09:15:17Z"
        XCTAssertEqual(2022, dateComponents.year!)
        XCTAssertEqual(2, dateComponents.month!)
        XCTAssertEqual(4, dateComponents.day!)
        XCTAssertEqual(9, dateComponents.hour!)
        XCTAssertEqual(15, dateComponents.minute!)
        XCTAssertEqual(17, dateComponents.second!)
    }

    static var allTests = [
        ("testDateAttributeRoundTrip", testDateAttributeRoundTrip),
        ("testDateAttributeRoundTripRounding", testDateAttributeRoundTripRounding),
        ("testDateMethodRoundTrip", testDateMethodRoundTrip),
        ("testMethodNullableNullRoundTrip", testMethodNullableNullRoundTrip),
        ("testMethodNullableRoundTrip", testMethodNullableRoundTrip),
        ("testDatesSteadyMethodRoundTrip", testDatesSteadyMethodRoundTrip),
        ("testDatesSteadyMethodNullableNullRoundTrip", testDatesSteadyMethodNullableNullRoundTrip),
        ("testDatesSteadyMethodNullableRoundTrip", testDatesSteadyMethodNullableRoundTrip),
        ("testDateDefaultsCet", testDateDefaultsCet),
        ("testDateDefaultsUtc", testDateDefaultsUtc),
        ("testDateDefaultsBeforeEpoch", testDateDefaultsBeforeEpoch),
        ("testDateDefaultsCpp", testDateDefaultsCpp)
    ]
}
