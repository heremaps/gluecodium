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

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.genium.cli.GeniumExecutionException;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(MultiFileSetCache.class)
public class MultiFileSetCacheTest {

  @Rule public TemporaryFolder testFolder = new TemporaryFolder();

  @Rule private final ExpectedException expectedException = ExpectedException.none();

  private static final String FILE_SET_A_NAME = "setA";
  private static final String FILE_SET_A_PATH = ".cache/setA";
  private File cacheFileSetA;

  private static final String FILE_SET_B_NAME = "setB";
  private static final String FILE_SET_B_PATH = ".cache/setB";
  private File cacheFileSetB;

  private static final String ROOT_FOLDER_NAME = "buildRoot";

  @Mock private FileSetCache cacheA;
  @Mock private FileSetCache cacheB;

  private File rootDir;
  private MultiFileSetCache multiCache;

  @Before
  public void setUp() throws Exception {

    rootDir = new File(testFolder.getRoot(), ROOT_FOLDER_NAME);

    cacheFileSetA = new File(rootDir.getAbsolutePath(), FILE_SET_A_PATH);
    cacheFileSetB = new File(rootDir.getAbsolutePath(), FILE_SET_B_PATH);

    PowerMockito.whenNew(FileSetCache.class).withArguments(cacheFileSetA).thenReturn(cacheA);
    PowerMockito.whenNew(FileSetCache.class).withArguments(cacheFileSetB).thenReturn(cacheB);

    multiCache =
        new MultiFileSetCache(
            rootDir.getAbsolutePath(),
            new HashSet<>(Arrays.asList(FILE_SET_A_NAME, FILE_SET_B_NAME)));
  }

  @Test
  public void retrieveExistingCacheFiles() {
    PowerMockito.mockStatic(Files.class);
    when(Files.isRegularFile(cacheFileSetA.toPath())).thenReturn(true);

    // act
    List<Path> cacheFiles =
        MultiFileSetCache.retrieveExistingCacheFiles(
            rootDir.getAbsolutePath(),
            new HashSet<>(Arrays.asList(FILE_SET_A_NAME, FILE_SET_B_NAME)));

    assertEquals(1, cacheFiles.size());
    assertEquals(cacheFileSetA.toPath(), cacheFiles.get(0));
    assertEquals(cacheFileSetA.toPath(), cacheFiles.get(0));
    verifyStatic();
    Files.isRegularFile(cacheFileSetB.toPath());
  }

  @Test
  public void constructMultiSetCache() throws Exception {

    // arrange & act is done in setUp

    PowerMockito.verifyNew(FileSetCache.class).withArguments(cacheFileSetA);

    PowerMockito.verifyNew(FileSetCache.class).withArguments(cacheFileSetB);
  }

  @Test
  public void updateCacheFileSetNotFound() {

    expectedException.expect(GeniumExecutionException.class);

    multiCache.updateCache(FILE_SET_A_NAME + "_X", Collections.EMPTY_LIST);
  }

  @Test
  public void updateCacheFileSetFound() {

    multiCache.updateCache(FILE_SET_A_NAME, Collections.EMPTY_LIST);

    verify(cacheA).updateCache(Collections.EMPTY_LIST);
    verify(cacheB, never()).updateCache(any());
  }

  @Test
  public void finalizeUpdates() {

    multiCache.finalizeUpdates();

    verify(cacheA).finalizeUpdates();
    verify(cacheB).finalizeUpdates();
  }

  @Test
  public void getNonCachedFiles() throws Exception {

    // arrange
    when(cacheA.filterOutCachedFiles())
        .thenReturn(
            path -> {
              if (path.isAbsolute()) {
                throw new GeniumExecutionException("this should never happen");
              }
              return !path.equals(Paths.get(TestFiles.PATH3).normalize());
            });

    when(cacheB.filterOutCachedFiles())
        .thenReturn(
            path -> {
              if (path.isAbsolute()) {
                throw new GeniumExecutionException("this should never happen");
              }
              return !path.equals(Paths.get(TestFiles.PATH4).normalize());
            });

    rootDir.mkdirs();

    File fileCachedByA = new File(rootDir.getAbsolutePath(), TestFiles.PATH3);
    fileCachedByA.createNewFile();

    File fileCachedByB = new File(rootDir.getAbsolutePath(), TestFiles.PATH4);
    fileCachedByB.createNewFile();

    File nonCachedFile = new File(rootDir.getAbsolutePath(), TestFiles.PATH_UNCACHED);
    nonCachedFile.createNewFile();

    // act
    List<Path> result = multiCache.getNonCachedFiles();

    // assert
    assertEquals(1, result.size());
    assertEquals(
        Paths.get(rootDir.getAbsolutePath(), TestFiles.PATH_UNCACHED).normalize(), result.get(0));

    verify(cacheA).filterOutCachedFiles();
    verify(cacheB).filterOutCachedFiles();
  }
}
