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

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;
import static org.powermock.api.mockito.PowerMockito.when;

import com.here.genium.generator.common.GeneratedFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(HashValueCalculator.class)
public final class FileSetCacheTest {

  @Rule public TemporaryFolder testFolder = new TemporaryFolder();

  private static final String RELATIVE_CACHE_PATH = "someDirectory/setA.txt";

  private FileSetCache cache;

  private File cacheFile;

  @Before
  public void setUp() {

    cacheFile = new File(testFolder.getRoot(), RELATIVE_CACHE_PATH);
    cache = new FileSetCache(cacheFile);

    PowerMockito.mockStatic(HashValueCalculator.class);

    // we need valid hash values
    when(HashValueCalculator.calculateHashValue(anyString()))
        .thenAnswer(invocation -> ((String) invocation.getArguments()[0]).getBytes());
  }

  @Test
  public void createEmptyCache() {
    // assert
    assertEquals(new HashMap<String, CacheEntry>(), cache.getCacheEntries());
  }

  @Test
  public void writeEmptyCache() throws IOException, ClassNotFoundException {

    // act
    cache.writeCache();

    // assert
    assertTrue(cacheFile.exists());
    FileInputStream fileInput = new FileInputStream(cacheFile);
    ObjectInputStream objectInputStream = new ObjectInputStream(fileInput);
    HashMap<String, CacheEntry> fileDirectory =
        (HashMap<String, CacheEntry>) objectInputStream.readObject();
    assertEquals(fileDirectory, cache.getCacheEntries());
  }

  @Test
  public void loadEmptyCache() throws IOException, ClassNotFoundException {
    cache.writeCache();

    // act
    FileSetCache loadedCache = new FileSetCache(cacheFile);

    // assert
    assertEquals(cache.getCacheEntries(), loadedCache.getCacheEntries());
  }

  @Test
  public void updateEmptyCache() throws IOException, ClassNotFoundException {

    // act
    List<GeneratedFile> result = cache.updateCache(TestFiles.INITIAL_FILES);

    // assert
    assertTrue(
        cache.getCacheEntries().entrySet().stream().allMatch(entry -> entry.getValue().touched));

    for (GeneratedFile file : TestFiles.INITIAL_FILES) {
      assertTrue(
          cache.getCacheEntries().containsKey(file.targetFile.toPath().normalize().toString()));
      assertTrue(result.contains(file));
    }
    for (GeneratedFile file : TestFiles.INITIAL_FILES) {
      verifyStatic();
      HashValueCalculator.calculateHashValue(file.content);
    }
  }

  @Test
  public void writeNonEmptyCache() throws IOException, ClassNotFoundException {

    cache.updateCache(TestFiles.INITIAL_FILES);

    // act
    cache.writeCache();

    // assert
    assertTrue(cacheFile.exists());
    FileInputStream fileInput = new FileInputStream(cacheFile);
    ObjectInputStream objectInputStream = new ObjectInputStream(fileInput);
    Map<String, CacheEntry> fileDirectory =
        (Map<String, CacheEntry>) objectInputStream.readObject();
    Map<String, CacheEntry> cacheEntries = cache.getCacheEntries();

    assertEquals(cacheEntries.size(), fileDirectory.size());
    assertEquals(cacheEntries.keySet(), fileDirectory.keySet());
    for (String key : cacheEntries.keySet()) {
      assertArrayEquals(
          cacheEntries.get(key).cachedFileHashValue, fileDirectory.get(key).cachedFileHashValue);
    }
  }

  @Test
  public void loadNonEmptyCache() throws IOException, ClassNotFoundException {

    cache.updateCache(TestFiles.INITIAL_FILES);
    cache.writeCache();

    // act
    FileSetCache loadedCache = new FileSetCache(cacheFile);

    // assert
    Map<String, CacheEntry> loadedEntries = loadedCache.getCacheEntries();
    Map<String, CacheEntry> cacheEntries = cache.getCacheEntries();

    assertEquals(cacheEntries.size(), loadedEntries.size());
    assertEquals(cacheEntries.keySet(), loadedEntries.keySet());
    for (String key : cacheEntries.keySet()) {
      assertArrayEquals(
          cacheEntries.get(key).cachedFileHashValue, loadedEntries.get(key).cachedFileHashValue);
    }
    assertTrue(loadedEntries.entrySet().stream().noneMatch(entry -> entry.getValue().touched));
  }

  @Test
  public void updateNonEmptyCache() {
    // arrange
    cache.updateCache(TestFiles.INITIAL_FILES);
    cache.finalizeUpdates();

    // act (changes: one file removed, one added, one changed, one unchanged)
    List<GeneratedFile> result = cache.updateCache(TestFiles.UPDATED_FILES);

    // assert
    assertEquals(4, cache.getCacheEntries().size());
    List<String> allFilePaths =
        Stream.concat(TestFiles.INITIAL_FILES.stream(), TestFiles.UPDATED_FILES.stream())
            .map(entry -> entry.targetFile.toPath().normalize().toString())
            .collect(Collectors.toList());

    // check that all files are in and have correct touched flag
    for (String path : allFilePaths) {
      CacheEntry value = cache.getCacheEntries().get(path);
      assertNotNull(value);
      if (TestFiles.UPDATED_FILES
          .stream()
          .anyMatch(entry -> entry.targetFile.toPath().normalize().toString().equals(path))) {
        assertTrue(value.touched);
      } else {
        assertFalse(value.touched);
      }
    }

    assertEquals(2, result.size());
    for (GeneratedFile file : TestFiles.CHANGED_FILES) {
      assertTrue(
          result
              .stream()
              .anyMatch(
                  changedFile ->
                      changedFile.targetFile.equals(file.targetFile)
                          && changedFile.content.equals(file.content)));
    }

    Map<String, Long> contentsWithUsageCount =
        Stream.concat(TestFiles.INITIAL_FILES.stream(), TestFiles.UPDATED_FILES.stream())
            .map(file -> file.content)
            .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));

    for (Map.Entry<String, Long> entry : contentsWithUsageCount.entrySet()) {
      verifyStatic(times((int) (long) entry.getValue()));
      HashValueCalculator.calculateHashValue(entry.getKey());
    }
  }

  @Test
  public void finalizeUpdateTest() {
    // arrange
    CacheEntry first = new CacheEntry("firstHash".getBytes());
    first.touched = false;
    cache.getCacheEntries().put("first", first);
    CacheEntry second = new CacheEntry("secondHash".getBytes());
    second.touched = true;
    cache.getCacheEntries().put("second", second);
    CacheEntry third = new CacheEntry("thirdHash".getBytes());
    third.touched = true;
    cache.getCacheEntries().put("third", third);

    // act
    cache.finalizeUpdates();

    // assert
    assertEquals(2, cache.getCacheEntries().size());
    assertTrue(cache.getCacheEntries().values().stream().allMatch(entry -> !entry.touched));
    CacheEntry secondFromCache = cache.getCacheEntries().get("second");
    CacheEntry thirdFromCache = cache.getCacheEntries().get("third");
    assertEquals(second, secondFromCache);
    assertEquals(third, thirdFromCache);
  }

  @Test
  public void predicateTest() {

    // arrange
    cache.updateCache(TestFiles.UPDATED_FILES);

    // act
    Predicate<Path> checker = cache.filterOutCachedFiles();

    // assert
    assertTrue(checker.test(Paths.get(TestFiles.PATH2)));
    assertTrue(checker.test(Paths.get(RELATIVE_CACHE_PATH)));
    assertFalse(checker.test(Paths.get(TestFiles.PATH3)));
    assertFalse(checker.test(Paths.get(TestFiles.PATH3)));
  }
}
