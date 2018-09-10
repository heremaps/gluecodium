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
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

final class IntegrationTestFiles {

  public static final Set<String> MY_GENERATORS =
      new HashSet<>(Arrays.asList("Fancy", "SuperFancy", "NotSoFancy"));

  public static final List<CacheInputOutputPair> FIRSTRUN;
  public static final List<CacheInputOutputPair> SECONDRUN;
  public static final List<CacheInputOutputPair> THIRDRUN;

  /**
   * This class wraps input (files given to updateCache()) and corresponding expected output(files
   * returned by write()) for a single cache run
   */
  public static class CacheInputOutputPair {
    public final String name;
    public final List<GeneratedFile> inputFiles;
    public final List<GeneratedFile> outputFiles;

    CacheInputOutputPair(
        final String cacheName,
        final List<GeneratedFile> expectedInput,
        final List<GeneratedFile> expectedOutput) {
      this.name = cacheName;
      inputFiles = expectedInput;
      outputFiles = expectedOutput;
    }
  }

  static {
    // input/ output for first cache
    List<GeneratedFile> firstFiles =
        Arrays.asList(
            new GeneratedFile("contentA", "FILE1.1"),
            new GeneratedFile("contentB", "FILE1.2"),
            new GeneratedFile("contentC", "FILE1.3"));
    CacheInputOutputPair firstRunCacheA = new CacheInputOutputPair("Fancy", firstFiles, firstFiles);
    // one unchanged, one deletion, one update, one addition
    CacheInputOutputPair secondRunCacheA =
        new CacheInputOutputPair(
            "Fancy",
            Arrays.asList(
                new GeneratedFile("contentA", "FILE1.1"),
                new GeneratedFile("contentC*", "FILE1.3"),
                new GeneratedFile("contentD", "FILE1.4")),
            Arrays.asList(
                new GeneratedFile("contentC*", "FILE1.3"),
                new GeneratedFile("contentD", "FILE1.4")));
    // all files renamed
    CacheInputOutputPair thirdRunCacheA =
        new CacheInputOutputPair(
            "Fancy",
            Arrays.asList(
                new GeneratedFile("contentA", "FILE1.5"),
                new GeneratedFile("contentC*", "FILE1.6"),
                new GeneratedFile("contentD", "FILE1.7")),
            Arrays.asList(
                new GeneratedFile("contentA", "FILE1.5"),
                new GeneratedFile("contentC*", "FILE1.6"),
                new GeneratedFile("contentD", "FILE1.7")));

    // input output for second cache
    CacheInputOutputPair firstRunCacheB =
        new CacheInputOutputPair("SuperFancy", Collections.emptyList(), Collections.emptyList());

    // three additions, (contents match first generator's output)
    CacheInputOutputPair secondRunCacheB =
        new CacheInputOutputPair(
            "SuperFancy",
            Arrays.asList(
                new GeneratedFile("contentA", "FILE2.1"),
                new GeneratedFile("contentC*", "FILE2.2"),
                new GeneratedFile("contentD", "FILE2.3")),
            Arrays.asList(
                new GeneratedFile("contentA", "FILE2.1"),
                new GeneratedFile("contentC*", "FILE2.2"),
                new GeneratedFile("contentD", "FILE2.3")));
    // all contents changed
    CacheInputOutputPair thirdRunCacheB =
        new CacheInputOutputPair(
            "SuperFancy",
            Arrays.asList(
                new GeneratedFile("contentA*", "FILE2.1"),
                new GeneratedFile("contentC**", "FILE2.2"),
                new GeneratedFile("contentD*", "FILE2.3")),
            Arrays.asList(
                new GeneratedFile("contentA*", "FILE2.1"),
                new GeneratedFile("contentC**", "FILE2.2"),
                new GeneratedFile("contentD*", "FILE2.3")));

    // input/ output for third cache
    firstFiles =
        Arrays.asList(
            new GeneratedFile("contentI", "FILE3.1"),
            new GeneratedFile("contentII", "FILE3.2"),
            new GeneratedFile("contentIII", "FILE3.3"));
    CacheInputOutputPair firstRunCacheC =
        new CacheInputOutputPair("NotSoFancy", firstFiles, firstFiles);
    // remove everything
    CacheInputOutputPair secondRunCacheC =
        new CacheInputOutputPair("NotSoFancy", Collections.emptyList(), Collections.emptyList());
    // same as in first run
    CacheInputOutputPair thirdRunCacheC =
        new CacheInputOutputPair(
            "NotSoFancy",
            Arrays.asList(
                new GeneratedFile("contentI", "FILE3.1"),
                new GeneratedFile("contentII", "FILE3.2"),
                new GeneratedFile("contentIII", "FILE3.3")),
            Arrays.asList(
                new GeneratedFile("contentI", "FILE3.1"),
                new GeneratedFile("contentII", "FILE3.2"),
                new GeneratedFile("contentIII", "FILE3.3")));

    FIRSTRUN = Arrays.asList(firstRunCacheA, firstRunCacheB, firstRunCacheC);
    SECONDRUN = Arrays.asList(secondRunCacheA, secondRunCacheB, secondRunCacheC);
    THIRDRUN = Arrays.asList(thirdRunCacheA, thirdRunCacheB, thirdRunCacheC);
  }
}
