/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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
import static junit.framework.Assert.assertNull;

import android.os.Build;
import com.here.android.lorem.ipsum.time.Duration;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class DurationsTest {

  @Test
  public void durationSecondsRoundTrip() {
    Duration duration = Duration.ofSeconds(42);

    Duration result = DurationSeconds.increaseDuration(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(0, result.getNano());
  }

  @Test
  public void durationSecondsRoundTripRoundedDown() {
    Duration duration = Duration.ofMillis(42042);

    Duration result = DurationSeconds.increaseDuration(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(0, result.getNano());
  }

  @Test
  public void durationSecondsRoundTripRoundedUp() {
    Duration duration = Duration.ofMillis(42840);

    Duration result = DurationSeconds.increaseDuration(duration);

    assertEquals(44, result.getSeconds());
    assertEquals(0, result.getNano());
  }

  @Test
  public void nullableDurationSecondsRoundTrip() {
    Duration duration = Duration.ofSeconds(42);

    Duration result = DurationSeconds.increaseDurationMaybe(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(0, result.getNano());
  }

  @Test
  public void nullableDurationSecondsRoundTripNull() {
    Duration result = DurationSeconds.increaseDurationMaybe(null);

    assertNull(result);
  }

  @Test
  public void durationSecondsStructRoundTrip() {
    DurationSeconds.DurationStruct struct =
        new DurationSeconds.DurationStruct(Duration.ofSeconds(42));

    DurationSeconds.DurationStruct result = DurationSeconds.durationStructRoundTrip(struct);

    assertEquals(42, result.durationField.getSeconds());
    assertEquals(0, result.durationField.getNano());
  }

  @Test
  public void durationMillisecondsRoundTrip() {
    Duration duration = Duration.ofMillis(42042);

    Duration result = DurationMilliseconds.increaseDuration(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(42000000, result.getNano());
  }

  @Test
  public void durationMillisecondsRoundTripRoundedDown() {
    Duration duration = Duration.ofNanos(42042071000L);

    Duration result = DurationMilliseconds.increaseDuration(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(42000000, result.getNano());
  }

  @Test
  public void durationMillisecondsRoundTripRoundedUp() {
    Duration duration = Duration.ofNanos(42042710000L);

    Duration result = DurationMilliseconds.increaseDuration(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(43000000, result.getNano());
  }

  @Test
  public void nullableDurationMillisecondsRoundTrip() {
    Duration duration = Duration.ofMillis(42042);

    Duration result = DurationMilliseconds.increaseDurationMaybe(duration);

    assertEquals(43, result.getSeconds());
    assertEquals(42000000, result.getNano());
  }

  @Test
  public void nullableDurationMillisecondsRoundTripNull() {
    Duration result = DurationMilliseconds.increaseDurationMaybe(null);

    assertNull(result);
  }

  @Test
  public void durationMillisecondsStructRoundTrip() {
    DurationMilliseconds.DurationStruct struct =
        new DurationMilliseconds.DurationStruct(Duration.ofMillis(42042));

    DurationMilliseconds.DurationStruct result =
        DurationMilliseconds.durationStructRoundTrip(struct);

    assertEquals(42, result.durationField.getSeconds());
    assertEquals(42000000, result.durationField.getNano());
  }

  @Test
  public void durationCallOverloadedFunction() {
    String result = DurationOverloads.durationFunction(Duration.ofSeconds(42));

    assertEquals("duration overload", result);
  }
}
