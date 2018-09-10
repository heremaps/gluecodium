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

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CachingStrategyCreatorTest {

  private static final String ROOT_FOLDER_NAME = "buildRoot";

  @Rule public TemporaryFolder testFolder = new TemporaryFolder();

  private File rootDir;

  @Before
  public void setUp() {
    rootDir = new File(testFolder.getRoot(), ROOT_FOLDER_NAME);
  }

  @Test
  public void initializeCachingWithCachingDisabled() {

    CachingStrategy result =
        CachingStrategyCreator.initializeCaching(false, rootDir.getAbsolutePath(), null);

    assertTrue(result instanceof CleanUpCachingStrategy);
  }

  @Test
  public void initializeCachingWithCachingEnabled() {

    CachingStrategy result =
        CachingStrategyCreator.initializeCaching(
            true, rootDir.getAbsolutePath(), Collections.emptySet());

    assertTrue(result instanceof FullCachingStrategy);
  }

  @Test
  public void initializeCachingWithCorruptCacheCleansCache() throws IOException {
    File cacheDir = new File(rootDir.getAbsolutePath(), ".cache");
    cacheDir.mkdirs();
    File brokenCache = new File(cacheDir.getAbsolutePath(), "foo");
    brokenCache.createNewFile();

    CachingStrategyCreator.initializeCaching(
        true, rootDir.getAbsolutePath(), Collections.singleton("foo"));

    assertFalse(brokenCache.exists());
  }
}
