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

package com.here.ivi.api.model.swift;

import java.util.ArrayList;
import java.util.List;

public class SwiftProperty extends SwiftModelElement {

  public Visibility visibility;
  public Atomicity atomicity;
  public Accessibility accessibility;
  public MemoryBehaviour memoryBehaviour;
  public Nullability nullability;
  public SwiftType type;

  public SwiftProperty(String propertyName) {
    super(propertyName);
  }

  public enum Visibility {
    PUBLIC,
    PRIVATE
  }

  public enum Atomicity {
    ATOMIC,
    NONATOMIC
  }

  public enum Accessibility {
    READWRITE,
    READONLY
  }

  public enum MemoryBehaviour {
    ASSIGN,
    STRONG,
    WEAK
  }

  public enum Nullability {
    NULLABLE,
    NONNULL
  }

  public List<String> getAttributes() {
    List<String> attributes = new ArrayList<>();
    if (atomicity == SwiftProperty.Atomicity.NONATOMIC) {
      attributes.add("nonatomic");
    }
    if (accessibility == SwiftProperty.Accessibility.READONLY) {
      attributes.add("readonly");
    }
    switch (memoryBehaviour) {
      case STRONG:
        attributes.add("strong");
        break;
      case WEAK:
        attributes.add("weak");
        break;
      default:
        break;
    }
    if (nullability == SwiftProperty.Nullability.NONNULL) {
      attributes.add("nonnull");
    }
    return attributes;
  }
}
