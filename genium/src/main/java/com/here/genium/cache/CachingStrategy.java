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
