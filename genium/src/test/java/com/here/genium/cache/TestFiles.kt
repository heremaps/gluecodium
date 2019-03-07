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

package com.here.genium.cache

import com.here.genium.generator.common.GeneratedFile
import java.util.Arrays

internal object TestFiles {
    private const val CONTENT1 = "CONTENT1"
    private const val CONTENT2 = ""
    private const val CONTENT3 = "CONTENT3"
    private const val CONTENT4 = "CONTENT4"

    private const val PATH1 = "PATH1_1/PATH1_2/FILE1"
    // leading dot is important, as it will be tested whether path strings get normalized before
    // storing them inside cache
    const val PATH2 = "./PATH2/FILE2"
    const val PATH3 = "FILE3"
    const val PATH4 = "FILE4"

    const val PATH_UNCACHED = "${PATH4}xtra"

    // initial file set
    val INITIAL_FILES: MutableList<GeneratedFile> = Arrays.asList(
        GeneratedFile(CONTENT1, PATH1),
        GeneratedFile(CONTENT2, PATH2),
        GeneratedFile(CONTENT3, PATH3)
    )

    // updated file set: one file removed, one unchanged, one added
    val UPDATED_FILES: MutableList<GeneratedFile> = Arrays.asList(
        GeneratedFile("${CONTENT1}xtra", PATH1),
        // following entry should be considered unchanged file as path's will be normalized
        GeneratedFile(CONTENT3, "./$PATH3"),
        GeneratedFile(CONTENT4, PATH4)
    )

    // set of changed files when caching INITIAL_FILES first and update with UPDATED_FILES afterwards
    val CHANGED_FILES: MutableList<GeneratedFile> = Arrays.asList(
        GeneratedFile("${CONTENT1}xtra", PATH1), GeneratedFile(CONTENT4, PATH4)
    )
}
