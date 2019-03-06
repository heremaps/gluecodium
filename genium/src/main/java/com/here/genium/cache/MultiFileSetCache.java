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

package com.here.genium.cache;

import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.generator.common.GeneratedFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * Cache for multiple file sets. This class encapsulate multiple FileSetCache objects. The workflow
 * consists of creating the cache, updating the file-set-caches via updateCache() and finally
 * calling finalizeUpdates(). Files that weren't touched by any update call (and therefore need to
 * be removed from disc) can be retrieved by calling getNonCachedFiles() (only valid after
 * finalizeUpdates() has been called).
 */
class MultiFileSetCache {

  private final String rootDirectory;
  private final Map<String, FileSetCache> singleSetCaches;

  /**
   * Constructs a multi-file-set cache. Single file-set-caches are generated via loading the
   * belonging cache index files.
   *
   * @param rootDirectory root directory containing all files to be cached
   * @param availableFileSets list of all available file sets
   */
  MultiFileSetCache(final String rootDirectory, final Set<String> availableFileSets) {

    this.rootDirectory = rootDirectory;
    singleSetCaches =
        availableFileSets
            .stream()
            .collect(
                Collectors.toMap(
                    name -> name,
                    name -> new FileSetCache(createCacheIndexFile(rootDirectory, name))));
  }

  /**
   * Writes index files of file-set-caches to disc. Cache index files will named according to
   * FileSetCache.getAbsoluteCacheFilePath()
   */
  public void writeCache() {
    for (FileSetCache cache : singleSetCaches.values()) {
      cache.writeCache();
    }
  }

  /**
   * Updates files-set-cache specified by fileSetName with given files, i.e. hash values will be
   * updated and 'touched' flags of corresponding entries will be set to true.
   *
   * @param fileSetName name of file-set-cache that will be updated
   * @param files file set to be updated in cache, paths are expected to be relative and must not
   *     contain parts like "folder/.." with "folder" representing a symbolic link. Additionally,
   *     file sets of different file-set-caches are expected to be disjoint.
   * @return files that have been changed since last cache run. null, if file-set-cache of given
   *     name was not found
   */
  public List<GeneratedFile> updateCache(
      final String fileSetName, final List<GeneratedFile> files) {

    FileSetCache cache = singleSetCaches.get(fileSetName);

    if (cache == null) {
      throw new GeniumExecutionException("No cache found of given name: " + fileSetName);
    }
    return cache.updateCache(files);
  }

  /** Removes all cache entries from all file-set caches. */
  public void clearCaches() {
    for (FileSetCache fileSetCache : singleSetCaches.values()) {
      fileSetCache.getCacheEntries().clear();
    }
  }

  /**
   * Finishes the update phase, i.e. all files which weren't touched in any update call will be
   * removed from corresponding file-set-cache and the touched flag of all remaining files will be
   * reset to false.
   */
  public void finalizeUpdates() {
    for (FileSetCache cache : singleSetCaches.values()) {
      cache.finalizeUpdates();
    }
  }

  /**
   * Returns absolute paths of all files present in root directory that are neither contained in any
   * file-set cache nor represent a cache index file (files containing the cache).
   */
  public List<Path> getNonCachedFiles() {

    Path source = Paths.get(rootDirectory).normalize();

    try {
      return Files.walk(source)
          .filter(Files::isRegularFile)
          .map(source::relativize)
          .filter(filterOutCachedFiles())
          .filter(filterOutCacheIndexFiles())
          .map(source::resolve)
          .collect(Collectors.toList());
    } catch (IOException e) {
      throw new GeniumExecutionException("Retrieval of non cached files failed", e);
    }
  }

  private Predicate<Path> filterOutCachedFiles() {
    return singleSetCaches
        .values()
        .stream()
        .map(FileSetCache::filterOutCachedFiles)
        .reduce(Predicate::and)
        .orElse(p -> false);
  }

  private Predicate<Path> filterOutCacheIndexFiles() {
    return path ->
        singleSetCaches
            .keySet()
            .stream()
            .noneMatch(name -> path.equals(new File(createRelativeCacheIndexFile(name)).toPath()));
  }

  /**
   * Returns a list of existing cache index files contained in given directory, if any.
   *
   * @param rootDirectory directory to search for cache index files
   * @param availableFileSets names of file sets
   * @return list of paths pointing to existing cache index
   */
  public static List<Path> retrieveExistingCacheFiles(
      final String rootDirectory, final Set<String> availableFileSets) {
    return availableFileSets
        .stream()
        .map(name -> createCacheIndexFile(rootDirectory, name).toPath())
        .filter(Files::isRegularFile)
        .collect(Collectors.toList());
  }

  private static File createCacheIndexFile(final String rootDirectory, final String fileSetName) {
    return new File(rootDirectory, createRelativeCacheIndexFile(fileSetName));
  }

  private static String createRelativeCacheIndexFile(final String fileSetName) {
    return ".cache" + File.separator + fileSetName;
  }
}
