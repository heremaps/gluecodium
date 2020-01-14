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

package com.here.gluecodium.model.common

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.platform.android.JavaDocProcessor
import java.util.logging.Logger
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class JavaDocProcessorTest {
    private val limeLogger =
        LimeLogger(Logger.getLogger(JavaDocProcessorTest::class.java.name), emptyMap())
    private val commentsProcessor = JavaDocProcessor()

    @Test
    fun simple() {
        val comment = "hello [this.is.a.link] world"
        val limeName = "RandomClass"
        val limeToJava = mapOf("this.is.a.link" to "javaName")

        val processedComment =
            commentsProcessor.process(limeName, comment, limeToJava, limeLogger)

        assertEquals("<p>hello {@link javaName} world</p>", processedComment)
    }

    @Test
    fun relativeReferenceToOtherPackage() {
        val comment = "[reference.to.other]"
        val limeName = "this.is.a.class"
        val limeToJava = mapOf("this.is.a.reference.to.other" to "javaName")

        val processedComment =
            commentsProcessor.process(limeName, comment, limeToJava, limeLogger)

        assertEquals("<p>{@link javaName}</p>", processedComment)
    }

    @Test
    fun directChildLink() {
        val comment = "[child]"
        val limeName = "package.my"
        val limeToJava = mapOf("package.my.child" to "javaName")

        val processedComment =
            commentsProcessor.process(limeName, comment, limeToJava, limeLogger)

        assertEquals("<p>{@link javaName}</p>", processedComment)
    }

    @Test
    fun javaDocWithoutLink() {
        val comment = "Hello\nWorld!\n\n"

        val processedComment = commentsProcessor.process("", comment, emptyMap(), limeLogger)

        assertEquals("<p>Hello\nWorld!</p>", processedComment)
    }
}
