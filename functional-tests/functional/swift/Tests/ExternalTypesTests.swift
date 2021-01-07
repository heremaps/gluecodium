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
import FoundationNetworking

class ExternalTypesTests: XCTestCase {

    class MySwiftClass: MyClass {
        public func foo() -> Int32 {
            return 77
        }
    }

    let externalStruct = ExternalStruct(stringField: "foo",
                                        externalStringField: "bar",
                                        externalArrayField: [7, 11],
                                        externalStructField: AnotherExternalStruct(intField: 42))

    func testUseExternalTypesExternalStruct() {
        let inputStruct = UseExternalTypes.StructWithExternalTypes(structField: externalStruct,
                                                                   enumField: .foo)

        let resultStruct = UseExternalTypes.extractExternalStruct(nestedStruct: inputStruct)

        XCTAssertNotNil(resultStruct)
        XCTAssertEqual("foo", resultStruct.stringField)
        XCTAssertEqual("bar", resultStruct.externalStringField)
        XCTAssertEqual(2, resultStruct.externalArrayField.count)
        XCTAssertEqual(7, resultStruct.externalArrayField[0])
        XCTAssertEqual(11, resultStruct.externalArrayField[1])
        XCTAssertEqual(42, resultStruct.externalStructField.intField)
    }

    func testUseExternalTypesExternalEnum() {
        let externalEnum = ExternalEnum.bar
        let inputStruct = UseExternalTypes.StructWithExternalTypes(structField: externalStruct,
                                                                   enumField: externalEnum)

        let resultEnum = UseExternalTypes.extractExternalEnum(nestedStruct: inputStruct)

        XCTAssertEqual(ExternalEnum.bar, resultEnum)
    }

    func testSwiftExternalTypeDateInterval() {
        let interval = DateInterval(start: Date(), duration: 60)

        let result = UseSwiftExternalTypes.dateIntervalRoundTrip(input: interval)

        XCTAssertEqual(interval.start.timeIntervalSinceReferenceDate,
            result.start.timeIntervalSinceReferenceDate, accuracy: 1e-6)
        XCTAssertEqual(interval.end.timeIntervalSinceReferenceDate,
            result.end.timeIntervalSinceReferenceDate, accuracy: 1e-6)
    }

    func testSwiftExternalTypePersistence() {
        let persistence = URLCredential.Persistence.forSession

        let result = UseSwiftExternalTypes.persistenceRoundTrip(input: persistence)

        XCTAssertEqual(persistence, result)
    }

    func testSwiftExternalTypeColor() {
        let color = PseudoColor(0x007FFF)

        let result = UseSwiftExternalTypes.colorRoundTrip(input: color)

        XCTAssertEqual(color.value, result.value)
    }

    func testSwiftExternalTypeSeason() {
        let season = Season("spring")

        let result = UseSwiftExternalTypes.seasonRoundTrip(input: season)

        XCTAssertEqual(season.value, result.value)
    }

    func testSwiftExternalTypesInStruct() {
        let typesStruct = SwiftExternalTypesStruct(
            dateInterval: DateInterval(start: Date(), duration: 60),
            persistence: URLCredential.Persistence.forSession,
            color: PseudoColor(0x007FFF),
            season: Season("spring"))

        let result = UseSwiftExternalTypes.structRoundTrip(input: typesStruct)

        XCTAssertEqual(typesStruct.dateInterval.start.timeIntervalSinceReferenceDate,
            result.dateInterval.start.timeIntervalSinceReferenceDate, accuracy: 1e-6)
        XCTAssertEqual(typesStruct.dateInterval.end.timeIntervalSinceReferenceDate,
            result.dateInterval.end.timeIntervalSinceReferenceDate, accuracy: 1e-6)
        XCTAssertEqual(typesStruct.persistence, result.persistence)
        XCTAssertEqual(typesStruct.color.value, result.color.value)
        XCTAssertEqual(typesStruct.season.value, result.season.value)
    }

    func testMyClass() {
        let result = UseMyClass().callBar(on: MySwiftClass())

        XCTAssertEqual(result, 77)
    }

    static var allTests = [
        ("testUseExternalTypesExternalStruct", testUseExternalTypesExternalStruct),
        ("testUseExternalTypesExternalEnum", testUseExternalTypesExternalEnum),
        ("testSwiftExternalTypeDateInterval", testSwiftExternalTypeDateInterval),
        ("testSwiftExternalTypePersistence", testSwiftExternalTypePersistence),
        ("testSwiftExternalTypeColor", testSwiftExternalTypeColor),
        ("testSwiftExternalTypeSeason", testSwiftExternalTypeSeason),
        ("testSwiftExternalTypesInStruct", testSwiftExternalTypesInStruct),
        ("testMyClass", testMyClass)
    ]
}
