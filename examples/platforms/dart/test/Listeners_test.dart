// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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
import "package:hello/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Listeners");

class MessageListener implements StringListener {
  @override
  void onMessage(String message) {}

  @override
  void onConstMessage(String message) {}

  @override
  void onStructMessage(StringListener_StringStruct message) {}

  @override
  void release() {}
}

class RouteImpl implements Route {
  @override
  void release() {}
}

class RouteProviderImpl implements RouteProvider {
  static bool setRouteWasRun = false;
  static bool setRouteCouldCast = false;

  @override
  void setRoute(Route route) {
    setRouteWasRun = true;
    setRouteCouldCast = route is RouteImpl;
    route.release();
  }

  @override
  void release() {}
}

void main() {
  _testSuite.test("String listener does not crash", () {
    DummyLogger.relayMessage(new MessageListener(), "Hi!");
  });
  _testSuite.test("String const listener does not crash", () {
    DummyLogger.relayConstMessage(new MessageListener(), "Hi!");
  });
  _testSuite.test("String listener round trip preserves type", () {
    Nlp.setRoute(new RouteProviderImpl(), new RouteImpl());

    expect(RouteProviderImpl.setRouteWasRun, isTrue);
    expect(RouteProviderImpl.setRouteCouldCast, isTrue);
  });
  _testSuite.test("Proxy cache works", () {
    final listener = new MessageListener();

    PersistingLogger.addListener(listener);
    final result = PersistingLogger.removeListener(listener);

    expect(result, isTrue);
  });
}
