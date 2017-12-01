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

import java.util.List;
import lombok.Builder;

public final class SwiftEnum extends SwiftType {
  public final List<SwiftEnumItem> items;

  @Builder
  private SwiftEnum(String name, String comment, List<SwiftEnumItem> items) {
    super(name, TypeCategory.ENUM);
    this.comment = comment;
    this.items = items;
  }

  public static SwiftEnum.SwiftEnumBuilder builder(String name) {
    return new SwiftEnum.SwiftEnumBuilder().name(name);
  }
}
