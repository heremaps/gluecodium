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

package com.here.ivi.api.generator.cpp;

import com.here.ivi.api.model.common.Include;

public final class CppLibraryIncludes {
  // Standard
  public static final Include INT_TYPES = Include.createSystemInclude("cstdint");
  public static final Include LIMITS = Include.createSystemInclude("limits");
  public static final Include MAP = Include.createSystemInclude("unordered_map");
  public static final Include MEMORY = Include.createSystemInclude("memory");
  public static final Include STRING = Include.createSystemInclude("string");
  public static final Include VECTOR = Include.createSystemInclude("vector");
  public static final Include NEW = Include.createSystemInclude("new");

  // Custom
  public static final Include RETURN = Include.createInternalInclude("Return.h");
  public static final Include ENUM_HASH = Include.createInternalInclude("enum_hash.h");
  public static final Include HF_ERROR = Include.createInternalInclude("ErrorCode.h");
}
