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

@file:Suppress("unused", "UnstableApiUsage")

package com.here.gluecodium.gradle

import java.io.File
import org.gradle.api.file.FileTree
import org.gradle.api.model.ObjectFactory
import org.gradle.api.provider.Property

/**
 * DSL extension object, exposed to the Gradle script.
 */
open class GluecodiumExtension(objects: ObjectFactory) {
    val source: Property<FileTree> = objects.property(FileTree::class.java)
    val outputDirectory: Property<File> = objects.property(File::class.java)
    val commonOutputDirectory: Property<File> = objects.property(File::class.java)
    val auxiliarySource: Property<FileTree> = objects.property(FileTree::class.java)

    val copyrightHeaderFile: Property<File> = objects.property(File::class.java)

    val javaPackage: Property<String> = objects.property(String::class.java)
    val javaInternalPackage: Property<String> = objects.property(String::class.java)
    val javaNameRules: Property<File> = objects.property(File::class.java)

    val javaNonNullAnnotation: Property<String> = objects.property(String::class.java)
    val javaNullableAnnotation: Property<String> = objects.property(String::class.java)

    val cppNamespace: Property<String> = objects.property(String::class.java)
    val cppInternalNamespace: Property<String> = objects.property(String::class.java)
    val cppExportMacroName: Property<String> = objects.property(String::class.java)
    val cppNameRules: Property<File> = objects.property(File::class.java)
}
