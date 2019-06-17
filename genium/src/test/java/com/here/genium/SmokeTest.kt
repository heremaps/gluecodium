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

package com.here.genium

import com.natpryce.konfig.ConfigurationProperties
import com.natpryce.konfig.overriding
import java.io.File
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameters

@RunWith(Parameterized::class)
class SmokeTest(
    private val featureDirectory: File,
    generatorName: String,
    featureName: String
) : AcceptanceTestBase(featureDirectory, generatorName) {

    @Test
    fun smokeTest() {
        runTest()
    }

    override fun getGeniumOptions(): Genium.Options {
        val options = Genium.testOptions()
        val cppNameRulesConfig =
            File(File(featureDirectory, FEATURE_INPUT_FOLDER), "namerules/cpp.properties")
        if (cppNameRulesConfig.exists()) {
            options.cppNameRules =
                ConfigurationProperties.fromFile(cppNameRulesConfig) overriding options.cppNameRules
        }

        val javaNameRulesConfig =
            File(File(featureDirectory, FEATURE_INPUT_FOLDER), "namerules/java.properties")
        if (javaNameRulesConfig.exists()) {
            options.javaNameRules =
                ConfigurationProperties.fromFile(javaNameRulesConfig) overriding options.javaNameRules
        }

        val swiftNameRulesConfig =
            File(File(featureDirectory, FEATURE_INPUT_FOLDER), "namerules/swift.properties")
        if (swiftNameRulesConfig.exists()) {
            options.swiftNameRules =
                ConfigurationProperties.fromFile(swiftNameRulesConfig) overriding options.swiftNameRules
        }

        return options
    }

    companion object {
        private val RESOURCE_PREFIX = "smoke"

        @JvmStatic
        @Parameters(name = "{2}, {1}")
        fun data(): Collection<Array<Any>> {
            return getData(RESOURCE_PREFIX)
        }
    }
}
