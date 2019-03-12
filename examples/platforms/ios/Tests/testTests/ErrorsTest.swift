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

class ErrorsTests: XCTestCase {

    func testMethodWithErrorThrows() {
      XCTAssertThrowsError(try Errors.methodWithError(errorFlag: true)) { error in
        XCTAssertEqual(error as? Errors.InternalErrors, Errors.InternalErrors.crashed)
      }
    }

    func testMethodWithErrorFinishes() {
      XCTAssertNoThrow(try Errors.methodWithError(errorFlag: false))
    }

    func testMethodWithErrorAndStringThrows() {
      XCTAssertThrowsError(try Errors.methodWithErrorAndString(errorFlag: true)) { error in
        XCTAssertEqual(error as? AdditionalErrors.ExternalErrors, AdditionalErrors.ExternalErrors.failed)
      }
    }

    func testMethodWithErrorAndStringFinishes() {
      XCTAssertEqual(try Errors.methodWithErrorAndString(errorFlag: false), "SUCCEEDED")
    }

    func testMethodThatExplodesThrows() {
      XCTAssertThrowsError(try Errors.methodThatExplodes(errorFlag: true)) { error in
        XCTAssertEqual(error as? ExplosiveErrors, ExplosiveErrors.exploded)
      }
    }

    func testMethodThatExplodesFinishes() {
      XCTAssertEqual(try Errors.methodThatExplodes(errorFlag: false), Data(bytes: [0x00, 0x01, 0x02]))
    }

    func testMethodWithGoodAndBadThrows() {
      XCTAssertThrowsError(try Errors.methodWithGoodAndBad(errorFlag: true)) { error in
        XCTAssertEqual(error as? YetAnotherErrors, YetAnotherErrors.bad)
      }
    }

    func testMethodWithGoodAndBadFinishes() {
      XCTAssertEqual(try Errors.methodWithGoodAndBad(errorFlag: false), SomeEnum.anotherResult)
    }

    func testMethodWithExternalErrorThrows() {
      XCTAssertThrowsError(try Errors.methodWithExternalError(errorFlag: true)) { error in
        XCTAssertEqual(error as? Errors.ExternalErrors, Errors.ExternalErrors.boom)
      }
    }

    func testMethodWithExternalErrorFinishes() {
      XCTAssertNoThrow(try Errors.methodWithExternalError(errorFlag: false))
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
        ("testMethodWithExternalErrorFinishes", testMethodWithExternalErrorFinishes)
    ]
}
