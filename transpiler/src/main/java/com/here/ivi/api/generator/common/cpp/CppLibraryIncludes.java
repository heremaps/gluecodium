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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.common.Includes;

public class CppLibraryIncludes {

  public static final Includes.SystemInclude LIMITS = new Includes.SystemInclude("limits");
  public static final Includes.SystemInclude MAP = new Includes.SystemInclude("map");
  public static final Includes.SystemInclude MEMORY = new Includes.SystemInclude("memory");
  public static final Includes.SystemInclude SET = new Includes.SystemInclude("set");
  public static final Includes.SystemInclude STRING = new Includes.SystemInclude("string");
  public static final Includes.SystemInclude VECTOR = new Includes.SystemInclude("vector");
}
