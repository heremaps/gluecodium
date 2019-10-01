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

package com.here.gluecodium.cache;

import com.here.gluecodium.cli.GluecodiumExecutionException;
import java.util.Set;

public final class CachingStrategyCreator {

  public static CachingStrategy initializeCaching(
      boolean cachingEnabled, final String buildFolder, final Set<String> availableGenerators) {

    if (!cachingEnabled) {
      return new CleanUpCachingStrategy(buildFolder, availableGenerators);
    }

    MultiFileSetCache cache;
    try {
      cache = new MultiFileSetCache(buildFolder, availableGenerators);
    } catch (GluecodiumExecutionException e) {
      eraseExistingFileCache(buildFolder, availableGenerators, e);
      cache = new MultiFileSetCache(buildFolder, availableGenerators);
    }

    return new FullCachingStrategy(cache, buildFolder);
  }

  private static void eraseExistingFileCache(
      final String buildFolder,
      final Set<String> availableGenerators,
      final GluecodiumExecutionException previousException) {

    CleanUpCachingStrategy cleanUpStrategy =
        new CleanUpCachingStrategy(buildFolder, availableGenerators);
    boolean cleanupResult = cleanUpStrategy.write(true);
    if (!cleanupResult) {
      throw new GluecodiumExecutionException("Failed to erase corrupt file cache", previousException);
    }
  }
}
