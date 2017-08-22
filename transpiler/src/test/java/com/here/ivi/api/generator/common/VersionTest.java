/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.common;

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
