/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
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
