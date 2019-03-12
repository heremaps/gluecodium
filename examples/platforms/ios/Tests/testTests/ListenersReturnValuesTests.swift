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

class ListenersReturnValuesTests: XCTestCase {

      class TestMessagePackage: MessagePackage {
          public func unpackMessage() -> String {
              return "Works"
          }
      }

      class TestListener: ListenerWithReturn {
          public func getMessage() -> String {
              return "Works"
          }

          public func getPackedMessage() -> MessagePackage? {
              return TestMessagePackage()
          }

          public func getBoxedMessage() -> MessageBox? {
              return MessageBox()
          }

          public func getStructuredMessage() -> MessageStruct {
              return MessageStruct(message: "Works")
          }

          public func getEnumeratedMessage() -> MessageEnum {
              return .yes
          }

          public func getArrayedMessage() -> CollectionOf<String> {
              return ["Works"]
          }

          public func getMappedMessage() -> [Int8: String] {
              return [0: "Works"]
          }

          public func getBufferedMessage() -> Data {
              return Data([0x57, 0x6F, 0x72, 0x6B, 0x73, 0x00])
          }
      }

    func testStringReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getMessage(envelope: envelope))
    }

    func testPackageReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getPackedMessage(envelope: envelope))
    }

    func testBoxedReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getBoxedMessage(envelope: envelope))
    }

    func testStructuredReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getStructuredMessage(envelope: envelope))
    }

    func testEnumeratedReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("YES", delivery.getEnumeratedMessage(envelope: envelope))
    }

    func testArrayedReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getArrayedMessage(envelope: envelope))
    }

    func testMappedReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getMappedMessage(envelope: envelope))
    }

    func testBufferedReturn() {
        let envelope = TestListener()
        let delivery = MessageDelivery()
        XCTAssertEqual("Works", delivery.getBufferedMessage(envelope: envelope))
    }

    static var allTests = [
        ("testStringReturn", testStringReturn),
        ("testPackageReturn", testPackageReturn),
        ("testBoxedReturn", testBoxedReturn),
        ("testStructuredReturn", testStructuredReturn),
        ("testEnumeratedReturn", testEnumeratedReturn),
        ("testArrayedReturn", testArrayedReturn),
        ("testMappedReturn", testMappedReturn),
        ("testBufferedReturn", testBufferedReturn)
    ]
}
