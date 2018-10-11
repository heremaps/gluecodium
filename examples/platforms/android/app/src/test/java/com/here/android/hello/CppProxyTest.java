/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */
package com.here.android.hello;

import static junit.framework.Assert.assertTrue;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public final class CppProxyTest {
  private static final Calculator.Position START_POSITION = new Calculator.Position();
  private static final Calculator.Position END_POSITION = new Calculator.Position();

  private static final CalculatorListener JAVA_LISTENER =
      new CalculatorListener() {
        @Override
        public void onCalculationResult(double v) {
          HelloWorldStaticLogger.append("calculation finished with result=" + v);
        }

        @Override
        public void onCalculationInBackgroundResult(double v) {
          HelloWorldStaticLogger.append("calculation in bg finished with result=" + v);
        }
      };

  private Calculator notifier;

  @BeforeClass
  public static void setUpClass() {
    START_POSITION.x = 0;
    START_POSITION.y = 0;
    START_POSITION.z = 0;

    END_POSITION.x = 10000;
    END_POSITION.y = 10000;
    END_POSITION.z = 10000;
  }

  @Before
  public void setUp() {
    HelloWorldStaticLogger.clearLog();
    notifier = CalculatorFactory.createCalculator();
  }

  @Test
  public void callbackToJavaListener() {
    notifier.calculate(START_POSITION, END_POSITION, JAVA_LISTENER);

    assertTrue(
        "Native Java listener was not called on C++ side",
        HelloWorldStaticLogger.getLog().contains("calculation finished with result=17320.508"));
  }

  @Test
  public void callbackToRegisteredJavaListener() {

    notifier.registerListener(JAVA_LISTENER);

    notifier.calculateInBackground(START_POSITION, END_POSITION);

    notifier.unregisterListener(JAVA_LISTENER);

    assertTrue(
        "Listener registration was unsuccessful on C++ side",
        HelloWorldStaticLogger.getLog().contains("new registration for the listener"));

    assertTrue(
        "Registered native Java listener was not called on C++ side",
        HelloWorldStaticLogger.getLog()
            .contains("calculation in bg finished with result=17320.508"));

    assertTrue(
        "Listener de-registration was unsuccessful on C++ side",
        HelloWorldStaticLogger.getLog().contains("removed registration for the listener"));
  }

  @Test
  public void callbackToRegisteredJavaListenerMultiThreading() throws InterruptedException {
    notifier.registerListener(JAVA_LISTENER);

    Thread callbackToNativeJavaScope =
        new Thread(() -> notifier.calculateInBackground(START_POSITION, END_POSITION));
    callbackToNativeJavaScope.start();
    callbackToNativeJavaScope.join();

    notifier.unregisterListener(JAVA_LISTENER);
    assertTrue(
        "Registered native Java listener was not called on C++ side (multi-threading)",
        HelloWorldStaticLogger.getLog()
            .contains("calculation in bg finished with result=17320.508"));
  }

  @Test
  public void registeredUnregisterDifferentThreads() throws InterruptedException {
    notifier.registerListener(JAVA_LISTENER);

    Thread unregisterThread = new Thread(() -> notifier.unregisterListener(JAVA_LISTENER));
    unregisterThread.start();
    unregisterThread.join();

    assertTrue(
        "Listener registration was unsuccessful on C++ side",
        HelloWorldStaticLogger.getLog().contains("new registration for the listener"));

    assertTrue(
        "Listener de-registration was unsuccessful on C++ side",
        HelloWorldStaticLogger.getLog().contains("removed registration for the listener"));
  }

  @Test
  public void removeAllRegisteredListenersAtDifferentThread( ) throws InterruptedException {
    Thread registerThread = new Thread(() -> notifier.registerListener(JAVA_LISTENER));

    registerThread.start();
    registerThread.join();

    notifier.removeAllListeners();

    assertTrue(
        "Listener registration was unsuccessful on C++ side (multi-threading)",
        HelloWorldStaticLogger.getLog().contains("new registration for the listener"));

    assertTrue(
        "Registered listeners were not removed on C++ side",
        HelloWorldStaticLogger.getLog().contains("removed registration for all listeners"));
  }
}
