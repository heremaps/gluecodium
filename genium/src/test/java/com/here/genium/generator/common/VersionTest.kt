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

package com.here.genium.generator.common

import io.mockk.every
import io.mockk.mockk
import org.franca.core.franca.FVersion
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class VersionTest {
    @Test
    fun toStringWithoutSuffix() {
        // Arrange, act
        val versionString = Version(MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION, "").toString()

        // Assert
        assertEquals(VERSION_WITHOUT_SUFFIX, versionString)
    }

    @Test
    fun toStringWithSuffix() {
        // Arrange, act
        val versionString = Version(MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION, VERSION_SUFFIX).toString()

        // Assert
        assertEquals(VERSION_WITH_SUFFIX, versionString)
    }

    @Test
    fun createFromFrancaVersion() {
        // Arrange
        val francaVersion = mockk<FVersion>()
        every { francaVersion.major } returns MAJOR_VERSION
        every { francaVersion.minor } returns MINOR_VERSION

        // Act
        val version = Version.createFromFrancaVersion(francaVersion)

        // Assert
        assertEquals(MAJOR_VERSION, version.major)
        assertEquals(MINOR_VERSION, version.minor)
        assertEquals(0, version.patch)
        assertEquals("", version.suffix)
    }

    @Test
    fun createFromStringWithoutSuffix() {
        // Arrange, act
        val version = Version.createFromString(VERSION_WITHOUT_SUFFIX)

        // Assert
        assertEquals(MAJOR_VERSION, version.major)
        assertEquals(MINOR_VERSION, version.minor)
        assertEquals(PATCH_VERSION, version.patch)
        assertEquals("", version.suffix)
    }

    @Test
    fun createFromStringWithSuffix() {
        // Arrange, act
        val version = Version.createFromString(VERSION_WITH_SUFFIX)

        // Assert
        assertEquals(MAJOR_VERSION, version.major)
        assertEquals(MINOR_VERSION, version.minor)
        assertEquals(PATCH_VERSION, version.patch)
        assertEquals(VERSION_SUFFIX, version.suffix)
    }

    @Test
    fun createFromStringWithInvalidString() {
        // Arrange, act
        val version = Version.createFromString(INVALID_VERSION_STRING)

        // Assert
        assertEquals(0, version.major)
        assertEquals(0, version.minor)
        assertEquals(0, version.patch)
        assertEquals("", version.suffix)
    }

    companion object {
        private const val MAJOR_VERSION = 7
        private const val MINOR_VERSION = 21
        private const val PATCH_VERSION = 302
        private const val VERSION_SUFFIX = "abc"
        private const val VERSION_WITHOUT_SUFFIX = "7.21.302"
        private const val VERSION_WITH_SUFFIX = "7.21.302-abc"
        private const val INVALID_VERSION_STRING = "not a version"
    }
}
