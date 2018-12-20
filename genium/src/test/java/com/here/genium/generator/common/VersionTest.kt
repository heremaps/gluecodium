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

package com.here.genium.generator.common;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.franca.core.franca.FVersion;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class VersionTest {

  private static final int MAJOR_VERSION = 7;
  private static final int MINOR_VERSION = 21;
  private static final int PATCH_VERSION = 302;
  private static final String VERSION_SUFFIX = "abc";
  private static final String VERSION_WITHOUT_SUFFIX = "7.21.302";
  private static final String VERSION_WITH_SUFFIX = "7.21.302-abc";
  private static final String INVALID_VERSION_STRING = "not a version";

  @Test
  public void toStringWithoutSuffix() {
    final Version version = new Version(MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION, "");

    String versionString = version.toString();

    assertEquals(VERSION_WITHOUT_SUFFIX, versionString);
  }

  @Test
  public void toStringWithSuffix() {
    final Version version =
        new Version(MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION, VERSION_SUFFIX);

    String versionString = version.toString();

    assertEquals(VERSION_WITH_SUFFIX, versionString);
  }

  @Test
  public void createFromFrancaVersion() {
    FVersion francaVersion = mock(FVersion.class);
    when(francaVersion.getMajor()).thenReturn(MAJOR_VERSION);
    when(francaVersion.getMinor()).thenReturn(MINOR_VERSION);

    Version version = Version.createFromFrancaVersion(francaVersion);

    assertEquals(MAJOR_VERSION, version.major);
    assertEquals(MINOR_VERSION, version.minor);
    assertEquals(0, version.patch);
    assertEquals("", version.suffix);
  }

  @Test
  public void createFromStringWithoutSuffix() {
    Version version = Version.createFromString(VERSION_WITHOUT_SUFFIX);

    assertEquals(MAJOR_VERSION, version.major);
    assertEquals(MINOR_VERSION, version.minor);
    assertEquals(PATCH_VERSION, version.patch);
    assertEquals("", version.suffix);
  }

  @Test
  public void createFromStringWithSuffix() {
    Version version = Version.createFromString(VERSION_WITH_SUFFIX);

    assertEquals(MAJOR_VERSION, version.major);
    assertEquals(MINOR_VERSION, version.minor);
    assertEquals(PATCH_VERSION, version.patch);
    assertEquals(VERSION_SUFFIX, version.suffix);
  }

  @Test
  public void createFromStringWithInvalidString() {
    Version version = Version.createFromString(INVALID_VERSION_STRING);

    assertEquals(0, version.major);
    assertEquals(0, version.minor);
    assertEquals(0, version.patch);
    assertEquals("", version.suffix);
  }
}
