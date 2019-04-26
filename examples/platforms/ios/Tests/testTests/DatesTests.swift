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
import hello

class DatesTests: XCTestCase {

    func testDateAttributeRoundTrip() {
        let date = Date()

        Dates.dateAttribute = date
        let result = Dates.dateAttribute

        XCTAssertEqual(result.timeIntervalSince1970, date.timeIntervalSince1970)
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

    static var allTests = [
        ("testDateAttributeRoundTrip", testDateAttributeRoundTrip),
        ("testDateMethodRoundTrip", testDateMethodRoundTrip),
        ("testMethodNullableNullRoundTrip", testMethodNullableNullRoundTrip),
        ("testMethodNullableRoundTrip", testMethodNullableRoundTrip)
    ]
}
