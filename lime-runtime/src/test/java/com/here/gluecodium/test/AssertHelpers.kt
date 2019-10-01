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

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeNamedElement
import org.junit.Assert
import org.junit.Assert.assertTrue

object AssertHelpers {
    fun <T> assertContains(expected: T, actual: Collection<T>) {
        assertTrue(actual.contains(expected))
    }

    fun assertHasAttribute(expected: LimeAttributeType, actual: LimeNamedElement) =
        assertTrue(actual.attributes.have(expected))

    fun assertHasAttribute(
        expectedType: LimeAttributeType,
        expectedValueType: LimeAttributeValueType,
        actual: LimeNamedElement
    ) = assertTrue(actual.attributes.have(expectedType, expectedValueType))

    fun assertAttributeValueEquals(
        expectedValue: String,
        expectedType: LimeAttributeType,
        expectedValueType: LimeAttributeValueType,
        actual: LimeNamedElement
    ) = Assert.assertEquals(
        expectedValue,
        actual.attributes.get(expectedType, expectedValueType)
    )
}
