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

package com.here.genium.cache

import com.here.genium.generator.common.GeneratedFile
import java.util.Arrays
import java.util.Collections
import java.util.HashSet

internal object IntegrationTestFiles {
    val MY_GENERATORS: Set<String> = HashSet(Arrays.asList("Fancy", "SuperFancy", "NotSoFancy"))

    val FIRSTRUN: List<CacheInputOutputPair>
    val SECONDRUN: List<CacheInputOutputPair>
    val THIRDRUN: List<CacheInputOutputPair>

    /**
     * This class wraps input (files given to updateCache()) and corresponding expected output(files
     * returned by write()) for a single cache run
     */
    class CacheInputOutputPair internal constructor(
        val name: String,
        val inputFiles: List<GeneratedFile>,
        val outputFiles: List<GeneratedFile>
    )

    init {
        // input/ output for first cache
        var firstFiles = Arrays.asList(
            GeneratedFile("contentA", "FILE1.1"),
            GeneratedFile("contentB", "FILE1.2"),
            GeneratedFile("contentC", "FILE1.3")
        )
        val firstRunCacheA = CacheInputOutputPair("Fancy", firstFiles, firstFiles)
        // one unchanged, one deletion, one update, one addition
        val secondRunCacheA = CacheInputOutputPair(
            "Fancy",
            Arrays.asList(
                GeneratedFile("contentA", "FILE1.1"),
                GeneratedFile("contentC*", "FILE1.3"),
                GeneratedFile("contentD", "FILE1.4")
            ),
            Arrays.asList(
                GeneratedFile("contentC*", "FILE1.3"),
                GeneratedFile("contentD", "FILE1.4")
            )
        )
        // all files renamed
        val thirdRunCacheA = CacheInputOutputPair(
            "Fancy",
            Arrays.asList(
                GeneratedFile("contentA", "FILE1.5"),
                GeneratedFile("contentC*", "FILE1.6"),
                GeneratedFile("contentD", "FILE1.7")
            ),
            Arrays.asList(
                GeneratedFile("contentA", "FILE1.5"),
                GeneratedFile("contentC*", "FILE1.6"),
                GeneratedFile("contentD", "FILE1.7")
            )
        )

        // input output for second cache
        val firstRunCacheB = CacheInputOutputPair("SuperFancy", emptyList(), emptyList())

        // three additions, (contents match first generator's output)
        val secondRunCacheB = CacheInputOutputPair(
            "SuperFancy",
            Arrays.asList(
                GeneratedFile("contentA", "FILE2.1"),
                GeneratedFile("contentC*", "FILE2.2"),
                GeneratedFile("contentD", "FILE2.3")
            ),
            Arrays.asList(
                GeneratedFile("contentA", "FILE2.1"),
                GeneratedFile("contentC*", "FILE2.2"),
                GeneratedFile("contentD", "FILE2.3")
            )
        )
        // all contents changed
        val thirdRunCacheB = CacheInputOutputPair(
            "SuperFancy",
            Arrays.asList(
                GeneratedFile("contentA*", "FILE2.1"),
                GeneratedFile("contentC**", "FILE2.2"),
                GeneratedFile("contentD*", "FILE2.3")
            ),
            Arrays.asList(
                GeneratedFile("contentA*", "FILE2.1"),
                GeneratedFile("contentC**", "FILE2.2"),
                GeneratedFile("contentD*", "FILE2.3")
            )
        )

        // input/ output for third cache
        firstFiles = Arrays.asList(
            GeneratedFile("contentI", "FILE3.1"),
            GeneratedFile("contentII", "FILE3.2"),
            GeneratedFile("contentIII", "FILE3.3")
        )
        val firstRunCacheC = CacheInputOutputPair("NotSoFancy", firstFiles, firstFiles)
        // remove everything
        val secondRunCacheC = CacheInputOutputPair("NotSoFancy", emptyList(), emptyList())
        // same as in first run
        val thirdRunCacheC = CacheInputOutputPair(
            "NotSoFancy",
            Arrays.asList(
                GeneratedFile("contentI", "FILE3.1"),
                GeneratedFile("contentII", "FILE3.2"),
                GeneratedFile("contentIII", "FILE3.3")
            ),
            Arrays.asList(
                GeneratedFile("contentI", "FILE3.1"),
                GeneratedFile("contentII", "FILE3.2"),
                GeneratedFile("contentIII", "FILE3.3")
            )
        )

        FIRSTRUN = Arrays.asList(firstRunCacheA, firstRunCacheB, firstRunCacheC)
        SECONDRUN = Arrays.asList(secondRunCacheA, secondRunCacheB, secondRunCacheC)
        THIRDRUN = Arrays.asList(thirdRunCacheA, thirdRunCacheB, thirdRunCacheC)
    }
}
