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

class ErrorsTests: XCTestCase {

    func testMethodWithErrorThrows() {
      XCTAssertThrowsError(try Errors.methodWithError(errorFlag: true)) { error in
        XCTAssertEqual(error as? Errors.InternalError, Errors.InternalError.crashed)
      }
    }

    func testMethodWithErrorFinishes() {
      XCTAssertNoThrow(try Errors.methodWithError(errorFlag: false))
    }

    func testMethodWithErrorAndStringThrows() {
      XCTAssertThrowsError(try Errors.methodWithErrorAndString(errorFlag: true)) { error in
        XCTAssertEqual(error as? AdditionalErrors.ExternalError, AdditionalErrors.ExternalError.failed)
      }
    }

    func testMethodWithErrorAndStringFinishes() {
      XCTAssertEqual(try Errors.methodWithErrorAndString(errorFlag: false), "SUCCEEDED")
    }

    func testMethodThatExplodesThrows() {
      XCTAssertThrowsError(try ArraysByteBuffer.methodThatExplodes(errorFlag: true)) { error in
        XCTAssertEqual(error as? TypeCollectionWithEnums.ExplosiveError, TypeCollectionWithEnums.ExplosiveError.exploded)
      }
    }

    func testMethodThatExplodesFinishes() {
      XCTAssertEqual(try ArraysByteBuffer.methodThatExplodes(errorFlag: false), Data([0x00, 0x01, 0x02]))
    }

    func testMethodWithGoodAndBadThrows() {
      XCTAssertThrowsError(try Errors.methodWithGoodAndBad(errorFlag: true)) { error in
        XCTAssertEqual(error as? TypeCollectionWithEnums.YetAnotherError, TypeCollectionWithEnums.YetAnotherError.bad)
      }
    }

    func testMethodWithGoodAndBadFinishes() {
      XCTAssertEqual(try Errors.methodWithGoodAndBad(errorFlag: false), TypeCollectionWithEnums.SomeEnum.anotherResult)
    }

    func testMethodWithExternalErrorThrows() {
      XCTAssertThrowsError(try Errors.methodWithExternalError(errorFlag: true)) { error in
        XCTAssertEqual(error as? Errors.ExternalError, Errors.ExternalError.boom)
      }
    }

    func testMethodWithExternalErrorFinishes() {
      XCTAssertNoThrow(try Errors.methodWithExternalError(errorFlag: false))
    }

    func testGetErrorCategoryMessage() {
      let result = Errors.getErrorCategoryMessage(value: .crashed)

      XCTAssertEqual(result, "::test::Errors::InternalErrorCode::CRASHED")
    }

    func testMethodWithPayloadErrorThrows() {
      XCTAssertThrowsError(try Errors.methodWithPayloadError(errorFlag: true)) { error in
        XCTAssertEqual(error as? WithPayloadError, WithPayloadError(errorCode: 42, message: "foo error"))
      }
    }

    func testMethodWithPayloadErrorFinishes() {
      XCTAssertNoThrow(try Errors.methodWithPayloadError(errorFlag: false))
    }

    func testMethodWithPayloadErrorAndValueThrows() {
      XCTAssertThrowsError(try Errors.methodWithPayloadErrorAndReturnValue(errorFlag: true)) { error in
        XCTAssertEqual(error as? WithPayloadError, WithPayloadError(errorCode: 42, message: "foo error"))
      }
    }

    func testMethodWithPayloadErrorAndValueFinishes() {
      let result = try? Errors.methodWithPayloadErrorAndReturnValue(errorFlag: false)
      XCTAssertEqual(result, "bar value")
    }

    static var allTests = [
        ("testMethodWithErrorThrows", testMethodWithErrorThrows),
        ("testMethodWithErrorFinishes", testMethodWithErrorFinishes),
        ("testMethodWithErrorAndStringThrows", testMethodWithErrorAndStringThrows),
        ("testMethodWithErrorAndStringFinishes", testMethodWithErrorAndStringFinishes),
        ("testMethodThatExplodesThrows", testMethodThatExplodesThrows),
        ("testMethodThatExplodesFinishes", testMethodThatExplodesFinishes),
        ("testMethodWithGoodAndBadThrows", testMethodWithGoodAndBadThrows),
        ("testMethodWithGoodAndBadFinishes", testMethodWithGoodAndBadFinishes),
        ("testMethodWithExternalErrorThrows", testMethodWithExternalErrorThrows),
        ("testMethodWithExternalErrorFinishes", testMethodWithExternalErrorFinishes),
        ("testGetErrorCategoryMessage", testGetErrorCategoryMessage),
        ("testMethodWithPayloadErrorThrows", testMethodWithPayloadErrorThrows),
        ("testMethodWithPayloadErrorFinishes", testMethodWithPayloadErrorFinishes),
        ("testMethodWithPayloadErrorAndValueThrows", testMethodWithPayloadErrorAndValueThrows),
        ("testMethodWithPayloadErrorAndValueFinishes", testMethodWithPayloadErrorAndValueFinishes)
    ]
}
