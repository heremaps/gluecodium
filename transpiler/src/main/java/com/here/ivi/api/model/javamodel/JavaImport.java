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

package com.here.ivi.api.model.javamodel;

/**
 * This class represents an import in java. It distinguishes between system, external and internal
 * imports.
 */
public class JavaImport {
  public final String importStatement;
  public final ImportType type;

  public JavaImport(String importStatement, ImportType type) {
    this.importStatement = importStatement;
    this.type = type;
  }

  public enum ImportType {
    SYSTEM,
    INTERNAL,
    EXTERNAL,
    STATIC
  }
}
