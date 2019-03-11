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

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.output.FileRemove;
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
