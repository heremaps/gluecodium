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

  private static final int majorVersion = 7;
  private static final int minorVersion = 21;
  private static final int patchVersion = 302;
  private static final String versionSuffix = "abc";
  private static final String versionWithoutSuffix = "7.21.302";
  private static final String versionWithSuffix = "7.21.302-abc";
  private static final String invalidVersionString = "not a version";

  @Test
  public void toStringWithoutSuffix() {
    final Version version = new Version(majorVersion, minorVersion, patchVersion, "");

    String versionString = version.toString();

    assertEquals(versionWithoutSuffix, versionString);
  }

  @Test
  public void toStringWithSuffix() {
    final Version version = new Version(majorVersion, minorVersion, patchVersion, versionSuffix);

    String versionString = version.toString();

    assertEquals(versionWithSuffix, versionString);
  }

  @Test
  public void createFromFrancaVersion() {
    FVersion francaVersion = mock(FVersion.class);
    when(francaVersion.getMajor()).thenReturn(majorVersion);
    when(francaVersion.getMinor()).thenReturn(minorVersion);

    Version version = Version.createFromFrancaVersion(francaVersion);

    assertEquals(majorVersion, version.major);
    assertEquals(minorVersion, version.minor);
    assertEquals(0, version.patch);
    assertEquals("", version.suffix);
  }

  @Test
  public void createFromStringWithoutSuffix() {
    Version version = Version.createFromString(versionWithoutSuffix);

    assertEquals(majorVersion, version.major);
    assertEquals(minorVersion, version.minor);
    assertEquals(patchVersion, version.patch);
    assertEquals("", version.suffix);
  }

  @Test
  public void createFromStringWithSuffix() {
    Version version = Version.createFromString(versionWithSuffix);

    assertEquals(majorVersion, version.major);
    assertEquals(minorVersion, version.minor);
    assertEquals(patchVersion, version.patch);
    assertEquals(versionSuffix, version.suffix);
  }

  @Test
  public void createFromStringWithInvalidString() {
    Version version = Version.createFromString(invalidVersionString);

    assertEquals(0, version.major);
    assertEquals(0, version.minor);
    assertEquals(0, version.patch);
    assertEquals("", version.suffix);
  }
}
