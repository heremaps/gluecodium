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

import com.google.common.annotations.VisibleForTesting;
import com.here.genium.cli.GeniumExecutionException;
import com.here.genium.generator.common.GeneratedFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

/**
 * Cache of a file-set (the outcome of a certain generator suite). This class is used internally in
 * MultiFileSetCache.
 */
class FileSetCache {

  private final File cacheIndexFile;
  private final Map<String, CacheEntry> cacheEntries;

  FileSetCache(final File cacheIndexFile) {

    this.cacheIndexFile = cacheIndexFile;

    if (cacheIndexFile.exists()) {
      cacheEntries = loadCache(cacheIndexFile);
    } else {
      cacheEntries = new HashMap<>();
    }
  }

  @SuppressWarnings("unchecked")
  private static Map<String, CacheEntry> loadCache(File cacheFile) {

    try (InputStream fileInputStream = new FileInputStream(cacheFile);
        ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream)) {
      return (HashMap<String, CacheEntry>) objectInputStream.readObject();
    } catch (IOException e) {
      throw new GeniumExecutionException("Reading cache index from file system failed", e);
    } catch (ClassNotFoundException e) {
      throw new GeniumExecutionException("Casting cache index contents failed", e);
    }
  }

  @VisibleForTesting
  void writeCache() {

    cacheIndexFile.getParentFile().mkdirs();
    try (OutputStream outputStream = new FileOutputStream(cacheIndexFile);
        ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream)) {
      objectOutputStream.writeObject(cacheEntries);
    } catch (FileNotFoundException e) {
      throw new GeniumExecutionException("Opening the cache index file for writing failed", e);
    } catch (IOException e) {
      throw new GeniumExecutionException("Writing stream header of cache index file failed", e);
    }
  }

  @VisibleForTesting
  List<GeneratedFile> updateCache(final List<GeneratedFile> inputFiles) {

    List<GeneratedFile> result = new LinkedList<>();
    for (GeneratedFile file : inputFiles) {
      byte[] hashValue = HashValueCalculator.calculateHashValue(file.getContent());
      String normalizedPath = Paths.get(file.getTargetFile().getPath()).normalize().toString();
      CacheEntry previousEntry = cacheEntries.put(normalizedPath, new CacheEntry(hashValue));
      if (previousEntry == null || !Arrays.equals(previousEntry.cachedFileHashValue, hashValue)) {
        result.add(file);
      }
    }
    return result;
  }

  @VisibleForTesting
  public void finalizeUpdates() {
    cacheEntries.entrySet().removeIf(entry -> !entry.getValue().touched);
    cacheEntries.values().forEach(value -> value.touched = false);
  }

  @VisibleForTesting
  Predicate<Path> filterOutCachedFiles() {
    return path -> !(cacheEntries.containsKey(path.normalize().toString()));
  }

  @VisibleForTesting
  Map<String, CacheEntry> getCacheEntries() {
    return cacheEntries;
  }
}
