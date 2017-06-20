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

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.franca.core.franca.FVersion;

public class Version {

  private static final String VERSION_FORMAT = "%d.%d.%d";
  private static final String VERSION_FORMAT_WITH_SUFFIX = "%d.%d.%d-%s";
  private static final Pattern VERSION_PATTERN =
      Pattern.compile("(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)(?:-(?<suffix>.+))?");

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

  @Override
  public String toString() {
    final String versionFormat = suffix.isEmpty() ? VERSION_FORMAT : VERSION_FORMAT_WITH_SUFFIX;
    return String.format(versionFormat, major, minor, patch, suffix);
  }

  public static Version createFromFrancaVersion(FVersion version) {
    return new Version(version.getMajor(), version.getMinor(), 0, "");
  }

  public static Version createFromString(final String versionString) {

    Matcher matcher = VERSION_PATTERN.matcher(versionString);

    if (matcher.matches()) {
      String suffix = matcher.group("suffix");
      return new Version(
          Integer.parseInt(matcher.group("major")),
          Integer.parseInt(matcher.group("minor")),
          Integer.parseInt(matcher.group("patch")),
          suffix != null ? suffix : "");
    } else {
      return new Version(0, 0, 0, "");
    }
  }
}
