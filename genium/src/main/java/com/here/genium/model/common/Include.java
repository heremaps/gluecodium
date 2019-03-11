/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.model.common;

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
