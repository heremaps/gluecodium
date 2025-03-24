// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2025 HERE Europe B.V.
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

class ListenerAsConstructorParamTest: XCTestCase {
    class CelsiusObserver : TemperatureObserver {
        private var updatesCount: Int = 0
        private var lastReadTemperature: Double = 0.0

        func getUpdatesCount() -> Int {
          return updatesCount
        }

        func getLastCelsius() -> Double {
          return lastReadTemperature
        }

        func onTemperatureUpdate(thermometer: Thermometer) -> Void {
          lastReadTemperature = thermometer.getCelsius()
          updatesCount += 1
        }
      }

    func testObserverUpdateWhenAfterConstructedUsed() {
      // Given temperature observer, which receives updates about temperature.
      let observer = CelsiusObserver()
      let observers = [observer]

      // When creating observed subject.
      let thermometer = Thermometer(interval: 1, observers: observers)

      // Then subject informed about its state during creation.
      XCTAssertEqual(1, observer.getUpdatesCount())
      XCTAssertEqual(thermometer.getCelsius(), observer.getLastCelsius(), accuracy: 0.000001)

      // When creating another observed subject.
      let anotherThermometer = Thermometer(observers: observers)

      // Then subject informed about its state during creation.
      XCTAssertEqual(2, observer.getUpdatesCount())
      XCTAssertEqual(anotherThermometer.getCelsius(), observer.getLastCelsius(), accuracy: 0.000001)
    }

    static var allTests = [
      ("testObserverUpdateWhenAfterConstructedUsed", testObserverUpdateWhenAfterConstructedUsed)
    ]
}