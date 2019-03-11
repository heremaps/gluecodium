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

import java.util.Set;

public final class CachingStrategyCreator {

  public static CachingStrategy initializeCaching(
      boolean cachingEnabled, final String buildFolder, Set<String> availableGenerators) {

    if (cachingEnabled) {
      return new FullCachingStrategy(
          new MultiFileSetCache(buildFolder, availableGenerators), buildFolder);
    }
    return new CleanUpCachingStrategy(buildFolder, availableGenerators);
  }
}
