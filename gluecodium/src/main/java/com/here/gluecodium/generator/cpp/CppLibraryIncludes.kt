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

package com.here.gluecodium.generator.cpp;

import com.here.gluecodium.model.common.Include;

public final class CppLibraryIncludes {
  public static final Include INT_TYPES = Include.Companion.createSystemInclude("cstdint");
  public static final Include MAP = Include.Companion.createSystemInclude("unordered_map");
  public static final Include MEMORY = Include.Companion.createSystemInclude("memory");
  public static final Include STRING = Include.Companion.createSystemInclude("string");
  public static final Include VECTOR = Include.Companion.createSystemInclude("vector");
  public static final Include NEW = Include.Companion.createSystemInclude("new");
  public static final Include SYSTEM_ERROR = Include.Companion.createSystemInclude("system_error");
  public static final Include LIMITS = Include.Companion.createSystemInclude("limits");
  public static final Include CHRONO = Include.Companion.createSystemInclude("chrono");
  public static final Include SET = Include.Companion.createSystemInclude("unordered_set");
  public static final Include FUNCTIONAL = Include.Companion.createSystemInclude("functional");
  public static final Include TYPE_TRAITS = Include.Companion.createSystemInclude("type_traits");
}