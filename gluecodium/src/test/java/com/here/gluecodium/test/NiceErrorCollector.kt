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

package com.here.gluecodium.test

import org.bitbucket.cowwoc.diffmatchpatch.DiffMatchPatch
import org.hamcrest.CoreMatchers.containsString
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertThat
import org.junit.ComparisonFailure
import org.junit.rules.ErrorCollector

/**
 * Custom error collector that calls specific assert*() methods instead of just generic assertThat().
 */
internal class NiceErrorCollector : ErrorCollector() {
    /**
     * Adds a failure with the given [message] to the table if [value] is not null.
     * Execution continues, but the test will fail at the end if a match fails.
     */
    fun <T> checkNotNull(message: String, value: T?) {
        checkSucceeds { assertNotNull(message, value) }
    }

    /**
     * Adds a failure with the given [message] to the table if the [expectedValue] string is not contained in the
     * [actualValue] string. Execution continues, but the test will fail at the end if a match fails. The assertion
     * error is rethrown as a [ComparisonFailure] to produce a nice diff in IDE.
     */
    fun checkContainsString(message: String, expectedValue: String, actualValue: String) {
        checkSucceeds {
            try {
                assertThat(message, actualValue, containsString(expectedValue))
            } catch (e: AssertionError) {
                val strippedValue = stripValue(actualValue, expectedValue)
                throw ComparisonFailure(message, expectedValue, strippedValue)
            }
        }
    }

    /**
     * Strip prefix and suffix from the [actualValue] value to show only the diff to the [expectedValue] itself.
     */
    private fun stripValue(actualValue: String, expectedValue: String): String {
        var result = actualValue

        val diff = DiffMatchPatch().diffMain(expectedValue, actualValue)
        if (diff.first.operation == DiffMatchPatch.Operation.INSERT) {
            result = result.drop(diff.first.text.length)
        }
        if (diff.last.operation == DiffMatchPatch.Operation.INSERT) {
            result = result.dropLast(diff.last.text.length)
        }

        return result
    }
}
