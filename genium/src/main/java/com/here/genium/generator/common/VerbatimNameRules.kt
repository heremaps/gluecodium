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

public final class VerbatimNameRules implements NameRules {

  public static final VerbatimNameRules INSTANCE = new VerbatimNameRules();

  private VerbatimNameRules() {}

  @Override
  public String getTypeName(final String base) {
    return base;
  }

  @Override
  public String getFunctionName(final String base) {
    return base;
  }

  @Override
  public String getVariableName(final String base) {
    return base;
  }

  @Override
  public String getConstantName(final String base) {
    return base;
  }
}
