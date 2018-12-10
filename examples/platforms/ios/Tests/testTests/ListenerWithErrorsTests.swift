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

class ListenerWithErrorsTests: XCTestCase {

      class TestListener: ListenerWithErrors {
          private var data: String = "Doesn't work"

          public func getMessage() throws -> String {
              return data
          }

          public func setMessage(message: String) throws {
              data = message
          }
      }

      class ThrowingListener: ListenerWithErrors {
          public func getMessage() throws -> String {
              throw ErrorEnum.broken
          }

          public func setMessage(message: String) throws {
              throw ErrorEnum.broken
          }
      }

    func testStringRoundTrip() {
        let listener = TestListener()

        let messenger = ErrorMessenger.create()
        XCTAssertNoThrow(try messenger.setMessage(listener: listener, message: "Works"))
        let result = try? messenger.getMessage(listener: listener)

        XCTAssertEqual(result, "Works")
    }

    func testGetMessageErrorRethrown() {
        let messenger = ErrorMessenger.create()

        XCTAssertThrowsError(try messenger.getMessage(listener: ThrowingListener())) { error in
            XCTAssertEqual(error as? ErrorEnum, ErrorEnum.broken)
        }
    }

    func testSetMessageErrorRethrown() {
        let messenger = ErrorMessenger.create()

        XCTAssertThrowsError(try messenger.setMessage(listener: ThrowingListener(), message: "Foo")) { error in
            XCTAssertEqual(error as? ErrorEnum, ErrorEnum.broken)
        }
    }

    static var allTests = [
        ("testStringRoundTrip", testStringRoundTrip),
        ("testGetMessageErrorRethrown", testGetMessageErrorRethrown),
        ("testSetMessageErrorRethrown", testSetMessageErrorRethrown)
    ]
}
