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

class ListenersWithDictionaries: XCTestCase {

  let expectedData = "Berlin -> [-2, 26]\nMadrid -> [1, 33]\nMarrakesh -> [8, 40]\n"
  let provider = ForecastFactory.createProvider()!

  func testCheckNativeListener() {
    HelloWorldStaticLogger.clearLog()

    let listener = ForecastFactory.createListener()!

    provider.inform(listener: listener)

    let log = HelloWorldStaticLogger.getLog()
    XCTAssertEqual(expectedData, log)
  }

  func testCheckSwiftListener() {
    class TestForecastListener: ForecastListener {
      let cities = ["Berlin", "Madrid", "Marrakesh"]
      var forecastData = ""

      func onForecastDataProvided(data: CityDataMap) {
        for city in cities {
          if let cityData = data[city] {
            forecastData += "\(city) -> [\(cityData.lowestDegree), \(cityData.highestDegree)]\n"
          }
        }
      }

      func getForecastData() -> String {
        return forecastData
      }
    }

    let listener = TestForecastListener()

    provider.inform(listener: listener)

    XCTAssertEqual(expectedData, listener.getForecastData())
  }

  static var allTests = [
      ("testCheckNativeListener", testCheckNativeListener),
      ("testCheckSwiftListener", testCheckSwiftListener)
  ]
}
