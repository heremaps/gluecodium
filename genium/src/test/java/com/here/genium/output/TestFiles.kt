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

package com.here.genium.output

import com.here.genium.generator.common.GeneratedFile

object TestFiles {
    const val CONTENT1 = "CONTENT1"
    const val CONTENT3 = "CONTENT3"
    const val PATH1 = "PATH1_1/PATH1_2/FILE1"
    const val PATH2 = "PATH2/FILE2"
    const val PATH3 = "FILE3"

    val FILES = listOf(
        GeneratedFile(CONTENT1, PATH1),
        GeneratedFile("", PATH2),
        GeneratedFile(CONTENT3, PATH3)
    )
}
