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

class ListenerWithAttributesTests: XCTestCase {

      class TestListener: ListenerWithAttributes {
          private var data: String = "Doesn't work"
          private var package: MessagePackage?
          private var box: MessageBox?
          private var enumData: MessageEnum = .no
          private var buffer: Data = Data([0xDE, 0xAD, 0xBE, 0xEF, 0x00])

          public var message: String {
              get {
                  return data
              }
              set {
                  data = newValue
              }
          }

          public var packedMessage: MessagePackage? {
              get {
                  return package
              }
              set {
                  package = newValue
              }
          }

          public var boxedMessage: MessageBox? {
              get {
                  return box
              }
              set {
                  box = newValue
              }
          }

          public var structuredMessage: MessageStruct {
              get {
                  return MessageStruct(message: data)
              }
              set {
                  data = newValue.message
              }
          }

          public var enumeratedMessage: MessageEnum {
              get {
                  return enumData
              }
              set {
                  enumData = newValue
              }
          }

          public var arrayedMessage: [String] {
              get {
                  return [data]
              }
              set {
                  data = newValue[0]
              }
          }

          public var mappedMessage: [Int8: String] {
              get {
                  return [0: data]
              }
              set {
                  data = newValue[0]!
              }
          }

          public var bufferedMessage: Data {
              get {
                  return buffer
              }
              set {
                  buffer = newValue
              }
          }
      }

    func testStringRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkMessageRoundTrip(envelope: envelope))
    }

    func testPackageRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkPackedMessageRoundTrip(envelope: envelope))
    }

    func testBoxedRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkBoxedMessageRoundTrip(envelope: envelope))
    }

    func testStructuredRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkStructuredMessageRoundTrip(envelope: envelope))
    }

    func testEnumeratedRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkEnumeratedMessageRoundTrip(envelope: envelope))
    }

    func testArrayedRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkArrayedMessageRoundTrip(envelope: envelope))
    }

    func testMappedRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkMappedMessageRoundTrip(envelope: envelope))
    }

    func testBufferedRoundTrip() {
        let envelope = TestListener()
        let delivery = AttributedMessageDelivery()
        XCTAssertTrue(delivery.checkBufferedMessageRoundTrip(envelope: envelope))
    }

    static var allTests = [
        ("testStringRoundTrip", testStringRoundTrip),
        ("testPackageRoundTrip", testPackageRoundTrip),
        ("testBoxedRoundTrip", testBoxedRoundTrip),
        ("testStructuredRoundTrip", testStructuredRoundTrip),
        ("testEnumeratedRoundTrip", testEnumeratedRoundTrip),
        ("testArrayedRoundTrip", testArrayedRoundTrip),
        ("testMappedRoundTrip", testMappedRoundTrip),
        ("testBufferedRoundTrip", testBufferedRoundTrip)
    ]
}
