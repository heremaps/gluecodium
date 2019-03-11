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

import static com.here.genium.cache.IntegrationTestFiles.FIRSTRUN;
import static com.here.genium.cache.IntegrationTestFiles.MY_GENERATORS;
import static com.here.genium.cache.IntegrationTestFiles.SECONDRUN;
import static com.here.genium.cache.IntegrationTestFiles.THIRDRUN;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import com.here.genium.generator.common.GeneratedFile;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class FullCachingStrategyIntegrationTest {

  @Rule public TemporaryFolder testFolder = new TemporaryFolder();

  private static final String BUILD_FOLDER = "buildFolder";

  private String buildFolderPath;
  private CachingStrategy myStrategy;

  @Before
  public void setUp() {
    buildFolderPath = testFolder.getRoot() + File.separator + BUILD_FOLDER;
    myStrategy = CachingStrategyCreator.initializeCaching(true, buildFolderPath, MY_GENERATORS);
    assertTrue(myStrategy instanceof FullCachingStrategy);
  }

  @Test
  public void writeEmptyCacheValid() {

    //act
    myStrategy.write(true);

    //assert
    for (String generatorName : MY_GENERATORS) {
      assertTrue(Files.isRegularFile(Paths.get(buildFolderPath, "/.cache/" + generatorName)));
      Map<String, CacheEntry> result =
          loadCacheFile(Paths.get(buildFolderPath, "/.cache/" + generatorName).toFile());
      assertTrue(result.isEmpty());
    }
  }

  @Test
  public void writeEmptyCacheInvalid() {

    //act
    myStrategy.write(false);

    //assert
    for (String generatorName : MY_GENERATORS) {
      assertTrue(Files.isRegularFile(Paths.get(buildFolderPath, "/.cache/" + generatorName)));
      Map<String, CacheEntry> result =
          loadCacheFile(Paths.get(buildFolderPath, "/.cache/" + generatorName).toFile());
      assertTrue(result.isEmpty());
    }
  }

  @Test
  public void updateEmptyCache() {

    for (IntegrationTestFiles.CacheInputOutputPair entry : FIRSTRUN) {
      //act
      List<GeneratedFile> result = myStrategy.updateCache(entry.name, entry.inputFiles);
      //assert
      assertEquals(entry.outputFiles.size(), result.size());
      assertTrue(entry.outputFiles.stream().allMatch(file -> result.contains(file)));
    }
  }

  @Test
  public void updateNonEmptyCache() {

    //arrange
    for (IntegrationTestFiles.CacheInputOutputPair entry : FIRSTRUN) {
      myStrategy.updateCache(entry.name, entry.inputFiles);
    }
    myStrategy.write(true);

    //act & assert
    for (IntegrationTestFiles.CacheInputOutputPair entry : SECONDRUN) {
      List<GeneratedFile> result = myStrategy.updateCache(entry.name, entry.inputFiles);

      assertEquals(result.size(), entry.outputFiles.size());
      assertTrue(entry.outputFiles.stream().allMatch(file -> result.contains(file)));
    }
    myStrategy.write(true);

    //act & assert
    for (IntegrationTestFiles.CacheInputOutputPair entry : THIRDRUN) {
      List<GeneratedFile> result = myStrategy.updateCache(entry.name, entry.inputFiles);

      assertEquals(result.size(), entry.outputFiles.size());
      assertTrue(entry.outputFiles.stream().allMatch(file -> result.contains(file)));
    }
  }

  @Test
  public void writeNonEmptyCache() {

    //arrange
    for (IntegrationTestFiles.CacheInputOutputPair entry : FIRSTRUN) {
      myStrategy.updateCache(entry.name, entry.inputFiles);
    }

    //act
    myStrategy.write(true);

    //assert
    for (IntegrationTestFiles.CacheInputOutputPair entry : FIRSTRUN) {
      Map<String, CacheEntry> result =
          loadCacheFile(Paths.get(buildFolderPath, "/.cache/" + entry.name).toFile());

      //check that we have entries for all files
      assertNotNull(result);
      assertEquals(result.size(), entry.inputFiles.size());

      entry.inputFiles.stream().allMatch(file -> result.containsKey(file.targetFile.getPath()));
    }
  }

  @Test
  public void writeNonEmptyCacheInvalid() {

    //arrange
    for (IntegrationTestFiles.CacheInputOutputPair entry : FIRSTRUN) {
      myStrategy.updateCache(entry.name, entry.inputFiles);
    }

    //act
    myStrategy.write(false);

    //assert
    for (IntegrationTestFiles.CacheInputOutputPair entry : FIRSTRUN) {
      Map<String, CacheEntry> result =
          loadCacheFile(Paths.get(buildFolderPath, "/.cache/" + entry.name).toFile());
      assertTrue(result.isEmpty());
    }
  }

  private static Map<String, CacheEntry> loadCacheFile(File cacheFile) {
    try {
      InputStream fileInputStream = new FileInputStream(cacheFile);
      ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
      return (HashMap<String, CacheEntry>) objectInputStream.readObject();
    } catch (IOException e) {
      return null;
    } catch (ClassNotFoundException e) {
      return null;
    }
  }
}
