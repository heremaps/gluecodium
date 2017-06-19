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

import org.franca.core.franca.FVersion;

public class Version {
  public final int major;
  public final int minor;
  public final int patch;
  public final String suffix;

  public Version(int major, int minor, int patch, String suffix) {
    this.major = major;
    this.minor = minor;
    this.patch = patch;
    this.suffix = suffix;
  }

  public static Version create(FVersion version) {
    return new Version(version.getMajor(), version.getMinor(), 0, "");
  }

  @Override
  public String toString() {
    return String.valueOf(major)
        + '.'
        + minor
        + '.'
        + patch
        + (suffix.isEmpty() ? "" : "-" + suffix);
  }
}
