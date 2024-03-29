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

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class ListenerRoundtripTest {

  static class RouteImpl implements Route {}

  static class RouteProviderImpl implements RouteProvider {
    public void setRoute(final Route route) {
      RouteImpl impl = (RouteImpl) route;
    }
  }

  static class SomeSimpleInterfaceImpl implements SomeSimpleInterface {
    @Override
    public String getValue() {
      return "this is a value";
    }
  }

  @Test
  public void stringListenerRoundTripDoesNotCrash() {
    Nlp.setRoute(new RouteProviderImpl(), new RouteImpl());
  }

  @Test
  public void childClassRoundTrip() {
    final SomeLifecycleListener listener = new SomeIndicator();

    assertTrue(RealBase.compareListenerToInitial(listener));
  }

  @Test
  public void convolutedRoundTrip() {
    final SomeIndicator listener = new SomeIndicator();
    final SomeBase base = new RealBase();

    base.addLifecycleListener(listener);

    assertTrue(listener.isWeakPtrAlive());
  }

  @Test
  public void simpleRoundTrip() {
    SomeSimpleInterface instance = new SomeSimpleInterfaceImpl();

    SomeSimpleInterface result = SomeSimpleRoundTrip.roundTrip(instance);

    assertTrue(result instanceof SomeSimpleInterface);
    assertEquals("this is a value", result.getValue());
  }
}
