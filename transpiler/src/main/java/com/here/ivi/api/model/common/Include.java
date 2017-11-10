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

package com.here.ivi.api.model.common;

import lombok.EqualsAndHashCode;

@EqualsAndHashCode
public final class Include implements Comparable<Include> {

  public final String fileName;
  public final boolean isSystem;

  private Include(final String fileName, final boolean isSystem) {
    this.fileName = fileName;
    this.isSystem = isSystem;
  }

  public static Include createInternalInclude(final String fileName) {
    return new Include(fileName, false);
  }

  public static Include createSystemInclude(final String fileName) {
    return new Include(fileName, true);
  }

  @Override
  public int compareTo(final Include include) {
    if (this.isSystem && !include.isSystem) {
      return 1;
    }
    if (!this.isSystem && include.isSystem) {
      return -1;
    }
    return fileName.compareTo(include.fileName);
  }
}
