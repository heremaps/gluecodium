/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import com.here.android.lorem.ipsum.FunctionalTestsInternalAPI
import kotlin.math.round

@FunctionalTestsInternalAPI
internal object ColorConverter {
    @JvmStatic @JvmSynthetic @JvmName("convertFromInternal")
    internal fun convertFromInternal(internalColor: SystemColor): Int? {
        return android.graphics.Color.argb(
            round(internalColor.alpha * 255).toInt(),
            round(internalColor.red * 255).toInt(),
            round(internalColor.green * 255).toInt(),
            round(internalColor.blue * 255).toInt()
        )
    }

    @JvmStatic @JvmSynthetic @JvmName("convertToInternal")
    internal fun convertToInternal(color: Int?): SystemColor {
        val systemColor: Int = color!!
        return SystemColor(
            android.graphics.Color.red(systemColor) / 255.0f,
            android.graphics.Color.green(systemColor) / 255.0f,
            android.graphics.Color.blue(systemColor) / 255.0f,
            android.graphics.Color.alpha(systemColor) / 255.0f
        )
    }
}