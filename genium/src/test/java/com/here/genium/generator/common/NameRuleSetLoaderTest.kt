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

package com.here.genium.generator.common

import com.natpryce.konfig.ConfigurationProperties
import org.junit.Assert.assertEquals

import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class NameRuleSetLoaderTest {
    private val config = ConfigurationProperties.fromResource(javaClass, "/namerules/test.properties")

    @Test
    fun `basic name rule works`() {
        val ruleSet = nameRuleSetFromConfig(config)
        assertEquals("FOO", ruleSet.getConstantName("foo"))
    }

    @Test
    fun `getter prefix rule works`() {
        val ruleSet = nameRuleSetFromConfig(config)
        assertEquals("get_foo", ruleSet.getGetterName("foo", false))
    }

    @Test
    fun `boolean getter prefix rule works`() {
        val ruleSet = nameRuleSetFromConfig(config)
        assertEquals("is_foo", ruleSet.getGetterName("foo", true))
    }
}
