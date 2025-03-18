/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test;

import static junit.framework.Assert.assertEquals;

import android.os.Build;
import com.here.android.lorem.ipsum.time.Duration;
import com.here.android.RobolectricApplication;
import java.util.ArrayList;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class ListenerAsConstructorParamTest {

  static class CelsiusObserver implements TemperatureObserver {
    private int updatesCount = 0;
    private double lastReadTemperature = 0.0;

    public int getUpdatesCount() {
      return updatesCount;
    }

    public double getLastCelsius() {
      return lastReadTemperature;
    }

    @Override
    public void onTemperatureUpdate(Thermometer thermometer) {
      lastReadTemperature = thermometer.getCelsius();
      ++updatesCount;
    }
  }

  @Test
  public void celsiusObserverIsUpdatedFromConstructor() {
    // Given temperature observer, which receives updates about temperature.
    CelsiusObserver observer = new CelsiusObserver();

    ArrayList<TemperatureObserver> observers = new ArrayList();
    observers.add(observer);

    // When creating observed subject.
    Thermometer thermometer = new Thermometer(Duration.ofSeconds(1), observers);

    // Then subject informed about its state during creation.
    double delta = 0.00000001;
    assertEquals(observer.getUpdatesCount(), 1);
    assertEquals(observer.getLastCelsius(), thermometer.getCelsius(), delta);
  }
}