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
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.util.List;
import java.util.logging.Logger;

/**
 * This strategy adds full caching to the pipeline, i.e. it performs updates of the cache and alters
 * file writing (writing is restricted to changed files only and files not contained in cache will
 * be deleted).
 */
final class FullCachingStrategy implements CachingStrategy {

  private static final Logger LOGGER = Logger.getLogger(FullCachingStrategy.class.getName());

  private final MultiFileSetCache multiCache;
  private final FileRemove fileRemover;

  FullCachingStrategy(MultiFileSetCache multiCache, final String outputDir) {
    this.multiCache = multiCache;
    this.fileRemover = new FileRemove(new File(outputDir));
  }

  @Override
  public boolean write(boolean folderContentIsValid) {

    if (folderContentIsValid) {
      multiCache.finalizeUpdates();
      multiCache.writeCache();
      // folder content could become inconsistent, if file removal fails
      return removeFilesFromOutputDirectory(multiCache.getNonCachedFiles());
    } else {
      // As Folder content is invalid, the cache contents might become inconsistent with file
      // system and need to be cleared therefore.
      multiCache.clearCaches();
      multiCache.writeCache();
      return false;
    }
  }

  @Override
  public List<GeneratedFile> updateCache(String cacheName, List<GeneratedFile> inputFiles) {
    return multiCache.updateCache(cacheName, inputFiles);
  }

  private boolean removeFilesFromOutputDirectory(final List<Path> absolutePaths) {

    boolean result;
    try {
      result = fileRemover.removeFiles(absolutePaths);
    } catch (FileNotFoundException e) {
      LOGGER.severe("Deletion of '" + absolutePaths.toString() + "' failed");
      return false;
    }
    return result;
  }
}
