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

package com.here.genium.generator.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Version {

  private static final String VERSION_FORMAT = "%d.%d.%d";
  private static final String VERSION_FORMAT_WITH_SUFFIX = "%d.%d.%d-%s";
  private static final Pattern VERSION_PATTERN =
      Pattern.compile("(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)(?:-(?<suffix>.+))?");

  public final int major;
  public final int minor;
  public final int patch;
  public final String suffix;

  Version(int major, int minor, int patch, String suffix) {
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
