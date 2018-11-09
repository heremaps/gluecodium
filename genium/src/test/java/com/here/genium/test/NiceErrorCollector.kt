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

package com.here.genium.test

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.rules.ErrorCollector

/**
 * Custom error collector that calls specific assert*() methods instead of just generic assertThat()
 */
class NiceErrorCollector : ErrorCollector() {
    /**
     * Adds a failure with the given `message` to the table if `actualValue` is not null.
     * Execution continues, but the test will fail at the end if the match fails.
     */
    fun <T> checkNotNull(message: String, value: T?) {
        checkSucceeds {
            assertNotNull(message, value)
            value
        }
    }

    /**
     * Adds a failure with the given `message` to the table if `expectedValue` does not
     * match `actualValue`. Execution continues, but the test will fail at the end if the match
     * fails.
     *
     * @implNote Calling assertEquals() makes sure the stored AssertionError is actually a
     * ComparisonFailure object. This allows IntelliJ to format the message nicely with a link to
     * a diff of the values.
     */
    fun <T> checkEquals(message: String, expectedValue: T, actualValue: T) {
        checkSucceeds {
            assertEquals(message, expectedValue, actualValue)
            actualValue
        }
    }
}
