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

import com.google.common.annotations.VisibleForTesting;
import com.here.ivi.api.cli.TranspilerExecutionException;
import com.here.ivi.api.generator.common.GeneratedFile;
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

  private static Map<String, CacheEntry> loadCache(File cacheFile) {

    InputStream fileInputStream = null;

    try {
      fileInputStream = new FileInputStream(cacheFile);
      ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
      return (HashMap<String, CacheEntry>) objectInputStream.readObject();
    } catch (IOException e) {
      throw new TranspilerExecutionException("Reading cache index from file system failed", e);
    } catch (ClassNotFoundException e) {
      throw new TranspilerExecutionException("Casting cache index contents failed", e);
    } finally {
      try {
        if (fileInputStream != null) {
          fileInputStream.close();
        }
      } catch (IOException e) {
        throw new TranspilerExecutionException(
            "Closing file input stream of cache index file failed", e);
      }
    }
  }

  @VisibleForTesting
  void writeCache() {
    OutputStream outputStream = null;
    cacheIndexFile.getParentFile().mkdirs();
    try {
      outputStream = new FileOutputStream(cacheIndexFile);
      ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream);
      objectOutputStream.writeObject(cacheEntries);
    } catch (FileNotFoundException e) {
      throw new TranspilerExecutionException("Opening the cache index file for writing failed", e);
    } catch (IOException e) {
      throw new TranspilerExecutionException("Writing stream header of cache index file failed", e);
    } finally {
      try {
        if (outputStream != null) {
          outputStream.close();
        }
      } catch (IOException e) {
        throw new TranspilerExecutionException(
            "Closing file output stream of cache index file failed", e);
      }
    }
  }

  @VisibleForTesting
  List<GeneratedFile> updateCache(final List<GeneratedFile> inputFiles) {

    List<GeneratedFile> result = new LinkedList<>();
    for (GeneratedFile file : inputFiles) {
      byte[] hashValue = HashValueCalculator.calculateHashValue(file.content);
      String normalizedPath = Paths.get(file.targetFile.getPath()).normalize().toString();
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
