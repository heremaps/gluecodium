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
import java.util.List;

/**
 * This strategy adds cache transparently to the pipeline, i.e. it performs updates to the cache (to
 * retain consistency between file system and cache) but neither it alters file writing nor it
 * deletes files.
 */
final class TransparentCachingStrategy implements CachingStrategy {

  private final MultiFileSetCache multiCache;

  TransparentCachingStrategy(MultiFileSetCache multiCache) {
    this.multiCache = multiCache;
  }

  @Override
  public boolean write(boolean folderContentIsValid) {

    if (folderContentIsValid) {
      multiCache.finalizeUpdates();
      multiCache.writeCache();
    } else {
      // As folder content is invalid, the cache contents might become inconsistent with file
      // system and need to be cleared therefore.
      multiCache.clearCaches();
      multiCache.writeCache();
    }
    return folderContentIsValid;
  }

  @Override
  public List<GeneratedFile> updateCache(String cacheName, List<GeneratedFile> inputFiles) {
    multiCache.updateCache(cacheName, inputFiles);
    // as current strategy doesn't alter the file writing, it just returns all input files
    return inputFiles;
  }
}
