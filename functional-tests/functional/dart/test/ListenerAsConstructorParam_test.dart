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

import "package:test/test.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("ListenerAsConstructorParam");

class CelsiusObserver implements TemperatureObserver {
     int updatesCount = 0;
     double lastReadTemperature = 0.0;

     @override
     void onTemperatureUpdate(Thermometer thermometer) {
         lastReadTemperature = thermometer.getCelsius();
         ++updatesCount;
     }
}

void main() {
  _testSuite.test("CelsiusObserver is updated from constructor when 'AfterConstructed' attribute used", () {
      // Given temperature observer, which receives updates about temperature.
      var observer = CelsiusObserver();
      var observers = [observer];

      // When creating observed subject.
      var thermometer = Thermometer.makeWithDuration(Duration(seconds: 1), observers);

      // Then subject informed about its state during creation.
      expect(observer.updatesCount, equals(1));
      expect(observer.lastReadTemperature, equals(thermometer.getCelsius()));

      // When creating another observed subject.
      var anotherThermometer = Thermometer.makeWithoutDuration(observers);

      // Then subject informed about its state during creation.
      expect(observer.updatesCount, equals(2));
      expect(observer.lastReadTemperature, equals(anotherThermometer.getCelsius()));
  });

  _testSuite.test("Exception is propagated when after construction function throws", () {
      // Given temperature observer, which receives updates about temperature.
      var observer = CelsiusObserver();
      var observers = [observer];

      // Then throwing after-construction function raises exception.
      expect(
          () => Thermometer.throwingMake(77, observers),
          throwsA(
              isA<ThermometerNotificationException>().having(
                  (e) => e.error,
                  "Correct error message is thrown",
                  "BAD THING HAPPENED!",
              )
          ),
      );
  });

  _testSuite.test("Exception is propagated when after construction function throws even for non throwing ctor", () {
      // Given temperature observer, which receives updates about temperature.
      var observer = CelsiusObserver();
      var observers = [observer];

      // Then throwing after-construction function raises exception.
      expect(
          () => Thermometer.nothrowMake("DUMMY LABEL", observers),
          throwsA(
              isA<ThermometerNotificationException>().having(
                  (e) => e.error,
                  "Correct error message is thrown",
                  "BAD THING HAPPENED!",
              )
          ),
      );
  });

  _testSuite.test("Exception is propagated when after construction function throws from ctor that can throw 2 error types", () {
      // Given temperature observer, which receives updates about temperature.
      var observer = CelsiusObserver();
      var observers = [observer];

      // Then throwing after-construction function raises exception.
      expect(
          () => Thermometer.anotherThrowingMake(true, observers),
          throwsA(
              isA<ThermometerNotificationException>().having(
                  (e) => e.error,
                  "Correct error message is thrown",
                  "BAD THING HAPPENED!",
              )
          ),
      );
  });
}