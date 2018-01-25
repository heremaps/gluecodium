/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.cache;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.output.FileRemove;
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
