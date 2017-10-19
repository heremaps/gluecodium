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

import lombok.Builder;

public class SwiftEnumItem extends SwiftModelElement {
  public final SwiftValue value;

  @Builder
  protected SwiftEnumItem(String name, String comment, SwiftValue value) {
    super(name);
    this.comment = comment;
    this.value = value;
  }

  public static SwiftEnumItem.SwiftEnumItemBuilder builder(String name) {
    return new SwiftEnumItem.SwiftEnumItemBuilder().name(name);
  }
}
