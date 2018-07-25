// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

class ExternalTypesTests: XCTestCase {

    let externalStruct = ExternalStruct(stringField: "foo",
                                        externalStringField: "bar",
                                        externalArrayField: CollectionOf<Int32>([7, 11]),
                                        externalStructField: AnotherExternalStruct(intField: 42))

    func testUseExternalTypesExternalStruct() {
        let inputStruct = UseExternalTypes.StructWithExternalTypes(structField: externalStruct,
                                                                   enumField: .foo)

        let resultStruct = UseExternalTypes.extractExternalStruct(nestedStruct: inputStruct)!

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

    static var allTests = [
        ("testUseExternalTypesExternalStruct", testUseExternalTypesExternalStruct),
        ("testUseExternalTypesExternalEnum", testUseExternalTypesExternalEnum)
    ]
}
