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

import XCTest
import functional

class LocalesTests: XCTestCase {

    func testLocaleRoundTrip() {
        let locale = Locale.current

        let result = Locales.localeRoundTrip(input: locale)

        XCTAssertEqual(result.identifier, locale.identifier)
    }

    func testLocaleRoundTripStripTag() {
        let locale = Locale.current

        let result = Locales.localeRoundTripStripTag(input: locale)

        XCTAssertEqual(result.identifier, locale.identifier)
    }

    func testLocaleRoundTripNullable() {
        let locale = Locale.current

        let result = Locales.localeRoundTripNullable(input: locale)

        XCTAssertEqual(result?.identifier, locale.identifier)
    }

    func testLocaleRoundTripNullableNull() {
        let result = Locales.localeRoundTripNullable(input: nil)

        XCTAssertNil(result)
    }

    func testLocalePropertyRoundTrip() {
        let locale = Locale.current

        Locales.localeProperty = locale
        let result = Locales.localeProperty

        XCTAssertEqual(result.identifier, locale.identifier)
    }

    func testLocaleWithMalformedTag() {
        let result = Locales.localeWithMalformedTag

        XCTAssertEqual(result.identifier, "")
    }

    func testLocaleWithMalformedLanguage() {
        let result = Locales.localeWithMalformedLanguage

        XCTAssertEqual(result.identifier, "")
    }

    func testLocaleWithMalformedCountry() {
        let result = Locales.localeWithMalformedCountry

        XCTAssertEqual(result.identifier, "foo-baz_")
    }

    func testLocaleWithMalformedScript() {
        let result = Locales.localeWithMalformedScript

        XCTAssertEqual(result.identifier, "foo_")
    }

    func testLocalesStructRoundTrip() {
        let locale = Locale(identifier: Locale.current.identifier)
        let localesStruct = LocalesStruct(primaryLocale: locale, secondaryLocale: locale)

        let result = LocalesStruct.localesStructRoundTrip(input: localesStruct)

        XCTAssertEqual(result.primaryLocale.identifier, localesStruct.primaryLocale.identifier)
        XCTAssertNotNil(result.secondaryLocale)
        XCTAssertEqual(result.secondaryLocale?.identifier, localesStruct.secondaryLocale?.identifier)
        XCTAssertEqual(hash(result), hash(localesStruct))
    }

    func testLocaleDefaultsTct() {
        let result = LocaleDefaults().traditionalChineseTaiwan

        XCTAssertEqual(result.languageCode, "nan")
        XCTAssertEqual(result.scriptCode, "Hant")
        XCTAssertEqual(result.regionCode, "TW")
    }

    func testLocaleDefaultsTctFromCpp() {
        let result = LocaleDefaults.getCppDefaults().traditionalChineseTaiwan

        XCTAssertEqual(result.languageCode, "nan")
        XCTAssertEqual(result.scriptCode, "Hant")
        XCTAssertEqual(result.regionCode, "TW")
    }

    func hash<H>(_ value: H) -> Int where H: Hashable {
        var hasher = Hasher()
        value.hash(into: &hasher)
        return hasher.finalize()
    }

    static var allTests = [
        ("testLocaleRoundTrip", testLocaleRoundTrip),
        ("testLocaleRoundTripStripTag", testLocaleRoundTripStripTag),
        ("testLocaleRoundTripNullable", testLocaleRoundTripNullable),
        ("testLocaleRoundTripNullableNull", testLocaleRoundTripNullableNull),
        ("testLocalePropertyRoundTrip", testLocalePropertyRoundTrip),
        ("testLocaleWithMalformedTag", testLocaleWithMalformedTag),
        ("testLocaleWithMalformedLanguage", testLocaleWithMalformedLanguage),
        ("testLocaleWithMalformedCountry", testLocaleWithMalformedCountry),
        ("testLocaleWithMalformedScript", testLocaleWithMalformedScript),
        ("testLocalesStructRoundTrip", testLocalesStructRoundTrip),
        ("testLocaleDefaultsTct", testLocaleDefaultsTct),
        ("testLocaleDefaultsTctFromCpp", testLocaleDefaultsTctFromCpp)
    ]
}
