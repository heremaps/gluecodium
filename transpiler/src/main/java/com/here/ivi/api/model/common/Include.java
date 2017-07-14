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

public class Include {

  public final String fileName;
  public final boolean isSystem;

  protected Include(final String fileName, final boolean isSystem) {
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
  public boolean equals(Object o) {

    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    Include that = (Include) o;

    if (isSystem != that.isSystem) {
      return false;
    }

    return fileName != null ? fileName.equals(that.fileName) : that.fileName == null;
  }

  @Override
  public int hashCode() {

    int result = isSystem ? 1 : 0;
    return 31 * result + (fileName != null ? fileName.hashCode() : 0);
  }
}
