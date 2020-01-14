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

import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertNull;
import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class NullableInstancesTest {

  private static class NullableInstanceListenerImpl implements NullableInstanceListener {

    private NullablePayload nullableAttribute = null;

    @Override
    public NullablePayload nullableBottomUpRoundTrip(final NullablePayload input) {
      return input;
    }

    @Override
    public NullablePayload getNullableAttribute() {
      return nullableAttribute;
    }

    @Override
    public void setNullableAttribute(final NullablePayload value) {
      nullableAttribute = value;
    }
  }

  @Test
  public void topDownNullRoundTrip() {
    NullablePayload result = NullableStatic.nullableTopDownRoundTrip(null);

    assertNull(result);
  }

  @Test
  public void topDownRoundTrip() {
    NullablePayload result = NullableStatic.nullableTopDownRoundTrip(new NullablePayload());

    assertNotNull(result);
  }

  @Test
  public void bottomUpNullRoundTrip() {
    boolean result =
        NullableStatic.nullableBottomUpNullRoundTrip(new NullableInstanceListenerImpl());
    assertTrue(result);
  }

  @Test
  public void bottomUpRoundTrip() {
    boolean result = NullableStatic.nullableBottomUpRoundTrip(new NullableInstanceListenerImpl());
    assertTrue(result);
  }

  @Test
  public void bottomUpAttributeNullRoundTrip() {
    boolean result =
        NullableStatic.nullableBottomUpAttributeNullRoundTrip(new NullableInstanceListenerImpl());
    assertTrue(result);
  }

  @Test
  public void bottomUpAttributeRoundTrip() {
    boolean result =
        NullableStatic.nullableBottomUpAttributeRoundTrip(new NullableInstanceListenerImpl());
    assertTrue(result);
  }
}
