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

package com.here.genium.cache;

import java.io.Serializable;

/** This class represents a cache entry. EqualsAndHashCode is for tests only. */
final class CacheEntry implements Serializable {

  // DO NOT CHANGE! Value obtained with "serialver" tool for Genium release v3.4.0
  private static final long serialVersionUID = 1149358075297866146L;

  public final byte[] cachedFileHashValue;
  public transient boolean touched;

  CacheEntry(final byte[] cachedFileHashValue) {
    this.cachedFileHashValue = cachedFileHashValue;
    this.touched = true;
  }
}
