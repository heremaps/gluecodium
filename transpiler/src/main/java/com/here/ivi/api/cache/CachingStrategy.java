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

public interface CachingStrategy {

  /**
   * Writes cache to disc and might perform cleanup in file system to retain consistency between
   * cache and file system (latter one depends on concrete strategy).
   *
   * @param folderContentIsValid flag indicating if folder contents is valid (i.e. all files given
   *     by updateCache are stored on disc correctly).
   * @return flag indicating whether folder content is valid and consistent with cache after write
   *     operation
   */
  boolean write(boolean folderContentIsValid);

  /**
   * Updates the cache, depending on the concrete strategy class, this might return all input files
   * or changed files only.
   *
   * @param cacheName name of the file-set
   * @param inputFiles list of files to be contained in cache
   * @return list of files that should be written to disc
   */
  List<GeneratedFile> updateCache(String cacheName, List<GeneratedFile> inputFiles);
}
