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

import com.here.gluecodium.generator.common.GeneratedFile;
import com.here.gluecodium.output.FileRemove;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Set;

/**
 * This strategy implements a clean-up caching strategy. It doesn't actually maintain the cache but
 * deletes potentially existing cache files: This is required if caching is disabled but build
 * folder still contains cache index files: as cache doesn't get updated in current run the cache
 * index files might get inconsistent with file contents and therefore need to be deleted.
 */
final class CleanUpCachingStrategy implements CachingStrategy {

  private final String rootDirectory;
  private final Set<String> availableCacheNames;

  CleanUpCachingStrategy(final String rootDirectory, final Set<String> availableCacheNames) {
    this.rootDirectory = rootDirectory;
    this.availableCacheNames = availableCacheNames;
  }

  @Override
  public boolean write(boolean folderContentIsValid) {

    if (rootDirectory != null) {
      List<Path> existingCacheFiles =
          MultiFileSetCache.retrieveExistingCacheFiles(rootDirectory, availableCacheNames);
      try {
        if (!existingCacheFiles.isEmpty()) {
          return new FileRemove(Paths.get(rootDirectory).toFile()).removeFiles(existingCacheFiles)
              && folderContentIsValid;
        }
      } catch (FileNotFoundException e) {
        return false;
      }
    }
    return folderContentIsValid;
  }

  @Override
  public List<GeneratedFile> updateCache(String cacheName, List<GeneratedFile> inputFiles) {
    return inputFiles;
  }
}
