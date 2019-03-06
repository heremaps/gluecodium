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

import com.here.genium.output.FileRemove
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.any
import org.mockito.Mockito.mock
import org.mockito.Mockito.never
import org.mockito.Mockito.verify
import org.powermock.api.mockito.PowerMockito
import org.powermock.api.mockito.PowerMockito.`when`
import org.powermock.api.mockito.PowerMockito.verifyStatic
import org.powermock.api.mockito.PowerMockito.whenNew
import org.powermock.core.classloader.annotations.PrepareForTest
import org.powermock.modules.junit4.PowerMockRunner
import java.io.IOException
import java.nio.file.Paths

@RunWith(PowerMockRunner::class)
@PrepareForTest(MultiFileSetCache::class, CleanUpCachingStrategy::class)
class CleanUpCachingStrategyTest {
    private val myStrategy = CleanUpCachingStrategy(ROOT_DIRECTORY_NAME, hashSetOf("SetA"))
    private var remover = mock(FileRemove::class.java)

    @Before
    @Throws(Exception::class)
    fun setupFileRemoval() {
        PowerMockito.mockStatic(MultiFileSetCache::class.java)
        whenNew(FileRemove::class.java).withAnyArguments().thenReturn(remover)
    }

    @Test
    @Throws(IOException::class)
    fun writeRootDirectoryNull() {
        // Arrange
        val nullStrategy = CleanUpCachingStrategy(null, hashSetOf("SetA"))

        // Act
        nullStrategy.write(true)

        // Assert
        verifyStatic(never())
        MultiFileSetCache.retrieveExistingCacheFiles(ROOT_DIRECTORY_NAME, hashSetOf("SetA"))
        verify(remover, never()).removeFiles(any())
    }

    @Test
    @Throws(IOException::class)
    fun writeExistingCacheFiles() {
        // Arrange
        `when`(MultiFileSetCache.retrieveExistingCacheFiles(any(), any()))
            .thenReturn(listOf(Paths.get("1"), Paths.get("2"), Paths.get("3")))

        // Act
        myStrategy.write(true)

        // Assert
        verifyStatic()
        MultiFileSetCache.retrieveExistingCacheFiles(ROOT_DIRECTORY_NAME, hashSetOf("SetA"))
        verify(remover).removeFiles(
            listOf(Paths.get("1"), Paths.get("2"), Paths.get("3"))
        )
    }

    @Test
    @Throws(IOException::class)
    fun writeNonExistingCacheFiles() {
        // Arrange
        `when`(MultiFileSetCache.retrieveExistingCacheFiles(any(), any())).thenReturn(
            listOf()
        )

        // Act
        myStrategy.write(true)

        // Assert
        verifyStatic()
        MultiFileSetCache.retrieveExistingCacheFiles(ROOT_DIRECTORY_NAME, hashSetOf("SetA"))
        verify(remover, never()).removeFiles(any())
    }

    companion object {
        private const val ROOT_DIRECTORY_NAME = "root"
    }
}
