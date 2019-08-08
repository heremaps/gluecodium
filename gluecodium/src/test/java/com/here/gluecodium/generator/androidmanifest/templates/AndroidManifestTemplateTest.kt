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

package com.here.gluecodium.generator.androidmanifest.templates

import org.junit.Assert.assertEquals

import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.model.java.JavaPackage
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class AndroidManifestTemplateTest {

    @Test
    fun generate() {
        // Arrange
        val javaPackage = JavaPackage(listOf("com", "example", "android"))
        val expected = TemplateEngine.render("xml/CopyrightHeader", "") +
                "\n" +
                "<manifest\n" +
                "    xmlns:android=\"http://schemas.android.com/apk/res/android\"\n" +
                "    package=\"com.example.android\">\n" +
                "\n" +
                "    <uses-permission android:name=\"android.permission.INTERNET\"/>\n" +
                "\n" +
                "</manifest>"

        // Act
        val generated = TemplateEngine.render("android/AndroidManifest", javaPackage.toString())

        // Assert
        assertEquals(expected, generated)
    }
}
