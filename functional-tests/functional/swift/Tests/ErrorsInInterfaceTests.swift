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

class ErrorsInInterfaceTests: XCTestCase {

      class TestListener: ErrorsInInterface {
          private var data: String = "Doesn't work"

          public func getMessage() throws -> String {
              return data
          }

          public func setMessage(message: String) throws {
              data = message
          }

          public func getMessageWithPayload() throws -> String {
              return data
          }

          public func setMessageWithPayload(message: String) throws {
              data = message
          }
      }

      class ThrowingListener: ErrorsInInterface {
          public func getMessage() throws -> String {
              throw AdditionalErrors.ExternalError.failed
          }

          public func setMessage(message: String) throws {
              throw AdditionalErrors.ExternalError.failed
          }

          public func getMessageWithPayload() throws -> String {
              throw WithPayloadError(errorCode: 42, message: "foo")
          }

          public func setMessageWithPayload(message: String) throws {
              throw WithPayloadError(errorCode: 42, message: "foo")
          }
      }

    func testStringRoundTrip() {
        let listener = TestListener()

        let messenger = ErrorMessenger()
        XCTAssertNoThrow(try messenger.setMessage(listener: listener, message: "Works"))
        let result = try? messenger.getMessage(listener: listener)

        XCTAssertEqual(result, "Works")
    }

    func testGetMessageErrorRethrown() {
        let messenger = ErrorMessenger()

        XCTAssertThrowsError(try messenger.getMessage(listener: ThrowingListener())) { error in
            XCTAssertEqual(error as? AdditionalErrors.ExternalError,
                AdditionalErrors.ExternalError.failed)
        }
    }

    func testSetMessageErrorRethrown() {
        let messenger = ErrorMessenger()

        XCTAssertThrowsError(try messenger.setMessage(listener: ThrowingListener(), message: "Foo")) { error in
            XCTAssertEqual(error as? AdditionalErrors.ExternalError,
                AdditionalErrors.ExternalError.failed)
        }
    }

    func testGetMessageWithPayloadErrorRethrown() {
        let messenger = ErrorMessenger()
        let listener = ThrowingListener()

        XCTAssertThrowsError(try messenger.getMessageWithPayload(listener: listener)) { error in
            XCTAssertEqual(error as? WithPayloadError, WithPayloadError(errorCode: 42, message: "foo"))
        }
    }

    func testSetMessageWithPayloadErrorRethrown() {
        let messenger = ErrorMessenger()
        let listener = ThrowingListener()

        XCTAssertThrowsError(try messenger.setMessageWithPayload(listener: listener, message: "Foo")) { error in
            XCTAssertEqual(error as? WithPayloadError, WithPayloadError(errorCode: 42, message: "foo"))
        }
    }

    static var allTests = [
        ("testStringRoundTrip", testStringRoundTrip),
        ("testGetMessageErrorRethrown", testGetMessageErrorRethrown),
        ("testSetMessageErrorRethrown", testSetMessageErrorRethrown),
        ("testGetMessageWithPayloadErrorRethrown", testGetMessageWithPayloadErrorRethrown),
        ("testSetMessageWithPayloadErrorRethrown", testSetMessageWithPayloadErrorRethrown)
    ]
}
