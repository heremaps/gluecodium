/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

import static org.junit.Assert.assertEquals;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldStaticLogger;
import java.util.List;
import java.util.Map;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

class TestForecastListener implements ForecastListener {

  private String data;

  TestForecastListener() {
    data = "";
  }

  public String getData() {
    return data;
  }

  @Override
  public void onForecastDataProvided(Map<String, ForecastData> map) {
    List<String> cities = java.util.Arrays.asList("Berlin", "Madrid", "Marrakesh");
    StringBuilder builder = new StringBuilder();
    for (String city : cities) {
      if (map.containsKey(city)) {
        ForecastData data = map.get(city);
        builder.append(city + " -> [" + data.lowestDegree + ", " + data.highestDegree + "]\n");
      }
    }

    data = builder.toString();
  }
}

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public final class ListenerWithMapsTest {

  private static final ForecastProvider PROVIDER = ForecastFactory.createProvider();
  private static final String EXPECTED_DATA =
      "Berlin -> [-2, 26]\n" + "Madrid -> [1, 33]\n" + "Marrakesh -> [8, 40]\n";

  @Before
  public void setup() {
    HelloWorldStaticLogger.clearLog();
  }

  @Test
  public void checkNativeListener() {
    ForecastListener listener = ForecastFactory.createListener();
    PROVIDER.inform(listener);
    assertEquals(EXPECTED_DATA, HelloWorldStaticLogger.getLog());
  }

  @Test
  public void checkJavaListener() {
    TestForecastListener listener = new TestForecastListener();
    PROVIDER.inform(listener);
    assertEquals(EXPECTED_DATA, listener.getData());
  }
}
