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

import 'dart:async';
import "package:test/test.dart";

import "package:functional/functional_context.dart";
import "package:functional/test.dart";

import "../test_suite.dart";

final _testSuite = TestSuite("CallbacksMultithreaded");

final completer = Completer<String>();

class ThreadedListenerImpl implements ThreadedListener {
  @override
  int onEvent(String message) {
    completer.complete(message);
    return 0;
  }

  @override
  int unloaded(UnloadedClass unloaded) {
    // Do nothing, no related Dart functionality.
    return 0;
  }

  @override
  void release() {}
}

void main(List<String> args) {
  setUp(() {
    LibraryContext.init(IsolateOrigin.main, nativeLibraryPath: args[0]);
  });
  tearDown(() {
    LibraryContext.release();
  });

  _testSuite.test("Listener notifier on different C++ thread", () async {
    final notifier = new ThreadedNotifier();
    final listener = new ThreadedListenerImpl();

    notifier.notifyOnDetached(listener, "foo");
    final result = await completer.future;

    expect(result, "foo");

    notifier.release();
  });
  _testSuite.test("Lambda notifier on different C++ thread", () async {
    final notifier = new ThreadedNotifier();
    final listener = new ThreadedListenerImpl();

    notifier.notifyLambdaOnDetached(
            (String message) { completer.complete(message); }, "foo");
    final result = await completer.future;

    expect(result, "foo");

    notifier.release();
  });
}
